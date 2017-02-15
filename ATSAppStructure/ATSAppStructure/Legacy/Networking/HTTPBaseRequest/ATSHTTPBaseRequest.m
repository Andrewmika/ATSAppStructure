//
//  ATSHTTPBaseRequest.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSHTTPBaseRequest.h"
#import "ATSURLConfig.h"
#import "ATSLog.h"

@implementation ATSHTTPBaseResponse


@end

@implementation ATSHTTPBaseRequest

#pragma mark - Private Method
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        // 初始化变量
        self.params = [NSMutableDictionary dictionary];
    }
    return self;
}

// 整理必传数据
- (void)configCommonParams
{
}

// 用时间戳和索引值得到文件名 处理附件名字
- (NSString *)getFileNameWithTimeIntervalAndIndex:(NSInteger) index
{
    NSDate *date = [NSDate date];
    NSString *fileName = [NSString stringWithFormat:@"%013.0f%02ld", [date timeIntervalSince1970] * 1000.0, (long)(index % 100)];
    return fileName;
}



- (void)setAuthorizationToken:(AFHTTPRequestSerializer *)serializer {
    //    [serializer setValue:[[unifiedUserInfoManager share] getTokenWithStatus] forHTTPHeaderField:@"Authorization"];
}
#pragma mark - Interface Method


// 请求数据整理，子类实现
- (void)prepareRequest
{
    [self configCommonParams];
}

// 返回数据整理，子类实现
- (ATSHTTPBaseResponse *)prepareResponse:(NSDictionary *)data
{
    ATSHTTPBaseResponse *res=[[ATSHTTPBaseResponse alloc] init];
    res.data=data;
    //    res.message = [data safeValueForKey:kMessage];
    return res;
}

// 请求数据
- (void)requestWithDelegate:(id<ATSHTTPBaseRequestDelegate>)delegate
{
    // 整理数据
    [self prepareRequest];
    
    // 代理设置
    self.delegate = delegate;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kURLAddress]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    // 判断是否需要token
    [self setAuthorizationToken:manager.requestSerializer];
    
    ATSLog(@"------->INPUT:%@,\n%@",[NSURL URLWithString:[kURLAddress stringByAppendingPathComponent:self.action]],self.params);
    
    [manager POST:self.action parameters:self.params progress:^(NSProgress * _Nonnull uploadProgress) {
        // 进度
        [self requestProgress:uploadProgress];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功
        [self requestFinished:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败
        [self requestFailed:error.userInfo];
    }];
}

// 上传图片
- (void)requestWithDelegate:(id<ATSHTTPBaseRequestDelegate>)delegate data:(NSData *)imageData
{
    // 整理数据
    [self prepareRequest];
    
    // 代理设置
    self.delegate = delegate;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kURLAddress]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 判断是否需要token
    [self setAuthorizationToken:manager.requestSerializer];
    
    ATSLog(@"------->INPUT:%@,\n%@",[NSURL URLWithString:[kURLAddress stringByAppendingPathComponent:self.action]],self.params);
    
    [manager POST:self.action parameters:self.params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:imageData name:@"name" fileName:[NSString stringWithFormat:@"%@.png", [self getFileNameWithTimeIntervalAndIndex:0]] mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 进度
        [self requestProgress:uploadProgress];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功
        [self requestFinished:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败
        [self requestFailed:error];
        
    }];
}

// Get请求
- (void)requestGetWithDelegate:(id<ATSHTTPBaseRequestDelegate>)delegate
{
    NSString *urlString = [kURLAddress stringByAppendingPathComponent:self.action];
    [self requestGetWithDelegate:delegate URL:urlString parameters:self.params];
}

// Get请求
- (void)requestGetWithDelegate:(id<ATSHTTPBaseRequestDelegate>)delegate URL:(NSString *)urlString parameters:(NSDictionary *)params
{
    // 整理数据
    [self prepareRequest];
    
    // 代理设置
    self.delegate = delegate;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 判断是否需要token
    [self setAuthorizationToken:manager.requestSerializer];
    
    ATSLog(@"------->INPUT:%@,\n%@",[NSURL URLWithString:[kURLAddress stringByAppendingPathComponent:self.action]],self.params);
    [manager GET:self.action parameters:self.params progress:^(NSProgress * _Nonnull downloadProgress) {
        // 进度
        [self requestProgress:downloadProgress];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功
        [self requestFinished:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败
        [self requestFailed:error.userInfo];
        
    }];
}

#pragma mark - Delegate
- (void)requestFinished:(id)responseObj
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(requestSucceed:response:)])
    {
        if ([responseObj isKindOfClass:[NSDictionary class]])
        {
            ATSLog(@"------->OUTPUT:%@",responseObj);
            //            BOOL isSuccess = [[UnifiedResultCodeManager share] manageResultCode:responseObj];
            BOOL isSuccess = YES;
            
            // 成功
            if (isSuccess)
            {
                ATSHTTPBaseResponse *response = [ATSHTTPBaseResponse new];
                response = [self prepareResponse:responseObj];
                // 整理返回数据
                [self.delegate requestSucceed:self response:response];
            } else {
                if (self.delegate && [self.delegate respondsToSelector:@selector(requestFail:response:)])
                {
                    [self requestFailed:responseObj];
                }
            }
        }
    }
}

- (void)requestFailed:(id)responseObj
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(requestFail:response:)])
    {
        ATSHTTPBaseResponse *response = [ATSHTTPBaseResponse new];
        response = [self prepareResponse:responseObj];
        [self.delegate requestFail:self response:response];
    }
}

- (void)requestProgress:(NSProgress *)progress {
    if (self.delegate && [self.delegate respondsToSelector:@selector(requestProgress:request:)])
    {
        CGFloat progressValue = 1.0 * progress.completedUnitCount / progress.totalUnitCount;
        [self.delegate requestProgress:progressValue request:self];
    }
    
}

@end

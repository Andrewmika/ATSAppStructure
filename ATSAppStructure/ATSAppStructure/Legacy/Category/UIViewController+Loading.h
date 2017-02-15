//
//  UIViewController+Loading.h
//  launcher
//
//  Created by williamzhang on 15/11/24.
//  Copyright © 2015年 William Zhang. All rights reserved.
//  loading VC 工具类

#import <UIKit/UIKit.h>

@interface UIViewController (Loading)

@property (nonatomic, readonly, getter=isLoading) BOOL loading;
/// 控制响应开关（default:YES关闭状态）
@property (nonatomic, assign) BOOL loadingUserInteractionEnabled;

#pragma mark - Success
- (void)ats_postSuccess;
- (void)ats_postSuccess:(NSString *)message;
- (void)ats_postSuccess:(NSString *)message overTime:(NSTimeInterval)second;

#pragma mark - Error
- (void)ats_postError:(NSString *)message;
- (void)ats_postError:(NSString *)message duration:(CGFloat)duration;
- (void)ats_postError:(NSString *)message detailMessage:(NSString *)detailMessage duration:(CGFloat)duration;

#pragma mark - Loading
- (void)ats_postProgress:(float)progress;
- (void)ats_postLoading;
- (void)ats_postLoadingBackgroundColor:(UIColor *)color;
- (void)ats_postLoading:(NSString *)message;
- (void)ats_postLoading:(NSString *)title message:(NSString *)message;
- (void)ats_postLoading:(NSString *)title message:(NSString *)message overTime:(NSTimeInterval)second;

#pragma mark - Hide
- (void)ats_hideLoading;

@end

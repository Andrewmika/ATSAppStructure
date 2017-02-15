//
//  ATSAppConfig.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSAppConfig.h"
#import "ATSAPNUtility.h"

@implementation ATSAppConfig

#pragma mark - Interface Method
+ (instancetype)sharedInstance {
    static ATSAppConfig *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ATSAppConfig alloc] init];
    });
    return sharedInstance;
}

- (void)configApp {
    [self configTheme];
}

- (void)configAPN {
    [ATSAPNUtility registerAppAPN];
}

- (void)checkAPNStatus {
    if (![ATSAPNUtility appAPNEnabled]) {
        
        // 提示
    }
    
}
#pragma mark - Pravite Method

// 主题
- (void)configTheme {
    // 背景
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    // 文字图标
    [[UINavigationBar appearance] setTintColor:[UIColor greenColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName : [UIColor whiteColor],
                                                           NSFontAttributeName : [UIFont systemFontOfSize:18]
                                                           }];
}

@end

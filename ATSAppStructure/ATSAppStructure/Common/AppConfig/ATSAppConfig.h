//
//  ATSAppConfig.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//  全局应用配置文件

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ATSAppConfig : NSObject

@property (nonatomic, strong)  UIWindow  *keyWindow; // <##>

+ (instancetype)sharedInstance;

- (void)configApp;
- (void)configAPN;
- (void)checkAPNStatus;

@end

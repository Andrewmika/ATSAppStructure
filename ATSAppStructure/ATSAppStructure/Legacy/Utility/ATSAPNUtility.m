//
//  ATSAPNUtility.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSAPNUtility.h"
#import <UIKit/UIKit.h>

@implementation ATSAPNUtility

+ (BOOL)appAPNEnabled {
    BOOL pushEnabled;
    // 设置里的通知总开关是否打开
    BOOL settingEnabled = [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
    // 设置里的通知各子项是否都打开
    BOOL subsettingEnabled = [[UIApplication sharedApplication] currentUserNotificationSettings].types != UIUserNotificationTypeNone;
    
    pushEnabled = settingEnabled && subsettingEnabled;
    return pushEnabled;
}

+ (void)registerAppAPN {
    // 消息推送注册
    [[UIApplication sharedApplication] registerUserNotificationSettings:
     [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                       categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

@end

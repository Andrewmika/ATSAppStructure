//
//  ATSAPNUtility.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//  推送通知工具

#import <Foundation/Foundation.h>

@interface ATSAPNUtility : NSObject

+ (void)registerAppAPN;
+ (BOOL)appAPNEnabled;

@end

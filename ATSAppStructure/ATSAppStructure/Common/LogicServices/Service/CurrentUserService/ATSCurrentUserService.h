//
//  ATSCurrentUserService.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//  当前用户信息管理类

#import <Foundation/Foundation.h>

@interface ATSCurrentUserService : NSObject

+ (instancetype)sharedInstance;

- (BOOL)loginStatus;

@end

//
//  ATSCurrentUserService.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSCurrentUserService.h"

@implementation ATSCurrentUserService

+ (instancetype)sharedInstance {
    static ATSCurrentUserService *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ATSCurrentUserService alloc] init];
    });
    return shareInstance;
}

- (BOOL)loginStatus {
    return YES;
}

@end

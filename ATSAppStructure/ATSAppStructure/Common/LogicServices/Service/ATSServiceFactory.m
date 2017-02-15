//
//  ATSServiceFactory.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSServiceFactory.h"

@implementation ATSServiceFactory

+ (instancetype)sharedInstance {
    static ATSServiceFactory *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ATSServiceFactory alloc] init];
    });
    return sharedInstance;
}

@end

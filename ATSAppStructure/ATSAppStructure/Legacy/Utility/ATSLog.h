//
//  ATSLog.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//  日志打印，输出

#import <Foundation/Foundation.h>

#define ATSLOGPRINT(xx, ...)   \
if([ATSLog logEnableStatus] ) {\
NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); \
}

#define ATSLog(xx, ...)  ATSLOGPRINT(xx, ##__VA_ARGS__)

@interface ATSLog : NSObject

+ (void)configLogEnable:(BOOL)enable;
+ (BOOL)logEnableStatus;

@end

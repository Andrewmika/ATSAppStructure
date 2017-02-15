//
//  ATSModuleInteractor.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//  界面跳转基类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ATSModuleInteractor : NSObject

+ (instancetype)sharedInstance;

// 普通push
- (void)pushToVC:(UIViewController *)VC;

// 强制跳转rootView再push
- (void)PushToChatVC:(UIViewController *)VC;

@end

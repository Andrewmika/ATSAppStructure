//
//  ATSAppInteractor.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//  应用入口逻辑，登录，注销，主界面的切换

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ATSAppInteractor : NSObject

@property (nonatomic, strong) UIWindow    *keyWindow; // <##>

@property (nonatomic, strong)  UIViewController  *mainController; // 主界面
@property (nonatomic, strong)  UIViewController  *loginController; // 登录页

- (instancetype)initWithKeyWindow:(UIWindow *)keyWindow;

// Optional
- (void)startUIFlow;
- (void)startLogin;
- (void)startMain;
- (void)logoutAction;

@end

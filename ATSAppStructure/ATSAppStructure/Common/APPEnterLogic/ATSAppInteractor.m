//
//  ATSAppInteractor.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSAppInteractor.h"
#import "ATSCurrentUserService.h"
#import "ATSBaseNavigationViewController.h"

@implementation ATSAppInteractor

- (instancetype)initWithKeyWindow:(UIWindow *)keyWindow
{
    self = [super init];
    if (self) {
        self.keyWindow = keyWindow;
        [self startUIFlow];
    }
    return self;
}

- (void)startUIFlow {
    if ([[ATSCurrentUserService sharedInstance] loginStatus]) {
        [self startMain];
    } else {
        [self startLogin];
    }
}

- (void)startLogin {
    if (!self.loginController) {
        // 初始化登录界面
    }
    
    if (self.mainController) {
        self.mainController = nil;
    }
    ATSBaseNavigationViewController *navi = [[ATSBaseNavigationViewController alloc] initWithRootViewController:self.loginController];
    self.keyWindow.rootViewController = navi;
}

- (void)startMain {
    
    if (!self.mainController) {
        // 初始化主界面
    }
    
    if (self.loginController) {
        self.loginController = nil;
    }
    self.keyWindow.rootViewController = self.mainController;
}

- (void)logoutAction {
    // TODO: clean something
    
    [self startLogin];
}

@end

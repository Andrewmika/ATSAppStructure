//
//  ATSModuleInteractor.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSModuleInteractor.h"

@implementation ATSModuleInteractor

+ (instancetype)sharedInstance {
    static ATSModuleInteractor *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ATSModuleInteractor alloc] init];
    });
    return sharedInstance;
}

- (void)pushToVC:(UIViewController *)VC {
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(p_realPushToVC:) withObject:VC afterDelay:0.01];
}

- (void)PushToChatVC:(UIViewController *)VC {
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(p_realPushToChatVC:) withObject:VC afterDelay:0.01];
}

#pragma mark - Private
- (void)p_realPushToVC:(UIViewController *)VC {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UITabBarController *controller = (UITabBarController *)rootViewController;
    UINavigationController *navi = controller.selectedViewController;
    [VC setHidesBottomBarWhenPushed:YES];
    [navi pushViewController:VC animated:YES];
}

- (void)p_realPushToChatVC:(UIViewController *)VC {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UITabBarController *controller = (UITabBarController *)rootViewController;
    controller.selectedIndex = 2;
    UINavigationController *navi = controller.selectedViewController;
    [navi popToRootViewControllerAnimated:NO];
    [VC setHidesBottomBarWhenPushed:YES];
    
    [navi pushViewController:VC animated:YES];
}

@end

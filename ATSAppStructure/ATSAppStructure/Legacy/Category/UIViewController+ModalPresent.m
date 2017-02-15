//
//  UIViewController+ModalPresent.m
//  ArthasBaseAppStructure
//
//  Created by Andrew Shen on 16/2/26.
//  Copyright © 2016年 Andrew Shen. All rights reserved.
//

#import "UIViewController+ModalPresent.h"

@implementation UIViewController (ModalPresent)
/// 半透明弹出VC
- (void)at_modalPresentViewController:(UIViewController *)viewControllerToPresent {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        self.providesPresentationContextTransitionStyle = YES;
        self.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentViewController:viewControllerToPresent animated:YES completion:nil];
    } else {
        self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentViewController:viewControllerToPresent animated:YES completion:nil];
        self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    }
}
@end

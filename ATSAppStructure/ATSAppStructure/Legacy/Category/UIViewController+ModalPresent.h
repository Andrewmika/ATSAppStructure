//
//  UIViewController+ModalPresent.h
//  ArthasBaseAppStructure
//
//  Created by Andrew Shen on 16/2/26.
//  Copyright © 2016年 Andrew Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ModalPresent)
/// 半透明弹出VC
- (void)at_modalPresentViewController:(UIViewController *)viewControllerToPresent;
@end

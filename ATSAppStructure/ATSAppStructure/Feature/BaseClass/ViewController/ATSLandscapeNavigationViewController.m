//
//  ATSLandscapeNavigationViewController.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSLandscapeNavigationViewController.h"

@interface ATSLandscapeNavigationViewController ()

@end

@implementation ATSLandscapeNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 带有navi的VC屏幕旋转依赖navi
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}

- (BOOL)shouldAutorotate{
    return YES;
}

@end

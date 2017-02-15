//
//  AppDelegate.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATSAppConfig.h"
#import "ATSAppInteractor.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong)  ATSAppConfig  *appConfig; // <##>
@property (nonatomic, strong)  ATSAppInteractor  *appInteractor; // <##>


@end


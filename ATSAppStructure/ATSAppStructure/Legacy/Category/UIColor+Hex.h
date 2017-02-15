//
//  UIColor+Hex.h
//  ArthasBaseAppStructure
//
//  Created by Andrew Shen on 16/2/26.
//  Copyright © 2016年 Andrew Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)at_colorWithHex:(NSInteger)hexValue;
+ (UIColor *)at_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

@end

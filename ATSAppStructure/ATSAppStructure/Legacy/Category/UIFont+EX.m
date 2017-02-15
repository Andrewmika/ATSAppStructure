//
//  UIFont+EX.m
//  ArthasBaseAppStructure
//
//  Created by Andrew Shen on 16/2/26.
//  Copyright © 2016年 Andrew Shen. All rights reserved.
//

#import "UIFont+EX.h"

@implementation UIFont (EX)

#pragma mark - Private

+ (UIFont *)p_boldFontWithSize:(CGFloat)size {
    return [UIFont boldSystemFontOfSize:size];
}



+ (UIFont *)p_fontWithSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size];
}

@end

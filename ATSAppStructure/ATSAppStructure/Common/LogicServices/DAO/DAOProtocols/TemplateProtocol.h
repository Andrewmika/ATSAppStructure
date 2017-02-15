//
//  TemplateProtocol.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//  

#import <Foundation/Foundation.h>

typedef void(^CompletionHandler)(BOOL success, NSString *errorMsg, NSArray *results);

@protocol TemplateProtocol <NSObject>

- (void)requestTemplateCompletionHandler:(CompletionHandler)completion;

@end

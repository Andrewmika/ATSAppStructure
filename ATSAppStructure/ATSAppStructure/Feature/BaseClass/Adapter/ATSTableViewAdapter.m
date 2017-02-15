//
//  ATSTableViewAdapter.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "ATSTableViewAdapter.h"

@implementation ATSTableViewAdapter

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        return self.adapterArray.count;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        return ((NSArray *)self.adapterArray[section]).count;
    }
    return self.adapterArray.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView setLayoutMargins:UIEdgeInsetsZero];
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    [UIView performWithoutAnimation:^{
        [cell layoutIfNeeded];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cellData = nil;
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        cellData = self.adapterArray[indexPath.section][indexPath.row];
    }
    else {
        cellData = [self.adapterArray objectAtIndex:indexPath.row];
    }
    
    UITableViewCell* cell = NULL;
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"tableView:cellFor%@:", [cellData class]]);
    if ([self respondsToSelector:selector]) {
        cell = [self performSelector:selector withObject:tableView withObject:cellData];
    }
    else {
        selector = NSSelectorFromString([NSString stringWithFormat:@"tableView:cellForRowAtIndexPath:with%@:", [cellData class]]);
        NSMethodSignature *signature = [self methodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        
        [invocation setSelector: selector];
        
        [invocation setTarget: self];
        //前两个参数为self与selector，其它参数要从2开始
        [invocation setArgument: &tableView  atIndex: 2];
        
        [invocation setArgument: &indexPath atIndex: 3];
        
        [invocation setArgument: &cellData  atIndex: 4];
        
        [invocation invoke];
        
        void *cellTemp;
        [invocation getReturnValue:&cellTemp];
        cell =  (__bridge UITableViewCell*)cellTemp;
    }
    
#pragma clang diagnostic pop
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    
    id cellData;
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        cellData = self.adapterArray[indexPath.section][indexPath.row];
    }
    else {
        cellData = self.adapterArray[indexPath.row];
    }
    if (self.adapterDelegate) {
        if ([_adapterDelegate respondsToSelector:@selector(didSelectCellData:index:)]) {
            [_adapterDelegate didSelectCellData:cellData index:indexPath];
        }
    }
}

#pragma mark - Init

- (NSMutableArray *)adapterArray {
    if (!_adapterArray) {
        _adapterArray = [NSMutableArray array];
    }
    return _adapterArray;
}

@end

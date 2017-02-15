//
//  ATSTableViewAdapter.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol ATSTableViewAdapterDelegate <NSObject>

@optional
- (void)didSelectCellData:(id)cellData index:(NSIndexPath *)indexPath;
- (void)deleteCellData:(id)cellData;
@end

@interface ATSTableViewAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)  UITableView  *tableView; // <##>
@property (nonatomic, strong)  NSMutableArray  *adapterArray; // 数据源
@property (nonatomic, weak)  id<ATSTableViewAdapterDelegate>  adapterDelegate; // <##>


@end

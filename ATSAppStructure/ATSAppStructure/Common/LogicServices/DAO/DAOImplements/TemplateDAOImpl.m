//
//  TemplateDAOImpl.m
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "TemplateDAOImpl.h"
#import <FMDB/FMDatabase.h>

static NSString *const kTableName = @"TemplateTable"; //
static NSString *const kSQLID = @"SQLID"; //

static NSString *const kName = @"name"; //

@interface TemplateDAOImpl()

@property (nonatomic, copy)  CompletionHandler  block; // <##>

@end
@implementation TemplateDAOImpl

#pragma mark - Impl

- (void)requestTemplateCompletionHandler:(CompletionHandler)completion {
    _block = completion;
    dispatch_async(self.DBActionQueue, ^{
        [self.DBQueue inDatabase:^(FMDatabase *db) {
            NSArray *array = [self p_query:db];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.block) {
                    self.block(YES, nil, array);
                    _block = nil;
                }
            });
        }];
    });

}

#pragma mark - SQL

/**
 *  创建表
 */
+ (void)createMessageTableWithDB:(FMDatabase *)db {
    NSString *strSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (%@ INTEGER primary key autoincrement, %@ TEXT);" ,
                        kTableName,
                        kSQLID,
                        kName];
    // 创建表
    if (![db executeUpdate:strSql])
    {
        NSAssert(0, @"表创建失败");
    }
}

// 删除内容
- (BOOL)p_deleteTableData:(FMDatabase *)db {
    BOOL success = YES;;
    NSString *sqlString = [NSString stringWithFormat:@"delete from %@",kTableName];
    if (![db executeUpdate:sqlString])
    {
        success = NO;
        NSAssert(0, @"删除失败");
    }
    return success;
}

// 查询
- (NSArray *)p_query:(FMDatabase *)db {
    NSMutableArray *array = [NSMutableArray array];
    NSString *sqlString = [NSString stringWithFormat:@"select * from '%@'",kTableName];
    FMResultSet *result = [db executeQuery:sqlString];
    while ([result next]) {
        NSString *name = [result stringForColumn:kName];
        [array addObject:name];
    }
    return array;
}

@end

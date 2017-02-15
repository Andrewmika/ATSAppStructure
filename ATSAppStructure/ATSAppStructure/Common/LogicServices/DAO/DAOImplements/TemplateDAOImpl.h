//
//  TemplateDAOImpl.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#import "DAOBaseImpl.h"
#import "TemplateProtocol.h"

@class FMDatabase;

@interface TemplateDAOImpl : DAOBaseImpl<TemplateProtocol>

+ (void)createMessageTableWithDB:(FMDatabase *)db;

@end

//
//  ATSDeviceMacro.h
//  ATSAppStructure
//
//  Created by Andrew Shen on 2017/2/15.
//  Copyright © 2017年 AndrewShen. All rights reserved.
//

#ifndef ATSDeviceMacro_h
#define ATSDeviceMacro_h

// UUID
#define DEVICE_UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]

// TYPE
#define DEVICE_TYPE [[UIDevice currentDevice] model]

// SYSTEM_VERSION
#define SYSTEM_VER [[UIDevice currentDevice] systemVersion]

// SYSTEM_NAME
#define SYSTEM_NAME [[UIDevice currentDevice] systemName]


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#endif /* ATSDeviceMacro_h */

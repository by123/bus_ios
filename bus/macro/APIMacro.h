//
//  APIMacro.h
//  framework
//
//  Created by 黄成实 on 2018/4/17.
//  Copyright © 2018年 黄成实. All rights reserved.
//



#import <Foundation/Foundation.h>

#pragma mark 定义API相关

#define sKeyName @"name"
#define sKeyReferer @"Referer"
#define sKeyCookie @"Cookie"

#define sUrlGetBusName @"http://wxbus.gzyyjt.net/wei-bus-app/route/getByName"
#define sUrlGetBusStopName     @"http://wxbus.gzyyjt.net/wei-bus-app/routeStation/getByRouteAndDirection"
#define sUrlGetBusStopLocation @"http://wxbus.gzyyjt.net/wei-bus-app/runBus/getByRouteAndDirection"
#define sHeaders @"http://wxbus.gzyyjt.net/wei-bus-app/route/monitor/%@/%@"
#define sBusInfoHeaders @"http://wxbus.gzyyjt.net/wei-bus-app/route?openId=ouz9MsyNIpeYEMJEhI7E-peH3oOk"
#define sCookie @"realOpenId=ouz9MsyNIpeYEMJEhI7E-peH3oOk; openId=ouz9MsyNIpeYEMJEhI7E-peH3oOk"





#pragma mark 网络请求码

#define CODE_SUCCESS 200

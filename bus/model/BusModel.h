//
//  BusModel.h
//  bus
//
//  Created by by.huang on 2018/9/14.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusModel : NSObject

//id
@property(copy, nonatomic)NSString *i;
//站名
@property(copy, nonatomic)NSString *n;
//
@property(copy, nonatomic)NSString *sni;
@property(copy, nonatomic)NSString *si;
@property(assign, nonatomic)NSInteger arrivaledNum;
@property(assign, nonatomic)NSInteger leavingNum;

@end

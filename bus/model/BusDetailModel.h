//
//  BusDetailModel.h
//  bus
//
//  Created by by.huang on 2018/9/17.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusDetailModel : NSObject

@property(copy , nonatomic)NSString *rn;
@property(copy , nonatomic)NSString *d;
@property(copy , nonatomic)NSString *c;
@property(copy , nonatomic)NSString *ft;
@property(copy , nonatomic)NSString *lt;
@property(strong , nonatomic)NSMutableArray *l;


@end

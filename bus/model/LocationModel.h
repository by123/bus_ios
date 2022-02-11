//
//  LocationModel.h
//  bus
//
//  Created by by.huang on 2018/9/17.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationInfo.h"

@interface LocationModel : NSObject

@property(strong, nonatomic)NSMutableArray<LocationInfo *> *bl;
@property(strong, nonatomic)NSMutableArray<LocationInfo *> *bbl;


+(NSInteger)isArrivaled:(LocationModel *)model;
+(NSInteger)isLeaving:(LocationModel *)model;

@end

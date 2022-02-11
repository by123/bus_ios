//
//  LocationModel.m
//  bus
//
//  Created by by.huang on 2018/9/17.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "LocationModel.h"

@implementation LocationModel

+(NSInteger)isArrivaled:(LocationModel *)model{
    return [model.bl count];
}

+(NSInteger)isLeaving:(LocationModel *)model{
    return [model.bbl count];
}


@end

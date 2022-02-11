//
//  BusDetailViewModel.h
//  bus
//
//  Created by by.huang on 2018/9/17.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusModel.h"
#import "BusDetailModel.h"
#import "LocationModel.h"
@protocol BusDetailViewDelegate<BaseRequestDelegate>

@end

@interface BusDetailViewModel : NSObject

@property(weak, nonatomic)id<BusDetailViewDelegate> delegate;
@property(strong, nonatomic)BusModel *busModel;
@property(strong, nonatomic)BusDetailModel *busDetailModel;
@property(strong, nonatomic)NSMutableArray *busModels;
@property(strong, nonatomic)NSMutableArray *locationModels;

-(instancetype)initWithBusModel:(BusModel *)busModel;
-(void)requestBusDetail:(Boolean)order;
//-(void)requestBusPosition:(Boolean)order;

@end

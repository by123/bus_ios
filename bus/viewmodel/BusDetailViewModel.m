//
//  BusDetailViewModel.m
//  bus
//
//  Created by by.huang on 2018/9/17.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "BusDetailViewModel.h"
#import "STNetUtil.h"
#import "LocationModel.h"


@implementation BusDetailViewModel

-(instancetype)initWithBusModel:(BusModel *)busModel{
    if(self == [super init]){
        _busModel = busModel;
        _busDetailModel = [[BusDetailModel alloc]init];
        _busModels = [[NSMutableArray alloc]init];
        _locationModels = [[NSMutableArray alloc]init];
    }
    return self;
}



-(void)requestBusDetail:(Boolean)order{
    if(_delegate == nil){
        return;
    }
    [_delegate onRequestBegin];
    NSString *orderBy = order ? @"0" : @"1";
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@",sUrlGetBusStopName,_busModel.i,orderBy];
    WS(weakSelf)
    [STNetUtil get:url parameters:nil success:^(RespondModel *respondModel) {
        weakSelf.busDetailModel = [BusDetailModel mj_objectWithKeyValues:respondModel.data];
        weakSelf.busModels  = [BusModel mj_objectArrayWithKeyValuesArray:weakSelf.busDetailModel.l];
        [weakSelf.delegate onRequestSuccess:respondModel data:nil];
        [self requestBusPosition:order];
    } failure:^(int errorCode) {
        [weakSelf.delegate onRequestFail:[NSString stringWithFormat:MSG_ERROR,errorCode]];
    }];
}


-(void)requestBusPosition:(Boolean)order{
    if(_delegate == nil){
        return;
    }
    NSString *orderBy = order ? @"0" : @"1";
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@",sUrlGetBusStopLocation,_busModel.i,orderBy];
    WS(weakSelf)
    [STNetUtil get:url parameters:nil success:^(RespondModel *respondModel) {
        weakSelf.locationModels = [LocationModel mj_objectArrayWithKeyValuesArray:respondModel.data];
        if(weakSelf.locationModels.count == weakSelf.busModels.count){
            NSInteger count = weakSelf.busModels.count;
            for(int i = 0 ; i <count; i ++){
                BusModel *busModel =  [weakSelf.busModels objectAtIndex:i];
                LocationModel *locationModel = [weakSelf.locationModels objectAtIndex:i];
                busModel.arrivaledNum = [LocationModel isArrivaled:locationModel];
                busModel.leavingNum = [LocationModel isLeaving:locationModel];
            }
        }
        [weakSelf.delegate onRequestSuccess:respondModel data:nil];
    } failure:^(int errorCode) {
        [weakSelf.delegate onRequestFail:[NSString stringWithFormat:MSG_ERROR,errorCode]];
    }];
}
@end

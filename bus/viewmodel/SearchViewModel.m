//
//  SearchViewModel.m
//  bus
//
//  Created by by.huang on 2018/9/14.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "SearchViewModel.h"
#import "STNetUtil.h"

@implementation SearchViewModel

-(instancetype)init{
    if(self == [super init]){
        _busModels = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)requestBus:(NSString *)text{
    [_busModels removeAllObjects];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic[sKeyName] = text;
    WS(weakSelf)
    [STNetUtil post:sUrlGetBusName parameters:dic success:^(RespondModel *respondModel) {
        weakSelf.busModels = [BusModel mj_objectArrayWithKeyValuesArray:respondModel.data];
        if(weakSelf.delegate){
            [weakSelf.delegate onRequestSuccess:respondModel data:weakSelf.busModels];
        }
    } failure:^(int errorCode) {
        if(weakSelf.delegate){
            [weakSelf.delegate onRequestFail:[NSString stringWithFormat:MSG_ERROR,errorCode]];
        }
    }];
}

-(void)goBusDetailPage:(BusModel *)busModel{
    if(_delegate){
        [_delegate onGoBusDetailPage:busModel];
    }
}
@end

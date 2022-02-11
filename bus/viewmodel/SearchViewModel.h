//
//  SearchViewModel.h
//  bus
//
//  Created by by.huang on 2018/9/14.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestDelegate.h"
#import "BusModel.h"

@protocol SearchViewDelegate<BaseRequestDelegate>

-(void)onGoBusDetailPage:(BusModel *)model;

@end

@interface SearchViewModel : NSObject

@property(weak, nonatomic)id<SearchViewDelegate> delegate;
@property(strong, nonatomic)NSMutableArray *busModels;


-(void)requestBus:(NSString *)text;
-(void)goBusDetailPage:(BusModel *)busModel;

@end

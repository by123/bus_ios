//
//  MainViewModel.h
//  bus
//
//  Created by by.huang on 2018/9/14.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainViewDelegate

-(void)onSearchClicked;

@end

@interface MainViewModel : NSObject

@property(weak, nonatomic)id<MainViewDelegate> delegate;

-(void)clickSearch;

@end

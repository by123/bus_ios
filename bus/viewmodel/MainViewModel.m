//
//  MainViewModel.m
//  bus
//
//  Created by by.huang on 2018/9/14.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "MainViewModel.h"

@implementation MainViewModel


-(void)clickSearch{
    if(_delegate){
        [_delegate onSearchClicked];
    }
}
@end

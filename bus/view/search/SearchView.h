//
//  SearchView.h
//  bus
//
//  Created by by.huang on 2018/9/14.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewModel.h"

@interface SearchView : UIView

-(instancetype)initWithViewModel:(SearchViewModel *)viewModel;
-(void)updateTableView;

@end

//
//  BusDetailView.h
//  bus
//
//  Created by by.huang on 2018/9/16.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusDetailViewModel.h"
@interface BusDetailView : UIView

-(instancetype)initWithViewModel:(BusDetailViewModel *)viewModel;
-(void)updateView;

@end

//
//  SearchViewCell.h
//  bus
//
//  Created by by.huang on 2018/9/15.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusModel.h"

@interface SearchViewCell : UITableViewCell


-(void)updateData:(BusModel *)model;
+(NSString *)identify;

@end

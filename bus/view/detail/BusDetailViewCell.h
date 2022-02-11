//
//  BusDetailViewCell.h
//  bus
//
//  Created by by.huang on 2018/9/25.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusModel.h"

@interface BusDetailViewCell : UITableViewCell

-(void)updateData:(BusModel *)model;
+(NSString *)identify;

@end

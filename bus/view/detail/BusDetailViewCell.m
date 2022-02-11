//
//  BusDetailViewCell.m
//  bus
//
//  Created by by.huang on 2018/9/25.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "BusDetailViewCell.h"
#import "LocationModel.h"

@interface BusDetailViewCell()

@property(strong, nonatomic)UILabel *nameLabel;
@property(strong, nonatomic)UIImageView *busImageView;
@property(strong, nonatomic)UILabel *arrivalLabel;
@property(strong, nonatomic)UILabel *leaveLabel;

@end

@implementation BusDetailViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initView];
    }
    return self;
}


-(void)initView{
    
    _busImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth - STWidth(15) - STHeight(20), STHeight(15), STHeight(20), STHeight(20))];
    _busImageView.image = [UIImage imageNamed:@"ic_bus_black"];
    [self.contentView addSubview:_busImageView];
    
    _nameLabel = [[UILabel alloc]initWithFont:STFont(16) text:@"" textAlignment:NSTextAlignmentCenter textColor:c05 backgroundColor:nil multiLine:NO];
    [self.contentView addSubview:_nameLabel];
    
    _arrivalLabel = [[UILabel alloc]initWithFont:STFont(12) text:@"" textAlignment:NSTextAlignmentCenter textColor:c06 backgroundColor:nil multiLine:NO];
    [self.contentView addSubview:_arrivalLabel];
    
    _leaveLabel = [[UILabel alloc]initWithFont:STFont(12) text:@"" textAlignment:NSTextAlignmentCenter textColor:c07 backgroundColor:nil multiLine:NO];
    [self.contentView addSubview:_leaveLabel];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(STWidth(15), STHeight(50)-LineHeight, ScreenWidth - STWidth(15), LineHeight)];
    lineView.backgroundColor = cline;
    [self.contentView addSubview:lineView];

    
}

-(void)updateData:(BusModel *)model{
    CGSize nameSize = [model.n sizeWithMaxWidth:ScreenWidth font:[UIFont systemFontOfSize:STFont(16)]];
    _nameLabel.text = model.n ;
    _nameLabel.frame = CGRectMake(STWidth(15), 0, nameSize.width, STHeight(50));
    
    if(model.leavingNum > 0 || model.arrivaledNum > 0){
        _busImageView.hidden = NO;
    }else{
        _busImageView.hidden = YES;
    }
    
    if(model.arrivaledNum > 0){
        NSString *arrivalStr = [NSString stringWithFormat:@"进站：%ld辆",model.arrivaledNum];
        _arrivalLabel.text = arrivalStr;
        CGSize arrivalSize = [arrivalStr sizeWithMaxWidth:ScreenWidth font:[UIFont systemFontOfSize:STFont(12)]];
        if(model.leavingNum > 0){
//            _arrivalLabel.font = [UIFont systemFontOfSize:STFont(12)];
//            CGSize arrivalSize = [arrivalStr sizeWithMaxWidth:ScreenWidth font:[UIFont systemFontOfSize:STFont(12)]];
            _arrivalLabel.frame = CGRectMake(ScreenWidth - STWidth(30) - STHeight(20)- arrivalSize.width, STHeight(8), arrivalSize.width, STHeight(12));
        }else{
//            _arrivalLabel.font = [UIFont systemFontOfSize:STFont(14)];
//            CGSize arrivalSize = [arrivalStr sizeWithMaxWidth:ScreenWidth font:[UIFont systemFontOfSize:STFont(14)]];
            _arrivalLabel.frame = CGRectMake(ScreenWidth - STWidth(30) - STHeight(20)- arrivalSize.width, 0, arrivalSize.width, STHeight(50));
        }

    }else{
        _arrivalLabel.text = @"";
    }
    
    if(model.leavingNum > 0){
        NSString *leaveStr = [NSString stringWithFormat:@"离站：%ld辆",model.leavingNum];
        _leaveLabel.text = leaveStr;
        CGSize leaveSize = [leaveStr sizeWithMaxWidth:ScreenWidth font:[UIFont systemFontOfSize:STFont(12)]];
        if(model.arrivaledNum > 0){
//            _leaveLabel.font = [UIFont systemFontOfSize:STFont(12)];
//            CGSize leaveSize = [leaveStr sizeWithMaxWidth:ScreenWidth font:[UIFont systemFontOfSize:STFont(12)]];
            _leaveLabel.frame = CGRectMake(ScreenWidth - STWidth(30) - STHeight(20)- leaveSize.width, STHeight(30), leaveSize.width, STHeight(12));
        }else{
//            _leaveLabel.font = [UIFont systemFontOfSize:STFont(14)];
//            CGSize leaveSize = [leaveStr sizeWithMaxWidth:ScreenWidth font:[UIFont systemFontOfSize:STFont(14)]];
            _leaveLabel.frame = CGRectMake(ScreenWidth - STWidth(30) - STHeight(20)- leaveSize.width, 0, leaveSize.width, STHeight(50));
        }
    }else{
        _leaveLabel.text = @"";
    }
}


+(NSString *)identify{
    return NSStringFromClass([BusDetailViewCell class]);
}

@end

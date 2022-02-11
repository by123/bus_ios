



//
//  SearchViewCell.m
//  bus
//
//  Created by by.huang on 2018/9/15.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "SearchViewCell.h"

@interface SearchViewCell()

@property(strong, nonatomic)UILabel *nameLabel;

@end

@implementation SearchViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initView];
    }
    return self;
}


-(void)initView{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(STWidth(15), STHeight(10), STHeight(20), STHeight(20))];
    imageView.image = [UIImage imageNamed:@"ic_bus_black"];
    [self.contentView addSubview:imageView];
    
    _nameLabel = [[UILabel alloc]initWithFont:STFont(16) text:@"" textAlignment:NSTextAlignmentCenter textColor:c05 backgroundColor:nil multiLine:NO];
    [self.contentView addSubview:_nameLabel];
    
    
    UIImageView *arrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth -  STWidth(15) -STHeight(20), STHeight(10), STHeight(20), STHeight(20))];
    arrowImageView.image = [UIImage imageNamed:@"ic_arrow"];
    [self.contentView addSubview:arrowImageView];
    
}

-(void)updateData:(BusModel *)model{
    CGSize nameSize = [model.n sizeWithMaxWidth:ScreenWidth font:[UIFont systemFontOfSize:STFont(16)]];
    _nameLabel.text = model.n;
    _nameLabel.frame = CGRectMake(STWidth(15) + STHeight(20) + STWidth(10), 0, nameSize.width, STHeight(40));

}

+(NSString *)identify{
    return NSStringFromClass([SearchViewCell class]);
}

@end

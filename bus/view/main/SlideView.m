//
//  SlideView.m
//  bus
//
//  Created by by.huang on 2018/9/13.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "SlideView.h"

@interface SlideView()

@property(strong, nonatomic)UIView *panelView;

@end

@implementation SlideView

-(instancetype)init{
    if(self == [super init]){
        [self initView];
    }
    return self;
}


-(void)initView{
    self.frame = CGRectMake(0, StatuBarHeight, ScreenWidth, ScreenHeight - StatuBarHeight);
    self.backgroundColor = c03;
    self.hidden = YES;
    
    CGFloat panelWidth = ScreenWidth * 2 / 3;
    _panelView = [[UIView alloc]initWithFrame:CGRectMake(-panelWidth, 0, panelWidth, ScreenHeight-StatuBarHeight)];
    _panelView.backgroundColor = cwhite;
    [self addSubview:_panelView];
    

    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, panelWidth, STHeight(200))];
    topView.backgroundColor = c02;
    [_panelView addSubview:topView];
    
    UIImageView *iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(STWidth(20), STHeight(50), STWidth(60), STWidth(60))];
    iconImageView.image = [UIImage imageNamed:@"ic_bus"];
    iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_panelView addSubview:iconImageView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFont:STFont(16) text:MSG_MAIN_TITLE textAlignment:NSTextAlignmentLeft textColor:cwhite backgroundColor:nil multiLine:NO];
    titleLabel.frame = CGRectMake(STWidth(20), STHeight(130), panelWidth - STWidth(20), STHeight(16));
    [_panelView addSubview:titleLabel];
    
    UILabel *titleLabel2 = [[UILabel alloc]initWithFont:STFont(16) text:MSG_MAIN_TITLE2 textAlignment:NSTextAlignmentLeft textColor:c04 backgroundColor:nil multiLine:NO];
    titleLabel2.frame = CGRectMake(STWidth(20), STHeight(150), panelWidth - STWidth(20), STHeight(16));
    [_panelView addSubview:titleLabel2];
}


-(void)open{
    CGFloat panelWidth = ScreenWidth * 2 / 3;
    self.hidden = NO;
    WS(weakSelf)
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.panelView.frame = CGRectMake(0, 0, panelWidth, ScreenHeight-StatuBarHeight);
    }];
    
}

-(void)close{
    CGFloat panelWidth = ScreenWidth * 2 / 3;
    WS(weakSelf)
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.panelView.frame = CGRectMake(-panelWidth, 0, panelWidth, ScreenHeight-StatuBarHeight);
    } completion:^(BOOL finished) {
        weakSelf.hidden = YES;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self close];
}

@end

//
//  BusDetailView.m
//  bus
//
//  Created by by.huang on 2018/9/16.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "BusDetailView.h"
#import "BusDetailViewCell.h"

@interface BusDetailView()<UITableViewDelegate,UITableViewDataSource>

@property(strong, nonatomic)BusDetailViewModel *mViewModel;
@property(strong, nonatomic)UITableView *tableView;
@property(strong, nonatomic)UILabel *startLabel;
@property(strong, nonatomic)UILabel *endLabel;

@end

@implementation BusDetailView{
    Boolean order;
}

-(instancetype)initWithViewModel:(BusDetailViewModel *)viewModel{
    if(self == [super init]){
        _mViewModel = viewModel;
        [self initView];
    }
    return self;
}

-(void)initView{
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, STHeight(100))];
    [self addSubview:topView];
    
    UILabel *startTitleLabel = [[UILabel alloc]initWithFont:STFont(14) text:@"起" textAlignment:NSTextAlignmentCenter textColor:cwhite backgroundColor:c01 multiLine:NO];
    startTitleLabel.layer.masksToBounds = YES;
    startTitleLabel.layer.cornerRadius = STHeight(15);
    startTitleLabel.frame = CGRectMake(STWidth(15), STHeight(10), STHeight(30), STHeight(30));
    [topView addSubview:startTitleLabel];
    
    _startLabel = [[UILabel alloc]initWithFont:STFont(14) text:@"" textAlignment:NSTextAlignmentCenter textColor:cblack backgroundColor:nil multiLine:NO];
    [topView addSubview:_startLabel];
    
    UILabel *endTitleLabel = [[UILabel alloc]initWithFont:STFont(14) text:@"终" textAlignment:NSTextAlignmentCenter textColor:cwhite backgroundColor:c02 multiLine:NO];
    endTitleLabel.layer.masksToBounds = YES;
    endTitleLabel.layer.cornerRadius = STHeight(15);
    endTitleLabel.frame = CGRectMake(STWidth(15), STHeight(60), STHeight(30), STHeight(30));
    [topView addSubview:endTitleLabel];
    
    _endLabel = [[UILabel alloc]initWithFont:STFont(14) text:@"" textAlignment:NSTextAlignmentCenter textColor:cblack backgroundColor:nil multiLine:NO];
    [topView addSubview:_endLabel];
    
    UIButton *exchangeBtn = [[UIButton alloc]init];
    exchangeBtn.frame  = CGRectMake(ScreenWidth - STHeight(40) - STWidth(15),STHeight(30), STHeight(40), STHeight(40));
    [exchangeBtn setImage:[UIImage imageNamed:@"ic_exchange"] forState:UIControlStateNormal];
    [exchangeBtn addTarget:self action:@selector(onExchangeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:exchangeBtn];

    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, STHeight(100),ScreenWidth , LineHeight)];
    lineView.backgroundColor = cline;
    [self addSubview:lineView];

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STHeight(100)+LineHeight, ScreenWidth, ContentHeight-STHeight(100)-LineHeight)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView useDefaultProperty];
    [self addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_mViewModel.busModels count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return STHeight(50);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BusDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[BusDetailViewCell identify]];
    if(cell == nil){
        cell = [[BusDetailViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[BusDetailViewCell identify]];
    }
    if(!IS_NS_COLLECTION_EMPTY(_mViewModel.busModels)){
        [cell updateData:[_mViewModel.busModels objectAtIndex:indexPath.row]];
    }
    return cell;
}


-(void)onExchangeBtnClick{
    order = !order;
    if(_mViewModel){
        [_mViewModel requestBusDetail:order];
    }
}


-(void)updateView{
    if(!IS_NS_COLLECTION_EMPTY(_mViewModel.busModels)){
        BusModel *startModel = [_mViewModel.busModels objectAtIndex:0];
        _startLabel.text = startModel.n;
        CGSize startSize = [startModel.n sizeWithMaxWidth:ScreenWidth - STWidth(120) font:[UIFont systemFontOfSize:16]];
        _startLabel.frame = CGRectMake(STWidth(60), STHeight(10), startSize.width, STHeight(30));
    
        BusModel *endModel = [_mViewModel.busModels objectAtIndex:(_mViewModel.busModels.count - 1)];
        _endLabel.text = endModel.n;
        CGSize endSize = [endModel.n sizeWithMaxWidth:ScreenWidth - STWidth(120) font:[UIFont systemFontOfSize:16]];
        _endLabel.frame = CGRectMake(STWidth(60), STHeight(60), endSize.width, STHeight(30));
    }
    [_tableView reloadData];
}


@end

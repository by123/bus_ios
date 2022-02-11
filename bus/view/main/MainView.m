//
//  MainView.m
//  bus
//
//  Created by by.huang on 2018/9/13.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "MainView.h"

@interface MainView()<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic)UIButton *searchBtn;
@property(strong, nonatomic)MainViewModel *mViewModel;
@property(strong, nonatomic)UITableView *tableView;

@end

@implementation MainView

-(instancetype)initWithViewModel:(MainViewModel *)viewModel{
    if(self == [super init]){
        _mViewModel = viewModel;
        [self initView];
    }
    return self;
}

-(void)initView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STHeight(60), ScreenWidth, ContentHeight-STHeight(60))];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView useDefaultProperty];
    [self addSubview:_tableView];
    
    _searchBtn = [[UIButton alloc]initWithFont:STFont(16) text:MSG_MAIN_SEARCH textColor:c01 backgroundColor:nil corner:STHeight(10) borderWidth:LineHeight borderColor:c01];
    _searchBtn.frame = CGRectMake((ScreenWidth - STWidth(120))/2, (ContentHeight -STHeight(40))/2 , STWidth(120), STHeight(40));
    [_searchBtn setImage:[UIImage imageNamed:@"ic_search"] forState:UIControlStateNormal];
    [_searchBtn addTarget:self action:@selector(onClickSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    [_searchBtn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -STWidth(10), 0.0, 0.0)];
    [self addSubview:_searchBtn];
    
}

-(void)onClickSearchBtn{
    if(_mViewModel){
        [_mViewModel clickSearch];
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if(!IS_NS_COLLECTION_EMPTY(_mViewModel.chatDatas)){
//        return [_mViewModel.chatDatas count];
//    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(!IS_NS_COLLECTION_EMPTY(_mViewModel.chatDatas)){
//        ChatModel *chatModel = [_mViewModel.chatDatas objectAtIndex:indexPath.row];
//        NSString *content = [NSString stringWithFormat:@"%@：%@",chatModel.name,chatModel.content];
//        CGSize cellSize = [content sizeWithMaxWidth:(ScreenWidth - STWidth(20)) font:[UIFont systemFontOfSize:STFont(14)]];
//        return cellSize.height + STHeight(5);
//    }
    return STHeight(30);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fsd"];
//    if(!cell){
//        cell = [[ChatViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ChatViewCell identify]];
//    }
//    [cell setBackgroundColor:cclear];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    if(!IS_NS_COLLECTION_EMPTY(_mViewModel.chatDatas)){
//        [cell updateView:[_mViewModel.chatDatas objectAtIndex:indexPath.row]];
//    }
    return cell;
}



@end

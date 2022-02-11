//
//  SearchPage.m
//  bus
//
//  Created by by.huang on 2018/9/14.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "SearchPage.h"
#import "SearchView.h"
#import "BusDetailPage.h"

@interface SearchPage ()<SearchViewDelegate>

@property(strong, nonatomic)SearchViewModel *viewModel;
@property(strong, nonatomic)SearchView *searchView;

@end

@implementation SearchPage


+(void)show:(BaseViewController *)controller{
    SearchPage *page = [[SearchPage alloc]init];
    [controller pushPage:page];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showSTNavigationBar:MSG_MAIN_TITLE needback:YES];
    [self initView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setStatuBarBackgroud:c01 style:UIStatusBarStyleLightContent];
}

-(void)initView{
    _viewModel = [[SearchViewModel alloc]init];
    _viewModel.delegate = self;
    
    _searchView = [[SearchView alloc]initWithViewModel:_viewModel];
    _searchView.frame = CGRectMake(0, StatuNavHeight, ScreenWidth, ContentHeight);
    [self.view addSubview:_searchView];
}

-(void)onRequestBegin{
    
}

-(void)onRequestFail:(NSString *)msg{
    
}

-(void)onRequestSuccess:(RespondModel *)respondModel data:(id)data{
    [_searchView updateTableView];
}


-(void)onGoBusDetailPage:(BusModel *)model{
    [BusDetailPage show:self model:model];
}



@end

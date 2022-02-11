//
//  MainPage.m
//  bus
//
//  Created by by.huang on 2018/9/13.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "MainPage.h"
#import "SlideView.h"
#import "MainView.h"
#import "MainViewModel.h"
#import "SearchPage.h"

@interface MainPage ()<MainViewDelegate>

@property(strong, nonatomic)MainView *mainView;
@property(strong, nonatomic)SlideView *slideView;

@end

@implementation MainPage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showSTNavigationBar:MSG_MAIN_TITLE leftImage:[UIImage imageNamed:@"ic_slide"]];
    [self initView];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setStatuBarBackgroud:c01 style:UIStatusBarStyleLightContent];
}


-(void)initView{

    MainViewModel *viewModel = [[MainViewModel alloc]init];
    viewModel.delegate = self;
    
    _mainView = [[MainView alloc]initWithViewModel:viewModel];
    _mainView.frame = CGRectMake(0, StatuBarHeight + NavigationBarHeight, ScreenWidth, ContentHeight);
    [self.view addSubview:_mainView];
    
    _slideView = [[SlideView alloc]init];
    [self.view addSubview:_slideView];
}


-(void)backLastPage{
    if(_slideView){
        [_slideView open];
    }
}


-(void)onSearchClicked{
    [SearchPage show:self];
}




@end

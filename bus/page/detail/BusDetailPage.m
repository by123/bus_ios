//
//  BusDetailPage.m
//  bus
//
//  Created by by.huang on 2018/9/16.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "BusDetailPage.h"
#import "BusDetailView.h"
@interface BusDetailPage ()<BusDetailViewDelegate>

@property(strong, nonatomic)BusModel *mBusModel;
@property(strong, nonatomic)BusDetailViewModel *viewModel;
@property(strong, nonatomic)BusDetailView *busDetailView;

@end

@implementation BusDetailPage

+(void)show:(BaseViewController *)controller model:(BusModel *)busModel{
    BusDetailPage *page = [[BusDetailPage alloc]init];
    page.mBusModel = busModel;
    [controller pushPage:page];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showSTNavigationBar:@"" needback:YES];
    [self initView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setStatuBarBackgroud:c01 style:UIStatusBarStyleLightContent];
}

-(void)initView{
    _viewModel = [[BusDetailViewModel alloc]initWithBusModel:_mBusModel];
    _viewModel.delegate = self;
    
    _busDetailView = [[BusDetailView alloc]initWithViewModel:_viewModel];
    _busDetailView.frame = CGRectMake(0, StatuNavHeight, ScreenWidth, ContentHeight);
    [self.view addSubview:_busDetailView];
    
    [_viewModel requestBusDetail:NO];
}


-(void)onRequestBegin{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)onRequestSuccess:(RespondModel *)respondModel data:(id)data{
    if([respondModel.requestUrl containsString:sUrlGetBusStopLocation]){
        [_busDetailView updateView];
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)onRequestFail:(NSString *)msg{
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}



@end

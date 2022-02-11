//
//  BaseViewController.m
//  framework
//
//  Created by 黄成实 on 2018/4/17.
//  Copyright © 2018年 黄成实. All rights reserved.
//

#import "BaseViewController.h"
#import "STObserverManager.h"
#import "AdMobManager.h"

@interface BaseViewController ()<STNavigationViewDelegate,STObserverProtocol>

@property(copy,nonatomic)void(^onRightBtnClick)(void);
@property(copy,nonatomic)void(^onLeftBtnClick)(void);

@end

@implementation BaseViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    [self hideNavigationBar:YES];
    self.view.backgroundColor = cwhite;
}

-(void)viewWillAppear:(BOOL)animated{
    [[STObserverManager sharedSTObserverManager]registerSTObsever:Notify_ADMOB delegate:self];
}

-(void)viewWillDisappear:(BOOL)animated{
    [[STObserverManager sharedSTObserverManager]removeSTObsever:Notify_ADMOB];
}


-(void)hideNavigationBar : (Boolean) hidden{
    self.navigationController.navigationBarHidden = hidden;
}


-(void)setStatuBarBackgroud : (UIColor *)color style:(UIStatusBarStyle)statuBarStyle{
    [[UIApplication sharedApplication] setStatusBarStyle:statuBarStyle];
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


-(void)pushPage:(BaseViewController *)targetPage{
    [self.navigationController pushViewController:targetPage animated:YES];
}

-(void)backLastPage{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)showSTNavigationBar:(NSString *)title needback:(Boolean)needback{
    _navigationView = [[STNavigationView alloc]initWithTitle:title needBack:needback];
    _navigationView.delegate = self;
    [self.view addSubview:_navigationView];
}

-(void)showSTNavigationBar:(NSString *)title needback:(Boolean)needback backgroudColor:(UIColor *)backgroudColor{
    _navigationView = [[STNavigationView alloc]initWithTitle:title needBack:needback];
    _navigationView.delegate = self;
    _navigationView.backgroundColor = backgroudColor;
    [self.view addSubview:_navigationView];
}

-(void)showSTNavigationBar:(NSString *)title needback:(Boolean)needback rightBtn:(NSString *)rightStr block:(void (^)(void))click{
    _onRightBtnClick = click;
    _navigationView = [[STNavigationView alloc]initWithTitle:title needBack:needback rightBtn:rightStr];
    _navigationView.delegate = self;
    [self.view addSubview:_navigationView];
}

-(void)showSTNavigationBar:(NSString *)title needback:(Boolean)needback rightBtn:(NSString *)rightStr rightColor:(UIColor *)color block:(void (^)(void))click{
    _onRightBtnClick = click;
    _navigationView = [[STNavigationView alloc]initWithTitle:title needBack:needback rightBtn:rightStr rightColor:color];
    _navigationView.delegate = self;
    [self.view addSubview:_navigationView];
}

-(void)showSTNavigationBar:(NSString *)title leftImage:(UIImage *)leftImage{
    _navigationView = [[STNavigationView alloc]initWithTitle:title needBack:YES leftimage:leftImage];
    _navigationView.delegate = self;
    [self.view addSubview:_navigationView];
}

-(void)OnBackBtnClicked{
    [self backLastPage];
}

-(void)onRightBtnClicked{
    _onRightBtnClick();
}

-(void)onReciveResult:(NSString *)key msg:(id)msg{
    WS(weakSelf)
    [STAlertUtil showAlertController:@"恭喜您！" content:@"观看完整广告可免费获取B币，给喜欢的主播免费刷礼物吧！" controller:self confirm:^{
        [[AdMobManager sharedAdMobManager] showAd:weakSelf];
    }];
}


@end

//
//  SearchView.m
//  bus
//
//  Created by by.huang on 2018/9/14.
//  Copyright © 2018年 by.huang. All rights reserved.
//

#import "SearchView.h"
#import "SearchViewCell.h"

@interface SearchView()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property(strong, nonatomic)SearchViewModel *mViewModel;
@property(strong, nonatomic)UITextField *searchTF;
@property(strong, nonatomic)UIButton *searchBtn;
@property(strong, nonatomic)UITableView *tableView;

@end

@implementation SearchView

-(instancetype)initWithViewModel:(SearchViewModel *)viewModel{
    if(self == [super init]){
        _mViewModel = viewModel;
        [self initView];
    }
    return self;
}

-(void)initView{
    _searchTF = [[UITextField alloc]initWithFont:STFont(14) textColor:cblack backgroundColor:nil corner:STHeight(10) borderWidth:LineHeight borderColor:c02 padding:STHeight(10)];
    [_searchTF setReturnKeyType:UIReturnKeySearch];
    _searchTF.frame = CGRectMake(STWidth(15), STHeight(15), ScreenWidth - STWidth(30), STHeight(40));
    _searchTF.placeholder = MSG_MAIN_SEARCH_TIPS;
    _searchTF.delegate = self;
    [_searchTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    [self addSubview:_searchTF];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STHeight(60), ScreenWidth, ContentHeight-STHeight(60))];
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
    return STHeight(40);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SearchViewCell identify]];
    if(cell == nil){
        cell = [[SearchViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[SearchViewCell identify]];
    }
    if(!IS_NS_COLLECTION_EMPTY(_mViewModel.busModels)){
        [cell updateData:[_mViewModel.busModels objectAtIndex:indexPath.row]];
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(!IS_NS_COLLECTION_EMPTY(_mViewModel.busModels)){
        BusModel *model = [_mViewModel.busModels objectAtIndex:indexPath.row];
        [_mViewModel goBusDetailPage:model];
    }
}

- (void)textFieldDidChange:(UITextField *)textField{
    if(IS_NS_STRING_EMPTY(textField.text)){
        return;
    }
    if(_mViewModel){
        [_mViewModel requestBus:textField.text];
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)updateTableView{
    [_tableView reloadData];
}


@end

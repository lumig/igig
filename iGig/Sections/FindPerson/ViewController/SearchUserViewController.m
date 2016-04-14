//
//  SearchUserViewController.m
//  iGig
//
//  Created by mac on 15/10/26.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "SearchUserViewController.h"
#import "LDSegmentControl.h"
#import "SearchUserTableViewCell.h"
#import "UserShowModel.h"
#import "MyHomePageViewController.h"

@interface SearchUserViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)LDSegmentControl *segmentControl;
@property (nonatomic, assign)   NSInteger          currentIndex;

@end

@implementation SearchUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetUI];
}

- (void)resetUI
{
    self.title = @"找到N个用户";
//    self.segmentControl = [[LDSegmentControl alloc]initWithTitles:@[@"全部",@"乐迷",@"乐队",@"主办",@"场地"] selected:^(NSInteger index) {
//        self.currentIndex = index;
//        [self.tableView reloadData];
//    }];
//    [self.view addSubview:self.segmentControl];
//    [self.segmentControl makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@64);
//        make.left.and.right.equalTo(@0);
//        make.height.equalTo(@45);
//        
//    }];
//    self.currentIndex = 0;
//    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH-20, SCREEN_HEIGHT-64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = RGBACOLOR(75, 75, 75, 1);
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArary.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *userCellID = @"userCellID";
    SearchUserTableViewCell *userCell = (SearchUserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:userCellID];
    if (userCell == nil) {
        userCell = [[SearchUserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userCellID];
    }
    if (indexPath.row < _dataArary.count) {
        [userCell cellFillWithModel:_dataArary[indexPath.row]];
    }
    
    userCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
    userCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return userCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SearchUserTableViewCell cellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserShowModel *model = _dataArary[indexPath.row];
    MyHomePageViewController *myHomeVC = [[MyHomePageViewController alloc] init];
    myHomeVC.userId = model.mId;
    [self.navigationController pushViewController:myHomeVC animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

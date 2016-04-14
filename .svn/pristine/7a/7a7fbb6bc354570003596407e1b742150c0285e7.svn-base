//
//  IGUserCenterViewController.m
//  iGig
//
//  Created by abc on 15/10/20.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGUserCenterViewController.h"
#import "IGCustInfoView.h"
#import "MineTableCell.h"
#import "IGLoginViewController.h"
#import "IGFeedbackViewController.h"
#import "MyHomePageViewController.h"
#import "IGAboutViewController.h"
#import "IGCircleViewController.h"
#import "IGAttentionViewController.h"

@interface IGUserCenterViewController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, IGCustInfoViewDelegate>{
    UIAlertView *_huancun;
}

@property (nonatomic, strong) NSArray *cellTitleArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation IGUserCenterViewController

- (NSArray *)cellTitleArray{
    if(nil == _cellTitleArray){
        _cellTitleArray = [NSArray arrayWithObjects:@"圈      子", @"建      议", @"关      于", @"关注设置", @"我的关注", @"清除缓存", @"退出登录", nil];
    }
    return _cellTitleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI{
    IGCustInfoView *headView = [[IGCustInfoView alloc] initWithFrame:CGRectMake(10, 10 + 64, SCREEN_WIDTH - 20, 100)];
    [self.view addSubview:headView];
    headView.delegate = self;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, KGetViewBottomestYPosition(headView)+5, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 74-64) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    _tableView = tableView;
//    tableView.scrollEnabled = NO;
    [self.view addSubview:tableView];

}

#pragma mark - delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineTableCell *cell = [MineTableCell cellWithTableView:tableView];
    
    cell.titleLabel.text = self.cellTitleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSelector:@selector(diSelected) withObject:nil afterDelay:0.5f];
    
    if(indexPath.row == 0){
        IGCircleViewController *vc = [[IGCircleViewController alloc] init];
        vc.isTabBar = YES;
        [self.tabBarController.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1){//意见反馈
        IGFeedbackViewController *vc = [[IGFeedbackViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 2){//关于
        IGAboutViewController *vc = [[IGAboutViewController alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 3){//关注设置
    
    }else if(indexPath.row == 4){//我的关注
        IGAttentionViewController *vc = [[IGAttentionViewController alloc] init];
        vc.isTabBar = YES;
        [vc addSegment:nil];
        [self.tabBarController.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 5){//清楚缓存
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"清理缓存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"清除", nil];
        _huancun = alertView;
        [alertView show];
    }else if(indexPath.row == 6){//退出登陆
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"确定退出?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
        [alertView show];
    }
}

- (void)diSelected{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(alertView == _huancun){
        if(buttonIndex == 1){
            //          [SVProgressHUD show];
            [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
            [self performSelector:@selector(huancun) withObject:nil afterDelay:1];
        }
    }else{
        if(buttonIndex == 1){
            
            IGLoginViewController *vc = [[IGLoginViewController alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            nav.navigationBar.hidden = YES;
            
            [self presentViewController:nav animated:YES completion:nil];
        }
    }
}

- (void)huancun{
    [SVProgressHUD dismiss];
    [MBProgressHUD showWithMessage:@"缓存清理成功"];
}

- (void)custInfoViewDidSeleted{
    MyHomePageViewController *vc = [[MyHomePageViewController alloc] init];
    vc.userId = [[NSUserDefaults standardUserDefaults]objectForKey:IGCust_Id];
    vc.titleStr = @"我的主页";
    [self.navigationController pushViewController:vc animated:YES];
}

@end

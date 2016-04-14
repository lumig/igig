//
//  IGAttentionViewController.m
//  iGig
//
//  Created by abc on 15/10/20.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGAttentionViewController.h"
#import "ShowTableViewCell.h"
#import "LDSegmentControl.h"
#import "SearchUserTableViewCell.h"
#import "IGShowManager.h"
#import "DetailShowViewController.h"
#import "IGUserManager.h"
#import "UserShowModel.h"
#import "MyHomePageViewController.h"
#import "EmptyView.h"

@interface IGAttentionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UITableView *userTableView;

@property(nonatomic,strong)LDSegmentControl *segmentControl;
@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)EmptyView *emptyView;

@end

@implementation IGAttentionViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关注";
//    [self requestData];
    
    [self setNav];
    
    [self resetUI];
}

- (void)setNav{
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22.5, 24)];
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn setImage:[UIImage imageNamed:@"i_arrow_white_left"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButtonItem;

}

- (void)backClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)resetUI
{
    if (_isShowUserTableView == NO) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH-20, SCREEN_HEIGHT-64)];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = RGBACOLOR(75, 75, 75, 1);
        [self.view addSubview:self.tableView];
    }
   
    if (_isShowUserTableView) {
    
        [self.view addSubview:self.segmentControl];
        
        [self.view addSubview:self.userTableView];
        
    }
}

- (void)addSegment:(UITabBarController *)tabbar
{
   UISegmentedControl *segmeController = [[UISegmentedControl alloc]initWithItems:@[@"演出",@"用户"]];
    segmeController.frame = CGRectMake(0, 0, 150, 30);
    segmeController.center = CGPointMake(self.view.bounds.size.width/2, 25);
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor whiteColor];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:14],NSFontAttributeName ,shadow,NSShadowAttributeName ,nil];
    NSDictionary * normalDic  = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName,  [UIFont systemFontOfSize:14],NSFontAttributeName ,shadow,NSShadowAttributeName ,nil];
    segmeController.tintColor =RGBACOLOR(90, 90, 90, 1);
    [segmeController setTitleTextAttributes:dic forState:UIControlStateSelected];
    [segmeController setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    [segmeController addTarget:self action:@selector(chooseCategoty:) forControlEvents:UIControlEventValueChanged];
    segmeController.selectedSegmentIndex = 0;
    if (tabbar) {
        tabbar.navigationItem.titleView = segmeController;
    }else{
        self.navigationItem.titleView = segmeController;
    }
    
}

- (void)chooseCategoty:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        _isShowUserTableView = NO;
        self.segmentControl.hidden = YES;
        self.userTableView.hidden = YES;
        self.tableView.hidden = NO;
        [self requestData];
        [self.tableView reloadData];
    }else
    {
        _isShowUserTableView = YES;
        self.segmentControl.hidden = NO;
        self.userTableView.hidden = NO;
        self.tableView.hidden = YES;
        
        [self requestData];
        [self.view addSubview:self.segmentControl];
        
        [self.view addSubview:self.userTableView];
        
        [self.userTableView reloadData];
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isShowUserTableView == YES) {
       return [self userTableView:tableView cellForRowAtIndexPath:indexPath];
        
        
    }
    else 
    {
        return [self showTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

#pragma mark -- 演出
- (UITableViewCell *)showTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showCellID = @"showCellID";
    ShowTableViewCell *showCell = [tableView dequeueReusableCellWithIdentifier:showCellID];
    if (showCell == nil) {
        showCell = [[[NSBundle mainBundle] loadNibNamed:@"ShowTableViewCell" owner:self options:nil] lastObject];
    }
    if (indexPath.row < _dataArray.count) {
        [showCell cellFillWithModel:_dataArray[indexPath.row]];
    }
    showCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
    showCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return showCell;
}

#pragma mark -- 用户
- (UITableViewCell *)userTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *userCellID = @"userCellID";
    SearchUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userCellID];
    if (cell == nil) {
        cell = [[SearchUserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userCellID];  
    }
    if (indexPath.row < _dataArray.count) {
        [cell cellFillWithModel:_dataArray[indexPath.row]];
    }
    cell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isShowUserTableView ) {
        return  [SearchUserTableViewCell cellHeight];
    }
    else
    {
        return [ShowTableViewCell cellHeight];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isShowUserTableView) {
        UserShowModel *model = _dataArray[indexPath.row];
        MyHomePageViewController *myHomeVC = [[MyHomePageViewController alloc] init];
        myHomeVC.userId = model.mId;
        myHomeVC.titleStr = model.userName;
        [self.navigationController pushViewController:myHomeVC animated:NO];
        
        
    }
    else
    {
        IGHomeModel *model = [[IGHomeModel alloc] init];
        model = _dataArray[indexPath.row];
        
        DetailShowViewController *detailVC = [[DetailShowViewController alloc] init];
        detailVC.showId = [NSNumber numberWithInt:[model.mId intValue]];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}
- (void)requestData

{
    [_dataArray removeAllObjects];
    if (_isShowUserTableView) {
        
        [[IGUserManager sharedInstance] attentionUserWithFrom:@"0" limit:@"10" type:[NSString stringWithFormat:@"%ld",self.currentIndex] utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *dict = (NSDictionary *)responseObject;
            NSArray *array = dict[@"data"];
            
            if (array.count > 0){
                if(_dataArray.count > 0){
                    [_dataArray removeAllObjects];
                }
            }
            for (NSDictionary *subDict in array) {
                [self.dataArray addObject:[UserShowModel fetchModelWithDict:subDict]];
            }
            
            [self isHaveMess];

            [_userTableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"-------- %@",error);
            [MBProgressHUD showWithMessage:@"lists_follow网络错误"];

        }];
    }
    else
    {
        [[IGShowManager sharedInstance] AttentionShowWithFrom:@"0" limit:@"10" utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dict = (NSDictionary *)responseObject;
            NSArray *array = dict[@"data"];
            for (NSDictionary *subDict in array) {
                [self.dataArray addObject:[IGHomeModel HomeModelWithDict:subDict]];
            }
//            [self isHaveMess];
            [_tableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"--------- %@",error);
            [MBProgressHUD showWithMessage:@"collectlists网络错误"];

        }];
    }
    
}

- (void)isHaveMess
{
    if (_dataArray == 0) {
        [self addEmptyView];   
    }
    else
    {
        [_emptyView removeFromSuperview];
    }
}

- (void)addEmptyView
{
    if(_emptyView == nil)
    {
        _emptyView = [[EmptyView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    [self.view addSubview:_emptyView];
    [self.view sendSubviewToBack:_tableView];
    
}


#pragma mark -- getter and setter
- (LDSegmentControl *)segmentControl
{
    if (_segmentControl == nil) {
        _segmentControl = [[LDSegmentControl alloc]initWithTitles:@[@"全部",@"场地",@"主办",@"乐队",@"乐迷"] selected:^(NSInteger index) {
            _currentIndex = index;
            [self requestData];
//            [self.tableView reloadData];
        }];
        [self.view addSubview:self.segmentControl];
        [self.segmentControl makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@64);
            make.left.and.right.equalTo(@0);
            make.height.equalTo(@45);
            
        }];
        _currentIndex = 0;
    }
    
    return _segmentControl;
}

- (UITableView *)userTableView
{
    if (_userTableView == nil) {
        _userTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 109, SCREEN_WIDTH-20, SCREEN_HEIGHT-109)];
        _userTableView.delegate = self;
       _userTableView.dataSource = self;
        _userTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _userTableView.backgroundColor = RGBACOLOR(75, 75, 75, 1);
    }
    return _userTableView;
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

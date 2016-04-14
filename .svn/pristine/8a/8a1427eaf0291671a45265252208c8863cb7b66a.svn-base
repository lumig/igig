//
//  IGCircleViewController.m
//  iGig
//
//  Created by abc on 15/10/20.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGCircleViewController.h"
#import "CircleTableViewCell.h"
#import "CircleModel.h"
#import "MyCircleViewController.h"
#import "PublishMsgViewController.h"
#import "IGCircleManager.h"
#import "IGCustData.h"
#import <UIImageView+AFNetworking.h>
#import "IGLoginViewController.h"


@interface IGCircleViewController ()<UITableViewDataSource,UITableViewDelegate,CircleTableViewCellDelegate>
{
    BOOL _isloading;
    NSInteger _from;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CircleModel *model;
@property(nonatomic,strong)NSString *titleStr;
@property(nonatomic,assign)NSInteger currentPage;
@end

@implementation IGCircleViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"圈子";
    [self isLogin];
    
//    [self requestData];
    
    [self resetUI];
    
}



- (void)addCameraBtn:(UITabBarController *)tabBar
{
        UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        rightButton.frame = CGRectMake(0, 0, 50, 50);
        [rightButton setImage:[UIImage imageNamed:@"circle_photo.png"] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(cameraClick) forControlEvents:UIControlEventTouchUpInside];
        tabBar.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}


- (void)resetUI
{

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-108)];
    
    if (_isTabBar) {
        self.tableView.frame = CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    }
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = [self addHeader];
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _from = 0;
        [self requestMoreData];
    }];

    
    _tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        _from += 10;
        [self requestMoreData];
    }];
//
//    [_tableView.header beginRefreshing];
    [self.view addSubview:_tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *circleCellID = @"circleCellID";
    CircleTableViewCell *circleCell = (CircleTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if (circleCell == nil) {
        circleCell = [[CircleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:circleCellID];
    }
    
    if (indexPath.row < _dataArray.count) {
        [circleCell cellFillWithCircleModel:_dataArray[indexPath.row]];

    }
    circleCell.selectionStyle = UITableViewCellSelectionStyleNone;
    circleCell.delegate =self;
    return circleCell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CircleTableViewCell CellHeightWithModel:_dataArray[indexPath.row]];
}

- (void)iconImgViewClickWithModel:(CircleModel *)model
{
    MyCircleViewController *myCircleVC = [[MyCircleViewController alloc] init];
    myCircleVC.titleStr = [NSString stringWithFormat:@"%@的圈文",model.name];
    myCircleVC.userid = model.userid;
    myCircleVC.utoken = [IGCustData sharedInstance].token;
    myCircleVC.userName = model.name;
    myCircleVC.userPic = model.iconImg;
    [self.navigationController pushViewController:myCircleVC animated:YES];
}



- (void)cameraClick
{
    PublishMsgViewController *pubVC = [[PublishMsgViewController alloc] init];
    [self.navigationController pushViewController:pubVC animated:YES];
}

- (UIView *)addHeader
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    topView.backgroundColor = RGBACOLOR(5, 5, 5, 1);
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 250, 50, 150, 22)];
    nameLabel.text = [IGCustData sharedInstance].username;
    nameLabel.textAlignment = NSTextAlignmentRight;
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.textColor = [UIColor whiteColor];
    [topView addSubview:nameLabel];
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -90 ,50,70 ,70 )];
    [headView setImageWithURL:[NSURL URLWithString:[IGCustData sharedInstance].headPic] placeholderImage:[UIImage imageNamed:@"headpic"]];
    headView.layer.cornerRadius = 35;
    headView.layer.masksToBounds = YES;
    headView.layer.borderWidth = 2;
    headView.layer.borderColor = [[UIColor whiteColor] CGColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)];
    
    headView.userInteractionEnabled = YES;
    [headView addGestureRecognizer:tap];
    [header addSubview:topView];
    [header addSubview:headView];
    
    
    
    return header;
}

- (void)imgClick
{
    MyCircleViewController *myCircleVC = [[MyCircleViewController alloc] init];
    myCircleVC.titleStr = @"我的圈文";
    myCircleVC.userid = [IGCustData sharedInstance].custId;
    myCircleVC.userName = [IGCustData sharedInstance].username;
    myCircleVC.userPic = [IGCustData sharedInstance].headPic;
    myCircleVC.utoken = [[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token];
    [self.navigationController pushViewController:myCircleVC animated:YES];
}

- (void)requestData
{
//    NSLog(@"------- %@",[IGCustData sharedInstance].token);
    _currentPage = 0;
    [_dataArray removeAllObjects];
    [[IGCircleManager sharedInstance] circleListWithFrom:[NSString stringWithFormat:@"%ld",_currentPage] limit:@"10" utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"------- %@",responseObject);
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSArray *array = dict[@"data"];
        
        if (array.count > 0 && _from == 0) {
            [self.dataArray removeAllObjects];
        }
        
        if (array.count < 10 && array.count > 0) {
            [self.tableView.mj_footer removeFromSuperview];
        }
        
        for (NSDictionary *subDict in array) {
            [self.dataArray addObject:[CircleModel fetchWithDesc:subDict]];
        }
//        [_tableView.header endRefreshing];
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:@"lists网络错误"];
    }];
}

- (void)requestMoreData
{
    if (_isloading) {
        return;
    }
    
    _isloading = YES;

    [[IGCircleManager sharedInstance] circleListWithFrom:[NSString stringWithFormat:@"%ld",_from] limit:@"10" utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"------- %@",responseObject);
        _isloading = NO;
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSArray *array = dict[@"data"];
        for (NSDictionary *subDict in array) {
            [self.dataArray addObject:[CircleModel fetchWithDesc:subDict]];
        }
//        [_tableView.footer endRefreshing];3
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:@"lists网络错误"];
    }];
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

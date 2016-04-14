//
//  MyCircleViewController.m
//  iGig
//
//  Created by LuMig on 15/10/25.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "MyCircleViewController.h"
#import "MyCircleTableViewCell.h"
#import "CircleModel.h"
#import "MyHomePageViewController.h"
#import "IGCircleManager.h"
#import "IGCustData.h"
#import <UIImageView+AFNetworking.h>
@interface MyCircleViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)CircleModel *model;

@end

@implementation MyCircleViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self requestData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self requestData];
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *circleCellID = @"circleCellID";
    MyCircleTableViewCell *circleCell = [tableView cellForRowAtIndexPath:indexPath];
    if (circleCell == nil) {
        circleCell = [[MyCircleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:circleCellID];
    }
    if (indexPath.row < _dataArray.count) {
        [circleCell cellFillWithCircleModel:_dataArray[indexPath.row]];
    }
    
    circleCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return circleCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < _dataArray.count) {
        return [MyCircleTableViewCell CellHeightWithModel:_dataArray[indexPath.row]];

    }
    return 0;
}






- (void)resetUI
{
    self.title = _titleStr;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = [self addHeader];
    [self.view addSubview:_tableView];
}

- (UIView *)addHeader
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    topView.backgroundColor = RGBACOLOR(5, 5, 5, 1);
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 250, 50, 150, 22)];
    nameLabel.text = _userName;
    nameLabel.textAlignment = NSTextAlignmentRight;
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.textColor = [UIColor whiteColor];
    [topView addSubview:nameLabel];
    
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -90 ,50,70 ,70 )];
    [headView setImageWithURL:[NSURL URLWithString:_userPic] placeholderImage:[UIImage imageNamed:@"headpic"]];
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
    MyHomePageViewController *homeVC = [[MyHomePageViewController alloc] init];
    homeVC.userId = _userid;
    homeVC.titleStr = @"我的主页";
    [self.navigationController pushViewController:homeVC animated:YES];
}

- (void)requestData
{
    [_dataArray removeAllObjects];
    [[IGCircleManager sharedInstance] myAndOthersCircleWithFrom:@"0"limit:@"10" userId:_userid utoken:[[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token]isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSArray *array = dict[@"data"];
        for (NSDictionary *subDict in array) {
            [self.dataArray addObject:[CircleModel fetchWithDesc:subDict]];
        }
        [self resetUI];
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
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

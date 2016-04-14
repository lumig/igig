//
//  IGFindPersonViewController.m
//  iGig
//
//  Created by abc on 15/10/20.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGFindPersonViewController.h"
#import "LDSegmentControl.h"
#import "PersonSearchTableViewCell.h"
#import "SearchUserViewController.h"
#import "UserShowModel.h"

@interface IGFindPersonViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)LDSegmentControl *segmentControl;
@property (nonatomic, assign)   NSInteger          currentIndex;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)NSString *searchStr;
@end

@implementation IGFindPersonViewController

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    [self resetUI];
}

- (void)resetUI
{
    self.segmentControl = [[LDSegmentControl alloc]initWithTitles:@[@"全部",@"场地",@"主办",@"乐队",@"乐迷"] selected:^(NSInteger index) {
        self.currentIndex = index;
        [self requestData];
        [self.tableView reloadData];
    }];
    [self.view addSubview:self.segmentControl];
    [self.segmentControl makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.left.and.right.equalTo(@0);
        make.height.equalTo(@45);
        
    }];
    self.currentIndex = 0;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 109, SCREEN_WIDTH-20, SCREEN_HEIGHT-158)style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = RGBACOLOR(75, 75, 75, 1);
    [self.view addSubview:self.tableView];
    
}

- (void)addSearchBar:(UITabBarController *)tabbar
{
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-44 , 35)];
    _searchBar.placeholder = @"找乐队、找主办、找场地";
    [_searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"public_searchbox"] forState:UIControlStateNormal];
    _searchBar.delegate = self;
    tabbar.navigationItem.titleView = _searchBar;
    
}
- (void)addSearchBtn:(UITabBarController *)tabBar
{
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 50, 50);
    [rightButton setImage:[UIImage imageNamed:@"public_search.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    tabBar.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}
- (void)searchClick
{
    [_searchBar resignFirstResponder];
    if (_searchStr != nil || _searchBar.text!=nil) {
        NSLog(@"-------- %@",_searchBar.text);
        
        [[IGUserManager sharedInstance] userSearchWithUserName:_searchBar.text type:[NSString stringWithFormat:@"%ld",_currentIndex] isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dict = (NSDictionary *)responseObject;
            NSArray *array = dict[@"data"];
            NSMutableArray *dataArray = [NSMutableArray array];
            for (NSDictionary *subDict in array) {
                [dataArray addObject:[UserShowModel fetchModelWithDict:subDict]];
            }
            if (dataArray.count > 0) {
                SearchUserViewController *searchVC = [[SearchUserViewController alloc] init];
                searchVC.dataArary = dataArray;
                [self.navigationController pushViewController:searchVC animated:YES];  
            }  
            
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//               NSLog(@"%@",error);
               [MBProgressHUD showWithMessage:@"search网络错误"];
           }];
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count] / 2 + [_dataArray count] % 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *searchCellID = @"searchCellID";
    PersonSearchTableViewCell *searchCell = (PersonSearchTableViewCell *)[tableView dequeueReusableCellWithIdentifier:searchCellID];
    if (searchCell == nil) {
        searchCell = [[PersonSearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchCellID];
    }
//    if (indexPath.section == 0) {
        NSDictionary *dict = _dataArray[indexPath.section];
        NSArray *array = dict[@"lists"];
        if (array.count > indexPath.row * 2) {
            BOOL rightFlag = [array count] > indexPath.row * 2 + 1;
            
            [searchCell cellFillLeftDict:[array objectAtIndex:indexPath.row*2] leftRow:indexPath.row * 2 rightDict:rightFlag ? [array objectAtIndex:indexPath.row*2 + 1]:nil rightRow:indexPath.row*2 + 1];
        }
//    }
    
    searchCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
    searchCell.selectionStyle = UITableViewCellSelectionStyleNone;

    return searchCell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    NSArray *array = @[@"热搜乐队",@"热搜场地",@"热搜主办"];
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH -20, 40)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 , 10, 200, 20)];
    titleLabel.font = [UIFont systemFontOfSize:15];
    header.backgroundColor = RGBACOLOR(202, 202, 202, 1);
    titleLabel.textColor = [UIColor blackColor];
    [header addSubview:titleLabel];
    switch (section) {
        case 0:
        {
            titleLabel.text = [_dataArray[0] objectForKey:@"listname"];
        }
            break;
        case 1:
        {
            titleLabel.text = [_dataArray[1] objectForKey:@"listname"];
        }
            break;
        case 2:
        {
            titleLabel.text = [_dataArray[2] objectForKey:@"listname"];
        }
            break;
        case 3:
        {
            titleLabel.text = [_dataArray[3] objectForKey:@"listname"];
        }
            break;  
        default:
            break;
    }
    
    
    return header;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH -20, 5)];
    
    footer.backgroundColor = RGBACOLOR(93, 93, 93, 1);
    return footer;
}



- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    
    if ([eventName isEqualToString:PERSONSEARCH_ROUTEREVENT]) {
        
//        NSUInteger row = [[userInfo objectForKey:@"row"] integerValue];
//        SearchUserViewController *userVC= [[SearchUserViewController alloc] init];
//        [self.navigationController pushViewController:userVC animated:YES];
        NSDictionary *dict = [userInfo objectForKey:@"dict"];
        [_searchBar becomeFirstResponder];
        _searchBar.text = dict[@"username"];
        _searchStr = dict[@"username"];;
    }
    
}

- (void)requestData
{
    
    [_dataArray removeAllObjects];
    [[IGUserManager sharedInstance] fDhotWordWithType:[NSNumber numberWithInteger:_currentIndex] isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSArray *array = dict[@"data"];
        self.dataArray = [array mutableCopy];
        
        [_tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:@"lists_hot网络错误"];
    }];

}
#pragma mark -- setter and getter
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
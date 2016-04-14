//
//  NoticeViewController.m
//  iGig
//
//  Created by mac on 15/11/4.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "NoticeViewController.h"
#import "NoticeTableViewCell.h"

@interface NoticeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    
    [self resetUI];
}

- (void)resetUI
{
    self.title = @"通知";
    
    [self addRightBtn];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH-20, SCREEN_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =  RGBACOLOR(93, 93, 93, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}


- (void)addRightBtn
{
    UIButton *btnRight = [[UIButton alloc] init];
    btnRight.frame = CGRectMake(0, 0, 30, 44);
    [btnRight setImage:[UIImage imageNamed:@"public_setup.png"] forState:UIControlStateNormal];
    [btnRight setImage:[UIImage imageNamed:@"public_setup_hg.png"] forState:UIControlStateHighlighted];
    [btnRight addTarget:self action:@selector(settingBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)settingBtn
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *noticeCellID= @"noticeCellID";
    NoticeTableViewCell *noticeCell = (NoticeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:noticeCellID];
    if (noticeCell == nil) {
        noticeCell = [[NoticeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:noticeCellID];
    }
    if (indexPath.row < _dataArray.count) {
        [noticeCell cellFillWithModel:_dataArray[indexPath.row]];
    }
    noticeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return noticeCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [NoticeTableViewCell cellHeight];
}


- (void)requestData
{
    
    [_dataArray removeAllObjects];
    [[IGShowManager sharedInstance] messageWithFrom:@"0" limit:@"10" utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSArray *array = dict[@"data"];
        for (NSDictionary *subDict in array) {
            [self.dataArray addObject:[NoticeModel fetchWithDict:subDict]];
        }
        
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
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

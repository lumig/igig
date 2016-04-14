//
//  FinishViewController.m
//  iGig
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "FinishViewController.h"
#import "PublishView.h"
#import "ShowStateView.h"
#import "ShowTableViewCell.h"
#import "PublishMsgTableViewCell.h"
#import "BtnCellTableViewCell.h"
#import "DetailShowViewController.h"
@interface FinishViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)ShowStateView *topStateView;
@property(nonatomic,strong)PublishView *publishView;
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation FinishViewController

- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadlistData];
    
    [self resetUI];
}

- (void)resetUI
{
    self.title = @"演出状态";
    
    self.topStateView = [[[NSBundle mainBundle] loadNibNamed:@"ShowStateView" owner:self options:nil] lastObject];
    _topStateView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 44);
    _topStateView.backgroundColor = RGBACOLOR(39, 39, 39, 1);
    _topStateView.publishLabel.textColor = [UIColor whiteColor];
    _topStateView.dot1Label.textColor = [UIColor whiteColor];
    _topStateView.acceptAppLabel.textColor = [UIColor whiteColor];
    _topStateView.publishShowLabel.textColor = [UIColor whiteColor];
    _topStateView.dot2Label.textColor = [UIColor whiteColor];
    _topStateView.dot3Label.textColor = [UIColor whiteColor];
    _topStateView.completeLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.topStateView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 108, SCREEN_WIDTH-20, SCREEN_HEIGHT-108) ];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =  RGBACOLOR(93, 93, 93, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //        _tableView.tableHeaderView = [self addHeader];
    [self.view addSubview:self.tableView];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *msgCellID = @"msgCellID";
    PublishMsgTableViewCell *msgCell = (PublishMsgTableViewCell *)[tableView dequeueReusableCellWithIdentifier:msgCellID];
    
    static NSString *btnCellID = @"btnCellID";
    BtnCellTableViewCell *btnCell = (BtnCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:btnCellID];
    
    static NSString *showCellID = @"showCellID";
    ShowTableViewCell  *showCell = (ShowTableViewCell *)[tableView dequeueReusableCellWithIdentifier:showCellID];
    
    if (indexPath.section ==0) {
        
        if (msgCell == nil) {
            msgCell = [[[NSBundle mainBundle] loadNibNamed:@"PublishMsgTableViewCell" owner:self options:nil] lastObject];
        }
        
        
        msgCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        msgCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [msgCell setInfoWithModel:self.model];
        return msgCell;
        
    }else if (indexPath.section == 1)
    {
        if (btnCell == nil) {
            btnCell = [[BtnCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:btnCellID];
        }
        
        
        btnCell.backgroundColor = RGBACOLOR(93, 93, 93, 1);
        btnCell.leftShowBtn.frame = CGRectMake(0, 40, SCREEN_WIDTH-20, 40);
        [btnCell.leftShowBtn setTitle:@"演出发布成功" forState:UIControlStateNormal];
        [btnCell.leftShowBtn setTitle:@"演出发布成功" forState:UIControlStateHighlighted];
        [btnCell.leftShowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnCell.leftShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        btnCell.leftShowBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        btnCell.rightShowBtn.hidden = YES;
        
        
        btnCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return btnCell;
        
    }
    else
    {
        if (showCell == nil) {
            showCell = [[[NSBundle mainBundle] loadNibNamed:@"ShowTableViewCell" owner:self options:nil] lastObject];
        }
        
        
        showCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        showCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return showCell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return [PublishMsgTableViewCell cellHeight];
    }
    else if (indexPath.section == 1)
    {
        return [BtnCellTableViewCell cellHeight];
    }
    else
    {
        return [ShowTableViewCell cellHeight];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH -20, 44)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 , 11, 200, 22)];
        titleLabel.text = @"申请的演出";
        titleLabel.font = [UIFont systemFontOfSize:15];
        header.backgroundColor = RGBACOLOR(202, 202, 202, 1);
        titleLabel.textColor = [UIColor blackColor];
        [header addSubview:titleLabel];
        
        return header;
    }
    else
    {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 44;
    }
    else
    {
        return 0;
    }
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    
    if ([eventName isEqualToString:BTN_ROUTEREVENT]) {
        
        NSUInteger row = [[userInfo objectForKey:@"row"] integerValue];
        if (row == 0)
        {
            [[IGShowManager sharedInstance] showIssuingWithShowId:self.model.mId utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [MBProgressHUD showWithMessage:@"发布成功"];
                
                DetailShowViewController *detailVC = [[DetailShowViewController alloc] init];
                detailVC.showId = [NSNumber numberWithInt:[_model.mId intValue]];
                [self.navigationController pushViewController:detailVC animated:YES];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                [MBProgressHUD showWithMessage:@"服务器维护"];
                [MBProgressHUD showWithMessage:@"issuing网络错误"];

            }];
        }else
        {
            NSLog(@"right");
        }
        
    }
}

- (void)loadlistData{
    NSLog(@"%@",_model);
    [[IGShowManager sharedInstance] showlists_applyWithShowId:self.model.mId utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDic = dict[@"data"];
        NSArray *array = dataDic[@"apply_list"];
        
        for (NSDictionary *dic in array) {
            [self.dataArray addObject:[IGHomeModel HomeModelWithDict:dic]];
        }
        
        [self.tableView reloadData];
        self.tableView.hidden = NO;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showWithMessage:@"申请列表显示失败"];
        [MBProgressHUD showWithMessage:@"lists_apply网络错误"];
    }];

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

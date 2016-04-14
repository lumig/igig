//
//  CloseShowViewController.m
//  iGig
//演出机会关闭
//  Created by mac on 15/11/3.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "CloseShowViewController.h"
#import "PublishView.h"
#import "ShowStateView.h"
#import "ShowTableViewCell.h"
#import "PublishMsgTableViewCell.h"
#import "BtnCellTableViewCell.h"
#import "IGShowManager.h"

@interface CloseShowViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)ShowStateView *topStateView;
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation CloseShowViewController

- (NSMutableArray *)dataArray{
    if(nil == _dataArray){
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDataList];
    
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
    _topStateView.dot3Label.hidden = YES;
    _topStateView.completeLabel.hidden = YES;
    [self.view addSubview:self.topStateView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 108, SCREEN_WIDTH-20, SCREEN_HEIGHT-108) ];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =  RGBACOLOR(93, 93, 93, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return _dataArray.count;
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
        
        [msgCell setInfoWithModel:self.model];
        
        msgCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        msgCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return msgCell;
        
    }else if (indexPath.section == 1)
    {
        if (btnCell == nil) {
            btnCell = [[BtnCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:btnCellID];
        }
        
        
        btnCell.backgroundColor = RGBACOLOR(93, 93, 93, 1);
        btnCell.leftShowBtn.frame = CGRectMake(0, 44, SCREEN_WIDTH-20, 44);
        [btnCell.leftShowBtn setTitle:@"演出机会关闭" forState:UIControlStateNormal];
        [btnCell.leftShowBtn setTitle:@"演出机会关闭" forState:UIControlStateSelected];
        [btnCell.leftShowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnCell.leftShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        btnCell.leftShowBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        // 演出机会按钮 仅仅是显示
        btnCell.leftShowBtn.enabled = NO;
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
        
//        [showCell cellFillWithModel:_dataArray[indexPath.row]];
        
        [showCell cellFillWithModel:_dataArray[indexPath.row]];
        showCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
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


- (void)requestData
{
    [[IGShowManager sharedInstance] placeOnlyApplyWithShowId:[NSNumber numberWithInt:[_model.mId intValue]] utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"pollly %@",responseObject);
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDic = dict[@"data"];
        NSArray *array = dataDic[@"apply_list"];
        
        for (NSDictionary *dic in array) {
            [self.dataArray addObject:[IGHomeModel HomeModelWithDict:dic]];
        }
        NSLog(@"data %@",_dataArray);
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:@"lists_apply网络错误"];
    }];
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    
    if ([eventName isEqualToString:BTN_ROUTEREVENT]) {
        
        NSUInteger row = [[userInfo objectForKey:@"row"] integerValue];
        if (row == 0)
        {
            [[IGShowManager sharedInstance] placeShowCloseWithShowId:[NSNumber numberWithInt:[self.model.mId intValue]] utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [MBProgressHUD showWithMessage:@"关闭成功"];
                [self.navigationController popViewControllerAnimated:YES];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                [MBProgressHUD showWithMessage:@"服务器维护中"];
                [MBProgressHUD showWithMessage:@"close网络错误"];

            }];
        }else
        {
            NSLog(@"right");
        }
        
    }
}

- (void)loadDataList{
//    [[IGShowManager sharedInstance] showlists_applyWithShowId:self.model.mId utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dict = (NSDictionary *)responseObject;
//        NSDictionary *dataDic = dict[@"data"];
//        NSArray *array = dataDic[@"apply_list"];
//        
//        for (NSDictionary *dic in array) {
//            [self.dataArray addObject:[IGHomeModel HomeModelWithDict:dic]];
//        }
//        
//        [self.tableView reloadData];
//        self.tableView.hidden = NO;
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showWithMessage:@"申请列表显示失败"];
//    }];



    [[IGShowManager sharedInstance] placeOnlyApplyWithShowId:[NSNumber numberWithInt:[_model.mId intValue]] utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"pollly %@",responseObject);
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDic = dict[@"data"];
        NSArray *array = dataDic[@"apply_list"];
        
        for (NSDictionary *dic in array) {
            [self.dataArray addObject:[IGHomeModel HomeModelWithDict:dic]];
        }
        NSLog(@"data %@",_dataArray);
        
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
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

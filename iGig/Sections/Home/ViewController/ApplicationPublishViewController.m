//
//  ApplicationPublishViewController.m
//  iGig
//
//  Created by mac on 15/11/3.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "ApplicationPublishViewController.h"
#import "ShowStateView.h"
#import "PublishMsgTableViewCell.h"
#import "BtnCellTableViewCell.h"
#import "ShowTableViewCell.h"
@interface ApplicationPublishViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)ShowStateView *topStateView;
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
//信息
@end

@implementation ApplicationPublishViewController

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
    _topStateView.publishLabel.text = @"申请演出";
    _topStateView.acceptAppLabel.text = @"等待回复";
    _topStateView.publishLabel.textColor = [UIColor whiteColor];
    _topStateView.dot1Label.textColor = [UIColor whiteColor];
    _topStateView.acceptAppLabel.textColor = [UIColor whiteColor];
    _topStateView.dot2Label.textColor = [UIColor whiteColor];
    _topStateView.publishShowLabel.textColor = [UIColor whiteColor];
    
    [self.view addSubview:self.topStateView];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 108, SCREEN_WIDTH -20, SCREEN_HEIGHT-108)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =  RGBACOLOR(93, 93, 93, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.hidden = YES;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
  
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *msgCellID = @"msgCellID";
    PublishMsgTableViewCell *msgCell = (PublishMsgTableViewCell *)[tableView dequeueReusableCellWithIdentifier:msgCellID];
    
    static NSString *phoneCellID = @"phoneCellID";
    UITableViewCell *phoneCell = [tableView dequeueReusableCellWithIdentifier:phoneCellID];
    static NSString *btnCellID = @"btnCellID";
    BtnCellTableViewCell *btnCell = (BtnCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:btnCellID];
    static NSString *showCellID = @"showCellID";
    ShowTableViewCell *showCell = (ShowTableViewCell *)[tableView dequeueReusableCellWithIdentifier:showCellID];
    if (indexPath.section == 0) {
        if (msgCell== nil) {
            msgCell = [[[NSBundle mainBundle] loadNibNamed:@"PublishMsgTableViewCell" owner:self options:nil] lastObject];
        }
        msgCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        msgCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [msgCell setInfoWithModel:self.model];
        
        return msgCell;
    }
    else if (indexPath.section == 1)
    {
        if (phoneCell == nil) {
            phoneCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:phoneCellID];
        }
        
        UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 11, 200, 21)];
        phoneLabel.font = [UIFont systemFontOfSize:14];
        phoneLabel.text = self.model.phone;
        [phoneCell addSubview:phoneLabel];
        
        UIButton *phoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-64, 0, 44, 44)];
        [phoneBtn setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [phoneBtn setImage:[UIImage imageNamed:@"phone_hg"] forState:UIControlStateHighlighted];
        [phoneBtn addTarget:self action:@selector(phoneBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [phoneCell addSubview:phoneBtn];
        
        phoneCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        phoneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return phoneCell;
    }
    else if(indexPath.section == 2)
    {
        if (btnCell == nil) {
                btnCell = [[BtnCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:btnCellID];
        }
        btnCell.leftShowBtn.frame = CGRectMake((SCREEN_WIDTH-200)/2.0f, 44, 180, 44);
        btnCell.backgroundColor = RGBACOLOR(93, 93, 93, 1);
        [btnCell.leftShowBtn setTitle:@"发  布" forState:UIControlStateNormal];
        [btnCell.leftShowBtn setTitle:@"发  布" forState:UIControlStateSelected];
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
        [showCell cellFillWithModel:_dataArray[indexPath.row]];
        showCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        showCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return showCell;
    }
    }



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH -20, 44)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 , 11, 200, 22)];
        titleLabel.text = @"联系方式";
        titleLabel.font = [UIFont systemFontOfSize:15];
        header.backgroundColor = RGBACOLOR(202, 202, 202, 1);
        titleLabel.textColor = [UIColor blackColor];
        [header addSubview:titleLabel];
        
        return header;
    }
   else if (section == 3) {
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
    if (section == 1 || section == 3) {
        return 44;
    }else
    {
        return 0.01f;
    }
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [PublishMsgTableViewCell cellHeight];
    }
    else if (indexPath.section == 2) {
        return [BtnCellTableViewCell cellHeight];
    }
    else if (indexPath.section == 3) {
        return [ShowTableViewCell cellHeight];
    }
    else
    {
        return 44;
    }
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    
    return YES;
}

- (void)submitbtnClick
{

    
}

- (void)phoneBtnClick
{
    NSLog(@"phoneBtnClick");
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    
    if ([eventName isEqualToString:BTN_ROUTEREVENT]) {
        
        NSUInteger row = [[userInfo objectForKey:@"row"] integerValue];
        if (row == 0)
        {
            //发布

            
            [[IGShowManager sharedInstance] showIssuingWithShowId:self.model.mId utoken:@"539a5e5450618268ec7fb8c12f5121e113671515485" success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [MBProgressHUD showWithMessage:@"发布成功"];
                [self.navigationController popToRootViewControllerAnimated:YES];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"error %@",[error localizedDescription]);
//                [MBProgressHUD showWithMessage:@"服务器维护中"];
                [MBProgressHUD showWithMessage:@"issuing网络错误"];

            }];
        }else
        {
            NSLog(@"right");
        }
        
    }
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)loadDataList{
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

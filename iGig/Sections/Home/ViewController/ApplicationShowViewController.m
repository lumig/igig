//
//  ApplicationShowViewController.m
//  iGig
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 longlz. All rights reserved.
//
//申请演出
#import "ApplicationShowViewController.h"
#import "ShowStateView.h"
#import "PublishMsgTableViewCell.h"
#import "IGShowManager.h"

@interface ApplicationShowViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)ShowStateView *topStateView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *submitBtn;

@end

@implementation ApplicationShowViewController
- (void)viewDidLoad {
    [super viewDidLoad];
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
    [self.view addSubview:self.topStateView];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 108, SCREEN_WIDTH -20, 268)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =  RGBACOLOR(93, 93, 93, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
    UIView *line = [UITools createViewWithFrame:CGRectMake(10, 180+108, SCREEN_WIDTH - 20, 2) backgroundColor:UIColorFromRGB(0xB4B4B4, 1)];
    [self.view addSubview:line];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 180 + 108+2, SCREEN_WIDTH - 20, 100)];
    textView.backgroundColor = UIColorFromRGB(0x999999, 1);
    textView.text = [NSString stringWithFormat:@"  %@",self.model.content_ext];
    [self.view addSubview:textView];
//    _textView = textView;
    
    self.submitBtn = [[UIButton alloc]init];
    self.submitBtn.frame = CGRectMake(0, 0, 175, 40);
    self.submitBtn.center = CGPointMake(SCREEN_WIDTH/2.0f, 438);
    [_submitBtn setTitle:@"申请" forState:UIControlStateNormal];
    [_submitBtn setTitle:@"申请" forState:UIControlStateSelected];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_submitBtn setTitleColor:[UIColor grayColor ] forState:UIControlStateDisabled];

    _submitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _submitBtn.enabled = self.enable;
    [_submitBtn addTarget:self action:@selector(submitbtnClick) forControlEvents:UIControlEventTouchUpInside];
    _submitBtn.backgroundColor = RGBACOLOR(202, 202, 202, 1);
    [self.view addSubview:self.submitBtn];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
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
    if (indexPath.section == 0) {
        if (msgCell== nil) {
            msgCell = [[[NSBundle mainBundle] loadNibNamed:@"PublishMsgTableViewCell" owner:self options:nil] lastObject];
        }
        msgCell.placeNameLabel.text = self.model.title;
        msgCell.publishTimeLabel.text = self.model.showTime;
        msgCell.styleLabel.text = self.model.style;
        msgCell.showFieldLabel.text = self.model.dirt;
        
        msgCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        msgCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return msgCell;
    }
    else
    {
        if (phoneCell == nil) {
         phoneCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:phoneCellID];
        }
        
        UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 11, 200, 21)];
        phoneLabel.font = [UIFont systemFontOfSize:14];
        [phoneCell addSubview:phoneLabel];
        phoneLabel.text = self.model.phone;
        UIButton *phoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-64, 0, 44, 44)];
        [phoneBtn setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [phoneBtn setImage:[UIImage imageNamed:@"phone_hg"] forState:UIControlStateHighlighted];
        [phoneBtn addTarget:self action:@selector(phoneBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [phoneCell addSubview:phoneBtn];
        
        phoneCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        phoneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return phoneCell;
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
    else
    {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else
    {
        return 44;
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
    if([[IGCustData sharedInstance].type isEqualToString:@"1"]){
        [MBProgressHUD showWithMessage:@"场地方无法申请"];
        return;
    }
    [[IGShowManager sharedInstance] applyWithShowId:[NSNumber numberWithInt:[self.model.mId intValue]] isHub:YES utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showWithMessage:@"上传成功！"];
        NSLog(@"yes");
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"no %@",error);
//        [MBProgressHUD showWithMessage:@"有问题"];
        [MBProgressHUD showWithMessage:@"apply网络错误"];

    }];
}

- (void)phoneBtnClick
{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",self.model.phone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
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

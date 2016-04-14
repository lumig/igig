//
//  StateShowViewController.m
//  iGig
//
//  Created by mac on 15/10/22.
//  Copyright (c) 2015年 longlz. All rights reserved.
//
//发布机会
#import "StateShowViewController.h"
#import "ShowStateView.h"
#import "PublishView.h"
#import "PublishMsgTableViewCell.h"
#import "IGShowManager.h"
#import "EditViewController.h"
@interface StateShowViewController ()<UITableViewDelegate,UITableViewDataSource, UITextViewDelegate>{
    NSString *_style;
    UILabel *_placeLabel;
    UITextView *_textView;
}
@property(nonatomic,strong)ShowStateView *topStateView;
@property(nonatomic,strong)PublishView *publishView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *submitBtn;

@end

@implementation StateShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _style = [NSString stringWithString:[IGCustData sharedInstance].style];
    
    [self resetUI];
}


- (void)resetUI
{
    self.title = @"演出状态";
    
    self.topStateView = [[[NSBundle mainBundle] loadNibNamed:@"ShowStateView" owner:self options:nil] lastObject];
    _topStateView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 44);
    _topStateView.backgroundColor = RGBACOLOR(39, 39, 39, 1);
    _topStateView.publishLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.topStateView];
    
//    self.publishView = [[[NSBundle mainBundle] loadNibNamed:@"PublishView" owner:self options:nil] lastObject];
//    _publishView.frame = CGRectMake(0, 108, SCREEN_WIDTH, 180);
//    [self.view addSubview:self.publishView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 108, SCREEN_WIDTH -20, 180)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor =  RGBACOLOR(93, 93, 93, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
    
    UIView *line = [UITools createViewWithFrame:CGRectMake(10, 180+108, SCREEN_WIDTH - 20, 2) backgroundColor:UIColorFromRGB(0xB4B4B4, 1)];
    [self.view addSubview:line];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 180 + 108+2, SCREEN_WIDTH - 20, 100)];
    textView.backgroundColor = UIColorFromRGB(0x999999, 1);
    [self.view addSubview:textView];
    textView.delegate= self;
    _textView = textView;
    
    UILabel *placeLabel = [[UILabel alloc] init];
    placeLabel.frame = CGRectMake(20, 180+108 + 10 , textView.bounds.size.width - 20, 13);
    placeLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:placeLabel];
    placeLabel.text = @"备注:";
//    placeLabel.backgroundColor = [UIColor redColor];
    placeLabel.textColor = [UIColor grayColor];
    _placeLabel = placeLabel;
    
    self.submitBtn = [[UIButton alloc]init];
    self.submitBtn.frame = CGRectMake(0, 0, 175, 40);
    self.submitBtn.center = CGPointMake(SCREEN_WIDTH/2.0f, 440);
    [_submitBtn setTitle:@"发布演出机会" forState:UIControlStateNormal];
    [_submitBtn setTitle:@"发布演出机会" forState:UIControlStateSelected];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [_submitBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    _submitBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _submitBtn.enabled = self.enable;
    [_submitBtn addTarget:self action:@selector(submitbtnClick) forControlEvents:UIControlEventTouchUpInside];
    _submitBtn.backgroundColor = RGBACOLOR(202, 202, 202, 1);
    [self.view addSubview:self.submitBtn];
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *msgCellID = @"msgCellID";
    PublishMsgTableViewCell *msgCell = (PublishMsgTableViewCell *)[tableView dequeueReusableCellWithIdentifier:msgCellID];
    
    if (msgCell== nil) {
        msgCell = [[[NSBundle mainBundle] loadNibNamed:@"PublishMsgTableViewCell" owner:self options:nil] lastObject];
    }
    msgCell.placeNameLabel.text = [[IGCustData sharedInstance] username];
            msgCell.publishTimeLabel.text = self.showTime;
            msgCell.showFieldLabel.text = [[IGCustData sharedInstance] address];
    msgCell.styleLabel.text = [IGCustData sharedInstance].style;
    
    msgCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
    msgCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIImageView *arrow = [[UIImageView alloc] init];
    arrow.image = [UIImage imageNamed:@"public_next"];
    arrow.frame = CGRectMake(SCREEN_WIDTH - 20 - 20, 180/4 * 3, 10, 180/4);
    arrow.contentMode = UIViewContentModeScaleAspectFit;
    [msgCell addSubview:arrow];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 180/4*3, SCREEN_WIDTH - 20, 180/4);
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(styleEdit) forControlEvents:UIControlEventTouchDown];
    [msgCell addSubview:btn];
    
    return msgCell;
}

- (void)styleEdit{
    PublishMsgTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    EditViewController *vc = [[EditViewController alloc] init];
    vc.titleStr = @"风格编辑";
    vc.editBlock = ^(NSString *editStr){
        cell.styleLabel.text = editStr;
        _style = editStr;
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PublishMsgTableViewCell cellHeight];
}



- (void)submitbtnClick
{

    [[IGShowManager sharedInstance] pulishShowChanceWithTitle:[IGCustData sharedInstance].username showTime:self.showTime dirt:[IGCustData sharedInstance].address style:_style contentext:_textView.text utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showWithMessage:@"发布成功!"];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"sendShowChance" object:self.showTime];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//          [MBProgressHUD showWithMessage:@"服务器维护中"];
        [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
    }];
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    _placeLabel.hidden = YES;
    CGPoint center = self.view.center;
    
    [UIView animateWithDuration:0 animations:^{
        self.view.center = CGPointMake(center.x, center.y - 100);
    }];
    
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    CGPoint center = self.view.center;
    
    [UIView animateWithDuration:0 animations:^{
        self.view.center = CGPointMake(center.x, center.y +100);
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

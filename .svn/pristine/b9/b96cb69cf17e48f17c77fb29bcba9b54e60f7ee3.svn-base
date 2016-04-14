//
//  ContentViewController.m
//  iGig
//
//  Created by LuMig on 15/11/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "ContentViewController.h"
#import "TextFieldTableViewCell.h"


@interface ContentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSString *textStr;
@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetUI];
}

- (void)resetUI
{
    self.title = @"评论";
    
    [self addRightBtn];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH- 20, 150)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
}

- (void)addRightBtn
{
    UIButton *btnRight = [[UIButton alloc] init];
    btnRight.frame = CGRectMake(0, 0, 44, 44);
    [btnRight setTitle:@"评论" forState:UIControlStateNormal];
    btnRight.titleLabel.font = [UIFont systemFontOfSize:15];
    [btnRight addTarget:self action:@selector(contentBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)contentBtn
{
    [[IGShowManager sharedInstance] commentWithShowId:_showId utoken:[IGCustData sharedInstance].token content:_textStr isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showWithMessage:@"评论成功！"];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"---------- %@",error);
        [MBProgressHUD showWithMessage:@"comment/add网络错误"];
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self textViewTableView:tableView cellForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TextFieldTableViewCell cellHeight];
}

#pragma mark -- 文本输入
- (UITableViewCell *)textViewTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellID"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TextFieldTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return cell;
}


#pragma mark -- router

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    if ([eventName isEqualToString:kPublishTextRouterEvent]) {
        _textStr = userInfo[@"content"];
    }
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

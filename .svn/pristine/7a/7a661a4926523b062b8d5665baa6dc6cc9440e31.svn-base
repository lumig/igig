//
//  PublishShowViewController.m
//  iGig
//
//  Created by LuMig on 15/10/22.
//  Copyright © 2015年 longlz. All rights reserved.
//
//发布演出
#import "PublishShowViewController.h"
#import "PublishView.h"
#import "ShowStateView.h"
#import "ShowTableViewCell.h"
#import "PublishMsgTableViewCell.h"
#import "BtnCellTableViewCell.h"
#import "IGShowManager.h"
#import "ShowDeatilEditViewController.h"

@interface PublishShowViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)ShowStateView *topStateView;
@property(nonatomic,strong)PublishView *publishView;
@property(nonatomic,strong)UIButton *closeShowBtn;
@property(nonatomic,strong)UIButton *publishShowBtn;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation PublishShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetUI];
    
    [self requestData];
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

    [self.view addSubview:self.topStateView];
    
//    self.publishView = [[[NSBundle mainBundle] loadNibNamed:@"PublishView" owner:self options:nil] lastObject];
//    _publishView.frame = CGRectMake(0, 108, SCREEN_WIDTH, 180);
//    [self.view addSubview:self.publishView];
    
//    self.closeShowBtn = [[UIButton alloc] init];
//    self.closeShowBtn.backgroundColor = RGBACOLOR(202, 202, 202, 1);
//    [_closeShowBtn setTitle:@"关闭演出机会" forState:UIControlStateNormal];
//    [_closeShowBtn setTitle:@"关闭演出机会" forState:UIControlStateSelected];
//    [_closeShowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_closeShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//    _closeShowBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    self.publishShowBtn = [[UIButton alloc] init];
//    self.publishShowBtn.backgroundColor = RGBACOLOR(202, 202, 202, 1);
//    [_publishShowBtn setTitle:@"发布演出" forState:UIControlStateNormal];
//    [_publishShowBtn setTitle:@"发布演出" forState:UIControlStateSelected];
//    [_publishShowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_publishShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//    _publishShowBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    
//    [self.view addSubview:self.closeShowBtn];
//    [self.view addSubview:self.publishShowBtn];
//    [self.closeShowBtn makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@330);
//        make.left.equalTo(self.view.mas_left).with.offset(10);
//        make.right.equalTo(self.publishShowBtn.mas_left).with.offset(-10);
//        make.height.equalTo(@40);
//        make.width.equalTo(self.publishShowBtn);
//    }];
//    
//    
//    [self.publishShowBtn makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@330);
//        make.left.equalTo(self.closeShowBtn.mas_right).with.offset(10);
//        make.right.equalTo(self.view.mas_right).with.offset(-10);
//        make.height.mas_equalTo(@40);
//        make.width.equalTo(self.closeShowBtn);
//    }];
    
    
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
        msgCell.placeNameLabel.text = _model.title;
        msgCell.publishTimeLabel.text = _model.showTime;
        msgCell.styleLabel.text = _model.style;
        msgCell.showFieldLabel.text = _model.dirt;
//        
        msgCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        msgCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return msgCell;
        
    }else if (indexPath.section == 1)
    {
        if (btnCell == nil) {
            btnCell = [[BtnCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:btnCellID];
        }
        
        
        btnCell.backgroundColor = RGBACOLOR(93, 93, 93, 1);
        
        [btnCell.leftShowBtn setTitle:@"关闭演出机会" forState:UIControlStateNormal];
            [btnCell.leftShowBtn setTitle:@"关闭演出机会" forState:UIControlStateSelected];
            [btnCell.leftShowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btnCell.leftShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            [btnCell.leftShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

            btnCell.leftShowBtn.enabled = self.enable;
            btnCell.leftShowBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [btnCell.rightShowBtn setTitle:@"发布演出" forState:UIControlStateNormal];
            [btnCell.rightShowBtn setTitle:@"发布演出" forState:UIControlStateSelected];
            [btnCell.rightShowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btnCell.rightShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            [btnCell.rightShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

            btnCell.leftShowBtn.enabled = self.enable;
            btnCell.leftShowBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        
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
            [[IGShowManager sharedInstance] placeShowCloseWithShowId:[NSNumber numberWithInt:[_model.mId intValue]] utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [MBProgressHUD showWithMessage:responseObject[@"上传成功！"]];
//                NSLog(@"yes");
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"fabuyanchuchenggong" object:nil];
                
                [self.navigationController popToRootViewControllerAnimated:YES];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"%@",error);
                [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
            }];
            NSLog(@"left");
        }else
        {
            
            ShowDeatilEditViewController *deatilEditVC = [[ShowDeatilEditViewController alloc] init];
            deatilEditVC.showTime = _model.showTime;
            [self.navigationController pushViewController:deatilEditVC animated:YES];
            
            
//            [[IGShowManager sharedInstance] placeShowPublishWithShowId:[NSNumber numberWithInt:[_model.mId intValue]] utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"yes right");
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                NSLog(@"right %@",error);
//            }];
            NSLog(@"right");
        }
        
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
        [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
    }];
}

- (UIView *)addHeader
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH -20, 44)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 , 11, 200, 22)];
    titleLabel.text = @"申请的演出";
    titleLabel.font = [UIFont systemFontOfSize:15];
    header.backgroundColor = RGBACOLOR(202, 202, 202, 1);
    titleLabel.textColor = [UIColor blackColor];
    [header addSubview:titleLabel];
    
    return header;
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

//
//  IGHomeViewController.m
//  iGig
//
//  Created by abc on 15/10/20.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGHomeViewController.h"
#import "MyShowViewController.h"
#import "BannerView.h"
#import "HomeCenterView.h"
#import "IGTableVIewCell.h"
#import "IGShowManager.h"
#import "IGHomeModel.h"
#import "ShowNullTableViewCell.h"
#import "ShowWaitingTableViewCell.h"
#import "ShowTableViewCell.h"
#import "ChooseViewController.h"
#import "StateShowViewController.h"
#import "AcceptShowStateViewController.h"
#import "PublishShowViewController.h"
#import "FinishViewController.h"
#import "ApplicationShowViewController.h"
#import "WaitingpublishShowViewController.h"
#import "ShowDeatilEditViewController.h"
#import "IGShowManager.h"
#import "IGHomeModel.h"
#import "ShowNullTableViewCell.h"
#import "ShowWaitingTableViewCell.h"
#import "AcceptShowStateViewController.h"
#import "ApplicationShowViewController.h"
#import "DetailShowViewController.h"
#import "CloseShowViewController.h"
#import "ApplicationPublishViewController.h"
#import "DataMode.h"
#import "DataMode.h"
#import "DatelistTool.h"
#import "JTCalendarView.h"
#import "ShopSearchViewController.h"
#import "NoticeViewController.h"
#import "IGLoginViewController.h"
#import "CityViewController.h"
#import "MyCircleViewController.h"

@interface IGHomeViewController ()<HomeCenterViewDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
{
    UITableView *_tableView;
    UIButton *_leftBtn;
    int _from;
//    BOOL _isLoading;
    BOOL _isWeekRefresh;
}

@property (nonatomic, strong)NSMutableArray *bannerImgArray;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)NSMutableArray *dataArrayALL;

@property (nonatomic, strong)NSString *currentDate;
@property (nonatomic, strong)NSString *date;

@property (nonatomic, strong)UISearchBar *searchBar;
@property (nonatomic, strong)UITextField *searchTF;

@property (nonatomic, strong)NSMutableDictionary *dict;//日历字典
@property(nonatomic,strong)JTCalendarView *jv ;
@property(nonatomic,strong)NSDate *calendareSaveDate;// 保存点击后的日期

@property(nonatomic,strong)IGHomeModel *model;
@end

@implementation IGHomeViewController

- (NSString *)date{
    if(nil == _date){
        NSDate *  senddate=[NSDate date];
        
        NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
        
        [dateformatter setDateFormat:@"YYYY-MM-dd"];
        _date = [dateformatter stringFromDate:senddate];
    }
    return _date;
}


- (NSDate *)calendareSaveDate{
    if(_calendareSaveDate == nil){
        _calendareSaveDate = [NSDate date];
    }
    return _calendareSaveDate;
}


- (NSString *)currentDate{
    
    if(nil == _currentDate){
        _currentDate = [NSString string];
        NSDate *  senddate=[NSDate date];
        
        NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
        
        [dateformatter setDateFormat:@"YYYY-MM-dd"];
        
        _currentDate=[dateformatter stringFromDate:senddate];
        
    }
    return _currentDate;
}

- (NSMutableArray *)dataArray{
    if(nil == _dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray *)dataArrayALL{
    if(nil == _dataArrayALL){
        _dataArrayALL = [NSMutableArray array];
    }
    return _dataArrayALL;
}

- (NSMutableArray *)bannerImgArray{
    if(nil == _bannerImgArray){
        _bannerImgArray = [NSMutableArray array];
//        for (int i=1; i<2; i++) {
//            NSString *imgStr = [NSString stringWithFormat:@"banner_%d", i];
//            UIImage *image = [UIImage imageNamed:imgStr];
//            [_bannerImgArray addObject:image];
//        }
        [_bannerImgArray addObject:[UIImage imageNamed:@"banner_1"]];
        [_bannerImgArray addObject:[UIImage imageNamed:@"banner_2"]];
        [_bannerImgArray addObject:[UIImage imageNamed:@"banner_3"]];

    }
    return _bannerImgArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self setNav];
    
    [self createUI];
    
    [self createCalendar];//日历
    
    [self downloadData];
    
    [self calendarData];

    //发布演出机会的通知 首页刷新这个list 带回日期
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendShowNoti:) name:@"sendShowChance" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backHomeList:) name:@"kJTCalendarDateSameSelected" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendShowNoti:) name:@"kSuccessAccept" object:nil];
    
    // 点击日历的红色与蓝色按钮更新数据
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionBtnRedNoti:) name:@"kJTCalendarActionBtnRed" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionBtnBlueNoti:) name:@"kJTCalendarActionBtnBlue" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionBtnAllNoti:) name:@"kJTCalendarActionBtnAll" object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

    
    [self.jv reloadData]; // Must be call in viewDidAppear
    
}

- (void)backHomeList:(NSNotification *)noti{
    
    _isWeekRefresh = NO;
    NSString *showTime = [noti object];
    [self downloadMonthDate:showTime];
    

}

#pragma mark 通知实现
- (void)sendShowNoti:(NSNotification *)noti{
    NSString *showTime = [noti object];
    [self listFromDateRequest:showTime];
}

- (void)actionBtnRedNoti:(NSNotification *)noti{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"showStatus == '1'|| showStatus == '8' ||showStatus == '10'"];
    NSMutableArray *dataArray = (NSMutableArray *) [self.dataArrayALL filteredArrayUsingPredicate:pre];
    self.dataArray = [NSMutableArray arrayWithArray:dataArray];
    [_tableView reloadData];
}

- (void)actionBtnBlueNoti:(NSNotification *)noti{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"showStatus != '1' && showStatus != '8' && showStatus != '10'"];
    NSMutableArray *dataArray = (NSMutableArray *) [self.dataArrayALL filteredArrayUsingPredicate:pre];
    self.dataArray = [NSMutableArray arrayWithArray:dataArray];
    [_tableView reloadData];
}

- (void)actionBtnAllNoti:(NSNotification *)noti{
    NSMutableArray *dataArray = [NSMutableArray arrayWithArray:self.dataArrayALL];
    self.dataArray = dataArray;
    [_tableView reloadData];
}


- (void)createUI{
//    _isLoading = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 113 - 225) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
//    _tableView.hidden = YES;
    _tableView.backgroundColor = RGBACOLOR(75, 75, 75, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = [self addHeader];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _from = 0;
        if (_isWeekRefresh) {
            [self listFromDateRequest:self.currentDate];
        }else{
            [self downloadData];
        }
    }];
    
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _from += 5;
        [self downloadData];
    }];
    [self.view addSubview:_tableView];
}



- (void)addSearchBar:(UITabBarController *)tabbar
{
    //设置导航栏的需求样式
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 250)/2,10,250.0f,24)];
    searchBar.delegate = self;
    searchBar.backgroundImage = [UIImage imageNamed:@"public_searchbox"];
    [searchBar setPlaceholder:@"搜索演出"];
    searchBar.layer.cornerRadius = 5;
    searchBar.layer.masksToBounds = YES;
    searchBar.layer.borderColor = UIColorFromRGB(0x383838, 1).CGColor;
    searchBar.layer.borderWidth = 1.0f;
    [searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"public_searchbox"] forState:UIControlStateNormal];
    
    for (id textField in searchBar.subviews) {
        if ([[textField class] isSubclassOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)textField;
            tf.font = [UIFont systemFontOfSize:12];
            self.searchTF = tf;
        }
    }
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setTitle:@"上海市" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    _leftBtn = btn;
    //将搜索条放在一个UIView上
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    searchView.backgroundColor = [UIColor clearColor];
    [searchView addSubview:searchBar];
    
    [searchView addSubview:btn];
    
    tabbar.navigationItem.titleView = searchView;
    
}

- (void)cityBtn{
    CityViewController *vc = [[CityViewController alloc] init];
    vc.cityBlock = ^(NSString *cityName){
        [_leftBtn setTitle:cityName forState:UIControlStateNormal];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [self gotosearch];
    return NO;
}

- (void)gotosearch
{
    
    ShopSearchViewController *searchVC = [[ShopSearchViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchVC];
    __block IGHomeViewController *vc = self;
    searchVC.searchInfo = ^(NSString *text)
    {
        vc.searchBar.text = text;
    };
    [self presentViewController:nav animated:YES completion:nil];
    
}


- (UIView *)addHeader
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    BannerView *bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 120) andImageArray:self.bannerImgArray];
    //    bannerView.backgroundColor = [UIColor redColor];
    [header addSubview:bannerView];
    
    HomeCenterView *centerView = [[HomeCenterView alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH - 20, 60)];
    
    centerView.delegate = self;
    [header addSubview:centerView];
    
    return header;
}

#pragma mark -delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return self.dataArray.count;
//    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ShowTableViewCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *nullCellID = @"nullCellID";
    ShowNullTableViewCell *nullCell = (ShowNullTableViewCell *)[tableView dequeueReusableCellWithIdentifier:nullCellID];
    static NSString *waitingCellID = @"waitingCellID";
    ShowWaitingTableViewCell *waitingCell = (ShowWaitingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:waitingCellID];
    static NSString *showCellID = @"showCellID";
    ShowTableViewCell *showCell = (ShowTableViewCell *)[tableView dequeueReusableCellWithIdentifier:showCellID];
    
    _model = [[IGHomeModel alloc] init];
    _model = _dataArray[indexPath.row];
    NSString *showState = _model.showStatus;
    if ([showState isEqualToString: @"11"]) {
        if (nullCell == nil) { 
            nullCell = [[[NSBundle mainBundle] loadNibNamed:@"ShowNullTableViewCell" owner:self options:nil] lastObject];
        }
        if([self.currentDate compare:self.date] == NSOrderedAscending){
            nullCell.descLabel.text = @"发布历史演出";
        }
        nullCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return nullCell;
    }
//    // 添加 状态为 3: 已申请  主办方状态 跳转到 演出状态
//    else if([showState isEqualToString:@"3"] )
//    {
//        if (waitingCell == nil) {
//            waitingCell = [[[NSBundle mainBundle] loadNibNamed:@"ShowWaitingTableViewCell" owner:self options:nil] lastObject];
//        }
//        [waitingCell cellFillWithModel:_model];
//        waitingCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return waitingCell;
//    }
    
    else if([showState isEqualToString:@"0"] || [showState isEqualToString:@"2"] || [showState isEqualToString:@"7"] || [showState isEqualToString:@"10"])
    {
        if (waitingCell == nil) {
            waitingCell = [[[NSBundle mainBundle] loadNibNamed:@"ShowWaitingTableViewCell" owner:self options:nil] lastObject];
        }
        [waitingCell cellFillWithModel:_model];
        waitingCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return waitingCell;
    }
    else
    {
        if (showCell  == nil) {
            showCell = [[[NSBundle mainBundle] loadNibNamed:@"ShowTableViewCell" owner:self options:nil] lastObject];
        }
        [showCell cellFillWithModel:_model];
        
        showCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return showCell;
    }

}

- (void)CenterViewBtnDidSeletedWithIndex:(NSInteger)index{
    NSLog(@"%ld", index);
    if (index == 0) {
        NoticeViewController *noticeVC =[[NoticeViewController alloc] init];
        [self.navigationController pushViewController:noticeVC animated:YES];
    }
   else if(index == 1){
        MyShowViewController *myShopVC = [[MyShowViewController alloc] init];
        [self.navigationController pushViewController:myShopVC animated:YES];
    }else if(index == 2){
        MyCircleViewController *vc = [[MyCircleViewController alloc] init];
        vc.userid = [[NSUserDefaults standardUserDefaults] objectForKey:IGCust_Id];
        vc.utoken = [[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token];
        vc.userName = [IGCustData sharedInstance].username;
        vc.userPic = [IGCustData sharedInstance].headPic;
        vc.titleStr = @"我的圈文";
        [self.tabBarController.navigationController pushViewController:vc
                                                              animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IGHomeModel *model = self.dataArray[indexPath.row];

    //    PublishShowViewController *showVC = [[PublishShowViewController alloc] init];
    //    [self.navigationController pushViewController:showVC animated:YES];
    //
    //0 演出机会（等待申请）  1演出  2有预约  3 申请后（等待同意和拒绝）  4已同意  5已拒绝   7已确定  8.已发布  9已关闭  10已过期  11虚位以待
    if ([model.showStatus isEqualToString:@"11"]) {
        ChooseViewController *chooseVC = [[ChooseViewController alloc] init];
        chooseVC.showTime = self.currentDate;
        [self.navigationController pushViewController:chooseVC animated:YES];
    }
    //0 演出机会(等待申请)-- 等待演出
    else if([model.showStatus isEqualToString:@"0"])
    {
        
        // 如果是场地方 -> 发布演出机会(查看页面,发布演出机会按钮不可点,只是作为查看发布的演出机会信息界面使用)
        // 如果是主办方 ->  申请页面
        // 
        if (kIGUserType == 1  ) {
            
            AcceptShowStateViewController *acceptVC = [[AcceptShowStateViewController alloc] init];
            acceptVC.model = model;
            acceptVC.enable = [model.fieldid isEqualToString:kIGCustId];
            [self.navigationController pushViewController:acceptVC animated:YES];
        }
        else if(kIGUserType == 2)
        {
            ApplicationShowViewController *applicationVC = [[ApplicationShowViewController alloc] init];
            applicationVC.enable = YES;
            applicationVC.model = model;
            [self.navigationController pushViewController:applicationVC animated:YES];
        }
        else{
            ApplicationShowViewController *applicationVC = [[ApplicationShowViewController alloc] init];
            applicationVC.enable = NO;
            applicationVC.model = model;
            [self.navigationController pushViewController:applicationVC animated:YES];
        }
    }
    // 1演出
    else if ([model.showStatus isEqualToString:@"1"]) {
        // 演出详情页面
        DetailShowViewController *showDetailVC = [[DetailShowViewController alloc] init];
        showDetailVC.showId = [NSNumber numberWithInt:[model.mId intValue]];
        [self.navigationController pushViewController:showDetailVC animated:YES];
    }
    //    2有预约 
    else if ([model.showStatus isEqualToString:@"2"]) {
        // 场地方 可见 -> 演出状态:同意申请界面
        // 如果此次演出机会不是场地方自己发布的.则里面的按钮不可点
        
//        NSLog(@"field-----%@ ,myGuse_id =%@,%@",model.fieldid,kIGCustId,[model.fieldid isEqualToString:kIGCustId]?@"YES":@"NO");
        
        AcceptShowStateViewController *acceptVC = [[AcceptShowStateViewController alloc] init];
        acceptVC.model = model;
        acceptVC.enable = [model.fieldid isEqualToString:kIGCustId];
        [self.navigationController pushViewController:acceptVC animated:YES];
        
    }
//    3 申请后（等待同意和拒绝）
    else if ([model.showStatus isEqualToString:@"3"]) {
        // 主办方可见 ->申请页面  申请按钮不可点
        
        ApplicationShowViewController *acceptVC = [[ApplicationShowViewController alloc] init];
        acceptVC.enable = NO;
        acceptVC.model = model;
        [self.navigationController pushViewController:acceptVC animated:YES];

    }
//     4已同意
    else if ([model.showStatus isEqualToString:@"4"] ) {
        // 场地方 跳转到 -> [演出状态:发布演出]
        // 之后的步骤:点击确定的主办方 ->[未编辑的演出详情界面] -> [演出详情编辑页面] ,编辑演出详情. 编辑完成后  ->点击确定 -> 发布.
        // 如果此次演出机会不是场地方自己发布的.则里面的按钮不可点

        
        // 主办方可见 跳转到 -> [演出详情编辑页面] ,编辑演出详情. 编辑完成后  ->点击确定 -> 发布.
        
        if (kIGUserType == 1) {
//        [MBProgressHUD showWithMessage:@"你的身份不是主办方"];
            
            // 场地方 点击发布演出 进入演出详情编辑页 填写演出详情后  点击确定 发布演出
            PublishShowViewController *publishVC = [[PublishShowViewController alloc] init];
            publishVC.enable = [model.fieldid isEqualToString:kIGCustId];
            publishVC.model = model;
            [self.navigationController pushViewController:publishVC animated:YES];
        }
        else
        {
            
            ShowDeatilEditViewController *appVC = [[ShowDeatilEditViewController alloc] init];
//               appVC.model = model;
            [self.navigationController pushViewController:appVC animated:YES];

        }

    
    }
//     5已拒绝 **
    else if ([model.showStatus isEqualToString:@"5"] ) {
        // 主办方可见 跳转到 申请页面 申请按钮不可点
        
        ApplicationShowViewController *appVC = [[ApplicationShowViewController alloc] init];
        appVC.enable = NO;
        appVC.model = model;
        [self.navigationController pushViewController:appVC animated:YES];
        //        }
        
    }
//    6.已过期.未发布演出时过期
    else if ([model.showStatus isEqualToString:@"6"] ) {
        // 场地方时, -> [演出状态:演出机会关闭页面]
        if (kIGUserType == 1) {
            CloseShowViewController *closeVC = [[CloseShowViewController alloc] init];
            closeVC.model = model;
            [self.navigationController pushViewController:closeVC animated:YES];
        }
        // 主办方 -> 申请页面 :申请按钮不可点
        else {
            ApplicationShowViewController *appVC = [[ApplicationShowViewController alloc] init];
            appVC.enable = NO;
            appVC.model = model;
            [self.navigationController pushViewController:appVC animated:YES];
        }
    }
    // 7已关闭(场地方,主办方,乐队)->演出状态,演出已关闭,当这个演出机会在没有或没有确定主办方申请的情况下关闭
    else if ([model.showStatus isEqualToString:@"7"] ) {
        // 场地方时, -> [演出状态:演出机会关闭页面]
        if (kIGUserType == 1) {
            // 场地方 点击发布演出 进入演出详情编辑页 填写演出详情后  点击确定 发布演出
            PublishShowViewController *publishVC = [[PublishShowViewController alloc] init];
            publishVC.enable = [model.fieldid isEqualToString:kIGCustId];
            publishVC.model = model;
            [self.navigationController pushViewController:publishVC animated:YES];
        }
        // 主办方 -> 申请页面 :申请按钮不可点
        else {
            ApplicationShowViewController *appVC = [[ApplicationShowViewController alloc] init];
            appVC.enable = NO;
            appVC.model = model;
            [self.navigationController pushViewController:appVC animated:YES];
        }

    }
//    8.已发布
    else if ([model.showStatus isEqualToString:@"8"] ) {
        DetailShowViewController *showDetailVC = [[DetailShowViewController alloc] init];
        showDetailVC.showId = [NSNumber numberWithInt:[model.mId intValue]];
        [self.navigationController pushViewController:showDetailVC animated:YES];
    }
//    9.已关闭  已确定主办方的情况下
    else if ([model.showStatus isEqualToString:@"9"] ) {
        // 场地方时, -> [演出状态:演出机会关闭页面]
        if (kIGUserType == 1) {
            CloseShowViewController *closeVC = [[CloseShowViewController alloc] init];
            closeVC.model = model;
            [self.navigationController pushViewController:closeVC animated:YES];
        }
        // 主办方 -> 申请页面 :申请按钮不可点
        else {
            ApplicationShowViewController *appVC = [[ApplicationShowViewController alloc] init];
            appVC.model = model;
            [self.navigationController pushViewController:appVC animated:YES];
        }
    }
//    10.已过期 发布的演出过期
    else if ([model.showStatus isEqualToString:@"10"] ) {
        // 演出详情页面
        
        DetailShowViewController *showDetailVC = [[DetailShowViewController alloc] init];
        showDetailVC.showId = [NSNumber numberWithInt:[model.mId intValue]];
        [self.navigationController pushViewController:showDetailVC animated:YES];
    }
    
    else
    {
        DetailShowViewController *showDetailVC = [[DetailShowViewController alloc] init];
        showDetailVC.showId = [NSNumber numberWithInt:[model.mId intValue]];
        [self.navigationController pushViewController:showDetailVC animated:YES];
    }
    
    
    
}



#pragma mark - request

- (void)listFromDateRequest:(NSString *)date{
//    if (_isLoading) {
//        return;
//    }
//    _isLoading = YES;
    [self.dataArray removeAllObjects];
    IGShowManager *manager = [IGShowManager sharedInstance];
    [manager showHomeListForDateWithDate:date utoken:[IGCustData sharedInstance].token IsHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
//        _isLoading = NO;
        [_tableView.mj_footer endRefreshing];
        [_tableView.mj_header endRefreshing];
        if(array.count>0){
            [self.dataArray removeAllObjects];
            [self.dataArrayALL removeAllObjects];
        }
        
        for (NSDictionary *subDict in array) {
            IGHomeModel *model = [IGHomeModel HomeModelWithDict:subDict];
            
            [self.dataArray addObject:model];
        }
        [self.dataArrayALL addObjectsFromArray:self.dataArray];
        [_tableView reloadData];
        _tableView.hidden = NO;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"listFromDateRequest加载数据出错");
        
        [MBProgressHUD showWithMessage:@"datelist网络错误"];
        [self.dataArray removeAllObjects];
        [_tableView reloadData];
        _tableView.hidden = NO;
    }];

}


- (void)downloadData{
//    NSLog(@"%@show/lists", BaseSever);
    
//    NSLog(@"------- %@",[[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token]);
//    if(_isLoading){
//        return;
//    }
//    _isLoading = YES;
    
    IGShowManager *manager = [IGShowManager sharedInstance];
    
    [manager listWithFrom:[NSNumber numberWithInt:_from] limit:@5 utoken:[[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token] isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
        [_tableView.mj_header endRefreshing];
        [_tableView.mj_footer endRefreshing];
//        _isLoading = NO;
        if(array.count>0 && _from == 0){
            [self.dataArray removeAllObjects];
            [self.dataArrayALL removeAllObjects];
        }
        
        for (NSDictionary *subDict in array) {
            IGHomeModel *model = [IGHomeModel HomeModelWithDict:subDict];
            
            [self.dataArray addObject:model];
            NSLog(@"-----%@",_dataArray);
        }
        
        [self.dataArrayALL addObjectsFromArray:self.dataArray];
        
        [_tableView reloadData];
        _tableView.hidden = NO;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:@"lists 网络错误"];
    }];
    
}


- (void)downloadMonthDate:(NSString *)date{
        NSLog(@"%@show/lists", BaseSever);
    
    //    NSLog(@"------- %@",[[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token]);
//    if(_isLoading){
//        return;
//    }
//    _isLoading = YES;
    
    IGShowManager *manager = [IGShowManager sharedInstance];
    
    [manager listWithFromMonth:date utoken:[[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token] isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
        [_tableView.header endRefreshing];
        [_tableView.footer endRefreshing];
//        _isLoading = NO;
        if(array.count>0 && _from == 0){
            [self.dataArray removeAllObjects];
            [self.dataArrayALL removeAllObjects];
        }
        
        for (NSDictionary *subDict in array) {
            IGHomeModel *model = [IGHomeModel HomeModelWithDict:subDict];
            [self.dataArray addObject:model];
            NSLog(@"responseObject-----%@",responseObject);
        }
        [self.dataArrayALL addObjectsFromArray:self.dataArray];
        
        [_tableView reloadData];
        _tableView.hidden = NO;
        
        _tableView.frame = !self.jv.calendar.calendarAppearance.isWeekMode ? CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 113 - 225) : CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 113 - 100);
            _tableView.contentOffset = CGPointZero;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"downloadMonthDate---%@",error);
        [MBProgressHUD showWithMessage:@"xxx网络错误"];
    }];
    
}

#pragma mark - 日历

- (void)createCalendar{
    

//    self.dict = [NSMutableDictionary dictionary];
//    for (int i = 10; i<30; i++) {
//        DataMode *dataMode = [[DataMode alloc]init];
//        NSString *dateStr =[NSString stringWithFormat:@"2015-11-%2d",i];
//        dataMode.showchargeNum = [NSString stringWithFormat:@"%u",arc4random_uniform(3)] ;
//        
//        dataMode.showNum = [NSString stringWithFormat:@"%u",arc4random_uniform(3)] ;
//        
//        NSLog(@"dateStr = %@,showChargeNun = %@,showNum = %@",dateStr,dataMode.showchargeNum,dataMode.showNum);
//        [self.dict setObject:dataMode forKey:dateStr];
//    }
//    
////    
//    
//    for (int i = 11; i<30; i++) {
//        DataMode *dataMode = [[DataMode alloc]init];
//        NSString *dateStr =[NSString stringWithFormat:@"2015-12-%2d",i];
//        dataMode.showchargeNum = [NSString stringWithFormat:@"%u",arc4random_uniform(3)] ;
//        
//        dataMode.showNum = [NSString stringWithFormat:@"%u",arc4random_uniform(3)] ;
//        
//        NSLog(@"dateStr = %@,showChargeNun = %@,showNum = %@",dateStr,dataMode.showchargeNum,dataMode.showNum);
//        [self.dict setObject:dataMode forKey:dateStr];
//    }
    
    CGRect boundsFrame = [[[UIApplication sharedApplication] delegate] window].bounds;
    
    //    kJTCalendarChangWeek
    JTCalendarView *jv =  [[JTCalendarView alloc]initWithFrame:CGRectMake(0, boundsFrame.size.height - 225-44-10, boundsFrame.size.width , 225+10)];

    self.jv = jv;
    [self.view addSubview:jv];
//    /**
//     以上是模拟的测试数据
//     
//     key 日期字符串
//     value DataMode
//     
//     DataMode  3个属性
//     )NSString *currentDateStr; 日期
//     NSString *showchargeNum; 演出机会总数
//     NSString *showNum;    演出总数
//     */
    [DatelistTool shardInstance].dataDic = self.dict;
    [self.jv reloadDatelistWithDict:self.dict ];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateSelected:) name:@"kJTCalendarDateSelected" object:nil];
    
}

// 点击某一天后
- (void)dateSelected:(NSNotification *)noti{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dataStr = [formatter stringFromDate:(NSDate *)[noti object]];
    NSLog(@"点击了某一天后,点击的时间为:%@",dataStr);
    _isWeekRefresh = YES;
    self.currentDate = dataStr;
    [self listFromDateRequest:self.currentDate];
    
    _tableView.frame = !self.jv.calendar.calendarAppearance.isWeekMode ? CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 113 - 225) : CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 113 - 100);
    _tableView.contentOffset = CGPointZero;
    
}

- (void)calendarData{
    NSDate *  senddate=self.calendareSaveDate;
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSLog(@"日历加载时日期为:%@",self.calendareSaveDate);
    [_dict removeAllObjects];
    [[IGShowManager sharedInstance] showM5dateWithDate:[dateformatter stringFromDate:senddate]utoken:[[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
        self.dict = [NSMutableDictionary dictionary];
        for (NSDictionary *dict in array) {
            DataMode *model = [DataMode modelWithDict:dict];
            [self.dict setObject:model forKey:model.currentDateStr];
            
            
        }
        [self.jv reloadDatelistWithDict:self.dict];
        [self.jv calendarDidDateSelected:self.jv.calendar date:senddate];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

//
//  ShopSearchViewController.m
//  XinchengMall
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 com.xincheng. All rights reserved.
//

#import "ShopSearchViewController.h"
#import "MMSearchBar.h"
#import "IGHomeModel.h"


//#import "WYMallViewController.h"

@interface ShopSearchViewController ()<MMSearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
{
    MMSearchBar *_search;
    UITableView *_tableView;
    IGHomeModel *_model;
}

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ShopSearchViewController

- (NSMutableArray *)dataArray{
    if(nil== _dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)dealloc
{
    NSLog(@"shifang");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatSearchBar];
    
    [self searchList];
}

- (void)searchList{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.hidden = YES;
    [self.view addSubview:_tableView];
}


- (void)creatSearchBar
{

    _search = [[MMSearchBar alloc] init];
    _search.searchField .borderStyle = UITextBorderStyleRoundedRect;
    _search.searchField.placeholder = @"演出名称";
    
    [_search.searchField becomeFirstResponder];
    
    _search.delegate = self;
    _search.frame = CGRectMake(10,4, SCREEN_WIDTH-20 , 40);
//    [_search setSearchFieldBackgroundImage:[UIImage imageNamed:@"public_searchbox"] forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:_search];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
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
        nullCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return nullCell;
    }
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ShowTableViewCell cellHeight];
}

- (void)mmSearchBarCancelButtonClicked:(MMSearchBar *)searchBar
{
    [searchBar.searchField resignFirstResponder];
    self.searchInfo(searchBar.searchField.text);
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)mmSearchBarSearchButtonClicked:(MMSearchBar *)searchBar
{
    
    [searchBar endEditing:YES];
    
    [self searchListRequest:searchBar];
    
 
    
    
}

- (void)searchListRequest:(MMSearchBar *)searchBar{
    IGShowManager *manager = [IGShowManager sharedInstance];
    
    [manager showSearchListFrom:@"0" andLimit:@"5" title:searchBar.searchField.text isHub:YES utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array = responseObject[@"data"];
        for (NSDictionary *subDict in array) {
            IGHomeModel *model = [IGHomeModel HomeModelWithDict:subDict];
            
            [self.dataArray addObject:model];
        }
        
        [_tableView reloadData];
        _tableView.hidden = NO;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
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
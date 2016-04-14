//
//  CityViewController.m
//  iGig
//
//  Created by duanzd on 15/11/15.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "CityViewController.h"
#import "CityModel.h"

@interface CityViewController ()<UITableViewDataSource, UITableViewDelegate>{
    UITableViewCell *_selectedCell;
}

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrTitle;

@end

@implementation CityViewController

- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择城市";
    _selectedCell = [[UITableViewCell alloc] init];
    [self createUI];
    
    [self requestData];
}

- (void)createUI{
    UIView *headView = [UITools createViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 44) backgroundColor:UIColorFromRGB(0xB8B8B8, 1)];
    UILabel *label = [UITools createLabelWithFrame:CGRectMake(10, 0, 100, 44) fontNumber:14 text:@"热门城市"];
    label.textColor = [UIColor redColor];
    UIView *line = [UITools createViewWithFrame:CGRectMake(0, 43.5, SCREEN_WIDTH - 20, 0.5) backgroundColor:[UIColor blackColor]];
    [headView addSubview:line];
    [headView addSubview:label];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 64) ];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColorFromRGB(0xDCDCDC, 1);
    self.tableView.sectionIndexColor = [UIColor whiteColor];
    
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.tableHeaderView = headView;
    [self.view addSubview:self.tableView];
}

- (UIView *)addHeader
{
    UIView *headView = [UITools createViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 44) backgroundColor:UIColorFromRGB(0xDCDCDC, 1)];
    UILabel *label = [UITools createLabelWithFrame:CGRectMake(10, 0, 100, 44) fontNumber:14 text:@"热门城市"];
    label.textColor = UIColorFromRGB(0x7D7D7D, 1);
    [headView addSubview:label];
    return headView;
}


- (void)requestData{
    self.arrTitle = [NSMutableArray array];
    [[IGShowManager sharedInstance] selectedCityWithIsHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *sub = responseObject[@"data"];
        self.dataArray = [sub[@"dirt_list"] mutableCopy];
        
        for (NSDictionary *dic in self.dataArray) {
            [self.arrTitle addObject:dic[@"letter"]];
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showWithMessage:@"获取城市列表失败"];
        [MBProgressHUD showWithMessage:@"dirt_list_ios网络错误"];

    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [self.dataArray[section] objectForKey:@"name"];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    NSDictionary *dic = self.dataArray[indexPath.section];
    NSArray *arr = [dic objectForKey:@"name"];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 0, 200, 44);
    [cell addSubview:label];
    label.text = arr[indexPath.row];
    cell.backgroundColor = UIColorFromRGB(0xB8B8B8, 1);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    for (id subView in _selectedCell.subviews) {
        UIImageView *imageView = subView;
        if(imageView.tag == 1001){
            [imageView removeFromSuperview];
        }
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UIImage *img = [UIImage imageNamed:@"形状-22"];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = img;
    imageView.tag = 1001;
    imageView.frame = CGRectMake(SCREEN_WIDTH - 28 - img.size.width, 0, img.size.width, 44);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    _selectedCell = cell;
    [cell addSubview:imageView];

    NSDictionary *dic = self.dataArray[indexPath.section];
    NSArray *arr = [dic objectForKey:@"name"];
    self.cityBlock(arr[indexPath.row]);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 30.0;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.dataArray[section] objectForKey:@"letter"];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return  self.arrTitle;
}

//响应点击索引时的委托方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger count = 0;
    for (NSDictionary *dict in self.dataArray) {
        if([dict[@"letter"] isEqualToString:title]){
            return count;
        }
        count++;
    }
    
    return 1;
    
//    
//    NSInteger count = 1;
//    
//    for(NSString *character in self.arrTitle)
//    {
//        
//        if ([character compare:@"A"] == NSOrderedAscending || [character compare:@"Z"] == NSOrderedDescending) {
//            count --;
//        }
//        if([character isEqualToString:title])
//        {
//            return  count+1;
//        }
//        
//        
//        count ++;
//        
//    }
//    return 1;
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

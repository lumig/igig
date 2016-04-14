//
//  ChooseViewController.m
//  iGig
//
//  Created by LuMig on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "ChooseViewController.h"

@interface ChooseViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation ChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetUI];
}

- (void)resetUI
{
    self.title = @"选择";
    
    self.dataArray = @[@"发布演出机会",@"发布演出"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, SCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    if (indexPath.row < _dataArray.count) {
        
        cell.backgroundColor = [UIColor colorWithRed:169/255.0f green:169/255.0f blue:169/255.0f alpha:1];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 11, 200, 20)];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.text = _dataArray[indexPath.row];
        [cell.contentView addSubview:titleLabel];
        
        UIImageView *rightImgView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -45, 12, 10, 20)];
        [rightImgView setImage:[UIImage imageNamed:@"public_next"]];
        [cell.contentView addSubview:rightImgView];
        
        UIImageView *lineImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 1)];
        lineImgView.backgroundColor = [UIColor colorWithRed:183/255.0f green:183/255.0f blue:183/255.0f alpha:1];
        [cell.contentView addSubview:lineImgView];
          
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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

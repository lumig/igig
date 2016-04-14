//
//  DetailShowViewController.m
//  iGig
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

//演出详情

#import "DetailShowViewController.h"
#import "ShowTableViewCell.h"
#import "PersonDescTableViewCell.h"
#import "DetailTypeTableViewCell.h"
#import "commentTableViewCell.h"
#import "IGShowManager.h"
#import "DetailModel.h"
#import "fieldModel.h"
#import "SponsorModel.h"
#import "bandModel.h"
#import "MyHomePageViewController.h"
#import "ContentViewController.h"
#import "AppDelegate.h"

@interface DetailShowViewController ()<UITableViewDelegate,UITableViewDataSource,ShowTableViewCellDelegate,PersonDescTableViewCellDelegate>

{
    UIButton *_currentBtn;
    BOOL _isBand;
    BOOL _isClickOther;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *typeArray;
@property(nonatomic,strong)NSArray *commentArray;
@property(nonatomic,strong)DetailModel *model;

@property(nonatomic,strong)fieldModel *fieldModel;
@property(nonatomic,strong)SponsorModel *sponsorModel;
@property(nonatomic,strong)bandModel *bandModel;
@property(nonatomic,strong)NSMutableArray *fieldArray;
@property(nonatomic,strong)NSMutableArray *bandArray;
@property(nonatomic,strong)NSMutableArray *sponsorArray;
@property(nonatomic,strong)IGHomeModel *showModel;
@property(nonatomic,strong)NSNumber *num;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,assign)BOOL isOpen;

@end

@implementation DetailShowViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _currentBtn.tag = 1001;
    _isOpen = NO;
    [self requestData];
    [self reSetUI];
    
}

- (void)reSetUI
{
    self.title =@"演出详情";
    
    [self addRightBtn];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10,64, SCREEN_WIDTH-20, SCREEN_HEIGHT-64-49) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = RGBACOLOR(75, 75, 75, 1);
    [self.view addSubview:self.tableView];
    
    [self addBottomView];
    
}

- (void)addRightBtn
{
    UIButton *btnRight = [[UIButton alloc] init];
    btnRight.frame = CGRectMake(0, 0, 30, 44);
    [btnRight setImage:[UIImage imageNamed:@"public_attention.png"] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(attentionBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)attentionBtn
{
    [[IGShowManager sharedInstance] collectShowWithShowId:[NSString stringWithFormat:@"%@",_showId] utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showWithMessage:@"关注成功!"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"collect %@",error);
        [MBProgressHUD showWithMessage:@"collect网络错误"];

    }];
}

- (void)addBottomView
{
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    bottomView.backgroundColor = RGBACOLOR(18, 18, 18, 1);
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, SCREEN_WIDTH -100, 21)];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = RGBACOLOR(123, 123, 123, 1);
    [bottomView addSubview:_titleLabel];
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-54, 2, 44, 44)];
    [rightBtn setImage:[UIImage imageNamed:@"public_circle"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(commentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:rightBtn];
    
    [self.view addSubview:bottomView];
}

- (void)commentBtnClick
{
    ContentViewController *contentVC = [[ContentViewController alloc] init];
    
    contentVC.showId = _model.showModel.mId;
    [self.navigationController pushViewController:contentVC animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     if (section == 1)
    {
//        if (_isTypeSelected) {
//            
//            return _typeArray.count;
//        }
//        else
//        {
//            if (_typeArray.count>0) {
//                _isBand = YES;
//            }else{
//                _isBand = NO;
//            }
//            NSLog(@"%ld", _currentBtn.tag);
//            if (_currentBtn.tag == 1001) {
//                
//                return _typeArray.count;
//            }else{
                return 1;
//            }
//        }
        
    }else if(section == 4)
    {
        if (_isComment) {
            return _commentArray.count;
        }
        else
        {
            return _commentArray.count;
        }
    }
    else
        
    {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *showCellID = @"showCellID";
    ShowTableViewCell *showCell = (ShowTableViewCell *)[tableView dequeueReusableCellWithIdentifier:showCellID];
    
    static NSString *typeCellID = @"typeCellID";
    DetailTypeTableViewCell *typeCell = (DetailTypeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:typeCellID];
    
    static NSString *descCellID = @"descCellID";
    PersonDescTableViewCell *descCell = (PersonDescTableViewCell *)[tableView dequeueReusableCellWithIdentifier:descCellID];
    
    static NSString *commentCellID = @"commentCellID";
    commentTableViewCell *commentCell = (commentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:commentCellID];
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (showCell == nil) {
            showCell = [[[NSBundle mainBundle] loadNibNamed:@"ShowTableViewCell" owner:self options:nil] lastObject];
        }
        [showCell cellFillWithModel:_showModel];
        showCell.delegate = self;
        showCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return showCell;
    }else if (indexPath.section == 1)
    {
        if (typeCell == nil) {
            typeCell = [[DetailTypeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:typeCellID];
        }
        if (indexPath.row < _typeArray.count || _currentBtn.tag != 1001) {
            if (_currentBtn.tag == 1001) {
                bandModel *model = [[bandModel alloc] init];
                model = _typeArray[indexPath.row];
                [typeCell cellFillWithBandModel:model];
            }else if (_currentBtn.tag == 1002){
                [typeCell cellFillWithFieldModel:self.fieldModel];
            }else if (_currentBtn.tag == 1003){
                [typeCell cellFillWithSponsorModel:self.sponsorModel];
            }
            
        }else{
            [typeCell notHaveBand];
            
        }
        
        typeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return typeCell;
    }else if(indexPath.section == 2)
    {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        UIImageView *lineImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, 2)];
        lineImgView.backgroundColor = RGBACOLOR(192, 192, 192, 1);
        [cell addSubview:lineImgView];
        UILabel *openBtn = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, SCREEN_WIDTH -20, 42)];
        openBtn.backgroundColor = RGBACOLOR(167, 167, 167, 1);
        openBtn.text = @"展开";
        openBtn.textAlignment = NSTextAlignmentCenter;

        [cell addSubview:openBtn];
        cell.tag = 101;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else if (indexPath.section ==3)
    {
        if (descCell == nil) {
            descCell = [[PersonDescTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:descCellID];
        }
        [descCell cellFillwithString:_model.desc isOpen:_isOpen ];
        descCell.delegate = self;
        descCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return descCell;
    }
    else if(indexPath.section == 4)
    {
        if (commentCell == nil) {
            commentCell = [[commentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentCellID];
        }
        if (indexPath.row < _commentArray.count) {
            [commentCell cellFillWithModel:_commentArray[indexPath.row]];
        }
        
        commentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return commentCell;
    }
    else
    {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        UIImageView *lineImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, 2)];
        lineImgView.backgroundColor = RGBACOLOR(192, 192, 192, 1);
        [cell addSubview:lineImgView];
        UILabel *openBtn = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, SCREEN_WIDTH -20, 42)];
        openBtn.backgroundColor = RGBACOLOR(167, 167, 167, 1);
        openBtn.textAlignment = NSTextAlignmentCenter;
        openBtn.text = @"展开";
        
        [cell addSubview:openBtn];
        cell.tag = 102;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [ShowTableViewCell cellHeight];
    }
    else if(indexPath.section == 1)
    {
        return [DetailTypeTableViewCell cellHeight];
    }
    else if (indexPath.section ==3)
    {
        NSLog(@"magishowhight%f",[PersonDescTableViewCell cellHeightWithStr:_model.desc isOpen:_isOpen]);
        return [PersonDescTableViewCell cellHeightWithStr:_model.desc isOpen:_isOpen];
    }
    else if(indexPath.section == 2 || indexPath.section == 5)
    {

        return 44;
    }
    else
    {
        CommentModel *model = _commentArray[indexPath.row];
                return [commentTableViewCell cellHeightWithModel:model];
    }
}

- (void)openButtonClickWithBtn:(UIButton *)btn isOpen:(BOOL)isOpen{
    
    if (_isOpen == YES) {
        _isOpen = NO;
        [_tableView reloadData];
    }
    else
    {
        _isOpen = isOpen;
    [_tableView reloadData];
    }
    
}


//切换乐队 主办方 场地方 选项卡
- (void)btnClick:(UIButton *)btn{
    if (btn == _currentBtn) {
        return;
    }else{
        _currentBtn.selected = NO;
        btn.selected = YES;
        _currentBtn = btn;
        NSLog(@"%ld", _currentBtn.tag);
        
//        if(_isBand){
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
//        }
//        }else{
//            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
//        }
    }
    _isClickOther = YES;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0 ||section ==2 ||section ==5 ) {
        return nil;
    }
    else
    {
        

        NSArray *array = @[@"参演乐队",@"演出详情",@"评论"];
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH -20, 40)];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 , 10, 200, 20)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        header.backgroundColor = RGBACOLOR(202, 202, 202, 1);
        titleLabel.textColor = [UIColor blackColor];
        [header addSubview:titleLabel];
        if (section == 1) {
            NSArray *titleArr = [NSArray arrayWithObjects:@"参演乐队",@"场地方",@"主办方", nil];
            CGFloat space = (SCREEN_WIDTH - 40 - 210)/2;
            for (int i=0; i<3; i++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(15 + i * (70+space), 10, 70, 20);
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
                [btn setTitle:titleArr[i] forState:UIControlStateNormal];
                [btn setTitleColor:RGBACOLOR(106, 106, 106, 1) forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
                btn.titleLabel.font = [UIFont systemFontOfSize:15];
                btn.titleLabel.textAlignment = NSTextAlignmentLeft;
                [header addSubview:btn];
                btn.tag = 1000 + i+1;
                
                if (i == 0) {
                    btn.selected = YES;
                    _currentBtn = btn;
                }
                
            }
        }
        switch (section) {
        case 1:
        {
//            titleLabel.text = array[0];
//            UILabel *placeLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2.0f, 10, 100, 20)];
//            placeLabel.font = [UIFont systemFontOfSize:15];
//            placeLabel.textColor = RGBACOLOR(106, 106, 106, 1);
//            placeLabel.text = @"场地方";
//            placeLabel.textAlignment = NSTextAlignmentCenter;
//            [header addSubview:placeLabel];
//            
//            UILabel *consignerLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-140, 10, 100, 20)];
//            consignerLabel.font = [UIFont systemFontOfSize:15];
//            consignerLabel.textColor = RGBACOLOR(106, 106, 106, 1);
//            consignerLabel.text = @"主办方";
//            consignerLabel.textAlignment = NSTextAlignmentRight;
//            [header addSubview:consignerLabel];
        }
            break;
        case 3:
        {
            titleLabel.text = array[1];
        }
            break;
        case 4:
        {
            titleLabel.text = array[2];
        }
            break;
            
        default:
            break;
    }
    
    
    return header;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 ||section ==2 ||section ==5 ) {
        return 0.01f;
    }else
    {
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 || indexPath.section == 5) {
        UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
        if (cell.tag == 101) {
            _isTypeSelected = YES;
            [_tableView reloadData];
        }
        else
        {
            _isComment = YES;
            [_tableView reloadData];
        }
            
//        UITableViewCell *cell = (UITableViewCell *)[self.view viewWithTag:101];
    }
    if(indexPath.section == 4)
    {
        if (indexPath.row < _commentArray.count) {
                    CommentModel *model = _commentArray[indexPath.row];
                    MyHomePageViewController *myVC = [[MyHomePageViewController alloc] init];
            myVC.userId = model.mId;
                    [self.navigationController pushViewController:myVC animated:YES];
        }

    }
    if (indexPath.section == 1) {
        bandModel *model = _bandArray[indexPath.row];
        MyHomePageViewController *myVC = [[MyHomePageViewController alloc] init];
        myVC.userId = [NSString stringWithFormat:@"%@",model.userId];
        [self.navigationController pushViewController:myVC animated:YES];
    }
    
}

  
   



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section ==1 || section ==4  ) {
        return 0.01f;
    }
    else
    {
    return 5;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{if (section ==1 ||section ==4 ) {
    return nil;
}
    else
    {
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH -20, 5)];
    
    footer.backgroundColor = RGBACOLOR(93, 93, 93, 1);
    return footer;
    }
}

- (void)postersImgViewClickWithImageName:(NSString *)imgName
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIWindow *mainWindow = [app window];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imageView.userInteractionEnabled = YES;
    imageView.tag = 1000;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(postersImgViewClick)];
    [imageView addGestureRecognizer:tap];
    [imageView setImageWithURL:[NSURL URLWithString:imgName] placeholderImage:nil];

    [mainWindow addSubview:imageView];
    
}

- (void)postersImgViewClick
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIWindow *mainWindow = [app window];
    UIImageView *imageView = [mainWindow viewWithTag:1000];
    [imageView removeFromSuperview];
    
}
- (void)requestData
{
    [[IGShowManager sharedInstance] showDetailWithShowId:_showId utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict =dict[@"data"];
        NSLog(@"%@",dataDict);
        self.model = [DetailModel fetchWithDict:dataDict];
        if (_model != nil) {
            self.showModel = _model.showModel;
//            self.fieldArray = _model.fieldArray;
//            self.bandArray = _model.bandArray;
            self.bandModel = _model.bandModel;
            self.typeArray = _model.bandArray;
            self.fieldModel = _model.fieldModel;
            self.sponsorModel = _model.sponsorModel;
            self.commentArray = _model.commentArray;
            self.num = _model.followNum;
        }
        _titleLabel.text = [NSString stringWithFormat:@"%@人关注了该演出",_num];

        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:@"detail网络错误"];

    }];
}

- (DetailModel *)model
{
    if (_model == nil) {
        _model = [[DetailModel alloc] init];
    }
    return _model;
}
- (NSArray *)typeArray
{
    if (_typeArray == nil) {
        _typeArray = [NSArray array];
    }
    return _typeArray;
}
- (NSMutableArray *)fieldArray
{
    if (_fieldArray == nil) {
        _fieldArray = [NSMutableArray array];
    }
    return _fieldArray;
}
- (NSMutableArray *)bandArray
{
    if (_bandArray == nil) {
        _bandArray = [NSMutableArray array];
    }
    return _bandArray;
}
- (NSMutableArray *)sponsorArray
{
    if (_sponsorArray == nil) {
        _sponsorArray = [NSMutableArray array];
    }
    return _sponsorArray;
}

- (IGHomeModel *)showModel
{
    if (_showModel == nil) {
        _showModel = [[IGHomeModel alloc] init];
    }
    return _showModel;
}
- (NSNumber *)num
{
    if (_num == nil) {
        _num = [[NSNumber alloc] init];
    }
    return _num;
}

- (fieldModel *)fieldModel{
    if (_fieldModel == nil) {
        _fieldModel = [[fieldModel alloc] init];
    }
    return _fieldModel;
}

- (SponsorModel *)sponsorModel{
    if (_sponsorModel == nil) {
        _sponsorModel = [[SponsorModel alloc] init];
    }
    return _sponsorModel;
}

- (bandModel *)bandModel{
    if (_bandModel == nil) {
        _bandModel = [[bandModel alloc] init];
    }
    return _bandModel;
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

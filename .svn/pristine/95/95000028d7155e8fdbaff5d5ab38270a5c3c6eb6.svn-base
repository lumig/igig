//
//  CustEditingViewController.m
//  iGig
//
//  Created by duanzd on 15/10/30.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "CustEditingViewController.h"
#import "EditViewController.h"

@interface CustEditingViewController ()<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    UIImageView *_headPic;
    UIImage *_iconImg;
}

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@end

@implementation CustEditingViewController

- (UIImagePickerController *)imagePickerController
{
    if (_imagePickerController == nil)
    {
        _imagePickerController = [[UIImagePickerController alloc]init];
        _imagePickerController.delegate = self;
        
//        _imagePickerController.allowsEditing = YES;
    }
    
    return _imagePickerController;
}


- (NSArray *)titleArray{
    if (nil == _titleArray){
        _titleArray = [NSArray arrayWithObjects:@"昵      称", @"性      别", @"签      名", @"个人简介", nil];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息编辑";
    [self createUI];
}

- (void)createUI{
    UIView *headView = [UITools createViewWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 70) backgroundColor:UIColorFromRGB(0xD4D4D4, 1)];
    headView.userInteractionEnabled = YES;
    UILabel *headLabel = [[UILabel alloc] init];
    headLabel.text = @"头      像";
    headLabel.frame = CGRectMake(15, 0, 100, 70);
    headLabel.font = [UIFont systemFontOfSize:16];
    [headView addSubview:headLabel];
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editHeadPic)];
    [headView addGestureRecognizer:ges];
    
    UIView *line1 = [UITools createViewWithFrame:CGRectMake(0, 69, SCREEN_WIDTH - 20, 1) backgroundColor:UIColorFromRGB(0x545454, 1)];
    [headView addSubview:line1];
    
    UIImageView *imagePic = [[UIImageView alloc] init];
    imagePic.frame = CGRectMake(SCREEN_WIDTH - 20 - 30 - 50, 10, 50, 50);
    [imagePic setImageWithURL:[NSURL URLWithString:[IGCustData sharedInstance].headPic] placeholderImage:[UIImage imageNamed:@"1"]];
    imagePic.layer.cornerRadius = 50/2;
    imagePic.layer.masksToBounds = YES;
    [headView addSubview:imagePic];
    _headPic = imagePic;
    
    UIImageView *arrow = [[UIImageView alloc] init];
    arrow.image = [UIImage imageNamed:@"public_next"];
    arrow.frame = CGRectMake(SCREEN_WIDTH - 20 - 20, 0, 10, 70);
    arrow.contentMode = UIViewContentModeScaleAspectFit;
    [headView addSubview:arrow];
    
    UIView *footView = [UITools createViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, 100) backgroundColor:[UIColor clearColor]];
    UIView *view1 = [UITools createViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 25) backgroundColor:UIColorFromRGB(0xD4D4D4, 1)];
    [footView addSubview:view1];
    
    UIView *line2 = [UITools createViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 1) backgroundColor:UIColorFromRGB(0x545454, 1)];
    [footView addSubview:line2];
    
    UILabel *zhaop = [[UILabel alloc] init];
    zhaop.text = @"照片";
    zhaop.frame = CGRectMake(20, 0, 100, 25);
    zhaop.font = [UIFont systemFontOfSize:14];
    [view1 addSubview:zhaop];
    
    UIView *view2 = [UITools createViewWithFrame:CGRectMake(0, 25, SCREEN_WIDTH - 20, 75) backgroundColor:UIColorFromRGB(0xB8B8B8, 1)];
    [footView addSubview:view2];
    
    CGFloat space = (SCREEN_WIDTH - 20 - 60*4)/ 5;
    for (int i=0; i<4; i++) {
        UIButton *imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imgBtn.frame = CGRectMake(space + (60 + space) * i, 7, 60, 60);
        [imgBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        [view2 addSubview:imgBtn];
    }
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = footView;
    tableView.tableHeaderView = headView;
    tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil];
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UIColorFromRGB(0xB8B8B8, 1);
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(SCREEN_WIDTH - 20 - 30 - 100, 0, 100, 44);
    label.textAlignment = NSTextAlignmentRight;
    label.tag = 1001;
    [cell addSubview:label];
    switch (indexPath.row) {
        case 0:
            label.text = [IGCustData sharedInstance].username;
            break;
        case 1:
            label.text = @"男";
            break;
        case 2:
            label.text = [IGCustData sharedInstance].sign;
            break;
        case 3:
            label.text = [IGCustData sharedInstance].content;
            break;
            
        default:
            break;
    }
    
    UIImageView *arrow = [[UIImageView alloc] init];
    arrow.image = [UIImage imageNamed:@"public_next"];
    arrow.frame = CGRectMake(SCREEN_WIDTH - 20 - 20, 0, 10, 44);
    arrow.contentMode = UIViewContentModeScaleAspectFit;
    [cell addSubview:arrow];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *edittype = [NSString string];
    switch (indexPath.row) {
        case 0:
            edittype = @"username";
            break;
        case 2:
            edittype = @"usersign";
            break;
        case 3:
            edittype = @"content";
            break;
        default:
            break;
    }
    EditViewController *vc = [[EditViewController alloc] init];
    NSString *str = self.titleArray[indexPath.row];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    vc.titleStr = str;
    vc.editBlock = ^(NSString *editStr){
        [[IGUserManager sharedInstance] editCustInfoWithEdittype:edittype content:editStr utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [MBProgressHUD showWithMessage:@"修改成功"];
            
            for (id subView in cell.subviews) {
                UILabel *label = subView;
                if(label.tag == 1001){
                    label.text = editStr;
                }
            }
            if(indexPath.row == 0){
                [IGCustData sharedInstance].username = editStr;
            }else if (indexPath.row == 2){
                [IGCustData sharedInstance].sign = editStr;
            }else if (indexPath.row == 3){
                [IGCustData sharedInstance].content = editStr;
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            [MBProgressHUD showWithMessage:@"服务器出错"];
            [MBProgressHUD showWithMessage:@"edit网络错误"];

        }];
        
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)editHeadPic{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择相片源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    
    sheet.tag = 20;
    
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
    {
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
    else if (buttonIndex == 1)
    {
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
    
}

#pragma mark --  UIImagePickerController  delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *original_image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    

    _iconImg = original_image;
    [picker dismissViewControllerAnimated:YES completion:^{
        
        //        [self modifyFace];
    }];
    
    [self requestEditHeadpic];
}

- (void)requestEditHeadpic{
    [[IGUserManager sharedInstance] edit_headpicWithpicUrl:_iconImg utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showWithMessage:@"编辑用户头像成功"];
        _headPic.image = _iconImg;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showWithMessage:@"服务器出错"];
        [MBProgressHUD showWithMessage:@"edit_headpic网络错误"];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
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

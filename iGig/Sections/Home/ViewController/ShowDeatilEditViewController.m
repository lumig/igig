//
//  ShowDeatilEditViewController.m
//  iGig
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "ShowDeatilEditViewController.h"
#import "ShowNullTableViewCell.h"
#import "ShowDetailEditMsgTableViewCell.h"
#import "BtnCellTableViewCell.h"
#import "IGHomeModel.h"
#import "EditViewController.h"
#import "IGShowManager.h"
#import "AddBandViewController.h"
#import "IntroduceViewController.h"
#import "AddBandModel.h"
@interface ShowDeatilEditViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *msgArray;
@property(strong,nonatomic)UIImagePickerController *imagePickerController;
@property(nonatomic,strong)UIImage *iconImg;
@property(nonatomic,strong)IGHomeModel *model;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)NSMutableArray *bankArray;
@end

@implementation ShowDeatilEditViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetUI];
}

- (void)resetUI
{
    self.title = @"演出详情编辑";
    
    _model = [[IGHomeModel alloc] init];

    _msgArray = @[@"演出名称",@"演出时间",@"预估价格",@"演出地点",@"演出风格",@"演出介绍",@"参演乐队",@"填写乐队名称"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH-20, SCREEN_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor =  RGBACOLOR(93, 93, 93, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 8;
    }
    else
    {
    return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *applicationCellID = @"applicationCellID";
    ShowNullTableViewCell *appCell = (ShowNullTableViewCell *)[tableView dequeueReusableCellWithIdentifier:applicationCellID];
    
    static NSString *msgCellID = @"msgCellID";
    UITableViewCell *msgCell = [tableView dequeueReusableCellWithIdentifier:msgCellID];
    
    static NSString *btnCellID = @"btnCellID";
    BtnCellTableViewCell *btnCell = (BtnCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:btnCellID];
    
    if (indexPath.section == 0) {
        if (appCell == nil) {
           appCell = [[[NSBundle mainBundle] loadNibNamed:@"ShowNullTableViewCell" owner:self options:nil] lastObject];
        }
        
        appCell.postersImgView.image = _iconImg;
        appCell.descLabel.frame = CGRectMake((SCREEN_WIDTH-280)/2.0f, (180-21)/2.0f, 140, 21);
        appCell.descLabel.text = @"添加海报";
        appCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        appCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return appCell;
    }
    else if(indexPath.section ==1)
    {
        if (msgCell == nil) {
            msgCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:msgCellID];
        }
        
        if (indexPath.row < _msgArray.count) {
//            if (indexPath.row == 7) {
//                //放入回调信息
//                 UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//                __weak ShowDeatilEditViewController *mSelf = self;
//                self.bandInfo = ^(NSMutableArray *idArray, NSMutableArray *nameArray){
//                   
//                    [mSelf setBandWithId:idArray andName:nameArray andCell:cell];
//                };
//                return cell;
//            }
            
            if(indexPath.row == 1 )
            {
                msgCell.textLabel.text = _msgArray[indexPath.row];
                msgCell.textLabel.font = [UIFont systemFontOfSize:14];
                [self.dataArray replaceObjectAtIndex:indexPath.row withObject:_showTime];
                msgCell.detailTextLabel.text = _dataArray[indexPath.row];
                msgCell.detailTextLabel.textColor = [UIColor blackColor];
                msgCell.detailTextLabel.font = [UIFont systemFontOfSize:14];
                msgCell.accessoryType = UITableViewCellAccessoryNone;

            }
            else if(indexPath.row == 3)
            {
                msgCell.textLabel.text = _msgArray[indexPath.row];
                msgCell.textLabel.font = [UIFont systemFontOfSize:14];
                msgCell.detailTextLabel.font = [UIFont systemFontOfSize:14];
                [self.dataArray replaceObjectAtIndex:indexPath.row withObject:[[IGCustData sharedInstance] address]];
                msgCell.detailTextLabel.text = _dataArray[indexPath.row];
                msgCell.detailTextLabel.textColor = [UIColor blackColor];
                msgCell.accessoryType = UITableViewCellAccessoryNone;
            }
            else if (indexPath.row == 7)
            {
                static NSString *cellId = @"cellId";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
                }
                
                cell.textLabel.text =_msgArray[indexPath.row];
                cell.backgroundColor =RGBACOLOR(135, 135, 135, 1);
                cell.textLabel.font = [UIFont systemFontOfSize:14];
                _textField = [[UITextField alloc] initWithFrame:CGRectMake(120, 0, 200, 44)];
                _textField.delegate = self;
                _textField.placeholder = @"请填写乐队名称";
                _textField.font = [UIFont systemFontOfSize:14];
                _textField.layer.cornerRadius = 2;
                _textField.layer.masksToBounds = YES;
                _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
                _textField.backgroundColor = RGBACOLOR(135, 135, 135, 1);
                [cell addSubview:_textField];
//                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            }
            else
            {
                msgCell.textLabel.text = _msgArray[indexPath.row];
                msgCell.textLabel.font = [UIFont systemFontOfSize:14];
                msgCell.detailTextLabel.font = [UIFont systemFontOfSize:14];
                //@"演出名称",@"演出时间",@"预估价格",@"演出地点",@"演出风格",@"演出介绍",@"参演乐队"
//           //                }
                msgCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            msgCell.detailTextLabel.text = self.dataArray[indexPath.row];
        }
        msgCell.detailTextLabel.textColor = [UIColor blackColor];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 42, SCREEN_WIDTH-20, 2)];
        lineView.backgroundColor = RGBACOLOR(188, 188, 188, 1);
        [msgCell addSubview:lineView];
        msgCell.backgroundColor = RGBACOLOR(153, 153, 153, 1);
        msgCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return msgCell;
    }
    else
    { if (btnCell == nil) {
        btnCell = [[BtnCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:btnCellID];
    }
        
        
        btnCell.backgroundColor = RGBACOLOR(93, 93, 93, 1);
        btnCell.leftShowBtn.frame = CGRectMake(0, 20, SCREEN_WIDTH-20, 40);
        [btnCell.leftShowBtn setTitle:@"确  定" forState:UIControlStateNormal];
        [btnCell.leftShowBtn setTitle:@"确  定" forState:UIControlStateHighlighted];
        [btnCell.leftShowBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnCell.leftShowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        btnCell.leftShowBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        btnCell.rightShowBtn.hidden = YES;
        
        btnCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return btnCell;
    }
    
}

- (void)setBandWithId:(NSMutableArray *)arrayId andName:(NSMutableArray *)arrayName andCell:(UITableViewCell *)cell{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    CGFloat space = (SCREEN_WIDTH - 60 - 200)/3;
//    CGFloat imageX = 20;
    for (int i=0; i<arrayId.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(20 + (space * i + 50*i), 15, 50, 50);
        imageView.backgroundColor = [UIColor redColor];
        [cell addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10 + ((space - 20) * i + 50*i), KGetViewBottomestYPosition(imageView)+10, 70, 70)];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = arrayName[i];
        [cell addSubview:label];
    }
    
    
//    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [ShowNullTableViewCell cellHeight];
    }
    else if(indexPath.section == 1)
    {
        if(indexPath.row == 7){
            return 44;
        }else{
            return 44;
        }
    }else
    {
        return [BtnCellTableViewCell cellHeight];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self nullCellImgClick];
    }
    else if (indexPath.section == 1)
    {
        if(indexPath.row == 1 || indexPath.row == 3 )
        {
            
        } else if (indexPath.row == 5)
        {
            IntroduceViewController *vc = [[IntroduceViewController alloc] init];
            vc.titleStr = _msgArray[indexPath.row ];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            vc.text = cell.detailTextLabel.text;
            [self.navigationController pushViewController:vc
                                                 animated:YES];
            vc.editBlock= ^(NSString *editStr)
            {
                UITableViewCell *cell =[self.tableView cellForRowAtIndexPath:indexPath];
                cell.detailTextLabel.text = editStr;
                _model.desc = editStr;
                if (self.dataArray.count > indexPath.row && editStr) {
                    [self.dataArray replaceObjectAtIndex:indexPath.row withObject:editStr];
                }
            };
            [_textField resignFirstResponder];
        }
        
        else if(indexPath.row == 6){
            
            AddBandViewController *vc = [[AddBandViewController alloc] init];
            [self.navigationController pushViewController:vc
                                                 animated:YES];
            vc.bankBlock= ^(NSMutableArray *bankArray)
            {
                for (AddBandModel *model in bankArray) {
                    
                    [self.bankArray addObject:model.bandId];
                }
                NSLog(@"bank %@",_bankArray);
        
            };
            
            vc.editBlock= ^(NSString *editStr)
            {
                UITableViewCell *cell =[self.tableView cellForRowAtIndexPath:indexPath];
                cell.detailTextLabel.text = editStr;
                if (self.dataArray.count > indexPath.row && editStr) {
                    [self.dataArray replaceObjectAtIndex:indexPath.row withObject:editStr];
                }
            };
            
            [_textField resignFirstResponder];
        }
       else
        {
            [_textField resignFirstResponder];
            EditViewController *editVC = [[EditViewController alloc] init];
            editVC.titleStr = _msgArray[indexPath.row ];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            editVC.text = cell.detailTextLabel.text;
            [self.navigationController pushViewController:editVC animated:YES];
            editVC.editBlock = ^(NSString *editStr)
            {
                UITableViewCell *cell =[self.tableView cellForRowAtIndexPath:indexPath];
                cell.detailTextLabel.text = editStr;
                
                
                if (self.dataArray.count > indexPath.row && editStr) {
                    [self.dataArray replaceObjectAtIndex:indexPath.row withObject:editStr];
                }
                if (indexPath.row == 0) {
                    _model.title = editStr;
                }
                else if (indexPath.row ==2)
                {
                    _model.price = editStr;
                }
                else if(indexPath.row == 4)
                {
                    _model.style = editStr;
                }
               
                //                else if (indexPath.row ==6)
                //                {
                //                    _model.desc = editStr;
                //                }
            };
            
            
        }
    }
    else
    {
        
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}


- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [_textField resignFirstResponder];
    if ([eventName isEqualToString:BTN_ROUTEREVENT]) {
        
        NSUInteger row = [[userInfo objectForKey:@"row"] integerValue];
        if (row == 0) {
            
            
            //发布按钮逻辑
            IGShowManager *manager = [IGShowManager sharedInstance];
            NSString *strImg = [NSString string];
            if(self.iconImg != nil){
                
                NSData *_data = UIImageJPEGRepresentation(self.iconImg, 1.0f);
                
                NSString *_encodedImageStr = [_data base64EncodedStringWithOptions:0];
                strImg = _encodedImageStr;
                //            NSLog(@"===Encoded image:\n%@", _encodedImageStr);
            }else{
                
            }
            
            NSLog(@"%@", _model.title);
            [[IGShowManager sharedInstance] applyWithWithTitle:_model.title showTime:self.showTime dirt:[IGCustData sharedInstance].address style:[IGCustData sharedInstance].style price:_model.price content:_model.desc picUrl:_iconImg field_id:[IGCustData sharedInstance].custId bandName: _textField.text band_id:_bankArray isHub:YES utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [MBProgressHUD showWithMessage:@"上传成功！"];
                NSLog(@"yes");
                [self.navigationController popToRootViewControllerAnimated:YES];

            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"------ %@",error);
                [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
            }];
            ;
//            [manager applyShowWithTitle:_model.title showTime:self.showTime dirt:[IGCustData sharedInstance].address style:[IGCustData sharedInstance].style price:_model.price content:_model.desc picUrl:strImg field_id:[IGCustData sharedInstance].custId utoken:[IGCustData sharedInstance].token success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                [MBProgressHUD showWithMessage:responseObject[@"msg"]];
//                
//                [self.navigationController popToRootViewControllerAnimated:YES];
//                
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                //            [MBProgressHUD showWithMessage:error];
//                [MBProgressHUD showWithMessage:@"服务器维护,稍后再试"];
//                NSLog(@"%@", error);
//            }];
        }
        
    }
    
}



#pragma mark --  UIImagePickerController  delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *original_image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    _iconImg = original_image;
    
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
//        [self modifyFace];
        [_tableView reloadData];
        
    }];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark -- actionSheet delegate


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
- (void)nullCellImgClick
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择相片源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    
    sheet.tag = 20;
    
    [sheet showInView:self.view];
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]initWithArray:@[@"",@"",@"",
                                @"",@"",@"",
                                @""]];
    }
    return _dataArray;
}
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

- (NSMutableArray *)bankArray
{
    if (_bankArray == nil) {
        _bankArray =[NSMutableArray array];
        
    }
    
    return _bankArray;
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

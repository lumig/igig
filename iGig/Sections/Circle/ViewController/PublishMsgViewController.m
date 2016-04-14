//
//  PublishMsgViewController.m
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "PublishMsgViewController.h"

#import "ZYQAssetPickerController.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"

#import "TextFieldTableViewCell.h"
#import "PublishPhotoTableViewCell.h"

#import "UIImage+Kit.h"
#import "NSData+Helpers.h"

@interface PublishMsgViewController ()<UITableViewDataSource,UITableViewDelegate, UIImagePickerControllerDelegate,UIActionSheetDelegate,ZYQAssetPickerControllerDelegate,UINavigationControllerDelegate>


@property(nonatomic,strong)UITableView *tableView;

@property (strong,nonatomic)ZYQAssetPickerController *assetPickerController;

@property (strong,nonatomic)UIImagePickerController *imagePickerController;

@property(strong,nonatomic)NSMutableArray *gridArr;

@property(strong,nonatomic)NSString *textStr;

@end

@implementation PublishMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetUI];
    
}

- (void)resetUI
{
    [self addRightBtn];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH-20, SCREEN_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}

- (void)addRightBtn
{
    UIButton *btnRight = [[UIButton alloc] init];
    btnRight.frame = CGRectMake(0, 0, 44, 44);
    [btnRight setTitle:@"发送" forState:UIControlStateNormal];
    btnRight.titleLabel.font = [UIFont systemFontOfSize:15];
    [btnRight addTarget:self action:@selector(publishBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)publishBtn
{
//    [[IGCircleManager sharedInstance] publishSayWithUtoken:[IGCustData sharedInstance].token content:_textStr imgArray:_gridArr isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"------ %@",responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//    }];
    
    
    [[IGCircleManager sharedInstance] publishSayingWithUtoken:[IGCustData sharedInstance].token content:_textStr imgStr:[self imageStrChangedWithImageArray:_gridArr] isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"------ %@",responseObject);
        [MBProgressHUD showWithMessage:@"上传成功！"];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@",error);
        [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
    }];
}


#pragma mark -- base64转码
- (NSString *)imageStrChangedWithImageArray:(NSArray *)imgArray
{
    NSMutableString *imageStr = [[NSMutableString alloc]init];
    
    for (int i = 0; i < imgArray.count; i++)
    {
        //压缩系数
        NSString *imgStr = [UIImageJPEGRepresentation(imgArray[i],0.3) base64EncodedString];
        
        [imageStr appendString:imgStr];
        
        if (i < imgArray.count - 1)
        {
            [imageStr appendString:@","];
        }
    }
    
    return imageStr;
}

#pragma mark -- 压缩图片
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self textViewTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    if (indexPath.section == 1) {
        return [self photoTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}


#pragma mark -- 文本框
- (UITableViewCell *)textViewTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellID"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TextFieldTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }

    return cell;
}

#pragma mark -- 照片
- (UITableViewCell *)photoTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PublishPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"publishPhotoCellID"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PublishPhotoTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    cell.gridArr = self.gridArr;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [TextFieldTableViewCell cellHeight];
    }
    if (indexPath.section == 1) {
        return [PublishPhotoTableViewCell heightViewWithArr:self.gridArr];
    }
    
    return 0;
}



#pragma mark -- router

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    if ([eventName isEqualToString:kPublishTextRouterEvent]) {
        _textStr = userInfo[@"content"];
    }
    
    if ([eventName isEqualToString:kPublishPhotoDidRouterEvent])
    {
        BOOL isAddPhoto = [[userInfo objectForKey:kAddPhoto]boolValue];
        
        if (isAddPhoto)
        {
            [self showActionSheet];
        }
        else
        {
            NSInteger currentIndex = [[userInfo objectForKey:kPhotoIndex] integerValue];
            
            NSMutableArray *imageViews = [userInfo objectForKey:kPhotoImageView];
            
            [self photoBrowserWithCurrentIndex:currentIndex imageViews:imageViews];
        }
        return;
    }
}

#pragma mark - showActionSheet
- (void)showActionSheet
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择相片源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"调用系统相机" otherButtonTitles:@"调用系统相册", nil];
    
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
        [self presentViewController:self.assetPickerController animated:YES completion:nil];
    }
}


#pragma mark --  UIImagePickerController  delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *original_image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    original_image = [UIImage scaleAndRotateImage:original_image];
    
    [self.gridArr addObject:original_image];
    NSLog(@"polly %@",_gridArr);
    [picker dismissViewControllerAnimated:YES completion:nil];
//    self.publishWorkApi.imageArr = self.gridArr;
    [self reloadSections_1];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    for (ALAsset *asset in assets)
    {
        UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
        [self.gridArr addObject:tempImg];
    }
    
    [self reloadSections_1];
}

#pragma mark - 创建浏览相片
- (void)photoBrowserWithCurrentIndex:(NSInteger)currentIndex imageViews:(NSMutableArray *)imageViews
{
    NSMutableArray *broArr = [[NSMutableArray alloc]init];
    NSMutableArray *broSelectArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.gridArr.count; i++)
    {
        MJPhoto *photo = [[MJPhoto alloc]init];
        photo.image = self.gridArr[i];
        photo.srcImageView = imageViews[i];
        [broArr addObject:photo];
        [broSelectArray addObject:@1];
    }
    
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = currentIndex;
    browser.photos = broArr;
    browser.isShowButton = YES;
    browser.selectArray = broSelectArray;
    [browser show];
    
    browser.seletedBlock = ^(NSMutableArray *seletedArray)
    {
        BOOL flag = NO;
        for (NSInteger k = seletedArray.count - 1; k >= 0; k--)
        {
            BOOL isSelected = [[seletedArray objectAtIndex:k] boolValue];
            
            if (!isSelected)
            {
                flag = YES;
                [self.gridArr removeObjectAtIndex:k];
            }
        }
        
//        self.publishWorkApi.imageArr = self.gridArr;
        
        if (flag)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self reloadSections_1];
            });
        }
    };
}


- (void)reloadSections_1
{
    if ([self.tableView numberOfSections] > 1)
    {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (NSMutableArray *)gridArr
{
    if (_gridArr == nil) {
        _gridArr = [NSMutableArray array];
    }
    return _gridArr;
}

- (ZYQAssetPickerController *)assetPickerController
{
    _assetPickerController = [[ZYQAssetPickerController alloc]init];
    _assetPickerController.assetsFilter = [ALAssetsFilter allPhotos];
    _assetPickerController.maximumNumberOfSelection = 9 - self.gridArr.count;
    _assetPickerController.delegate=self;
    _assetPickerController.navigationBar.barTintColor = RGBACOLOR(42, 42, 42, 1);
    [_assetPickerController.navigationBar setTintColor:[UIColor whiteColor]];
    _assetPickerController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    _assetPickerController.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo])
        {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            return duration >= 5;
        } else {
            return YES;
        }
    }];
    return _assetPickerController;
}

- (UIImagePickerController *)imagePickerController
{
    if (_imagePickerController == nil)
    {
        _imagePickerController = [[UIImagePickerController alloc]init];
        _imagePickerController.delegate = self;
    }
    
    return _imagePickerController;
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

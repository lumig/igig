//
//  IGFansViewController.m
//  iGig
//
//  Created by liuzhanying on 15/10/26.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGFansViewController.h"
#import "IGTabBarController.h"
#import "IGUserManager.h"

@interface IGFansViewController ()
{
    UITextField *_name;

}
@end

@implementation IGFansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)createUI{
    UIImageView *bgImgView = [[UIImageView alloc] init];
    bgImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 667/2);
    bgImgView.image = [UIImage imageNamed:@"login_bg"];
//    bgImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bgImgView];

    
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *clickImg = [UIImage imageNamed:@"registered_optional"];
    [clickBtn setImage:clickImg forState:UIControlStateNormal];
    clickBtn.frame = CGRectMake((SCREEN_WIDTH - 190/2) / 2, 240, clickImg.size.width, clickImg.size.height);
    [self.view addSubview:clickBtn];
    
    NSString *str = @"同意注册协议";
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(2, 4)];
    [attStr addAttribute:NSUnderlineStyleAttributeName
                   value:[NSNumber numberWithInt:kCTUnderlineStyleSingle]
                   range:NSMakeRange(2, 4)];
    UILabel *label = [UITools createLabelWithFrame:CGRectMake(KGetViewRightestXPosition(clickBtn)+5, 240, 100, 14) fontNumber:14 text:@""];
    label.attributedText = attStr;
    //    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    
    
    UIButton *finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *btnImg = [UIImage imageNamed:@"login_button"];
    finishBtn.frame = CGRectMake((SCREEN_WIDTH - btnImg.size.width)/2 , KGetViewBottomestYPosition(clickBtn)+ 22, btnImg.size.width, btnImg.size.height );
    [self.view addSubview:finishBtn];
    [finishBtn setImage:btnImg forState:UIControlStateNormal];
        [finishBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *btnLabel = [UITools createLabelWithFrame:CGRectMake((SCREEN_WIDTH - btnImg.size.width)/2 + 10, KGetViewBottomestYPosition(clickBtn)+ 18, btnImg.size.width, btnImg.size.height) fontNumber:14 text:@"完成"];
    btnLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:btnLabel];
    
    
    UILabel *title = [UITools createLabelWithFrame:CGRectMake((SCREEN_WIDTH - 190)/2, 110, 100, 14) fontNumber:14 text:@"昵称"];
    title.textColor = UIColorFromInt(137, 137, 137, 1);
    [self.view addSubview:title];
    
    UITextField *hostText = [UITools createTextFiledWithFrame:CGRectMake((SCREEN_WIDTH - 190)/2, KGetViewBottomestYPosition(title)+10, 190, 25) fontNumber:12 placeText:@"输入"];
    //    hostText.keyboardType = UIKeyboardTypePhonePad;
    hostText.textColor = UIColorFromInt(67, 67, 67, 1);
    hostText.backgroundColor = UIColorFromInt(27, 27, 27, 1);
    hostText.clearsOnBeginEditing = YES;
    [self.view addSubview:hostText];
    _name = hostText;

}

- (void)btnClick{
    [[IGUserManager sharedInstance] reginfoWithphone:self.phone username:_name.text type:@"4" style:nil address:nil isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [IGCustData savaUserInfo:responseObject[@"data"]];
        [self gotoHomePage];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showWithMessage:@"reginfo网络错误"];
    }];
}

- (void)gotoHomePage{
    AppDelegate* appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = nil;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[IGTabBarController alloc] init]];
    //        nav.navigationBar.hidden = YES;
    appDelegate.window.rootViewController =nav;
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

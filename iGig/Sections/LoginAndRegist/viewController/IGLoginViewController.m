//
//  IGLoginViewController.m
//  iGig
//
//  Created by liuzhanying on 15/10/24.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGLoginViewController.h"
#import "IGTabBarController.h"
#import "AppDelegate.h"
#import "IGDignityViewController.h"
#import "IGUserManager.h"
#import <SMS_SDK/SMSSDK.h>
#define ceshiToken @"1"

#define Btn_Tag_Start 100

@interface IGLoginViewController ()
{
    NSTimer *_timer;
    NSInteger _currentTime;
    UIButton *_securityBtn;
    BOOL _isFire;
    UITextField *_textFiledId;
    UITextField *_textFiledCode;
}

@end

@implementation IGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI{
    UIImageView *bgImgView = [[UIImageView alloc] init];
    bgImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 667/2);
    bgImgView.image = [UIImage imageNamed:@"login_bg"];
//    bgImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bgImgView];
    
    
    UIImageView *logo = [[UIImageView alloc] init];
    UIImage *img = [UIImage imageNamed:@"login_logo"];
    logo.frame = CGRectMake(0, 15 + 64, SCREEN_WIDTH, img.size.height);
    logo.contentMode = UIViewContentModeScaleAspectFit;
//    logo.backgroundColor = [UIColor redColor];
    logo.image = img;
    [self.view addSubview:logo];
    
    UILabel *labelId = [UITools createLabelWithFrame:CGRectMake((SCREEN_WIDTH - 190)/2, KGetViewBottomestYPosition(logo)+15, 190, 12) fontNumber:14 text:@"手机号"];
    [self.view addSubview:labelId];
    labelId.textColor = UIColorFromInt(137, 137, 137, 1);
    
    UITextField *textId = [UITools createTextFiledWithFrame:CGRectMake((SCREEN_WIDTH - 190)/2, KGetViewBottomestYPosition(labelId)+5, 190, 25) fontNumber:12 placeText:@"输入手机号"];
    textId.keyboardType = UIKeyboardTypePhonePad;
    textId.textColor = UIColorFromInt(67, 67, 67, 1);
    textId.backgroundColor = UIColorFromInt(27, 27, 27, 1);
//    textId.text = @"输入手机号";
    textId.clearsOnBeginEditing = YES;
    [self.view addSubview:textId];
    _textFiledId = textId;
    
    UILabel *labelPwd = [UITools createLabelWithFrame:CGRectMake((SCREEN_WIDTH - 190)/2, KGetViewBottomestYPosition(textId)+8, 190, 12) fontNumber:12 text:@"验证码"];
    [self.view addSubview:labelPwd];
    labelPwd.textColor = UIColorFromInt(137, 137, 137, 1);
    
    UITextField *textPwd = [UITools createTextFiledWithFrame:CGRectMake((SCREEN_WIDTH - 190)/2, KGetViewBottomestYPosition(labelPwd)+5, 110, 25) fontNumber:12 placeText:@"验证码"];
    textPwd.keyboardType = UIKeyboardTypePhonePad;
//    textPwd.text = @"验证码";
    textPwd.textColor = UIColorFromInt(67, 67, 67, 1);
    textPwd.backgroundColor = UIColorFromInt(27, 27, 27, 1);
    textPwd.clearsOnBeginEditing = YES;
    [self.view addSubview:textPwd];
    _textFiledCode = textPwd;
    
    UIButton *securityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    securityBtn.frame = CGRectMake(KGetViewRightestXPosition(textPwd)+5,  KGetViewBottomestYPosition(labelPwd)+5, 75, 25);
    [securityBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    securityBtn.backgroundColor = UIColorFromInt(32, 32, 32, 1);
    [securityBtn setTitleColor:UIColorFromInt(111, 111, 111, 1) forState:UIControlStateNormal];
    securityBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [securityBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:securityBtn];
    _securityBtn = securityBtn;
    _currentTime = 60;
    
    UIImage *btnImg = [UIImage imageNamed:@"login_button"];
    CGFloat space = (190 - btnImg.size.width*3) / 2;
    NSArray *titleArray = [NSArray arrayWithObjects:@"注册", @"登陆", @"逛逛", nil];
    for (int i=0; i<3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((SCREEN_WIDTH - 190)/2 + (btnImg.size.width * i) + (space * i) , KGetViewBottomestYPosition(textPwd)+18, btnImg.size.width, btnImg.size.height);
        [btn setBackgroundImage:btnImg forState:UIControlStateNormal];
        
        UILabel *label = [UITools createLabelWithFrame:CGRectMake((SCREEN_WIDTH - 190)/2 + (btnImg.size.width * i) + (space * i) + 10 , KGetViewBottomestYPosition(textPwd)+16, btnImg.size.width, btnImg.size.height) fontNumber:14 text:titleArray[i]];
        label.textColor = [UIColor whiteColor];
        
        [btn addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i + Btn_Tag_Start;
        [self.view addSubview:btn];
        [self.view addSubview:label];
    }
}

- (void)btnClick:(UIButton *)btn{
    

    
    if(_isFire){
        return;
    }
    
    //发送验证码
    [SMSSDK getVerificationCodeByMethod:0 phoneNumber:_textFiledId.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        NSLog(@"发送成功");
    }];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    _isFire = YES;
}

- (void)loginBtn:(UIButton *)sendBtn{
    [self.view endEditing:YES];
    //注册
    if(sendBtn.tag - Btn_Tag_Start == 0){
        if(_textFiledCode.text.length <= 0){
            [MBProgressHUD showWithMessage:@"验证码未填写"];
            return ;
        }
        
        
        [[IGUserManager sharedInstance] regverify_testWithPhone:_textFiledId.text code:_textFiledCode.text isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", responseObject);
            IGDignityViewController *vc = [[IGDignityViewController alloc] init];
            vc.phone = _textFiledId.text;
            [self.navigationController pushViewController:vc animated:YES];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
//            [MBProgressHUD showWithMessage:@"服务器维护"];
            [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
        }];
        

    }
    
    //登陆
    if (sendBtn.tag - Btn_Tag_Start == 1) {
        if(_textFiledCode.text.length <= 0){
            [MBProgressHUD showWithMessage:@"验证码未填写"];
            return ;
        }
        [[IGUserManager sharedInstance] login_testWithPhone:_textFiledId.text code:_textFiledCode.text device_no:[UIDevice currentDevice].model device_type:@"1" isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@",responseObject);
            
            [IGCustData savaUserInfo:responseObject[@"data"]];
            [self gotoHomePage];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            [MBProgressHUD showWithMessage:@"用户名或验证码错误"];
            [MBProgressHUD showWithMessage:[NSString stringWithFormat:@"%s网络错误",__FUNCTION__]];
        }];
        
        
        
        
    }
    
    //逛逛无token
    if(sendBtn.tag - Btn_Tag_Start == 2){
        [MBProgressHUD showWithMessage:@"暂时不支持此功能,请输入手机号"];
    }
}

- (void)gotoHomePage{
    AppDelegate* appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = nil;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[IGTabBarController alloc] init]];
    //        nav.navigationBar.hidden = YES;
    appDelegate.window.rootViewController =nav;
}

- (void)requestCustInfo{
    
}

- (void)timeFireMethod{
    _currentTime --;
    [_securityBtn setTitle:[NSString stringWithFormat:@"%ld秒", _currentTime] forState:UIControlStateNormal];
    if(_currentTime == 0){
        
        [_timer invalidate];
        _timer = nil;
        _currentTime = 60;
        [_securityBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        _isFire = NO;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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

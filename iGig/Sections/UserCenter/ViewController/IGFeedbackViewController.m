//
//  IGFeedbackViewController.m
//  iGig
//
//  Created by duanzd on 15/10/29.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGFeedbackViewController.h"

@interface IGFeedbackViewController ()<UITextViewDelegate>
{
    UILabel *_holdLabel;
    UITextView *_textView;
    UITextField *_textFiled;
}
@end

@implementation IGFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(sendClick)];
}

- (void)sendClick{
    //提交反馈
    [[IGShowManager sharedInstance] suggestWithContent:_textView.text Contact:_textFiled.text utoken:[IGCustData sharedInstance].token isHub:YES success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showWithMessage:@"提交成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showWithMessage:@"服务器出错"];
        [MBProgressHUD showWithMessage:@"/suggest/add网络错误"];
    }];
}

- (void)createUI{
    self.title = @"给我们建议";
    
    UIView *bgText = [UITools createViewWithFrame:CGRectMake(10, 10+64, SCREEN_WIDTH - 20, 140) backgroundColor:UIColorFromRGB(0x898989, 1)];
    [self.view addSubview:bgText];
    
    _holdLabel = [[UILabel alloc] init];
    _holdLabel.text = @"请输入您的建议";
    _holdLabel.frame = CGRectMake(10, 15, 200, 12);
    _holdLabel.font = [UIFont systemFontOfSize:12];
    _holdLabel.textColor = UIColorFromRGB(0xd3d3d3, 1);
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 40, 140 - 20)];
    textView.font = [UIFont systemFontOfSize:12];
    textView.delegate = self;
    textView.backgroundColor = [UIColor clearColor];
    _textView = textView;
    [bgText addSubview:textView];
    [bgText addSubview:_holdLabel];
    
    UIView *footView = [UITools createViewWithFrame:CGRectMake(10, KGetViewBottomestYPosition(bgText)+10, SCREEN_WIDTH - 20, 40) backgroundColor:UIColorFromRGB(0x898989, 1)];
    [self.view addSubview:footView];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(10, 0, SCREEN_WIDTH - 40, 40);
    _textFiled = textField;
    textField.font = [UIFont systemFontOfSize:12];
    [footView addSubview:textField];
    textField.placeholder = @"联系方式(邮箱/手机)";

}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    _holdLabel.hidden = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end

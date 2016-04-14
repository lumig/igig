//
//  IntroduceViewController.m
//  iGig
//
//  Created by 倪莹蕾 on 15/11/22.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IntroduceViewController.h"
#import "IGHomeModel.h"
#import "PlaceholderTextView.h"

@interface IntroduceViewController ()<UITextFieldDelegate,UITextViewDelegate>
//@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)PlaceholderTextView *textView;
@end

@implementation IntroduceViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationItem.leftBarButtonItem.enabled = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetUI];
}

- (void)resetUI
{
    self.title = [NSString stringWithFormat:@"编辑%@",_titleStr];
    
    self.textView = [[PlaceholderTextView alloc] initWithFrame:CGRectMake(10, 74, SCREEN_WIDTH-20, 100)];
    _textView.delegate = self;
    if (self.text.length <= 0) {
        _textView.placeholder = @"请输入相应文本";
    }
    _textView.layer.cornerRadius = 2;
    _textView.layer.masksToBounds = YES;
    _textView.backgroundColor = [UIColor whiteColor];
    [_textView becomeFirstResponder];
    if (self.text) {
        _textView.text = self.text;
    }
    [self.view addSubview:self.textView];

    
    [self creatRigthItem];
}


- (void)creatRigthItem
{
    UIButton *btnRight = [[UIButton alloc] init];
    btnRight.titleLabel.font = [UIFont systemFontOfSize:15];
    btnRight.frame = CGRectMake(0, 0, 30, 44);
    [btnRight setTitle:@"完成" forState:UIControlStateNormal];
    [btnRight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnRight setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    //    btnRight.enabled = NO;
    
    [btnRight addTarget:self action:@selector(saveChanged) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
}
- (void)saveChanged
{
    [self.view endEditing:YES];
    NSString *str = self.textView.text;
    if (self.editBlock)
    {
        self.editBlock(str);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationItem.leftBarButtonItem.enabled = YES;

    [self.textView resignFirstResponder];
}

#pragma mark - textFiledDelegate

- (void)textViewDidChange:(UITextView *)textView{
    
    if (self.textView.text.length > 0 ) {
        
        self.navigationItem.rightBarButtonItem.enabled = YES;
        
    }else
    {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
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

//
//  EditViewController.m
//  iGig
//
//  Created by mac on 15/11/3.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "EditViewController.h"
#import "IGHomeModel.h"
@interface EditViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *textField;
@end

@implementation EditViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationItem.leftBarButtonItem.enabled = NO;3
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetUI];
    
}

- (void)resetUI
{
    self.title = [NSString stringWithFormat:@"编辑%@",_titleStr];
    
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 74, SCREEN_WIDTH-20, 44)];
    _textField.delegate = self;
    if (self.text) {
        _textField.text = self.text;
    }
    _textField.placeholder = @"请输入相应文本";
    _textField.layer.cornerRadius = 2;
    _textField.layer.masksToBounds = YES;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField.backgroundColor = [UIColor whiteColor];
    [_textField becomeFirstResponder];
    [self.view addSubview:self.textField];
    
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
    NSString *str = self.textField.text;
    
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

    [self.textField resignFirstResponder];
}

#pragma mark - textFiledDelegate

-(void) textFiledEditChanged:(UITextField *)textField
{
    if (self.textField.text.length > 0 ) {
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
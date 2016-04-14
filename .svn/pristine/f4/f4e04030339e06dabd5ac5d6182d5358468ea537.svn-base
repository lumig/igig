//
//  IGBaseViewController.m
//  iGig
//
//  Created by abc on 15/10/20.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGBaseViewController.h"
#import "IGLoginViewController.h"

@interface IGBaseViewController ()

@end

@implementation IGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBACOLOR(51, 51, 51, 1);
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self addLeftNavBtn];
    
    [self addGesBack];
}

- (void)isLogin{
    if([IGCustData sharedInstance].token.length<=0){
        IGLoginViewController *vc = [[IGLoginViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [self presentViewController:nav animated:YES completion:nil];
    }
}

- (void)addGesBack{
    UIGestureRecognizer *gesture = self.navigationController.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    
    
    if (self.navigationController.viewControllers.count<=1) {
//        [self.myNavBar.backBtn removeFromSuperview];
        return;
    }
    
    UIView *gestureView = gesture.view;
    //gestureView.backgroundColor = [UIColor redColor];
    NSLog(@"%@",gestureView.backgroundColor);
    _popRecognizer = [[UIPanGestureRecognizer alloc] init];
    // popRecognizer.delegate = self;
    _popRecognizer.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:_popRecognizer];
    
    NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
    //    /**
    //     *  获取它的唯一对象，我们知道它是一个叫UIGestureRecognizerTarget的私有类，它有一个属性叫_target
    //     */
    id gestureRecognizerTarget = [_targets firstObject];
    //    /**
    //     *  获取_target:_UINavigationInteractiveTransition，它有一个方法叫handleNavigationTransition:
    //     */
    id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
    //    /**
    //     *  通过前面的打印，我们从控制台获取出来它的方法签名。
    //     */
    SEL handleTransition = NSSelectorFromString(@"handleNavigationTransition:");
    //    /**
    //     *  创建一个与系统一模一样的手势，我们只把它的类改为UIPanGestureRecognizer
    //     */
    [_popRecognizer addTarget:navigationInteractiveTransition action:handleTransition];
}

- (void)addLeftNavBtn
{
    if (self.navigationController && self.navigationController.viewControllers.count > 1)
    {
        UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22.5, 24)];
        backBtn.backgroundColor = [UIColor clearColor];
        [backBtn setImage:[UIImage imageNamed:@"i_arrow_white_left"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem = backButtonItem;
    }
}

- (void)backClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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

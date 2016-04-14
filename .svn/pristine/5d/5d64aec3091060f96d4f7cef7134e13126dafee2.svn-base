//
//  FirstLaunchViewController.m
//  iGig
//
//  Created by duanzd on 15/12/6.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "FirstLaunchViewController.h"
#import "IGLoginViewController.h"

@interface FirstLaunchViewController ()<UIScrollViewDelegate>

//@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation FirstLaunchViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI{

    UIScrollView *scView = [[UIScrollView alloc] init];
    scView.frame = [UIScreen mainScreen].bounds;
    scView.delegate = self;
    for (int i=0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *imageStr = [NSString stringWithFormat:@"firstLacunch%d.jpg", i+1];
        imageView.image = [UIImage imageNamed:imageStr];
        imageView.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [scView addSubview:imageView];
        
        if (i == 2){
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterLogin)];
            [imageView addGestureRecognizer:tap];
        }
    }
    
    scView.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT);
    scView.pagingEnabled = YES;
    [self.view addSubview:scView];

//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn addTarget:self action:@selector(enterLogin) forControlEvents:UIControlEventTouchUpInside];
//    btn.frame = CGRectMake(SCREEN_WIDTH * 2 + 25, SCREEN_HEIGHT * 0.8, SCREEN_WIDTH - 50, 45);
//    btn.backgroundColor = [UIColor orangeColor];
//    [btn setTitle:@"进入app" forState:UIControlStateNormal];
//    [scView addSubview:btn];
    
}

- (void)enterLogin{
    IGLoginViewController *vc = [[IGLoginViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%fand%f", scrollView.contentOffset.x,SCREEN_WIDTH * 3);
    if (scrollView.contentOffset.x >= SCREEN_WIDTH * 2 + 50) {
        [self enterLogin];
    }
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

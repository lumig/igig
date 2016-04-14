//
//  IGTabBarController.m
//  iGig
//
//  Created by abc on 15/10/20.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGTabBarController.h"

#import "IGHomeViewController.h"
#import "IGAttentionViewController.h"
#import "IGCircleViewController.h"
#import "IGFindPersonViewController.h"
#import "IGUserCenterViewController.h"

@interface IGTabBarController ()
{
    IGHomeViewController            *_homeVC;
    IGAttentionViewController       *_attentionVC;
    IGCircleViewController          *_circleVC;
    IGFindPersonViewController      *_findPersonVC;
    IGUserCenterViewController      *_userCenterVC;
    
}

@property (strong,nonatomic)UIButton    *centerButton;

@end

static IGTabBarController *g_tabBarController;

@implementation IGTabBarController

+ (IGTabBarController *)shareIGTabBarController
{
    return g_tabBarController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        g_tabBarController = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"20-4"]];
    
    _circleVC = [[IGCircleViewController alloc]init];
    
    _circleVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"圈子" image:[UIImage imageNamed:@"1-1.png"] selectedImage:[[UIImage imageNamed:@"1-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    _circleVC.tabBarItem.tag = 0;
    [self unselectedTabBarItem:_circleVC.tabBarItem];
    [self selectedTabBatItem:_circleVC.tabBarItem];
    
    _findPersonVC = [[IGFindPersonViewController alloc]init];
    
    _findPersonVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"找人" image:[UIImage imageNamed:@"2-1"] selectedImage:[[UIImage imageNamed:@"2-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    _findPersonVC.tabBarItem.tag = 1;
    [self unselectedTabBarItem:_findPersonVC.tabBarItem];
    [self selectedTabBatItem:_findPersonVC.tabBarItem];
    
    _homeVC = [[IGHomeViewController alloc]init];
    _homeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"5-1"] selectedImage:[[UIImage imageNamed:@"5-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    _homeVC.tabBarItem.tag = 2;
    
    _attentionVC = [[IGAttentionViewController alloc]init];
    
    _attentionVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"关注" image:[UIImage imageNamed:@"3-1"] selectedImage:[[UIImage imageNamed:@"3-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    _attentionVC.tabBarItem.tag = 3;
    [self unselectedTabBarItem:_attentionVC.tabBarItem];
    [self selectedTabBatItem:_attentionVC.tabBarItem];
    
    _userCenterVC = [[IGUserCenterViewController alloc]init];
   
    _userCenterVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"4-1"] selectedImage:[[UIImage imageNamed:@"4-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    _userCenterVC.tabBarItem.tag = 4;
    [self unselectedTabBarItem:_userCenterVC.tabBarItem];
    [self selectedTabBatItem:_userCenterVC.tabBarItem];
    
    self.viewControllers = @[_circleVC,_findPersonVC,_homeVC,_attentionVC,_userCenterVC];
    
    
    
    [self.view addSubview:self.centerButton];
    
    self.selectedIndex = 2;
    [self titleShowWitnIndex:2];

}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self titleShowWitnIndex:item.tag];
}


- (void)titleShowWitnIndex:(NSInteger)index
{
    _centerButton.selected = NO;
    switch (index)
    {
        case 0:
        {
            self.navigationItem.titleView = nil;
            self.title = @"圈子";
            [_circleVC addCameraBtn:self];
        }
            break;
        case 1:
        {
            self.title = @"";
            self.navigationItem.rightBarButtonItem = nil;
            [_findPersonVC addSearchBtn:self];
            [_findPersonVC addSearchBar:self];
        }
            break;
        case 2:
        {

            _centerButton.selected = YES;
            self.navigationItem.rightBarButtonItem = nil;
            [_homeVC addSearchBar:self];
        }
            break;
        case 3:
        {

            self.navigationItem.rightBarButtonItem = nil;
            [_attentionVC addSegment:self];
        }
            break;
        case 4:
        {
            self.navigationItem.titleView = nil;

            self.title = @"我";
            self.navigationItem.rightBarButtonItem = nil;
        }
            break;
            
        default:
            break;
    }
}

- (void)centerClick:(id)sender
{
    _centerButton.selected = YES;
    
    self.selectedIndex = 2;
    [self titleShowWitnIndex:2];
    
}


- (UIButton *)centerButton
{
    if (_centerButton == nil)
    {
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerButton.frame = CGRectMake((SCREEN_WIDTH - 75) * 0.5, SCREEN_HEIGHT - 63, 75, 70);
        [_centerButton setImage:[UIImage imageNamed:@"5-1.png"] forState:UIControlStateNormal];
        [_centerButton setImage:[UIImage imageNamed:@"5-1.png"] forState:UIControlStateHighlighted];

        [_centerButton setImage:[UIImage imageNamed:@"5-2.png"] forState:UIControlStateSelected];
        _centerButton.highlighted = NO;
        [_centerButton addTarget:self action:@selector(centerClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}


- (void)unselectedTabBarItem:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12], NSFontAttributeName, [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
}

- (void)selectedTabBatItem:(UITabBarItem *)tabBarItem
{
    
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:12],
                                        NSFontAttributeName,RGBACOLOR(255, 255, 255, 1),NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
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

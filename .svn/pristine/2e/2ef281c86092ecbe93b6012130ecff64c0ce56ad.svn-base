//
//  HomeCenterView.m
//  iGig
//
//  Created by liuzhanying on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "HomeCenterView.h"
#import "XCTabBarButton.h"
#define centerBtnCnt 4
#define btnTagStart 100

@interface HomeCenterView (){
    CGRect _currentFrame;
}

@property (nonatomic, strong)NSMutableArray *imageStrArray;
@property (nonatomic, strong)NSMutableArray *titleArray;

@end

@implementation HomeCenterView
- (NSMutableArray *)imageStrArray{
    if(_imageStrArray == nil){
        _imageStrArray = [NSMutableArray array];
        [_imageStrArray addObject:@"zhuye1"];
        [_imageStrArray addObject:@"zhuye2"];
        [_imageStrArray addObject:@"zhuye3"];
        [_imageStrArray addObject:@"zhuye4"];
    }
    return _imageStrArray;
}

- (NSMutableArray *)titleArray{
    if(nil == _titleArray){
        _titleArray = [[NSMutableArray alloc] initWithObjects:@"通知", @"我的演出", @"我的圈子", @"资源推荐", nil];
    }
    return _titleArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
        self.backgroundColor = [UIColor grayColor];

    }
    return self;
}

- (void)createSubviews{
    //    CGFloat preX = 0;
    for (int i=0; i<centerBtnCnt; i++) {
        XCTabBarButton *btn = [XCTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i * (SCREEN_WIDTH-20)/4, 0, (SCREEN_WIDTH-20)/4, 60);
        [btn setImage:[UIImage imageNamed:self.imageStrArray[i]] forState:UIControlStateNormal];
        btn.tag = i + btnTagStart;
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
}

- (void)btnClick:(UIButton *)btn{
    if([self.delegate respondsToSelector:@selector(CenterViewBtnDidSeletedWithIndex:)]){
        [self.delegate CenterViewBtnDidSeletedWithIndex:btn.tag - btnTagStart];
    }
}

@end

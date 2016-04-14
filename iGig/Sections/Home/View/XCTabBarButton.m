//
//  XCTabBarButton.m
//  CommunityService
//
//  Created by zhangmm on 15/6/4.
//  Copyright (c) 2015年 lee. All rights reserved.
//
#define XCTabBarButtonImageRatio 0.6
#import "XCTabBarButton.h"
#import "UIView+Extension.h"
@implementation XCTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        

        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
  
        self.titleLabel.font = [UIFont systemFontOfSize:11];

       
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [self setTitleColor:COLOR_TABBAR_Selected forState:UIControlStateSelected];
        

    }
    return self;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = self.frame.size.height * XCTabBarButtonImageRatio;
    return CGRectMake(0, 5, imageW, imageH-5);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = self.frame.size.height * XCTabBarButtonImageRatio;
    CGFloat titleW = self.frame.size.width;
    CGFloat titleH = self.frame.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
  
    [self setTitle:item.title forState:UIControlStateNormal];
 
    [self setImage:item.image forState:UIControlStateNormal];
  
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    

    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
}


- (void)removeFromSuperview
{
//    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  当利用KVO监听到某个对象的属性改变了, 就会调用这个方法
 *
 *  @param keyPath 被改变的属性的名称
 *  @param object  被监听的那个对象
 *  @param change  存放者被改变属性的值
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{

    
 
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
   
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}

- (void)setHighlighted:(BOOL)highlighted { }


@end

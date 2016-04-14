//
//  LDSegmentControl.m
//  LingDou
//
//  Created by chuxiaolong on 15/9/1.
//  Copyright (c) 2015年 chuxiaolong. All rights reserved.
//

#import "LDSegmentControl.h"

#define BUTTON_SPACING 15
#define COLOR_TEXT_TITLE [UIColor grayColor]
#define COLOR_ASSIST [UIColor whiteColor]
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define equalTo(...)                     mas_equalTo(__VA_ARGS__)


@interface LDSegmentControl()
{
    UIButton * currentSelectedButton;
}
@property (nonatomic, copy)  SelectedBlock   selectedBlock;
@property (nonatomic, copy)  NSArray       * titleArray;

@end

@implementation LDSegmentControl

- (id)initWithTitles:(NSArray*)array selected:(SelectedBlock)selectedBlock{
    if (self = [super init]) {
        self.selectedBlock = selectedBlock;
        self.titleArray = array;
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    self.backgroundColor = [UIColor colorWithRed:52/255.0 green:52/255.0f blue:52/255.0f alpha:1];
    
    CGFloat buttonWidth = (SCREEN_WIDTH - (self.titleArray.count-1)-BUTTON_SPACING*2*self.titleArray.count)/self.titleArray.count;
    UIView * lastLineView = nil;
    for (NSInteger count = 0; count < self.titleArray.count; count++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:self.titleArray[count] forState:UIControlStateSelected];
        [btn setTitle:self.titleArray[count] forState:UIControlStateNormal];
        [btn setTitleColor:COLOR_TEXT_TITLE forState:UIControlStateNormal];
        [btn setTitleColor:COLOR_ASSIST forState:UIControlStateSelected];
        btn.tag = count;
        btn.titleLabel.font = [UIFont chineseFontWithSize:11];
        [btn addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
        if (count == 0) {
            btn.selected = YES;
            btn.titleLabel.font = [UIFont chineseFontWithSize:12];
            currentSelectedButton = btn;
            btn.layer.transform = CATransform3DMakeScale(1.1, 1.1, 1);
        }
        [self addSubview:btn];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            if (lastLineView) {
                make.left.equalTo(lastLineView.right).equalTo(@(BUTTON_SPACING));
            }else{
               make.left.equalTo(@(BUTTON_SPACING));
            }
            make.width.equalTo(@(buttonWidth));
            make.top.equalTo(@5);
            make.bottom.equalTo(@-5);
        }];
        if (count == self.titleArray.count-1) {
            return;
        }
        UIView * lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineView];
        [lineView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@15);
            make.bottom.equalTo(@-15);
            make.left.equalTo(btn.right).equalTo(BUTTON_SPACING);
            make.width.equalTo(@1);
        }];
        lastLineView = lineView;
    }
}

- (void)choose:(UIButton*)sender
{
    if (currentSelectedButton == sender) {
        return;
    }
    sender.selected = YES;
    currentSelectedButton.selected = NO;
    POPSpringAnimation * animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.1, 1.1)];
    animation.springBounciness = 12.f;
    [sender pop_addAnimation:animation forKey:@"animationScale"];
    
    POPSpringAnimation * animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation2.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.1, 1.1)];
    animation2.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    animation2.springBounciness = 12.f;
    [currentSelectedButton pop_addAnimation:animation2 forKey:@"animationScale2"];
    

    [UIView animateWithDuration:0.2 animations:^{
        currentSelectedButton.titleLabel.font = [UIFont chineseFontWithSize:11];
        sender.titleLabel.font = [UIFont chineseFontWithSize:12];
    }];
    currentSelectedButton = sender;
    self.selectedBlock(sender.tag);
}
@end

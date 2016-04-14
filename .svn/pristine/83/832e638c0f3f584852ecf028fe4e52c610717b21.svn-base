//
//  BtnCellTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/10/22.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "BtnCellTableViewCell.h"
#import "UIResponder+Router.h"

@implementation BtnCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _leftShowBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40 + 80, (SCREEN_WIDTH -30)/2.0f, 40)];
        [_leftShowBtn addTarget:self action:@selector(leftTapClick) forControlEvents:UIControlEventTouchUpInside];
        _leftShowBtn.backgroundColor = RGBACOLOR(202, 202, 202, 1);
        [self addSubview:_leftShowBtn];
        _rightShowBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH -30)/2.0f + 10, 40 + 80, (SCREEN_WIDTH -30)/2.0f, 40)];
        _rightShowBtn.backgroundColor = RGBACOLOR(202, 202, 202, 1);

        [_rightShowBtn addTarget:self action:@selector(rightTapClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightShowBtn];
    }
    return  self;
}

- (void)leftTapClick
{
    _leftRow = 0;
//        NSLog(@"leftTapClick %lu",(unsigned long)_leftRow);
    [super routerEventWithName:BTN_ROUTEREVENT userInfo:@{@"row":[NSString stringWithFormat:@"%d",(int)_leftRow]}];
    
}

- (void)rightTapClick
{
    _rightRow = 1;
//        NSLog(@"rightTapClick%lu",(unsigned long)_rightRow);
    [super routerEventWithName:BTN_ROUTEREVENT userInfo:@{@"row":[NSString stringWithFormat:@"%d",(int)_rightRow]}];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    
    return YES;
}

+ (CGFloat)cellHeight
{
    return 120;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

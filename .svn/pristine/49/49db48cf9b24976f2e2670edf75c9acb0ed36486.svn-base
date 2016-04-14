//
//  PersonSearchTableViewCell.m
//  iGig
//
//  Created by mac on 15/10/26.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "PersonSearchTableViewCell.h"

@implementation PersonSearchTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.rightLabel];
    if (self) {
        
    }
    return self;
}

- (void)cellFillLeftDict:(NSDictionary *)leftDict leftRow:(NSUInteger)leftRow rightDict:(NSDictionary *)rightDict rightRow:(NSUInteger)rightRow
{
    _leftRow = leftRow;
    _rightRow = rightRow;
    _leftLabel.text = leftDict[@"username"];
    _leftDict = leftDict;
    if (rightDict == nil) {
        _rightLabel.hidden = YES;
        
    }
    
    else
    {
        _rightLabel.text = rightDict[@"username"];
        _rightDict = rightDict;
    }
}

- (UILabel *)leftLabel
{
    if (_leftLabel == nil) {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 11, (SCREEN_WIDTH-40)/2.0f, 22)];
        _leftLabel.font = [UIFont systemFontOfSize:14];
        _leftLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftTapClick)];
        [_leftLabel addGestureRecognizer:tap];
        _leftLabel.textColor = RGBACOLOR(74, 74, 74, 1);
    }
    
    return _leftLabel;
}

- (UILabel *)rightLabel
{
    if (_rightLabel == nil) {
        _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-40)/2.0f, 11, (SCREEN_WIDTH-40)/2.0f, 22)];
        _rightLabel.font = [UIFont systemFontOfSize:14];
        _rightLabel.textColor = RGBACOLOR(74, 74, 74, 1);
        _rightLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightTapClick)];
        [_rightLabel addGestureRecognizer:tap];
    }
    return _rightLabel;
}

- (void)leftTapClick
{
//        NSLog(@"leftTapClick %lu,%@",(unsigned long)_leftRow,_leftDict[@"username"]);
    [super routerEventWithName:PERSONSEARCH_ROUTEREVENT userInfo:@{@"row":[NSString stringWithFormat:@"%d",(int)_leftRow],@"dict":_leftDict}];
    
}

- (void)rightTapClick
{
//    NSLog(@"rightTapClick%lu,%@",(unsigned long)_rightRow,_rightDict[@"username"]);
    [super routerEventWithName:PERSONSEARCH_ROUTEREVENT userInfo:@{@"row":[NSString stringWithFormat:@"%d",(int)_rightRow],@"dict":_rightDict}];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

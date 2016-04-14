//
//  PersonDescTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/10/25.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "PersonDescTableViewCell.h"

@implementation PersonDescTableViewCell



- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGBACOLOR(157, 157, 157, 1);
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.openBtn];
        
    }
    return self;
}

- (void)cellFillWithModel:(PersonModel *)model
{
    
    _height = [PersonDescTableViewCell getTheDescHeightWithDescription:model.desc];
    if (_height > 100) {
        [_openBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _openBtn.enabled = YES;
        [self.openBtn addTarget:self action:@selector(openBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    else
    {
        _lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, SCREEN_WIDTH-20, 2)];
        _openBtn.frame = CGRectMake(0, 142, SCREEN_WIDTH-20, 40); 
    }
    if (_isOpen) {
        _descLabel.frame = CGRectMake(20, 13, SCREEN_WIDTH-60, _height);

    }
    else
    {
        _descLabel.frame = CGRectMake(20, 13, SCREEN_WIDTH-60, 140);

    }
    _descLabel.text = model.desc;
    
    
}


- (void)cellFillWithStr:(NSString *)str
{
    _height = [PersonDescTableViewCell getTheDescHeightWithDescription:str];
    if (_height > 100) {
        [_openBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _openBtn.enabled = YES;
        [self.openBtn addTarget:self action:@selector(openBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    else
    {
        _lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 140, SCREEN_WIDTH-20, 2)];
        _openBtn.frame = CGRectMake(0, 142, SCREEN_WIDTH-20, 40); 
    }
    if (_isOpen) {
        _descLabel.frame = CGRectMake(20, 13, SCREEN_WIDTH-60, _height);
        
    }
    else
    {
        _descLabel.frame = CGRectMake(20, 13, SCREEN_WIDTH-60, 140);
        
    }
    _descLabel.text = str;

}

- (void)cellFillwithString:(NSString *)str isOpen:(BOOL)isOpen
{
    _isOpen = isOpen;
    _height = [PersonDescTableViewCell getTheDescHeightWithDescription:str];
    if (_height > 100) {
        [_openBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _openBtn.enabled = YES;
        [self.openBtn addTarget:self action:@selector(openBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _descLabel.frame = CGRectMake(20, 13, SCREEN_WIDTH-60, 140);
        _lineView.frame = CGRectMake(0, 140, SCREEN_WIDTH-20, 2);
        _lineView.backgroundColor = RGBACOLOR(180, 180, 180, 1);
        _openBtn.frame = CGRectMake(0, 142, SCREEN_WIDTH-20, 40);
        
    }
    else
    {
        _lineView.frame = CGRectMake(0, 140, SCREEN_WIDTH-20, 2);
        _lineView.backgroundColor = RGBACOLOR(180, 180, 180, 1);
        _openBtn.frame = CGRectMake(0, 142, SCREEN_WIDTH-20, 40);
    }
    if (_isOpen) {
        _descLabel.frame = CGRectMake(20, 13, SCREEN_WIDTH-60, _height);
        _lineView.frame = CGRectMake(0, _height +13, SCREEN_WIDTH-20, 2);
        _lineView.backgroundColor = RGBACOLOR(180, 180, 180, 1);
        _openBtn.frame = CGRectMake(0, _height +15, SCREEN_WIDTH-20, 40);
        
    }
    else
    {
        _descLabel.frame = CGRectMake(20, 13, SCREEN_WIDTH-60, 140);
        _lineView.frame = CGRectMake(0, 140, SCREEN_WIDTH-20, 2);
        _lineView.backgroundColor = RGBACOLOR(180, 180, 180, 1);

        _openBtn.frame = CGRectMake(0, 142, SCREEN_WIDTH-20, 40);
        
    }
    _descLabel.text = str;

}

+ (CGFloat)getTheDescHeightWithDescription:(NSString *)desc
{
    return [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 60, 1000) font:    [UIFont systemFontOfSize:14]
                                                 text:desc].height;
    
}

- (void)openBtnClick:(UIButton *)btn
{
    _isOpen = YES;
//    _descLabel.frame = CGRectMake(20, 13, SCREEN_WIDTH -50, _height);
//    _lineView.frame = CGRectMake(0, _height+13, SCREEN_WIDTH -20, 2);
//    _openBtn.frame = CGRectMake(0, CGRectGetMaxY(_lineView.frame), SCREEN_WIDTH -20, 40);
    [_openBtn setTitleColor:[UIColor grayColor]forState:UIControlStateNormal];
    if ([_delegate respondsToSelector:@selector(openButtonClick)]) {
        [_delegate openButtonClick];
    }
    
    if ([_delegate respondsToSelector:@selector(openButtonClickWithBtn:isOpen:)]) {
        [_delegate openButtonClickWithBtn:btn isOpen:_isOpen];
    }

}

- (CGFloat)cellHeightWithStr:(NSString *)str isOpen:(BOOL)isOpen
{
    _isOpen = isOpen;
    if (_isOpen == YES) {
        return [PersonDescTableViewCell getTheDescHeightWithDescription:str] + 52;
    }
    else
    {
        return 182;
    }
}
+ (CGFloat)cellHeightWithStr:(NSString *)str isOpen:(BOOL)isOpen
{
    return [[self alloc] cellHeightWithStr:str isOpen:isOpen];
}

- (CGFloat)cellHeightWithModel:(PersonModel *)model
{
//    NSLog(@"magi%d",_isOpen);
    if (_isOpen == YES) {
        return [PersonDescTableViewCell getTheDescHeightWithDescription:model.desc] + 52;
    }
    else
    {
    return 182;
    }
}

+(CGFloat)cellHeightWithModel:(PersonModel *)model
{
   return [[self alloc] cellHeightWithModel:model];
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 13, SCREEN_WIDTH-40, 140)];
        _descLabel.numberOfLines = 0;
        _descLabel.font = [UIFont systemFontOfSize:14];
        _descLabel.textColor = RGBACOLOR(33, 33, 33, 1);
    }
    return _descLabel;
}

- (UIImageView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = RGBACOLOR(180, 180, 180, 1);
    }
    return _lineView;
}
- (UIButton *)openBtn
{
    if (_openBtn == nil) {
        _openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _openBtn.frame = CGRectMake(0, 142, SCREEN_WIDTH-20, 40);
        _openBtn.backgroundColor = RGBACOLOR(157, 157, 157, 1);
        [_openBtn setTitle:@"展开" forState:UIControlStateNormal];
        [_openBtn setTitle:@"展开" forState:UIControlStateHighlighted];
        _openBtn.enabled = NO;
        [_openBtn setTitleColor:RGBACOLOR(121, 121, 121, 1) forState:UIControlStateNormal];
    }
    return _openBtn;
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

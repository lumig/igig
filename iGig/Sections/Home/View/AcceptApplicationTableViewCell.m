//
//  AcceptApplicationTableViewCell.m
//  iGig
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "AcceptApplicationTableViewCell.h"

@implementation AcceptApplicationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (IBAction)agreeBtnClick:(id)sender {
    NSInteger index =1;
    if ([_delegate respondsToSelector:@selector(btnClickWithIndex:model:)]) {
        [_delegate btnClickWithIndex:index model:_model];
    }
}

- (void)cellFillWithModel:(IGHomeModel *)model 
{
    _model = model;
    [self.postersImgView setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:nil];
    self.tilteLabel.text = model.title;
    self.styleLabel.text = model.style;
    self.showTimeLabel.text = model.showTime;
    self.fieldLabel.text = model.dirt;
    self.priceLabel.text = model.price;
}

-(void)setEnable:(BOOL)enable{
    self.agressBtn.enabled = enable;
    self.disAgressBtn.enabled = enable;
    _enable = enable;
}

- (IBAction)disAgreeBtnClick:(id)sender {
    NSInteger index =2;
    if ([_delegate respondsToSelector:@selector(btnClickWithIndex: model:)]) {
        [_delegate btnClickWithIndex:index model:_model];
    }
}

+ (CGFloat)cellHeight
{
    return 230;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

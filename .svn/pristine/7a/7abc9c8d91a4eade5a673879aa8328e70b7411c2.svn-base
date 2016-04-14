//
//  DetailTypeTableViewCell.m
//  iGig
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "DetailTypeTableViewCell.h"
#import "GHStringManger.h"
#import "fieldModel.h"
#import "SponsorModel.h"
@implementation DetailTypeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGBACOLOR(157, 157, 157, 1);
        [self.contentView addSubview:self.iconImgView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.lvLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.lineImgView];
    }
    return self;
}

- (void)cellFillWithBandModel:(bandModel *)model
{
    [_iconImgView setImageWithURL:[NSURL URLWithString:model.headpic] placeholderImage:nil];
    _nameLabel.frame = CGRectMake(80, 20, [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH- 100, 20) font:[UIFont boldSystemFontOfSize:15] text:model.name].width, 20);
    _nameLabel.text = model.name;
    _lvLabel.frame = CGRectMake(CGRectGetMaxX(_nameLabel.frame)+5, 23, 100, 13);
    _lvLabel.text = [NSString stringWithFormat:@"%d",[model.level intValue]];
    _descLabel.text = model.sign;
    _typeLabel.text = model.typeName;
    

}

- (void)cellFillWithFieldModel:(fieldModel *)model
{
    _iconImgView.hidden = NO;
    [_iconImgView setImageWithURL:[NSURL URLWithString:model.headPic] placeholderImage:nil];
    _nameLabel.frame = CGRectMake(80, 20, [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH- 100, 20) font:[UIFont boldSystemFontOfSize:15] text:model.name].width, 20);
    _nameLabel.text = model.name;
    _lvLabel.frame = CGRectMake(CGRectGetMaxX(_nameLabel.frame)+5, 23, 100, 13);
    _lvLabel.text = [NSString stringWithFormat:@"%d",[model.level intValue]];
    _descLabel.text = model.dirt;
    _typeLabel.text = model.typeName;
    
    self.notLabel.hidden = YES;
}
- (void)cellFillWithSponsorModel:(SponsorModel *)model
{
    _iconImgView.hidden = NO;
    [_iconImgView setImageWithURL:[NSURL URLWithString:model.headPic] placeholderImage:nil];
    _nameLabel.frame = CGRectMake(80, 20, [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH- 100, 20) font:[UIFont boldSystemFontOfSize:15] text:model.name].width, 20);
    _nameLabel.text = model.name;
    _lvLabel.frame = CGRectMake(CGRectGetMaxX(_nameLabel.frame)+5, 23, 100, 13);
    _lvLabel.text = [NSString stringWithFormat:@"%d",[model.level intValue]];
//    _descLabel.text = model.sign;
    _typeLabel.text = model.typeName;
    
    self.notLabel.hidden = YES;
}

- (void)notHaveBand{
    _lvLabel.text = @"";
    _typeLabel.text = @"";
    _nameLabel.text = @"";
    _iconImgView.hidden = YES;
    if (self.notLabel == nil) {
        self.notLabel = [[UILabel alloc] init];
        self.notLabel.text = @"还没有乐队,快去邀请把!";
        [self.contentView addSubview:self.notLabel];
        self.notLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
        self.notLabel.textAlignment = NSTextAlignmentCenter;
        self.notLabel.font = [UIFont systemFontOfSize:20];
    }else{
        self.notLabel.hidden = NO;
    }
    


}

- (UIImageView *)iconImgView
{
    if (_iconImgView == nil) {
        _iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        _iconImgView.layer.cornerRadius = 30;
        _iconImgView.layer.masksToBounds = YES;
//        _iconImgView.layer.borderWidth = 1;
//        _iconImgView.layer.borderColor = [[UIColor colorWithRed:192 green:192 blue:192 alpha:1] CGColor];
        
    }
    return _iconImgView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 100, 22)];
        _nameLabel.font = [UIFont boldChineseFontWithSize:15];
    }
    return _nameLabel;
}

- (UILabel *)lvLabel
{
    if (_lvLabel == nil) {
        _lvLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 23, 50, 13)];
        _lvLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return _lvLabel;
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 45, SCREEN_WIDTH-180, 13)];
        _descLabel.font = [UIFont systemFontOfSize:13];
        _descLabel.textColor = RGBACOLOR(90, 90, 90, 1);
    }
    return _descLabel;
}

- (UILabel *)typeLabel
{
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-130, 57, 100, 13)];
        _typeLabel.font = [UIFont systemFontOfSize:13];
        _typeLabel.textAlignment = NSTextAlignmentRight;
        _typeLabel.textColor = RGBACOLOR(90, 90, 90, 1);
    }
    return _typeLabel;
}

- (UIImageView *)lineImgView
{
    if (_lineImgView == nil) {
        _lineImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 78, SCREEN_WIDTH-20, 2)];
        _lineImgView.backgroundColor = RGBACOLOR(192, 192, 192, 1);
    }
    return _lineImgView;
}

+ (CGFloat)cellHeight
{
    return 80;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  SearchUserTableViewCell.m
//  iGig
//
//  Created by mac on 15/10/26.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "SearchUserTableViewCell.h"
#import "GHStringManger.h"

@implementation SearchUserTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGBACOLOR(138, 138, 138, 1);
        [self.contentView addSubview:self.iconBackView];
        [self.contentView addSubview:self.iconImgView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.lvLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.lineImgView];
    }
    return self;
}

- (void)cellFillWithModel:(UserShowModel *)model
{
    [self.iconImgView setImageWithURL:[NSURL URLWithString:model.headPic] placeholderImage:nil ];
   CGFloat width = [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH -150, 22) font: [UIFont boldChineseFontWithSize:15] text:model.userName].width;
    self.nameLabel.frame = CGRectMake(90, 20, width, 22);
    self.nameLabel.text = model.userName;
    self.lvLabel.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame) +5, 26, 50, 13);
    self.lvLabel.text = model.level;
    self.descLabel.text = model.sign;
    self.typeLabel.text = model.typeName;
}

+ (CGFloat)cellHeight
{
    return 80;
}

- (UIView *)iconBackView
{
    if (_iconBackView == nil) {
        
        _iconBackView = [[UIView alloc] initWithFrame:CGRectMake(2, 2, 76, 76)];
        _iconBackView.backgroundColor = RGBACOLOR(45, 45, 45, 1);
    }
    return _iconBackView;
}

- (UIImageView *)iconImgView
{
    if (_iconImgView == nil) {
        _iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 56, 56)];
        _iconImgView.layer.cornerRadius = 28;
        _iconImgView.layer.masksToBounds = YES;
    }
    return _iconImgView;
}
- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 100, 22)];
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
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 45, SCREEN_WIDTH-180, 13)];
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
        _lineImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 79, SCREEN_WIDTH-20, 1)];
        _lineImgView.backgroundColor = RGBACOLOR(45, 45, 45, 1);
    }
    return _lineImgView;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

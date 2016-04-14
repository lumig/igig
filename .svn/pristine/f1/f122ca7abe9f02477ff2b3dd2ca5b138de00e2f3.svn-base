//
//  NoticeTableViewCell.m
//  iGig
//
//  Created by mac on 15/11/4.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "NoticeTableViewCell.h"
#import "GHStringManger.h"
@implementation NoticeTableViewCell

- (void)awakeFromNib {
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGBACOLOR(191, 192, 191, 1);
        [self.contentView addSubview:self.iconImgView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.lineView];
        
    }
    
    return self;
}

- (void)cellFillWithModel:(NoticeModel *)model
{
    [self.iconImgView setImageWithURL:[NSURL URLWithString:model.headPic] placeholderImage:[UIImage imageNamed:@"headpic"]];
    self.nameLabel.frame = CGRectMake(70, 15, [GHStringManger stringBoundingRectWithSize:CGSizeMake(200, 21) font:[UIFont boldChineseFontWithSize:15] text:model.userName].width, 21);
    self.nameLabel.text = model.userName;
    self.typeLabel.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + 5, 15, 100, 21);
    self.typeLabel.text = model.typeName;
    self.descLabel.text = model.message;
    self.timeLabel.text = model.sendTime;
}

- (UIImageView *)iconImgView
{
    if (_iconImgView ==nil) {
        _iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _iconImgView.layer.cornerRadius =25;
        _iconImgView.layer.masksToBounds = YES;
        _iconImgView.layer.borderWidth = 1;
        _iconImgView.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
    return _iconImgView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 15, 100, 21)];
        _nameLabel.font = [UIFont boldChineseFontWithSize:15];
    }
    return _nameLabel;
}

- (UILabel *)typeLabel
{
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 15, 100, 21)];
        _typeLabel.font = [UIFont systemFontOfSize:13];
        _typeLabel.textColor = [UIColor grayColor];
    }
    return _typeLabel;
}
- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 35, 200, 22)];
        _descLabel.font = [UIFont systemFontOfSize:13];
        _descLabel.textColor = [UIColor grayColor];
    }
    return _descLabel;
}

- (UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -180, 45, 150, 22)];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

- (UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 68, SCREEN_WIDTH-20, 2)];
        _lineView.backgroundColor = RGBACOLOR(106, 106, 106, 1);
    }
    return _lineView;
}

+ (CGFloat)cellHeight
{
    return 70;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

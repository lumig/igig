//
//  commentTableViewCell.m
//  iGig
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "commentTableViewCell.h"
#import "GHStringManger.h"
@implementation commentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cellFillWithModel:(CommentModel *)model
{
    [_iconImgView setImageWithURL:[NSURL URLWithString:model.headPic] placeholderImage:nil];
    _nameLabel.frame = CGRectMake(80, 10, [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH- 100, 20) font:[UIFont boldSystemFontOfSize:15] text:model.userName].width, 20);
    _nameLabel.text = model.userName;
    if (model.content.length > 0) {
        CGFloat descHeight = [commentTableViewCell getTheDescHeightWithDesc:model];
        self.descLabel.frame = CGRectMake(80, CGRectGetMaxY(self.nameLabel.frame) + 10, SCREEN_WIDTH - 90, descHeight);
        
      _lineImgView.frame = CGRectMake(0, descHeight+69, SCREEN_WIDTH, 1);  
    }
    self.descLabel.text = model.content;
    _showTimeLabel.frame = CGRectMake(80, CGRectGetMaxY(_descLabel.frame)+10, 150, 13);
    self.showTimeLabel.text = model.time;
    
}

+ (CGFloat)getTheDescHeightWithStr:(NSString *)str
{
    return [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 100, 1000) font:    [UIFont systemFontOfSize:13]
                                                 text:str].height;
}


+ (CGFloat)getTheDescHeightWithDesc:(CommentModel *)model
{
    return [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 100, 1000) font:    [UIFont systemFontOfSize:13]
                                                 text:model.content].height;
    
}

+ (CGFloat)cellHeightWithStr:(NSString *)str
{
    return [commentTableViewCell getTheDescHeightWithStr:str] + 70;
}
+ (CGFloat)cellHeightWithModel:(CommentModel *)model
{
    return [commentTableViewCell getTheDescHeightWithDesc:model] + 70;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGBACOLOR(167, 167, 167, 1);
        [self.contentView addSubview:self.iconImgView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.showTimeLabel];
        [self.contentView addSubview:self.lineImgView];
    }
    return self;
}



- (UIImageView *)iconImgView
{
    if (_iconImgView == nil) {
        _iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        _iconImgView.layer.cornerRadius = 30;
        _iconImgView.layer.masksToBounds = YES;
        _iconImgView.layer.borderWidth = 1;
        _iconImgView.layer.borderColor = [[UIColor colorWithRed:192 green:192 blue:192 alpha:1] CGColor];
        
    }
    return _iconImgView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 22)];
        _nameLabel.font = [UIFont boldChineseFontWithSize:15];
    }
    return _nameLabel;
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 35, SCREEN_WIDTH-120, 13)];
        _descLabel.font = [UIFont systemFontOfSize:13];
//        _descLabel.textColor = RGBACOLOR(90, 90, 90, 1);
    }
    return _descLabel;
}

- (UILabel *)showTimeLabel
{
    if (_showTimeLabel == nil) {
        _showTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, CGRectGetMaxY(_descLabel.frame)+15, 150, 13)];
        _showTimeLabel.font = [UIFont systemFontOfSize:12];
        _showTimeLabel.textColor = RGBACOLOR(90, 90, 90, 1);
        
    }
    return _showTimeLabel;
}

- (UIImageView *)lineImgView
{
    if (_lineImgView == nil) {
        _lineImgView = [[UIImageView alloc] init];
        _lineImgView.backgroundColor = RGBACOLOR(183, 183, 183, 1);
    }
    return _lineImgView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  CircleTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/10/24.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "CircleTableViewCell.h"

#import <UIImageView+AFNetworking.h>
//#define kImgHeight ([UIScreen mainScreen].bounds.size.width == 320 ? 100 : 120

#define kImgHeight 100
#define kCellGap 10
#define SDPhotoGroupImageMargin 10

#define kHeight   ((SCREEN_WIDTH - 120)/3.0f)


@implementation CircleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.photoGroup];
        [self.contentView addSubview:self.publishTimeLabel];
        [self.contentView addSubview:self.rightBtn];
        [self.contentView addSubview:self.lineImgView];
        
    }
    
    return self;
}


- (void)cellFillWithCircleModel:(CircleModel *)model
{
    
    _model = model;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgViewClick)];
    [self.iconImageView addGestureRecognizer:tap];
    
    [self.iconImageView setImageWithURL:[NSURL URLWithString:model.iconImg] placeholderImage:nil];
    self.nameLabel.text = model.name;
    if (model.desc.length > 0) {
        CGFloat descHeight = [CircleTableViewCell getTheDescHeightWithDescription:model.desc];
        self.descLabel.frame = CGRectMake(80, CGRectGetMaxY(self.nameLabel.frame) + 10, SCREEN_WIDTH - 90, descHeight);
        
        _photoGroupHeight = descHeight + 52;
        
    }
    self.descLabel.text = model.desc;
    
    if (model.picArray.count > 0) {
        NSMutableArray *temp = [NSMutableArray array];
        [model.picArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
            SDPhotoItem *item = [[SDPhotoItem alloc] init];
            item.thumbnail_pic = src;
            [temp addObject:item];
        }];
        
        self.photoGroup.photoItemArray = [temp copy];
    }
    else
    {
        _photoGroupHeight = 0;
    }
    
    self.publishTimeLabel.frame = CGRectMake(80, [CircleTableViewCell getPhotoGroupHeightWithModel:model] + 50+ [CircleTableViewCell getTheDescHeightWithDescription:model.desc], 200, 22);
    self.publishTimeLabel.text = model.publishTime;
    self.rightBtn.frame = CGRectMake(SCREEN_WIDTH- 40, [CircleTableViewCell getPhotoGroupHeightWithModel:model] + 50+ [CircleTableViewCell getTheDescHeightWithDescription:model.desc], 30, 20);

    [_lineImgView setFrame:CGRectMake(0, CGRectGetMaxY(_publishTimeLabel.frame) ,SCREEN_WIDTH, 2)];
    _lineImgView.backgroundColor = RGBACOLOR(208, 208, 208, 1);
}



+ (CGFloat)getTheDescHeightWithDescription:(NSString *)desc
{
    return [GHStringManger stringBoundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 100, 1000) font:    [UIFont systemFontOfSize:14]
 text:desc].height;
    
}

- (CGFloat)getThePhotoGroupHeight
{
    return _photoGroupHeight;
}


+ (CGFloat)getPhotoGroupHeightWithModel:(CircleModel *)model
{
    long imageCount = model.picArray.count;
    int perRowImageCount = ((imageCount == 4) ? 2 : 3);
    CGFloat perRowImageCountF = (CGFloat)perRowImageCount;
    int totalRowCount = ceil(imageCount / perRowImageCountF); // ((imageCount + perRowImageCount - 1) / perRowImageCount)
    
    //图片的宽高
    CGFloat h = kHeight;
    
    CGFloat height = totalRowCount * (SDPhotoGroupImageMargin + h);
    
    
    return height;
}

+ (CGFloat)CellHeightWithModel:(CircleModel *)model
{
    return [CircleTableViewCell getPhotoGroupHeightWithModel:model] + [CircleTableViewCell getTheDescHeightWithDescription:model.desc] + 70;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    
    return YES;
}

- (void)imgViewClick
{
    if ([self.delegate respondsToSelector:@selector(iconImgViewClickWithModel:)]) {
        [self.delegate iconImgViewClickWithModel:_model];
    }
    
//    [super routerEventWithName:kIconImgViewClick userInfo:@{@"model":_model}];
}


- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 60, 60)];
        _iconImageView.layer.cornerRadius = 30;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.userInteractionEnabled = YES;
        _iconImageView.backgroundColor = [UIColor clearColor];
    }
    
    return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 200, 22)];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    
    return _nameLabel;
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = [UIFont systemFontOfSize:14];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}

- (SDPhotoGroup *)photoGroup
{
    if (_photoGroup == nil) {
        _photoGroup = [[SDPhotoGroup alloc] initWithFrame:CGRectMake(90, CGRectGetMaxY(self.descLabel.frame) + 10, SCREEN_WIDTH - 80 , SCREEN_WIDTH - 80)];
    }
    _photoGroup.delegate = self;
    return _photoGroup;
}

- (UILabel *)publishTimeLabel
{
    if (_publishTimeLabel == nil) {
        _publishTimeLabel = [[UILabel alloc] init];
        _publishTimeLabel.font = [UIFont systemFontOfSize:14];
        _publishTimeLabel.textColor = [UIColor grayColor];
    }
    return _publishTimeLabel;
}

- (UIButton *)rightBtn
{
    if (_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_rightBtn setImage:[UIImage imageNamed:@"circle_more"] forState:UIControlStateNormal];
    }
    return _rightBtn;
}

- (UIImageView *)lineImgView
{
    if (_lineImgView == nil) {
        _lineImgView = [[UIImageView alloc] init];
    }
    return _lineImgView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

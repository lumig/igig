//
//  MyCircleTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/10/25.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "MyCircleTableViewCell.h"


#define kImgHeight 100
#define kCellGap 10
#define SDPhotoGroupImageMargin 10

#define kHeight   ((SCREEN_WIDTH - 120)/3.0f)

@implementation MyCircleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.todayLabel];
        [self.contentView addSubview:self.monthLabel];
        [self.contentView addSubview:self.dayLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.dotImgView];
        [self.contentView addSubview:self.lineImgView];
        [self.contentView addSubview:self.photoGroup];
    }
    return self;
}

- (void)cellFillWithCircleModel:(CircleModel *)model
{
    if (![NSNumber numberWithBool:model.type]) {
        self.todayLabel.text = @"今天";
    }
    else
    {
        self.monthLabel.text = model.month;
        self.dayLabel.text = model.day;
    }
    
    if (model.desc.length > 0) {
        CGFloat descHeight = [MyCircleTableViewCell getTheDescHeightWithDescription:model.desc];
        self.descLabel.frame = CGRectMake(80, 0, SCREEN_WIDTH - 120, descHeight);
        
        _photoGroupHeight = descHeight + 10;
        
    }
    else
    {
        _photoGroupHeight = -10;
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

    
    _lineImgView.frame = CGRectMake(67, 16, 2, [MyCircleTableViewCell getPhotoGroupHeightWithModel:model] + [MyCircleTableViewCell getTheDescHeightWithDescription:model.desc] + 34);
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
    return [MyCircleTableViewCell getPhotoGroupHeightWithModel:model] + [MyCircleTableViewCell getTheDescHeightWithDescription:model.desc] + 50;
}

- (UILabel *)todayLabel
{
    if (_todayLabel == nil) {
        _todayLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 70, 20)];
        _todayLabel.font = [UIFont boldSystemFontOfSize:15];
        _todayLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _todayLabel;
}
- (UILabel *)monthLabel
{
    if (_monthLabel == nil) {
        _monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 40, 13)];
        _monthLabel.font = [UIFont boldSystemFontOfSize:13];
        _monthLabel.textAlignment = NSTextAlignmentRight;
    }
    return _monthLabel;
    
}

- (UILabel *)dayLabel
{
    if (_dayLabel == nil) {
        _dayLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 20)];
        _dayLabel.font = [UIFont boldSystemFontOfSize:15];
        _dayLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _dayLabel;
}
- (UIImageView *)dotImgView
{
    if (_dotImgView == nil) {
        _dotImgView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 0, 16, 16)];
        [_dotImgView setImage:[UIImage imageNamed:@"circle"]];
    }
    return _dotImgView;
}

- (UIImageView *)lineImgView
{
    if (_lineImgView == nil) {
        _lineImgView = [[UIImageView alloc] initWithFrame:CGRectMake(67, 16, 2, 100)];
        _lineImgView.backgroundColor = RGBACOLOR(163, 163, 163, 1);
    }
    return _lineImgView;
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, SCREEN_WIDTH-120, 0)];
        _descLabel.numberOfLines = 0;
        _descLabel.font = [UIFont systemFontOfSize:14];
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

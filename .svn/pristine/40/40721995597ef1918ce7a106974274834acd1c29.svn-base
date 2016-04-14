//
//  ImgArrayTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/10/25.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "ImgArrayTableViewCell.h"

#define SDPhotoGroupImageMargin 5
@implementation ImgArrayTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGBACOLOR(157, 157, 157, 1);

        [self.contentView addSubview:self.photoGroup];
    }
    return self;
}

- (void)cellFillWithPersonModel:(PersonModel *)model
{
    NSLog(@"-------- %@",model.imgArray);
    if (model.imgArray.count > 0) {
        NSMutableArray *temp = [NSMutableArray array];
        NSArray *array = [NSArray array];
        if (model.imgArray.count > 4) {
            array = [model.imgArray subarrayWithRange:NSMakeRange(0, 4)];
        }
        [array enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
            SDPhotoItem *item = [[SDPhotoItem alloc] init];
            item.thumbnail_pic = src;
            [temp addObject:item];
        }];
        
        self.photoGroup.photoItemArray = [temp copy];
    }
}

- (void)cellFillWithArray:(NSArray *)array
{
    if (array.count > 0) {
        NSMutableArray *temp = [NSMutableArray array];
        NSArray *arr = [NSArray array];
        if (array.count > 4) {
            arr = [array subarrayWithRange:NSMakeRange(0, 4)];
        }
        else
        {
            arr = [array mutableCopy];
        }
        [arr enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
            SDPhotoItem *item = [[SDPhotoItem alloc] init];
            item.thumbnail_pic = src;
            [temp addObject:item];
        }];
        
        self.photoGroup.photoItemArray = [temp copy];
    }
}

- (BOOL)isChange
{
    return YES;
}

+ (CGFloat)getPhotoGroupHeightWithArray:(NSArray *)array
{
    long imageCount = array.count;
    int perRowImageCount = 4;
    CGFloat perRowImageCountF = (CGFloat)perRowImageCount;
    int totalRowCount = ceil(imageCount / perRowImageCountF); // ((imageCount + perRowImageCount - 1) / perRowImageCount)
    
    //图片的宽高
    CGFloat h = (SCREEN_WIDTH- 55)/4.0f;
    
    CGFloat height = totalRowCount * (SDPhotoGroupImageMargin + h);
    
    
    return height;
}

+ (CGFloat)getPhotoGroupHeightWithModel:(PersonModel *)model
{
    long imageCount = model.imgArray.count;
    int perRowImageCount = 4;
    CGFloat perRowImageCountF = (CGFloat)perRowImageCount;
    int totalRowCount = ceil(imageCount / perRowImageCountF); // ((imageCount + perRowImageCount - 1) / perRowImageCount)
    
    //图片的宽高
    CGFloat h = (SCREEN_WIDTH- 55)/4.0f;
    
    CGFloat height = totalRowCount * (SDPhotoGroupImageMargin + h);
    
    
    return height;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    
    return YES;
}

- (SDPhotoGroup *)photoGroup
{
    if (_photoGroup == nil) {
        _photoGroup = [[SDPhotoGroup alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20 , (SCREEN_WIDTH- 55)/4.0f)];
    }
    _photoGroup.delegate = self;
    return _photoGroup;
}

+ (CGFloat)cellHeight
{
    return (SCREEN_WIDTH- 55)/4.0f+ 20;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

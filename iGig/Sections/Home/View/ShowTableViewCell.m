//
//  ShowTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "ShowTableViewCell.h"
#import "SDPhotoItem.h"

@implementation ShowTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cellFillWithModel:(IGHomeModel *)model
{
    [self.postersImgView setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:nil];
    self.postersImgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick)];
    _imgStr = model.picUrl;
    [_postersImgView addGestureRecognizer:tap];
    
//    if (model.picArray.count > 0) {
//        NSMutableArray *temp = [NSMutableArray array];
//        [model.picArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
//            SDPhotoItem *item = [[SDPhotoItem alloc] init];
//            item.thumbnail_pic = src;
//            [temp addObject:item];
//        }];
//        
//        self.photoGroup.photoItemArray = [temp copy];
//    }
//    NSArray *array = [NSArray arrayWithObjects:model.picUrl, nil]
//    SDPhotoItem *item = [[SDPhotoItem alloc] init];
//    item.thumbnail_pic = src;
//    [temp addObject:item];
//    self.photoGroup.photoItemArray = [temp copy];
    self.tilteLabel.text = [model.title stringByAppendingString:model.mId];//测试
    self.styleLabel.text = model.style;
    self.showTimeLabel.text = model.showTime;
    self.fieldLabel.text =model.dirt;
    self.priceLabel.text =model.price;
    int index = [model.showStatus intValue];
    //1对应选择中发布演出
    //0 演出机会（等待演出）  1演出  2有预约  3 申请后（等待同意和拒绝）  4已同意  5已拒绝   7已确定  8.已发布  9已关闭  10已过期  11虚位以待
    switch (index) {
        case 1:
        {
            [self.tagImgView setImage:[UIImage imageNamed:@""]];
            
        }
            break;
        case 3:
        {
             [self.tagImgView setImage:[UIImage imageNamed:@"蓝-已申请"]];

        }
            break;
        case 4:
        {
            [self.tagImgView setImage:[UIImage imageNamed:@"蓝-已同意"]];

        }
            break;
        case 5:
        {
            [self.tagImgView setImage:[UIImage imageNamed:@"灰-已拒绝"]];

        }
            break;
        case 6:
        {
            [self.tagImgView setImage:[UIImage imageNamed:@""]];

        }
            break;
        case 8:
        {
            [self.tagImgView setImage:[UIImage imageNamed:@"灰-已发布"]];

        }
            break; 
        case 9:
        {
            [self.tagImgView setImage:[UIImage imageNamed:@"灰-已关闭"]];

        }
            break;   
        default:
            break;
    }
}

- (void)imgClick
{
    if ([self.delegate respondsToSelector:@selector(postersImgViewClickWithImageName:)]) {
        [_delegate postersImgViewClickWithImageName:_imgStr];
    }
}


+ (CGFloat)cellHeight
{
    return 182;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

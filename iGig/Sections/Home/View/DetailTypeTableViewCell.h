//
//  DetailTypeTableViewCell.h
//  iGig
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bandModel.h"
@class fieldModel;
@class SponsorModel;
@interface DetailTypeTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *iconImgView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *lvLabel;
@property(nonatomic,strong)UILabel *typeLabel;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)UIImageView *lineImgView;
@property(nonatomic,strong)UILabel *notLabel;

- (void)cellFillWithBandModel:(bandModel *)model;

- (void)cellFillWithFieldModel:(fieldModel *)model;

- (void)cellFillWithSponsorModel:(SponsorModel *)model;

- (void)notHaveBand;

+ (CGFloat)cellHeight;

@end

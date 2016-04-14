//
//  MyCircleTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/10/25.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleModel.h"
#import "SDPhotoGroup.h"
#import "SDPhotoItem.h"
#import "GHStringManger.h"


@interface MyCircleTableViewCell : UITableViewCell<SDPhotoGroupDelegate>
@property(nonatomic,strong)UILabel *todayLabel;
@property(nonatomic,strong)UILabel *monthLabel;
@property(nonatomic,strong)UILabel *dayLabel;
@property(nonatomic,strong)UIImageView *dotImgView;
@property(nonatomic,strong)UIImageView *lineImgView;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)SDPhotoGroup *photoGroup;
@property(nonatomic,assign)CGFloat photoGroupHeight;



- (void)cellFillWithCircleModel:(CircleModel *)model;

+ (CGFloat)CellHeightWithModel:(CircleModel *)model;

+ (CGFloat)getPhotoGroupHeightWithModel:(CircleModel *)model;

+ (CGFloat)getTheDescHeightWithDescription:(NSString *)desc;

@end

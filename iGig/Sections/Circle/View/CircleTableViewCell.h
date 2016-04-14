//
//  CircleTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/10/24.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleModel.h"
#import "SDPhotoGroup.h"
#import "SDPhotoItem.h"
#import "GHStringManger.h"

#define kIconImgViewClick @"kIconImgViewClick"

@protocol CircleTableViewCellDelegate <NSObject>

- (void)iconImgViewClickWithModel:(CircleModel *)model;

@end

@interface CircleTableViewCell : UITableViewCell<SDPhotoGroupDelegate>

@property(nonatomic,assign) id<CircleTableViewCellDelegate> delegate;
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)SDPhotoGroup *photoGroup;
@property(nonatomic,strong)UILabel *publishTimeLabel;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIImageView *lineImgView;
//photo距离cell顶端的高度
@property(nonatomic,assign)CGFloat photoGroupHeight;
@property(strong,nonatomic)CircleModel *model;


- (void)cellFillWithCircleModel:(CircleModel *)model;

+ (CGFloat)CellHeightWithModel:(CircleModel *)model;

+ (CGFloat)getPhotoGroupHeightWithModel:(CircleModel *)model;

+ (CGFloat)getTheDescHeightWithDescription:(NSString *)desc;


@end

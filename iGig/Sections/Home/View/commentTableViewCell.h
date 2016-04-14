//
//  commentTableViewCell.h
//  iGig
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface commentTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *iconImgView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)UILabel *showTimeLabel;
@property(nonatomic,strong)UIImageView *lineImgView;

@property(nonatomic,assign)CGFloat photoGroupHeight;
- (void)cellFillWithModel:(CommentModel *)model;
+ (CGFloat)getTheDescHeightWithDesc:(CommentModel *)model;
+(CGFloat)cellHeightWithModel:(CommentModel *)model;
- (void)cellFillWithStr:(NSString *)str;
+ (CGFloat)getTheDescHeightWithStr:(NSString *)str;
+(CGFloat)cellHeightWithStr:(NSString *)str;

@end

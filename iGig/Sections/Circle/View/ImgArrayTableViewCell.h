//
//  ImgArrayTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/10/25.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDPhotoGroup.h"
#import "SDPhotoItem.h"
#import "PersonModel.h"
@interface ImgArrayTableViewCell : UITableViewCell<SDPhotoGroupDelegate>

@property(nonatomic,strong)SDPhotoGroup *photoGroup;
//photo距离cell顶端的高度
@property(nonatomic,assign)CGFloat photoGroupHeight;

- (void)cellFillWithPersonModel:(PersonModel *)model;
- (void)cellFillWithArray:(NSArray *)array;
+ (CGFloat)getPhotoGroupHeightWithArray:(NSArray *)array;

+ (CGFloat)getPhotoGroupHeightWithModel:(PersonModel *)model;

+ (CGFloat)cellHeight;
@end

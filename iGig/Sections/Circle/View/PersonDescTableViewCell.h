//
//  PersonDescTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/10/25.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"
#import "GHStringManger.h"

@protocol PersonDescTableViewCellDelegate <NSObject>

- (void)openButtonClick;
- (void)openButtonClickWithBtn:(UIButton *)btn isOpen:(BOOL) isOpen;


@end

@interface PersonDescTableViewCell : UITableViewCell

@property(nonatomic,assign)id<PersonDescTableViewCellDelegate>delegate;
@property(nonatomic,strong)UILabel *descLabel;
@property(nonatomic,strong)UIImageView *lineView;
@property(nonatomic,strong)UIButton *openBtn;

@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,assign)CGFloat height;

- (void)cellFillWithModel:(PersonModel *)model;

- (void)cellFillWithStr:(NSString *) str;
- (void)cellFillwithString:(NSString *)str isOpen:(BOOL)isOpen;

- (CGFloat)cellHeightWithModel:(PersonModel *)model;

+ (CGFloat)cellHeightWithModel:(PersonModel *)model;

- (CGFloat)cellHeightWithStr:(NSString *)str isOpen:(BOOL)isOpen;
+ (CGFloat)cellHeightWithStr:(NSString *)str isOpen:(BOOL)isOpen;

@end
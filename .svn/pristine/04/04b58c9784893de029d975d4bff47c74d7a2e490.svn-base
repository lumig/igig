//
//  AcceptApplicationTableViewCell.h
//  iGig
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGHomeModel.h"

@protocol AcceptApplicationTableViewCellDelegate <NSObject>
- (void)btnClickWithIndex:(NSInteger)index;
- (void)btnClickWithIndex:(NSInteger)index model:(IGHomeModel *)model;

@end

@interface AcceptApplicationTableViewCell : UITableViewCell

@property(nonatomic,assign)id<AcceptApplicationTableViewCellDelegate> delegate;

@property(nonatomic,strong)IGHomeModel *model;

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *postersImgView;

@property (weak, nonatomic) IBOutlet UILabel *tilteLabel;

@property (weak, nonatomic) IBOutlet UILabel *styleLabel;
@property (weak, nonatomic) IBOutlet UILabel *showTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fieldLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tagImgView;

@property (weak, nonatomic) IBOutlet UIButton *agressBtn;
@property (weak, nonatomic) IBOutlet UIButton *disAgressBtn;
@property (nonatomic,assign)BOOL enable;
- (IBAction)agreeBtnClick:(id)sender;

- (IBAction)disAgreeBtnClick:(id)sender;

- (void)cellFillWithModel:(IGHomeModel *)model;
+ (CGFloat)cellHeight;

@end

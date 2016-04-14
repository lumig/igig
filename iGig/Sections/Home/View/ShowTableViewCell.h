//
//  ShowTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGHomeModel.h"

@protocol ShowTableViewCellDelegate <NSObject>

- (void)postersImgViewClickWithImageName:(NSString *)imgName;

@end
@interface ShowTableViewCell : UITableViewCell
@property(nonatomic,assign)id<ShowTableViewCellDelegate> delegate;

@property(nonatomic,strong)NSString *imgStr;

@property (weak, nonatomic) IBOutlet UIImageView *postersImgView;

@property (weak, nonatomic) IBOutlet UILabel *tilteLabel;

@property (weak, nonatomic) IBOutlet UILabel *styleLabel;

@property (weak, nonatomic) IBOutlet UILabel *showTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *fieldLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


@property (weak, nonatomic) IBOutlet UIImageView *tagImgView;


- (void)cellFillWithModel:(IGHomeModel *)model;
+ (CGFloat)cellHeight;
@end

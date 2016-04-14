//
//  ShowWaitingTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGHomeModel.h"
@interface ShowWaitingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postersImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *showTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *fieldLabel;

@property (weak, nonatomic) IBOutlet UIImageView *tagImgVIew;


- (void)cellFillWithModel:(IGHomeModel *)model;

+ (CGFloat)cellHeight;

@end

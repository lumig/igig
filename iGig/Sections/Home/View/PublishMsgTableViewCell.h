//
//  PublishMsgTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/10/22.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IGHomeModel;

@interface PublishMsgTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *placeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *showFieldLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleLabel;

- (void)setInfoWithModel:(IGHomeModel *)model;

+ (CGFloat)cellHeight;
@end

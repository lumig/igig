//
//  PublishMsgTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/10/22.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "PublishMsgTableViewCell.h"

@implementation PublishMsgTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (CGFloat)cellHeight
{
    return 180;
}

- (void)setInfoWithModel:(IGHomeModel *)model{
    self.placeNameLabel.text = model.title;
    self.publishTimeLabel.text = model.showTime;
    self.showFieldLabel.text = model.dirt;
    self.styleLabel.text = model.style;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

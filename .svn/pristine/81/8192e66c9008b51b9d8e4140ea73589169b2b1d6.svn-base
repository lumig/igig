//
//  ShowWaitingTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "ShowWaitingTableViewCell.h"

@implementation ShowWaitingTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)cellFillWithModel:(IGHomeModel *)model
{
    self.showTimeLabel.text = model.showTime;
    self.fieldLabel.text = model.dirt;
    int index = [model.showStatus intValue];

    switch (index) {
        case 0:
        {
            [self.tagImgVIew setImage:[UIImage imageNamed:@""]];

        }
            break;
      //本应该为2为友预约，现在为了配合后端逻辑，改为3    
        case 2:
        {
            [self.tagImgVIew setImage:[UIImage imageNamed:@"蓝-有预约"]];

        }
            break;
            
        case 7:
        {
            [self.tagImgVIew setImage:[UIImage imageNamed:@"灰-已关闭"]];

        }
            break;
            
        case 10:
        {
            [self.tagImgVIew setImage:[UIImage imageNamed:@"灰-已过期"]];
        }
            break;
            
            
        default:
            break;
    }
}

+ (CGFloat)cellHeight
{
    return 182;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

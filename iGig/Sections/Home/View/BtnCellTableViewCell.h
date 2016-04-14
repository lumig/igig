//
//  BtnCellTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/10/22.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BtnCellTableViewCell : UITableViewCell

@property(nonatomic,strong)UIButton *leftShowBtn;
@property(nonatomic,strong)UIButton *rightShowBtn;

@property(nonatomic,assign)NSUInteger leftRow;
@property(nonatomic,assign)NSUInteger rightRow;

+ (CGFloat)cellHeight;

@end

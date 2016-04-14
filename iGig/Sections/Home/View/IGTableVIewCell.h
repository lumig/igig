//
//  IGTableVIewCell.h
//  iGig
//
//  Created by liuzhanying on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IGHomeModel;

@interface IGTableVIewCell : UITableViewCell

@property (nonatomic, strong) IGHomeModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

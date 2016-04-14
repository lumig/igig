//
//  BandCell.h
//  iGig
//
//  Created by duanzd on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddBandModel;
//void (^) (bool isSelected);
typedef void(^Block)(BOOL isSelected);

@interface BandCell : UITableViewCell
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) NSString *bandId;
@property (nonatomic, strong) AddBandModel *model;
@property (nonatomic, copy) Block imgChanged;

@end

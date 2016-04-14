//
//  ApplicationShowViewController.h
//  iGig
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGBaseViewController.h"
#import "IGHomeModel.h"

@interface ApplicationShowViewController : IGBaseViewController


@property(nonatomic,strong)IGHomeModel *model;
@property(nonatomic,assign)BOOL enable;
@end

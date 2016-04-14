//
//  EditViewController.h
//  iGig
//
//  Created by mac on 15/11/3.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "IGBaseViewController.h"

typedef void(^EditBlock)(NSString *editStr);


@interface EditViewController : IGBaseViewController

@property(nonatomic,strong)NSString *titleStr;

@property (copy,nonatomic)EditBlock editBlock;

@property (copy, nonatomic)NSString *text;

@end

//
//  AddBandViewController.h
//  iGig
//
//  Created by duanzd on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGBaseViewController.h"
//增加乐队列表
typedef void(^EditBlock)(NSString *editStr);
typedef void(^bankBlock)(NSMutableArray *bankArray) ;

@interface AddBandViewController : IGBaseViewController
@property (copy,nonatomic)EditBlock editBlock;
@property(nonatomic,copy)bankBlock bankBlock;
@property(nonatomic,strong)NSMutableArray *addArray;
@end

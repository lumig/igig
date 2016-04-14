//
//  IntroduceViewController.h
//  iGig
//
//  Created by 倪莹蕾 on 15/11/22.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGBaseViewController.h"

typedef void(^EditBlock)(NSString *editStr);

@interface IntroduceViewController : IGBaseViewController


@property(nonatomic,strong)NSString *titleStr;

@property (copy,nonatomic)EditBlock editBlock;

@property(copy, nonatomic) NSString *text;
@end

//
//  ShowStateView.m
//  iGig
//
//  Created by mac on 15/10/22.
//  Copyright (c) 2015年 longlz. All rights reserved.
//

#import "ShowStateView.h"

@implementation ShowStateView


- (instancetype)init
{
    self = [super init];
    if ( self) {
        self.backgroundColor = RGBACOLOR(39, 39, 39, 1);
        self.backView.backgroundColor = RGBACOLOR(39, 39, 39, 1);
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

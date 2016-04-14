//
//  EmptyView.m
//  iGig
//
//  Created by LuMig on 15/11/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "EmptyView.h"

@implementation EmptyView


 -(instancetype)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(58, 58, 58, 1);
        self.titleLabel.frame = CGRectMake((self.frame.size.width - 100)/2.0f,(self.frame.size.height - 20)/2.0f, 100, 20);
        
        self.titleLabel.text = @"没有更多内容";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.tintColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        
    }
    
    return self;
}


@end

//
//  ShowModelManager.m
//  iGig
//
//  Created by LuMig on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "ShowModelManager.h"

@implementation ShowModelManager
static ShowModelManager *g_ModelManager;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataArray = [NSMutableArray array];
    }
    return self;
}

+ (ShowModelManager *)shareModelManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_ModelManager = [[self alloc] init];
    });
    return g_ModelManager;
}




@end

//
//  DataMode.m
//  Example
//
//  Created by dwt on 15/11/1.
//  Copyright © 2015年 Jonathan Tribouharet. All rights reserved.
//

#import "DataMode.h"

@implementation DataMode

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
//        property(nonatomic,strong)NSString *currentDateStr;
//        @property(nonatomic,strong)NSString *showchargeNum;
//        @property(nonatomic,strong)NSString *showNum;
        self.currentDateStr = dict[@"date"];
        self.showchargeNum = dict[@"showchargeNum"];
        self.showNum = dict[@"showNum"];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end

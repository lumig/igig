//
//  DatelistTool.m
//  Example
//
//  Created by dwt on 15/11/1.
//  Copyright © 2015年 Jonathan Tribouharet. All rights reserved.
//

#import "DatelistTool.h"
#import "DataMode.h"

@implementation DatelistTool
static DatelistTool *_instance;
+ (instancetype)shardInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DatelistTool alloc]init];
    });
    return _instance;
}

- (NSString *)showNumWithData:(NSDate *)currenData{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dataStr = [formatter stringFromDate:currenData];

    DataMode *dataMode = self.dataDic[dataStr];
    return dataMode.showNum;
}
- (NSString *)showchargeNumWithData:(NSDate *)currenData{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dataStr = [formatter stringFromDate:currenData];
    
    DataMode *dataMode = self.dataDic[dataStr];
    return dataMode.showchargeNum;
}
@end

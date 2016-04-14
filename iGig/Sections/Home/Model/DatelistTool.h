//
//  DatelistTool.h
//  Example
//
//  Created by dwt on 15/11/1.
//  Copyright © 2015年 Jonathan Tribouharet. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DataMode;
@interface DatelistTool : NSObject

@property(nonatomic,strong)NSDictionary *dataDic;



+(instancetype)shardInstance;

- (NSString *)showNumWithData:(NSDate *)currenData;
- (NSString *)showchargeNumWithData:(NSDate *)currenData;

@end

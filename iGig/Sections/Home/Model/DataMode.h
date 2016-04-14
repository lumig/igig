//
//  DataMode.h
//  Example
//
//  Created by dwt on 15/11/1.
//  Copyright © 2015年 Jonathan Tribouharet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataMode : NSObject
@property(nonatomic,strong)NSString *currentDateStr;
@property(nonatomic,strong)NSString *showchargeNum;
@property(nonatomic,strong)NSString *showNum;

+ (instancetype)modelWithDict:(NSDictionary *)dict; 

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

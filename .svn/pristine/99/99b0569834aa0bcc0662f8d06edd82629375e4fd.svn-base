//
//  AddBandModel.m
//  iGig
//
//  Created by duanzd on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "AddBandModel.h"

@implementation AddBandModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        self.headpic = KConvertAllObjectToStrOrNil(dict[@"headpic"]);
        self.username = KConvertAllObjectToStrOrNil(dict[@"username"]);
        self.sign = KConvertAllObjectToStrOrNil(dict[@"sign"]);

        self.bandId = KConvertAllObjectToStrOrNil(dict[@"id"]);

        
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end

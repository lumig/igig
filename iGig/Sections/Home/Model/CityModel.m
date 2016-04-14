//
//  CityModel.m
//  iGig
//
//  Created by duanzd on 15/11/15.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    CityModel *model = [[CityModel alloc] init];
    model.name = KConvertAllObjectToStrOrNil(dict[@"name"]);
    model.letter = KConvertAllObjectToStrOrNil(dict[@"letter"]);
    model.cityId = KConvertAllObjectToStrOrNil(dict[@"id"]);
    return model;
}

@end

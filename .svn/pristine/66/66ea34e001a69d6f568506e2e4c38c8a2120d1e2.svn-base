//
//  MyHomeModel.m
//  iGig
//
//  Created by LuMig on 15/11/14.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "MyHomeModel.h"

@implementation MyHomeModel

+ (MyHomeModel *)fetchModelWithDict:(NSDictionary *)dict
{
    MyHomeModel *model = [[MyHomeModel alloc] init];
    model.content = KConvertAllObjectToStrOrNil(dict[@"content"]);
    model.dirt = KConvertAllObjectToStrOrNil(dict[@"dirt"]); 
    model.mId = KConvertAllObjectToStrOrNil(dict[@"id"]);
    model.headPic = KConvertAllObjectToStrOrNil(dict[@"headpic"]);
    model.commentNum = KConvertAllObjectToStrOrNil(dict[@"commentNum"]);
    model.followNum = KConvertAllObjectToStrOrNil(dict[@"followNum"]);
    model.followedNum = KConvertAllObjectToStrOrNil(dict[@"followedNum"]);
    model.level = KConvertAllObjectToStrOrNil(dict[@"level"]);
    model.phone = KConvertAllObjectToStrOrNil(dict[@"phone"]);
    model.picArray = [dict[@"pic"] mutableCopy];
    model.sign = KConvertAllObjectToStrOrNil(dict[@"sign"]);
    model.type = KConvertAllObjectToStrOrNil(dict[@"type"]);
    model.typeName = KConvertAllObjectToStrOrNil(dict[@"typename"]);
    model.userName = KConvertAllObjectToStrOrNil(dict[@"username"]);
    
    NSArray *array = dict[@"collect_show_lists"];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [dataArray addObject:[IGHomeModel HomeModelWithDict:dict]];
    }
    
    model.showArray = dataArray;
    return model;
}

@end

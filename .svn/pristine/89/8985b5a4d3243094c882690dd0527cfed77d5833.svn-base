//
//  fieldModel.m
//  iGig
//
//  Created by LuMig on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "fieldModel.h"

@implementation fieldModel

+ (fieldModel *)fetchWithDict:(NSDictionary *)dict
{
    fieldModel *model = [[fieldModel alloc] init];
    model.dirt = KConvertAllObjectToStrOrNil(dict[@"dirt"]);
    model.headPic = dict[@"headpic"];
    model.level = dict[@"level"];
    model.name = dict[@"name"];
    model.typeName = dict[@"typename"];
    model.userId = dict[@"userid"];
    return model;
}

@end

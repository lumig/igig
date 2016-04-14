//
//  bandModel.m
//  iGig
//
//  Created by LuMig on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "bandModel.h"

@implementation bandModel

+ (bandModel *)fetchWithDict:(NSDictionary *)dict
{
    bandModel *model = [[bandModel alloc] init];
    NSLog(@"%@", dict);
    model.headpic = dict[@"headpic"];
    model.level = dict[@"level"];
    model.name = dict[@"name"];
    model.sign = dict[@"sign"];
    model.typeName = dict[@"typename"];
    model.userId = dict[@"userid"];
    return model;
}

@end

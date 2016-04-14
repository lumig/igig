//
//  CircleModel.m
//  iGig
//
//  Created by LuMig on 15/10/24.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "CircleModel.h"

@implementation CircleModel

+ (CircleModel *)fetchWithDesc:(NSDictionary *)dict
{
    CircleModel *model = [[CircleModel alloc] init];
    model.cTime = dict[@"cTime"];
    model.name = dict[@"userName"];
    model.iconImg = dict[@"headpic"];
    model.publishTime = dict[@"contentTime"];
    model.desc = dict[@"content"];
    model.mId = dict[@"id"];
    model.userid = dict[@"userid"];
    model.picArray = dict[@"pic"];
    model.user_id = dict[@"user_id"];
    model.day = dict[@"vday"];
    model.month = dict[@"vmonth"];
    
    return model;
}

@end

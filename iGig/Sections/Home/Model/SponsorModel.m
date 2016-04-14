//
//  SponsorModel.m
//  iGig
//
//  Created by LuMig on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "SponsorModel.h"

@implementation SponsorModel

+ (SponsorModel *)fetchWithDict:(NSDictionary *)dict
{
    SponsorModel *model = [[SponsorModel alloc] init];
    model.headPic = dict[@"headpic"];
    model.level = dict[@"level"];
    model.name = dict[@"name"];
    model.typeName = dict[@"typename"];
    model.userId = dict[@"userid"];
    return model;
}

@end

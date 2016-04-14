//
//  UserShowModel.m
//  iGig
//
//  Created by LuMig on 15/11/14.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "UserShowModel.h"

@implementation UserShowModel

/*  "id": "171",
 "username": "乐队171",
 "sign": "sign签名171",
 "type": "3",
 "typename": "乐队",
 "headpic": "http://123.57.215.235/data/headpic.jpg"
 */

+ (UserShowModel *)fetchModelWithDict:(NSDictionary *)dict
{
    UserShowModel *model = [[UserShowModel alloc] init];
    
    model.mId = KConvertAllObjectToStrOrNil(dict[@"id"]);
    model.userName = KConvertAllObjectToStrOrNil(dict[@"username"]);
    model.level = KConvertAllObjectToStrOrNil(dict[@"level"]);
    model.typeName = KConvertAllObjectToStrOrNil(dict[@"typename"]);
    model.sign = KConvertAllObjectToStrOrNil(dict[@"sign"]);
    model.headPic = KConvertAllObjectToStrOrNil(dict[@"headpic"]);
    
    
    return model;
}

@end

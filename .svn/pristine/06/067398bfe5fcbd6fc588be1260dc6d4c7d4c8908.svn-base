//
//  NoticeModel.m
//  iGig
//
//  Created by LuMig on 15/11/15.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "NoticeModel.h"

@implementation NoticeModel

+ (NoticeModel *)fetchWithDict:(NSDictionary *)dict
{
    NoticeModel *model = [[NoticeModel alloc] init];
    model.headPic = KConvertAllObjectToStrOrNil(dict[@"headpic"]);
    model.mId = KConvertAllObjectToStrOrNil(dict[@"id"]);
    model.sendTime = KConvertAllObjectToStrOrNil(dict[@"sendTime"]);
    model.message = KConvertAllObjectToStrOrNil(dict[@"message"]);
    model.typeName = KConvertAllObjectToStrOrNil(dict[@"typename"]);
    model.userName = KConvertAllObjectToStrOrNil(dict[@"username"]);
    return model;
}


@end

//
//  CommentModel.m
//  iGig
//
//  Created by LuMig on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

+ (CommentModel *)fetchWithDict:(NSDictionary *)dict
{
    CommentModel *model = [[CommentModel alloc] init];
    model.mId = dict[@"userid"];
    model.content = dict[@"content"];
    model.headPic = dict[@"headpic"];
    model.time = dict[@"time"];
    model.userName =dict[@"username"];
    return model;

}

@end

//
//  IGHomeModel.m
//  iGig
//
//  Created by liuzhanying on 15/10/24.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGHomeModel.h"

@implementation IGHomeModel

+ (IGHomeModel *) sharedInstance
{
    static IGHomeModel *__sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[IGHomeModel alloc] init];
        
    });
    
    return __sharedInstance;
}

//+ (void)modifyShowDetailWithMsgBlock:(void (^)(IGHomeModel *))model
//{
//    if (model) {
//        model(model);
//    }
//}



//  id		int	演出id
//title		string	演出名称
//showTime	string	演出时间
//dirt		string	演出地点
//style		string	演出风格
//price		string	演出票价
//showStatus	string	演出状态
//picUrl	string	图片（海报）
- (instancetype)initHomeModelWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        self.mId = KConvertAllObjectToStrOrNil(dict[@"id"]);
        self.title = KConvertAllObjectToStrOrNil(dict[@"title"]);
        self.showTime = KConvertAllObjectToStrOrNil(dict[@"showTime"]);
        self.dirt = KConvertAllObjectToStrOrNil(dict[@"dirt"]);
        self.style = KConvertAllObjectToStrOrNil(dict[@"style"]);
        self.applyStatus = KConvertAllObjectToStrOrNil(dict[@"applyStatus"]);
        self.showStatus = KConvertAllObjectToStrOrNil(dict[@"showStatus"]);
        self.isedit = KConvertAllObjectToStrOrNil(dict[@"isedit"]);
        self.picUrl = KConvertAllObjectToStrOrNil(dict[@"picUrl"]);
        self.phone = KConvertAllObjectToStrOrNil(dict[@"fieldphone"]);
        self.fieldid = KConvertAllObjectToStrOrNil(dict[@"fieldid"]);
        self.content_ext = KConvertAllObjectToStrOrNil(dict[@"content_ext"]);
    }
    return self;
}

+ (instancetype)HomeModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initHomeModelWithDict:dict];
}


@end

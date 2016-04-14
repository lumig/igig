//
//  NoticeModel.h
//  iGig
//
//  Created by LuMig on 15/11/15.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoticeModel : NSObject

@property(nonatomic,strong)NSString *headPic;
@property(nonatomic,strong)NSString *mId;
@property(nonatomic,strong)NSString *sendTime;
@property(nonatomic,strong)NSString *typeName;
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *message;
+ (NoticeModel *)fetchWithDict:(NSDictionary *)dict;

@end

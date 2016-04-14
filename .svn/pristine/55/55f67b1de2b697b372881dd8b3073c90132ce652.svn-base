//
//  HttpRequest.h
//  hk_money
//
//  Created by vin on 14-7-21.
//  Copyright (c) 2014年 LianZhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HttpRequest : NSObject
//+(HttpRequest*)shareInstance;

//不需要缓存的接口
+(void)getWebData:(NSDictionary *)params path:(NSString *)path method:(NSString *)method ishowLoading:(BOOL)show success:(void(^)(id object))success fail:(void(^)(NSString* msg))fail;

//需要缓存的接口
+(void)getWebData:(NSDictionary *)params path:(NSString *)path method:(NSString *)method ishowLoading:(BOOL)show success:(void(^)(id object))success fail:(void(^)(NSString* msg))fail isNeedCache:(BOOL)isNeedCache
  cacheExpireTime:(int)cacheExpireTime;

//上传图片
+(void)uploadImage:(NSDictionary *)params path:(NSString *)path andImageArr:(UIImage*)image  withView:(UIView*)view withIntIndex:(int)index   success:(void(^)(id object))success fail:(void(^)(NSString* msg))fail;

//上传多张图片
+(void)uploadImages:(NSDictionary *)params path:(NSString *)path andImageArr:( NSArray*)images  withView:(UIView*)view withIntIndex:(int)index  success:(void(^)(id object))success fail:(void(^)(NSString* msg))fail;

@end

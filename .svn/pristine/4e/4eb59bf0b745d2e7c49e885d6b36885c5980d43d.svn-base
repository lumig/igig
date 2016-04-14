//
//  IGShowManager.m
//  IGNetWorking
//
//  Created by admin on 15/10/22.
//  Copyright © 2015年 lifevc_longlz. All rights reserved.
//

#import "IGShowManager.h"


@interface IGShowManager()

@property (strong,nonatomic)NSString  *baseUrl;

@end

@implementation IGShowManager

GTMOBJECT_SINGLETON_BOILERPLATE(IGShowManager,sharedInstance)


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseUrl = [NSString stringWithFormat:@"%@/show/",HOST_DOMAIN];
    }
    return self;
}

- (void)editsWithUserid:(NSNumber *)userid
                headpic:(NSNumber *)headpic
               username:(NSString *)username
              headImage:(NSString *)headImage
               usersign:(NSString *)usersign
                content:(NSString *)content
                  isHub:(BOOL)isHub
                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self postWithPath:[self getUrlWithPath:@"edits"] parameters:@{@"userid":userid,@"headpic":headImage,@"usersign":usersign,@"content":usersign,@"content":usersign} isHub:isHub success:success failure:failure];
}

- (void)editWithUserid:(NSNumber *)userid
              edittype:(NSNumber *)edittype
               content:(NSString *)content
                 isHub:(BOOL)isHub
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self postWithPath:[self getUrlWithPath:@"edit"] parameters:@{@"userid":userid,@"edittype":edittype,@"content":content} isHub:isHub success:success failure:failure];
}


- (void)closeWithShowid:(NSNumber *)showid
                  isHub:(BOOL)isHub
                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self postWithPath:[self getUrlWithPath:@"close"] parameters:@{@"showid":showid} isHub:isHub success:success failure:failure];
}

- (void)addWithTitle:(NSString *)title
            showTime:(NSString *)showTime
                dirt:(NSString *)dirt
               style:(NSString *)style
               price:(NSString *)price
             content:(NSString *)content
              picUrl:(NSString *)picUrl
            field_id:(NSNumber *)field_id
             band_id:(NSNumber *)band_id
               isHub:(BOOL)isHub
             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self postWithPath:[self getUrlWithPath:@"add"] parameters:@{@"title":title,@"showTime":showTime,@"dirt":dirt,@"style":style,@"price":price,@"content":content,@"picUrl":picUrl,@"field_id":field_id,@"band_id":band_id} isHub:isHub success:success failure:failure];
}

- (void)listWithFrom:(NSNumber *)from
               limit:(NSNumber *)limit
               isHub:(BOOL)isHub
             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self getWithPath:[self getUrlWithPath:@"lists"] parameters:@{@"from":from,@"limit":limit} isHub:isHub success:success failure:failure];
}

- (NSString *)getUrlWithPath:(NSString *)path
{
    return [NSString stringWithFormat:@"%@%@",self.baseUrl,path];
}

@end

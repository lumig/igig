//
//  IGUserManager.m
//  IGNetWorking
//
//  Created by admin on 15/10/22.
//  Copyright © 2015年 lifevc_longlz. All rights reserved.
//

#import "IGUserManager.h"

@interface IGUserManager()

@property (strong,nonatomic)NSString  *baseUrl;

@end

@implementation IGUserManager

GTMOBJECT_SINGLETON_BOILERPLATE(IGUserManager,sharedInstance)


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseUrl = [NSString stringWithFormat:@"%@/user/",HOST_DOMAIN];
    }
    return self;
}
#pragma mark - 登录
- (void)loginWithPhone:(NSString *)phone
                  code:(NSString *)code
             device_no:(NSString *)device_no
           device_type:(NSString *)device_type
                 isHub:(BOOL)isHub
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self postWithPath:[self getUrlWithPath:@"login"] parameters:@{@"phone":phone,@"code":code,@"device_no":device_no,@"device_type":device_type} isHub:isHub success:success failure:failure];
}


#pragma mark - 注册
- (void)regverifyWithPhone:(NSString *)phone
                      code:(NSString *)code
                     isHub:(BOOL)isHub
                   success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self postWithPath:[self getUrlWithPath:@"regverify"] parameters:@{@"phone":phone,@"code":code} isHub:isHub success:success failure:failure];
}

#pragma mark -注册验证通过后填写具体信息
- (void)reginfoWithUsername:(NSString *)username
                       type:(NSString *)type
                      style:(NSString *)style
                    address:(NSString *)address
                      isHub:(BOOL)isHub
                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:@{@"type":type}];
    
    if (username) {
        [dic setValue:@"username" forKey:username];
    }
    
    if (style) {
        [dic setValue:@"style" forKey:style];
    }
    
    if (address) {
        [dic setValue:@"address" forKey:address];
    }
    
    [self postWithPath:[self getUrlWithPath:@"reginfo"] parameters:dic isHub:isHub success:success failure:failure];
}

#pragma mark - 用户信息
- (void)detailWithUserid:(NSString *)userid
                   isHub:(BOOL)isHub
                 success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    [self getWithPath:[self getUrlWithPath:@"detail"] parameters:@{@"userid":userid} isHub:isHub success:success failure:failure];
}

#pragma mark - 用户列表
- (void)listsWithType:(NSString *)type
                 from:(NSString *)from
                limit:(NSString *)limit
                isHub:(BOOL)isHub
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    if (type) {
        [dic setValue:@"type" forKey:type];
    }
    
    if (from) {
        [dic setValue:@"from" forKey:from];
    }
    
    if (limit) {
        [dic setValue:@"limit" forKey:limit];
    }
    
    [self getWithPath:[self getUrlWithPath:@"lists"] parameters:dic isHub:isHub success:success failure:failure];
}

#pragma mark - 登录测试
- (void)login_testWithPhone:(NSString *)phone
                       code:(NSString *)code
                  device_no:(NSString *)device_no
                device_type:(NSString *)device_type
                      isHub:(BOOL)isHub
                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self postWithPath:[self getUrlWithPath:@"login_test"] parameters:@{@"phone":phone,@"code":code,@"device_no":device_no,@"device_type":device_type} isHub:isHub success:success failure:failure];
}


#pragma mark - 注册测试
- (void)regverify_testWithPhone:(NSString *)phone
                           code:(NSString *)code
                          isHub:(BOOL)isHub
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self postWithPath:[self getUrlWithPath:@"regverify_test"] parameters:@{@"phone":phone,@"code":code} isHub:isHub success:success failure:failure];
}

- (NSString *)getUrlWithPath:(NSString *)path
{
    return [NSString stringWithFormat:@"%@%@",self.baseUrl,path];
}


@end

//
//  IGUserManager.h
//  IGNetWorking
//
//  Created by admin on 15/10/22.
//  Copyright © 2015年 lifevc_longlz. All rights reserved.
//

#import "IGBaseManager.h"

@interface IGUserManager : IGBaseManager
+ (IGUserManager *)sharedInstance;

//登录
- (void)loginWithPhone:(NSString *)phone
                  code:(NSString *)code
             device_no:(NSString *)device_no
           device_type:(NSString *)device_type
                 isHub:(BOOL)isHub
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


//注册
- (void)regverifyWithPhone:(NSString *)phone
                  code:(NSString *)code
                 isHub:(BOOL)isHub
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

//注册验证通过后填写具体信息  type １场地方，２主办方，３乐队　４．乐迷
- (void)reginfoWithUsername:(NSString *)username
                       type:(NSString *)type
                      style:(NSString *)style
                    address:(NSString *)address
                      isHub:(BOOL)isHub
                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

//获取用户信息
- (void)detailWithUserid:(NSString *)userid
                     isHub:(BOOL)isHub
                   success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/*
 获取用户列表接口
 type		string	否	１场地方，２主办方，３乐队　４．乐迷
 from		string	否	第几条记录开始
 limit		string	否	一共请求多少条记录
 */
- (void)listsWithType:(NSString *)type
                 from:(NSString *)from
                limit:(NSString *)limit
                isHub:(BOOL)isHub
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
//登录测试
- (void)login_testWithPhone:(NSString *)phone
                  code:(NSString *)code
             device_no:(NSString *)device_no
           device_type:(NSString *)device_type
                 isHub:(BOOL)isHub
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


//注册测试
- (void)regverify_testWithPhone:(NSString *)phone
                      code:(NSString *)code
                     isHub:(BOOL)isHub
                   success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


@end

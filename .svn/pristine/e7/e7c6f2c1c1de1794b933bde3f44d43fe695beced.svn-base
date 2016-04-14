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
- (void)reginfoWithphone:(NSString *)phone username:(NSString *)username
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

/*
 十七、	搜索出乐队列表_我的关注的乐队接口GET（user/lists_follow_band）（完）
 功能说明：
 请求url：http://... ~/follow/lists
 请求参数：
 参数名称	类型	是否必须	描述
 from		int	否	第几条记录开始，默认从第1条记录开始
 limit		int	否	请求多少条记录，默认显示5条
 utoken		string	是
 
 返回结果
 参数名称	类型	描述
 error		string	发送成功返回0，如果发送不成功，则返回错误代码
 msg		string	错误信息或提示信息
 data		array
 id		int	乐队的用户id
 headpic	string	头像
 username	string	乐队名称
 sign		string  个性签名
 
 
 */

- (void)searchBandWithFrom:(NSString *)from
                     limit:(NSString *)limit
                    utoken:(NSString *)utoken
                   success:(void (^) (AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^) (AFHTTPRequestOperation *operation, NSError *error))failure;

/*
 我的主页
 
 */
- (void)homePageWithUserId:(NSString *)userid isHub:(BOOL)isHub
                   success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


/*
 关注  用户
 type   0全部 1场地方 2主办方	3乐队	4乐迷
 from
 limit
 utoken 
 */

- (void)attentionUserWithFrom:(NSString *)from limit:(NSString *)limit type:(NSString *)type utoken:(NSString *) utoken isHub:(BOOL)isHub
                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


/*
 找人  热搜
 */

- (void)fDhotWordWithType:(NSNumber *)type isHub:(BOOL)isHub
success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/*
 我的主页
 */

- (void)homeWithUserId:(NSString *)userId utoken:(NSString *)utoken isHub:(BOOL)isHub
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


/*
 找人  search
 */
- (void)userSearchWithUserName:(NSString *)userName type:(NSString *)type isHub:(BOOL)isHub
                       success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


/*
 八、	编辑用户接口POST（user/edit）（完）
 功能说明：一次编辑一项内容
 请求url：http://... ~/show/edit
 请求参数：
 参数名称	类型	是否必须	描述
 edittype	string	是	修改类型( headpic头像, username昵称, usersign 签名 , content个人简介)
 content		string	是	修改内容
 utoken		string	是		utoken验证

 */

- (void)editCustInfoWithEdittype:(NSString *)edittype content:(NSString *)content utoken:(NSString *)utoken isHub:(BOOL)isHub
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/*
 编辑头像
 */
- (void)edit_headpicWithpicUrl:(UIImage *)picUrl utoken:(NSString *)utoken isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end

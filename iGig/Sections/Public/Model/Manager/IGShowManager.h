//
//  IGShowManager.h
//  IGNetWorking
//
//  Created by admin on 15/10/22.
//  Copyright © 2015年 lifevc_longlz. All rights reserved.
//

#import "IGBaseManager.h"

@interface IGShowManager : IGBaseManager


+ (IGShowManager *)sharedInstance;

/*用户_编辑用户多属性
    userid		int	是	用户id
    headImage		int	是	头像    //有待询问
    username	string	是	昵称
    usersign	string	是	签名
    content		string	是	个人简介
 */
- (void)editsWithUserid:(NSNumber *)userid
                headpic:(NSNumber *)headpic
               username:(NSString *)username
                headImage:(NSString *)headImage
               usersign:(NSString *)usersign
                content:(NSString *)content
                 isHub:(BOOL)isHub
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
/*
 用户_编辑一项内容
 edittype	int	是	修改类型( headpic头像, username昵称, usersign 签名 , content个人简介)
 content		string	是	修改内容
 */
- (void)editWithUserid:(NSNumber *)userid
              edittype:(NSNumber *)edittype
                content:(NSString *)content
                  isHub:(BOOL)isHub
                success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
/*
 演出接口
    showid		int	是		演出场次的id
 */
- (void)closeWithShowid:(NSNumber *)showid
                 isHub:(BOOL)isHub
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/*
 场地方发布演出
 title	string	是	演出名称
 showTime	string	是	演出时间
 dirt	string	是	演出地点
 style	string	是	演出风格
 price	string	是	演出票价
 content	string	是	演出简介
 picUrl	string	是	图片
 field_id	Int	是	场地方
 band_id	int	是	乐队
 */
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
                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/*
 演出信息列表接
 from		int	否		第几条记录开始，默认从第1条记录开始
 limit		int	否		请求多少条记录，默认显示5条
 */
- (void)listWithFrom:(NSNumber *)from
            limit:(NSNumber *)limit
               isHub:(BOOL)isHub
             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end

//
//  IGCircleManager.h
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGBaseManager.h"

@interface IGCircleManager : IGBaseManager

+ (IGCircleManager *)sharedInstance;
/*
 十九、	圈子主列表接口GET（circle/lists）（完）
 功能说明： 	圈子主列表
 请求参数：
 参数名称	类型	是否必须	描述
 from		int	否	第几条记录开始，默认从第1条记录开始
 limit		int	否	请求多少条记录，默认显示5条
 utoken		string	是				
 
 */

- (void)circleListWithFrom:(NSString *)from limit:(NSString *)limit utoken:(NSString *)utoken isHub:(BOOL)isHub
                   success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


/* circel 我的圈文
 
 
 */
- (void)myAndOthersCircleWithFrom:(NSString *) from limit:(NSString *)limit userId:(NSString *)userId utoken:(NSString *)utoken isHub:(BOOL)isHub
                          success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
/*
 别人的圈文
 */



/*
 发表说说  == 文件流
 */
-  (void)publishSayWithUtoken:(NSString *)utoken content:(NSString *)content imgArray:(NSArray *)imgArray isHub:(BOOL)isHub
                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/*
 base64  发表说说
 */

- (void)publishSayingWithUtoken:(NSString *)utoken content:(NSString *)content imgStr:(NSString *)imgStr isHub:(BOOL)isHub
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end

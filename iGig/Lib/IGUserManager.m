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
- (void)reginfoWithphone:(NSString *)phone username:(NSString *)username type:(NSString *)type style:(NSString *)style address:(NSString *)address isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:@{@"type":type, @"phone":phone}];
    
    if (username) {
        [dic setValue:username forKey:@"username"];
    }
    
    if (style) {
        [dic setValue:style forKey:@"style"];
    }
    
    if (address) {
        [dic setValue:address forKey:@"address"];
    }
//    NSLog(@"%@", dic);
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

- (void)searchBandWithFrom:(NSString *)from limit:(NSString *)limit utoken:(NSString *)utoken success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure{
    [self getWithPath:[self getUrlWithPath:@"lists_follow_band"] parameters:@{@"from":from, @"limit": limit, @"utoken":utoken} isHub:YES success:success failure:failure];
}

- (void)homePageWithUserId:(NSString *)userid isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self getWithPath:[self getUrlWithPath:@"detail"] parameters:@{@"userid":userid} isHub:YES success:success failure:failure];
}


- (void)attentionUserWithFrom:(NSString *)from limit:(NSString *)limit type:(NSString *)type utoken:(NSString *)utoken isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self getWithPath:[self getUrlWithPath:@"lists_follow"] parameters:@{@"from":from,@"limit":limit,@"type":type,@"utoken":utoken} isHub:YES success:success failure:failure];
}

- (void)fDhotWordWithType:(NSNumber *)type isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self getWithPath:[self getUrlWithPath:@"lists_hot"] parameters:@{@"type":type} isHub:YES success:success failure:failure];
}

- (void)homeWithUserId:(NSString *)userId utoken:(NSString *)utoken isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self getWithPath:[self getUrlWithPath:@"home"] parameters:@{@"userid":userId,@"utoken":utoken} isHub:YES success:success failure:failure];
}

- (void)userSearchWithUserName:(NSString *)userName type:(NSString *)type isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self getWithPath:[self getUrlWithPath:@"search"] parameters:@{@"username":userName,@"type":type} isHub:YES success:success failure:failure];
}

- (void)editCustInfoWithEdittype:(NSString *)edittype content:(NSString *)content utoken:(NSString *)utoken isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure{
    [self postWithPath:[self getUrlWithPath:@"edit"] parameters:@{@"edittype" : edittype, @"content": content, @"utoken":utoken} isHub:isHub success:success failure:failure];
}

- (void)edit_headpicWithpicUrl:(UIImage *)picUrl utoken:(NSString *)utoken isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    if (isHub) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //          [SVProgressHUD show];
            [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
        });
    }
    
    NSString *path = [self getUrlWithPath:@"edit_headpic"];
    [mgr POST:path parameters:@{@"utoken":utoken} constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *data = UIImagePNGRepresentation(picUrl);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@_%ld.jpg", str, random()];
        [formData appendPartWithFileData:data name:@"picUrl" fileName:fileName mimeType:@"image/png"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (isHub) {
            [SVProgressHUD dismiss];
        }
        if ([[responseObject objectForKey:@"error"] integerValue] == 0) {
            if (success)
            {
                success(operation,responseObject);
            }
        }else
        {
            SHOW_ALERT([responseObject objectForKey:@"msg"]);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (isHub) {
            [SVProgressHUD dismiss];
        }
        if (failure) {
            failure(operation,error);
        }
    }];
    
}


- (NSString *)getUrlWithPath:(NSString *)path
{
    return [NSString stringWithFormat:@"%@%@",self.baseUrl,path];
}




@end

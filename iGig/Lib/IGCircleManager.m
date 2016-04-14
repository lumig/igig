//
//  IGCircleManager.m
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGCircleManager.h"

@interface IGCircleManager()
@property (strong,nonatomic)NSString  *baseUrl;

@end

@implementation IGCircleManager
GTMOBJECT_SINGLETON_BOILERPLATE(IGCircleManager,sharedInstance)


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseUrl = [NSString stringWithFormat:@"%@/circle/",HOST_DOMAIN];
    }
    return self;
}

- (void)circleListWithFrom:(NSString *)from limit:(NSString *)limit utoken:(NSString *)utoken isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self getWithPath:[self getUrlWithPath:@"lists"] parameters:@{@"from":from,@"limit":limit,@"utoken":utoken} isHub:isHub success:success failure:failure ];
}


- (void)myAndOthersCircleWithFrom:(NSString *)from limit:(NSString *)limit userId:(NSString *)userId utoken:(NSString *)utoken isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self getWithPath:[self getUrlWithPath:@"lists_mine"] parameters:@{@"from":from,@"limit":limit,@"userid":userId,@"utoken":utoken} isHub:YES success:success failure:failure];
}

- (void)publishSayWithUtoken:(NSString *)utoken content:(NSString *)content imgArray:(NSArray *)imgArray isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    if (isHub) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          //[SVProgressHUD show];
            [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
        });
    }
        NSString *path = [self getUrlWithPath:@"add"];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                content, @"content",
                                utoken, @"utoken",
                                nil];
    [mgr POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for (UIImage* image in imgArray)
        {
            NSData *data = UIImageJPEGRepresentation(image,0.6);
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@_%ld.jpg", str, random()];
            [formData appendPartWithFileData:data name:@"picUrls" fileName:fileName mimeType:@"image/jpeg"];
        }
        
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

- (void)publishSayingWithUtoken:(NSString *)utoken content:(NSString *)content imgStr:(NSString *)imgStr isHub:(BOOL)isHub success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self postWithPath:[self getUrlWithPath:@"add"] parameters:@{@"utoken":utoken,@"content":content,@"picUrls":imgStr} isHub:YES success:success failure:failure];
}




- (NSString *)getUrlWithPath:(NSString *)path
{
    return [NSString stringWithFormat:@"%@%@",self.baseUrl,path];
}

@end

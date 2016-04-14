//
//  IGBaseManager.m
//  IGNetWorking
//
//  Created by admin on 15/10/22.
//  Copyright © 2015年 lifevc_longlz. All rights reserved.
//

#import "IGBaseManager.h"
#import "SVProgressHUD.h"

@implementation IGBaseManager


- (void)postWithPath:(NSString *)path
          parameters:(id)parameters
               isHub:(BOOL)isHub
             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    if (isHub) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD show];
        });
    }
    [mgr POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if (isHub) {
            [SVProgressHUD dismiss];
        }
        if (failure) {
            failure(operation,error);
        }
    }];
}

-(void)getWithPath:(NSString *)path
        parameters:(id)parameters
             isHub:(BOOL)isHub
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    if (isHub) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD show];
        });
    }
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    [mgr GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if (isHub) {
            [SVProgressHUD dismiss];
        }
        if (failure) {
            failure(operation,error);
        }
    }];
}

@end

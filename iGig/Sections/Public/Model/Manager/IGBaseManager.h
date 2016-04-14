//
//  IGBaseManager.h
//  IGNetWorking
//
//  Created by admin on 15/10/22.
//  Copyright © 2015年 lifevc_longlz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "GTMObjectSingleton.h"

#define HOST_DOMAIN @"http://123.57.215.235"

#define SHOW_ALERT(msg) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[alert show];

@interface IGBaseManager : NSObject


- (void)postWithPath:(NSString *)path
          parameters:(id)parameters
                isHub:(BOOL)isHub
             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

-(void)getWithPath:(NSString *)path
        parameters:(id)parameters
           isHub:(BOOL)isHub
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end

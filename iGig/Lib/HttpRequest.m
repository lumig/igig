//
//  HttpRequest.m
//  hk_money
//
//  Created by vin on 14-7-21.
//  Copyright (c) 2015年 liconghui. All rights reserved.
//

#import "HttpRequest.h"
//#import "ASIHTTPRequest.h"
//#import "AFHTTPRequestOperation.h"
//#import "AFHTTPClient.h"

//#import "MBProgressHUD.h"
#import "AFNetworking.h"
//#import "Reachability.h"
#import "AFNetworking.h"
#import "AppDelegate.h"

@implementation HttpRequest



static dispatch_queue_t _mySerialQueue;

+(void)getWebData:(NSDictionary *)params path:(NSString *)path method:(NSString *)method ishowLoading:(BOOL)show success:(void(^)(id object))success fail:(void(^)(NSString* msg))fail
{
   
    [self getWebData:params path:path method:method ishowLoading:show success:success fail:fail isNeedCache:NO cacheExpireTime:0];
}

+(UIView*)getFLowerVC
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UINavigationController* nav = (UINavigationController*)appDelegate.window.rootViewController;
    if ( nav && [nav isKindOfClass:[UINavigationController class]])
    {
        return nav.topViewController.view;
    }
    else
    {
        return appDelegate.window;
    }
}

//+(void)inithttps
//{
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
//    securityPolicy.allowInvalidCertificates = YES;
//    [AFHTTPRequestOperationManager manager].securityPolicy = securityPolicy;
//
//}

//+(void)setDefaultHeader:(AFHTTPRequestOperationManager*)manager
//{
////    deviceId 设备id
////    systemVersion 系统版本
////    mobileType 手机型号
////    appVersion app版本
////    channel 渠道
//    
//    //设置通用头
//    
//    //deviceID
//    
//    //idfv
//    //NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//   
//    //友盟的openID
//    Class cls = NSClassFromString(@"UMANUtil");
//    SEL deviceIDSelector = @selector(openUDIDString);
//    NSString *deviceID = nil;
//    if(cls && [cls respondsToSelector:deviceIDSelector])
//    {
//        deviceID = [cls performSelector:deviceIDSelector];
//    }
//    if ( deviceID && deviceID.length )
//    {
//        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//        NSDictionary* headerDic = @{
//                                    @"deviceId":deviceID,
//                                    @"systemVersion":[[UIDevice currentDevice] systemVersion],
//                                    @"mobileType":[[UIDevice currentDevice] model],
//                                    @"appVersion":version,
//                                    //TODO, add 通行证TOKEN
//                                    @"channel":PACKAGE_CHINNLE
//                                    };
//        
//        NSString* headerStr = [NSString jsonStringWithDictionary:headerDic];
//        [manager.requestSerializer setValue:headerStr forHTTPHeaderField: @"appInfo"];
//    }
//}

+(void)getWebData:(NSDictionary *)params path:(NSString *)path method:(NSString *)method ishowLoading:(BOOL)show success:(void(^)(id object))success fail:(void(^)(NSString* msg))fail isNeedCache:(BOOL)isNeedCache
  cacheExpireTime:(int)cacheExpireTime
{
//    [self inithttps];
    
    if (isNeedCache)
    {
//        //初始化cache
//        if ( _kache == nil )
//        {
//            _kache = [[Kache alloc] initWithFiletoken:@"xcfamily"];
//        }
//        
//        //cache线程
//        if ( _mySerialQueue == nil )
//        {
//            _mySerialQueue = dispatch_queue_create("xcfamily.request.cache", 0);
//        }  
    }
    
//    NSURL *url = nil;
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    url = [NSURL URLWithString:path];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    manager.requestSerializer.timeoutInterval = 10;
    
   // [self setDefaultHeader:manager];
    
    
    if (show)
    {
//        BOOL isHUD = NO;
//        UIWindow *mainwindow = [[UIApplication sharedApplication].windows objectAtIndex:0];
//        for (UIView *v in mainwindow.subviews)
//        {
//            if ([v isKindOfClass:[MBProgressHUD class]])
//            {
//                isHUD=YES;
//            }
//        }
//        if (isHUD)
//        {
//            
//            NSLog(@"isHUD");//有菊花，就不加
//        }
//        else
//        {
//            
//            [MBProgressHUD showHUDAddedTo:[self getFLowerVC] animated:YES];//没有菊花就加
//        }
    }
    
//    //无网络返回cache内容
//    NSMutableURLRequest *request = nil;
//    if ( isNeedCache )
//    {
//        //初始化cache
//        NSError *serializationError = nil;
//        request = [manager.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:path] absoluteString] parameters:params error:&serializationError];
//        
//        //check cache availabel if network unavailabel
//        //Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
//        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        
//        if ( appdelegate.networkStatus == NotReachable)
//            
//        {
//            if (show)
//            {
//                //cache回来后，取消菊花
//                [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication].windows objectAtIndex:0] animated:YES];
//            }
//            
//            id caceResponseObject = [Kache valueForKey:[request.URL absoluteString]];
//            if (caceResponseObject)
//            {
//                NSString* string = [[NSString alloc] initWithData:caceResponseObject encoding:NSUTF8StringEncoding];
//                SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
//                NSMutableDictionary *dict = [jsonParser objectWithString:string];
//                
//                
//                if (success) {
//                    success(dict);
//                }
//            }
//            else
//            {
//                if (fail) {
//                    fail(@"cache is empty");
//                }
//            }
//            return;
//            
//        }
//    }
    
    
    
    
    if ([method isEqualToString:@"POST"])
    {
        [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            if (isNeedCache)
            {
//                //写缓存
//                dispatch_async(_mySerialQueue,
//                               ^{
//                                   //cache
//                                   [Kache setValue:responseObject forKey:[request.URL absoluteString] expiredAfter:cacheExpireTime];
//                                   sleep(1);
//                              });
            }

//            dispatch_async(dispatch_get_main_queue(), ^{
                NSString* string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                
            NSDictionary *json =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            
            
//                if (show)
//                {
//                    //POST请求回来后，取消菊花
//                    [MBProgressHUD hideHUDForView:[self getFLowerVC] animated:YES];
//                }
                if (success) {
                    success(json);
                }

//            });
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error.description);
            NSLog(@"%@",operation.response.allHeaderFields);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                for (UIView *v in [[[UIApplication sharedApplication].windows objectAtIndex:0] subviews])
//                {
//                    if ([v isKindOfClass:[MBProgressHUD class]])
//                    {
//                        MBProgressHUD *winHud=(MBProgressHUD *)v;
//                        winHud.labelText=@"加载失败";
//                    }
//                }
            
                //[MBProgressHUD hideHUDForView:[self getFLowerVC] animated:YES];
            
                if (fail) {
                    fail(error.description);
                }
                

//            });
            
        }];
        
    }
    else
    {
        NSLog(@"GET request issued, url = %@", path);
        
        
        [manager  GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            
        if (isNeedCache)
        {
//            //写缓存
//            dispatch_async(_mySerialQueue,
//                               ^{
//                                   //cache
//                                   [Kache setValue:responseObject forKey:[request.URL absoluteString] expiredAfter:cacheExpireTime];
//                                   sleep(1);
//                               });
        }

            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                if ([path isEqualToString:@"http://vinpush2012.sinaapp.com/index.php/Upgrade/getAppUpdate"])
//                {
//                    //菊花消失
//                    NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//                    [MBProgressHUD hideHUDForView:[self getFLowerVC] animated:YES];
//                    success(string);
//                    return ;
//                }
            
                //            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
                //
                //            NSMutableDictionary *dict = [jsonParser objectWithString:string];
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"http data response = %@", dict);
//                if (show)
//                {
//                    //GET请求成功， 取消菊花
//                    [MBProgressHUD hideHUDForView:[self getFLowerVC] animated:YES];
//                }
            
                if (success) {
                    success(dict);
                }

//            });
           
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error.description);
            NSLog(@"%@",operation.response.allHeaderFields);

//            dispatch_async(dispatch_get_main_queue(), ^{
//                for (UIView *v in [[[UIApplication sharedApplication].windows objectAtIndex:0] subviews])
//                {
//                    if ([v isKindOfClass:[MBProgressHUD class]])
//                    {
//                        
//                        MBProgressHUD *winHud=(MBProgressHUD *)v;
//                        winHud.labelText=@"加载失败";
//                    }
//                }
                //GET请求成功， 取消菊花
//                [SVProgressHUD hideHUDForView:[self getFLowerVC] animated:YES];
                if (fail) {
                    fail(error.description);
                }
                

//            });
        }];

    }
}

//上传图片
+(void)uploadImage:(NSDictionary *)params path:(NSString *)path andImageArr:( UIImage*)image  withView:(UIView*)view withIntIndex:(int)index  success:(void(^)(id object))success fail:(void(^)(NSString* msg))fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];

//    [self setDefaultHeader:manager];
    
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
    {
        NSData *data = UIImagePNGRepresentation(image);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@_%ld.png", str, random()];
        [formData appendPartWithFileData:data name:@"imageFile" fileName:fileName mimeType:@"image/png"];
    }
    success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"上传完成");
        
        if (success) {
            success([NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil]);
        }
    
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if (fail) {
            fail(error.description);
        }
        NSLog(@"上传失败->%@", error);

    }];
}

+(void)uploadImages:(NSDictionary *)params path:(NSString *)path andImageArr:( NSArray*)images  withView:(UIView*)view withIntIndex:(int)index  success:(void(^)(id object))success fail:(void(^)(NSString* msg))fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
   // [self setDefaultHeader:manager];
    
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
     {
         for (UIImage* image in images)
         {
             NSData *data = UIImagePNGRepresentation(image);
             NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
             formatter.dateFormat = @"yyyyMMddHHmmss";
             NSString *str = [formatter stringFromDate:[NSDate date]];
             NSString *fileName = [NSString stringWithFormat:@"%@_%ld.png", str, random()];
             [formData appendPartWithFileData:data name:@"imageFile" fileName:fileName mimeType:@"image/png"];
         }
     }
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"上传完成");
         
         if (success) {
             success([NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil]);
         }
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if (fail) {
             fail(error.description);
         }
         NSLog(@"上传失败->%@", error);
     }];
}




@end

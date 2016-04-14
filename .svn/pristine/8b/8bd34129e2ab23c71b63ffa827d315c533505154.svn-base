//
//  IGCustData.m
//  iGig
//
//  Created by liuzhanying on 15/10/22.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGCustData.h"
#import "IGUserManager.h"

@implementation IGCustData

+ (IGCustData *)sharedInstance{
    static IGCustData *__sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[IGCustData alloc] init];
        
//        __sharedInstance= @"1";
    });
    
    return __sharedInstance;

}

//测试token
- (instancetype)init{
    if(self = [super init]){
        self.custId = @"1";
    }
    return self;
}

//注册成功后或者登陆成功后根据返回dic 保存用户信息
+ (void)savaUserInfo:(NSDictionary *)dict{
    NSLog(@"%@", KConvertAllObjectToStrOrNil(dict[@"id"]));

    [[NSUserDefaults standardUserDefaults] setObject:KConvertAllObjectToStrOrNil(dict[@"id"]) forKey:IGCust_Id];
    [[NSUserDefaults standardUserDefaults] setValue:KConvertAllObjectToStrOrNil(dict[@"utoken"]) forKey:IGCust_token];
    
    
    [self getInfo:dict];
//    NSLog(@"%@", dict);
}

+ (void)getUserAllInfoWithCustId:(NSString *)custId{
//    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:IGCust_Id]);
//    [[IGUserManager sharedInstance] detailWithUserid:[[NSUserDefaults standardUserDefaults] objectForKey:IGCust_Id] isHub:NO success:^(AFHTTPRequestOperation *operation, id responseObject) {
////        NSLog(@"%@", responseObject[@"data"]);
//        NSDictionary *dict = responseObject[@"data"];
//        
//        [self getInfo:dict];
////        self sharedInstance
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token]);
    
    //因首页请求用到token 自动登陆做一个同步请求(待调整)
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://123.57.215.235/user/detail?userid=%@&utoken=%@", custId, [[NSUserDefaults standardUserDefaults] objectForKey:IGCust_token]]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
    request.HTTPMethod = @"GET";
    request.timeoutInterval = 3;//3秒未loading 直接跳过次步骤
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(data){
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        [self getInfo:dict[@"data"]];
    }
    

}


+ (void)getInfo:(NSDictionary *)dict{
    [self sharedInstance].custId = KConvertAllObjectToStrOrNil(dict[@"id"]);
    
    [self sharedInstance].token = KConvertAllObjectToStrOrNil(dict[@"utoken"]);
    [self sharedInstance].commentNum = KConvertAllObjectToStrOrNil(dict[@"commentNum"]);
    [self sharedInstance].content = KConvertAllObjectToStrOrNil(dict[@"content"]);
    [self sharedInstance].followedNum = KConvertAllObjectToStrOrNil(dict[@"followedNum"]);
    [self sharedInstance].followNum =KConvertAllObjectToStrOrNil(dict[@"followNum"]);
    [self sharedInstance].headPic = KConvertAllObjectToStrOrNil(dict[@"headpic"]);
    [self sharedInstance].phone = KConvertAllObjectToStrOrNil(dict[@"phone"]);
    [self sharedInstance].style = KConvertAllObjectToStrOrNil(dict[@"style"]);
    [self sharedInstance].type = KConvertAllObjectToStrOrNil(dict[@"type"]);
    //kIGUserType 通过获取到type改变后面的cell用户类型的跳转
    [[NSUserDefaults standardUserDefaults] setObject: KConvertAllObjectToStrOrNil(dict[@"type"]) forKey:@"userType"];
    [self sharedInstance].username = KConvertAllObjectToStrOrNil(dict[@"username"]);
    [self sharedInstance].address = KConvertAllObjectToStrOrNil(dict[@"address"]);
    [self sharedInstance].gender = KConvertAllObjectToStrOrNil(dict[@"gender"]);
    [self sharedInstance].sign = KConvertAllObjectToStrOrNil(dict[@"sign"]);
    
}


+ (BOOL)firstLogin{
    NSString *str =KConvertAllObjectToStrOrNil([[NSUserDefaults standardUserDefaults] objectForKey:IGCust_Id]);
    if(str){
        [self getUserAllInfoWithCustId:[[NSUserDefaults standardUserDefaults] objectForKey:IGCust_Id]];
        return NO;
    }
    return YES;
}

@end

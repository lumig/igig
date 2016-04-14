//
//  IGCustData.h
//  iGig
//
//  Created by liuzhanying on 15/10/22.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IGCustData : NSObject

/***************************   个人信息     ***************************/


//性别
@property (nonatomic, strong) NSString *gender;

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *custId;

//地址
@property (nonatomic, strong) NSString *address;


//用户简介
@property (nonatomic, strong) NSString *content;



/*
    1场地长 2主办方 3乐队 4乐迷
 */
@property (nonatomic, strong) NSString *type;

/*
    评论数
 */
@property (nonatomic, strong) NSString *commentNum;
/*
    关注数
 */
@property (nonatomic, strong) NSString *followNum;

/*
    被关注
 */
@property (nonatomic, strong) NSString *followedNum;

/*
    手机号
 */
@property (nonatomic, strong) NSString *phone;

/*
    风格
 */
@property (nonatomic, strong) NSString *style;

@property (nonatomic, strong) NSString *username;

/*
    头像
 */
@property (nonatomic, strong) NSString *headPic;
@property (nonatomic, strong) NSString *sign;



+ (IGCustData *)sharedInstance;

+ (BOOL)firstLogin;

//用户通过登陆 注册进入获得个人信息
+ (void)savaUserInfo:(NSDictionary *)dict;

//静默登陆
+ (void)getUserAllInfoWithCustId:(NSString *)custId;

@end

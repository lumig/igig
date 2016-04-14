//
//  AddBandModel.h
//  iGig
//
//  Created by duanzd on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddBandModel : NSObject

//  id		int	乐队的用户id
//headpic	string	头像
//username	string	乐队名称
//sign		string  个性签名
@property (nonatomic, strong) NSString *headpic;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *sign;
@property (nonatomic, strong) NSString *bandId;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end

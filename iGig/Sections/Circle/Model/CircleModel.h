//
//  CircleModel.h
//  iGig
//
//  Created by LuMig on 15/10/24.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CircleModel : NSObject

@property(nonatomic,strong)NSString *iconImg; //headPic
@property(nonatomic,strong)NSString *name;  //userName
@property(nonatomic,strong)NSString *desc;  //content
@property(nonatomic,strong)NSMutableArray *picArray;
@property(nonatomic,strong)NSString *publishTime;  //contentTime
@property(nonatomic,strong)NSString *month;
@property(nonatomic,strong)NSString *day;

@property(nonatomic,strong)NSNumber *type;

@property(strong,nonatomic)NSString *cTime;
@property(strong,nonatomic)NSMutableArray *commentArray;
//@property(strong,nonatomic)NSString *content;
//@property(strong,nonatomic)NSString *contentTime;
@property(strong,nonatomic)NSString *mId;
//@property(strong,nonatomic)NSMutableArray *picArray;
@property(strong,nonatomic)NSString *show_id;
//@property(strong,nonatomic)NSString *userName;
@property(strong,nonatomic)NSString *user_id;
@property(strong,nonatomic)NSString *userid;
@property(strong,nonatomic)NSMutableArray *zanArray;

+ (CircleModel *)fetchWithDesc:(NSDictionary *)dict;

@end

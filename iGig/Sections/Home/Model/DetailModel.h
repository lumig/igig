//
//  DetailModel.h
//  iGig
//
//  Created by LuMig on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGHomeModel.h"
#import "CommentModel.h"
#import "fieldModel.h"
#import "SponsorModel.h"
#import "bandModel.h"
@interface DetailModel : NSObject

//@property(nonatomic,strong)NSNumber *mId;
//@property(nonatomic,strong)NSString *picUrl;
//@property(nonatomic,strong)NSString *price;
//@property(nonatomic,strong)NSString *showState;
//@property(nonatomic,strong)NSString *showTime;
//@property(nonatomic,strong)NSString *followNum;
//@property(nonatomic,strong)
@property(nonatomic,strong)IGHomeModel *showModel;
@property(nonatomic,strong)NSNumber *followNum;
@property(nonatomic,strong)NSArray *bandArray;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSArray *commentArray;
@property(nonatomic,strong)fieldModel *fieldModel;
@property(nonatomic,strong)SponsorModel *sponsorModel;
@property(nonatomic,strong)bandModel *bandModel;


+ (DetailModel *)fetchWithDict:(NSDictionary *)dict;


@end

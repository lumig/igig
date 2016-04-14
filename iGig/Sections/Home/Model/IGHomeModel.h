//
//  IGHomeModel.h
//  iGig
//
//  Created by liuzhanying on 15/10/24.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGHomeModel.h"


@interface IGHomeModel : NSObject


/**
 *             
 "band_id" = 0;
 cTime = 0;
 content = "";
 dirt = "316_8_[2,315,0]_316\U4e1c\U57ce\U533a\U4f60\U4eec\U5bb6";
 fieldName = "\U6d4b\U8bd5\U5e10\U53f71";
 "field_id" = 316;
 fieldid = 316;
 fieldphone = 13671393689;
 id = 375;
 note = "";
 picUrl = "http://123.57.215.235/data/show.jpg";
 price = 0;
 showStatus = 8;
 showTime = "2016-01-08";
 "sponsor_id" = 0;
 startStatus = 0;
 style = "\U9664\U4e86\U7535\U5b50\U90fd\U884c";
 title = "\U6d4b\U8bd5\U5e10\U53f71_8_[2,315,0]_316_";
 "user_id" = 316;
 */

@property (nonatomic, strong) NSString *mId;
@property(nonatomic,strong) NSString *isedit;
@property(nonatomic,strong) NSString * applyStatus;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *showTime;
@property (nonatomic, strong) NSString *dirt;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *showStatus;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *bank;
@property(nonatomic,strong) NSString *phone;
@property(nonatomic,strong) NSString *fieldid;
@property (nonatomic, strong) NSString *content_ext;
//0 演出机会（等待申请）  1演出  2有预约  3 申请后（等待同意和拒绝）  4已同意  5已拒绝   7已确定  8.已发布  9已关闭  10已过期  11虚位以待

+ (instancetype)HomeModelWithDict:(NSDictionary *)dict;

- (instancetype)initHomeModelWithDict:(NSDictionary *)dict;

+ (IGHomeModel *) sharedInstance;


@end

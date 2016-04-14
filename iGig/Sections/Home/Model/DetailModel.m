//
//  DetailModel.m
//  iGig
//
//  Created by LuMig on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "DetailModel.h"
#import "bandModel.h"

@implementation DetailModel

+ (DetailModel *)fetchWithDict:(NSDictionary *)dict
{
    DetailModel *model = [[DetailModel alloc] init];
    model.showModel = [IGHomeModel HomeModelWithDict:dict];
    NSMutableArray *bArray = [NSMutableArray array];
    NSArray *bandArr = dict[@"band"];
    for (NSDictionary *dic in bandArr) {
        [bArray addObject:[bandModel fetchWithDict:dic]];
    }
    
    model.bandArray = bArray;
    
    model.followNum = dict[@"followNum"];
    
    NSMutableArray *commArray = [NSMutableArray array];
    NSArray *commArr = dict[@"comment"];
    for (NSDictionary *dict in commArr) {
        [commArray addObject:[CommentModel fetchWithDict:dict]];
    }
    model.commentArray = commArray;
    
    
    NSDictionary *dic = dict[@"field"];
    fieldModel *fieldM = [[fieldModel alloc] init];
    fieldM = [fieldModel fetchWithDict:dic];
    
//    NSDictionary *dic1 = dict[@"band"];
//    bandModel *bandM = [[bandModel alloc] init];
//    bandM = [bandModel fetchWithDict:dic1];

model.fieldModel = fieldM;
    
    SponsorModel *spModel = [[SponsorModel alloc] init];
    spModel = [SponsorModel fetchWithDict:dict[@"sponsor"]];
    model.sponsorModel = spModel;

    
    model.desc = dict[@"content"];
    
    return model;
}

@end

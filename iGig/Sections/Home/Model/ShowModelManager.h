//
//  ShowModelManager.h
//  iGig
//
//  Created by LuMig on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^SuccessBlock)(BOOL state,NSMutableArray *dataArray);
typedef void (^FailureBlock)(BOOL state);

@interface ShowModelManager : NSObject

@property(nonatomic,strong)NSMutableArray *dataArray;

+(ShowModelManager *)shareModelManager;
@end

//
//  AppMacro.h
//  FrameWork
//
//  Created by chuxiaolong on 15/8/9.
//  Copyright (c) 2015年 BST. All rights reserved.
//

#ifndef FrameWork_AppMacro_h
#define FrameWork_AppMacro_h

//AppMacro.h 里放app相关的宏定义
//http://123.57.215.235/show/lists
#define BaseSever @"http://123.57.215.235/"

#define IGCust_Id @"igCustId_default"
#define IGCust_token @"igCustToken_default"

#define AES_KEY @"2fMVbe6Nvtyy6CsV"

#define ios8    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]



#define UIColorFromInt(redValue, greenValue, blueValue, alphaValue) [UIColor colorWithRed:(redValue)/255.0f green:(greenValue)/255.0f blue:(blueValue)/255.0f alpha:(alphaValue)]

#define UIColorFromRGB(rgbValue,alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]


//设置view的frame根据兄弟试图
#define KGetViewToppestYPosition(value) (value.frame.origin.y)
#define KGetViewLeftestXPosition(value) (value.frame.origin.x)

#define KGetViewRightestXPosition(value) ( value.frame.origin.x + value.frame.size.width )
#define KGetViewBottomestYPosition(value) ( value.frame.origin.y + value.frame.size.height )

//数据保护

#define KConvertAllObjectToStrOrNil(value)  ( ([value isKindOfClass:[NSNull class]] || value == nil || value == Nil ) ? nil : [NSString stringWithFormat:@"%@", ( value )] )

//单例宏
#define DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
return __singleton__; \
}

#define UserDefaults [NSUserDefaults standardUserDefaults]

#define kIGUserType [[[NSUserDefaults standardUserDefaults] objectForKey:@"userType"] intValue]
#define kIGCustId [[NSUserDefaults standardUserDefaults] objectForKey:@"igCustId_default"]

typedef NS_ENUM(NSInteger , IGUserType) {
    
    IGUserTypePlace = 1,        //场地方
    IGUserTypeOrganizers =2,    //主办方
    IGUserTypeBand = 3          //乐队
};

#endif

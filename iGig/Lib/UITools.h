//
//  UITools.h
//  XinchengMall
//
//  Created by liuzhanying on 15/10/21.
//  Copyright © 2015年 com.xincheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UITools : NSObject

+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;

+ (UILabel *)createLabelWithFrame:(CGRect)frame fontNumber:(NSInteger)fontNumber text:(NSString *)text;

+ (UITextField *)createTextFiledWithFrame:(CGRect)frame fontNumber:(NSInteger)fontNumber placeText:(NSString *)placeText;


@end

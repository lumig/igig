//
//  UIImage+Kit.h
//  LingDou
//
//  Created by chuxiaolong on 15/8/25.
//  Copyright (c) 2015年 chuxiaolong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
@interface UIImage (Kit)
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage*)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;

+ (UIImage *)scaleAndRotateImage:(UIImage *)image;

+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

+ (void)lowQuailtyWithInputURL:(NSURL*)inputURL
                             outputURL:(NSURL*)outputURL
                          blockHandler:(void (^)(AVAssetExportSession*))handler;

@end

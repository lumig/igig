//
//  NSData+Helpers.h
//  FrameWork
//
//  Created by chuxiaolong on 15/8/10.
//  Copyright (c) 2015年 BST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Helpers)
//base64编码
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;
//加密相关
- (NSData *)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSData *)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

- (NSData *)encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSData *)decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

- (NSString *)UTF8String;
@end

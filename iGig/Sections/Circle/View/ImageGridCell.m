//
//  ImageGridCell.m
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "ImageGridCell.h"
#import <UIImageView+AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation ImageGridCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        _imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_imageView];
    
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.right.equalTo(@0);
            make.top.equalTo(@0);
            make.bottom.equalTo(@0);
        }];
    }
    
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];

    
}
@end

//
//  ImageGridCell.h
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageGridCell : UICollectionViewCell

@property(nonatomic,strong)NSString *imageUrl;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,assign)BOOL isBig;

@end

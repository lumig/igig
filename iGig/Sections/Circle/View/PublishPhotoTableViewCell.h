//
//  PublishPhotoTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kPublishPhotoDidRouterEvent @"kPublishPhotoDidRouterEvent"

#define kPhotoIndex @"kPhotoIndex"
#define kAddPhoto   @"kAddPhoto"
#define kPhotoImageView @"kPhotoImageView"

@interface PublishPhotoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *collectView;
@property (strong,nonatomic)UICollectionViewFlowLayout *flowLayout;

@property (strong,nonatomic)NSMutableArray  *gridArr;

+ (CGFloat)heightViewWithArr:(NSMutableArray *)gridArr;

@end

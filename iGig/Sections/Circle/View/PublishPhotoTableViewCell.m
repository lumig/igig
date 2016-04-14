//
//  PublishPhotoTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "PublishPhotoTableViewCell.h"
#import "ImageGridCell.h"

#define KGap 10
#define kSmallGap  5

#define kImageGridCellId @"kImageGridCellId"

@interface PublishPhotoTableViewCell() <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation PublishPhotoTableViewCell

- (void)awakeFromNib {
    self.collectView.backgroundColor = [UIColor whiteColor];
    self.collectView.dataSource = self;
    self.collectView.delegate  = self;
    
    self.collectView.collectionViewLayout = self.flowLayout;
    
    [self.collectView registerClass:[ImageGridCell class] forCellWithReuseIdentifier:kImageGridCellId];
    
}

#pragma mark - collectionView delegate datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.gridArr.count == 9)
    {
        return self.gridArr.count;
    }
    
    return [self.gridArr count] + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageGridCellId forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    if (self.gridArr.count > indexPath.row)
    {
        cell.imageView.image = self.gridArr[indexPath.row];
    }else
    {
        cell.imageView.image = [UIImage imageNamed:@"i_voucher.png"];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isAddPhoto = NO;
    
    if (self.gridArr.count == indexPath.row)
    {
        isAddPhoto = YES;
    }
    
    NSMutableArray *imageViews = [[NSMutableArray alloc]init];
    
    if (!isAddPhoto)
    {
        for (int i = 0; i < self.gridArr.count; i++)
        {
            NSIndexPath *pIndexPath = [NSIndexPath indexPathForItem:i inSection:0];
            ImageGridCell *cell = (ImageGridCell *)[collectionView cellForItemAtIndexPath:pIndexPath];
            
            if (cell)
            {
                [imageViews addObject:cell.imageView];
            }
        }
    }
        
    [super routerEventWithName:kPublishPhotoDidRouterEvent userInfo:@{kAddPhoto:[NSNumber numberWithDouble:isAddPhoto],kPhotoIndex:[NSNumber numberWithInteger:indexPath.row],kPhotoImageView:imageViews}];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = 0;
    CGFloat height = 0;
    
    NSInteger gCount = self.gridArr.count;
    
    if (gCount == 0)
    {
        gCount = 1;
    }
    
    width = (SCREEN_WIDTH - 2 * KGap - 2 * kSmallGap - 20) / 3.0;
    height = width;
    
    return CGSizeMake(width, height);
}


#pragma mark - setter
- (void)setGridArr:(NSMutableArray *)gridArr
{
    _gridArr = gridArr;
    
    [self.collectView reloadData];
}



#pragma mark - getter

- (UICollectionViewFlowLayout *)flowLayout
{
    if (_flowLayout == nil)
    {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(KGap, KGap, KGap, KGap);
        _flowLayout.minimumLineSpacing = kSmallGap;
        _flowLayout.minimumInteritemSpacing = kSmallGap;
    }
    
    return _flowLayout;
}

+ (CGFloat)heightViewWithArr:(NSArray *)gridArr
{
    CGFloat width = 0;
    CGFloat height = 0;
    
    NSInteger gCount = gridArr.count;
    
    if (gCount < 9) {
        gCount = gCount + 1;
    }
    
    width = (SCREEN_WIDTH - 2 * KGap - 2 * kSmallGap) / 3.0;
    height = width;
    
    int remainder = gCount % 3;
    
    int quotient = (int)gCount / 3;
    
    if (remainder > 0) {
        remainder = 1;
    }
    
    int count = remainder + quotient;
    
    return 2 * KGap + count * height + 2 * kSmallGap + 30;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

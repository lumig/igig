//
//  BannerView.m
//  xinchengHome
//
//  Created by liuzhanying on 15/10/13.
//  Copyright © 2015年 duanzongdi. All rights reserved.
//

#import "BannerView.h"

@interface BannerView ()<UIScrollViewDelegate>{
    CGRect _currentFrame;
    UIScrollView *_scrollView;
    UIPageControl *_pageConrol;
    BOOL _isPageControl;
    NSInteger _pageIndex;
}
@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation BannerView

- (instancetype)initWithFrame:(CGRect)frame andImageArray:(NSMutableArray *)imageArray{
    if(self = [super initWithFrame:frame]){
        //轮播时图片需要在最前插入最后一张，在最后插入最前一张
        if(imageArray.count > 1){
            _imageArray = [[NSMutableArray alloc] initWithArray:imageArray];
            [_imageArray addObject:[imageArray firstObject]];
            [_imageArray insertObject:[imageArray lastObject] atIndex:0];
        }else{
            _imageArray = [[NSMutableArray alloc] initWithArray:imageArray];
        }
        _currentFrame = frame;
        _isPageControl = imageArray.count == 1 ? NO : YES;
        [self createScrollView];
    }
    return self;
}

- (void)createScrollView{
    NSLog(@"%@", NSStringFromCGRect(_currentFrame));
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _currentFrame.size.width, _currentFrame.size.height)];
//    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
    for (int i=0; i<_imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * _currentFrame.size.width, 0, _currentFrame.size.width, _currentFrame.size.height)];
        
//        imageView.contentMode = 3UIViewContentModeScaleAspectFill;
        
        [imageView setImage:[_imageArray objectAtIndex:i]];
        [_scrollView addSubview:imageView];
    }
    _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH - 20, 0);
    _scrollView.contentSize = CGSizeMake(_currentFrame.size.width * _imageArray.count,0);
    
    if (_isPageControl) {
        _pageConrol = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _currentFrame.size.height- 25, _currentFrame.size.width, 20)];
//        _pageConrol.backgroundColor = [UIColor blackColor];
        [_pageConrol setNumberOfPages:[_imageArray count] - 2];
        _pageConrol.currentPageIndicatorTintColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.7];
        _pageConrol.pageIndicatorTintColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.3];
        [_pageConrol setCurrentPage:0];
        [self addSubview:_pageConrol];
    }

    
}

#pragma mark --delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self updateIndexAndSpecialLocation];
    
    _pageConrol.currentPage = _pageIndex;
}

- (void)updateIndexAndSpecialLocation {
    int index = _scrollView.contentOffset.x / (SCREEN_WIDTH - 20);
    NSLog(@"%d", index);
    if (index == 0) {
        // 当目前显示的是slider4-b页面时
        _pageIndex = 3;
        // 修改offset，使后边的slider4显示出来
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * 3 - 60, 0);
    }else if(index == 4) {
        // 当目前显示的是slider0-b页时
        // 修改offset，使前边的slider0显示出来
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH - 20, 0);
        _pageIndex = 0;
    }else {
        _pageIndex = _scrollView.contentOffset.x / (SCREEN_WIDTH - 20) - 1 ;
    }
}

@end

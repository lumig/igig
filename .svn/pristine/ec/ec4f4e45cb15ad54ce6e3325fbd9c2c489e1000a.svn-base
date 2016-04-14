//
//  MMSearchBar.h
//  SZMobileMall
//
//  Created by Joe Wang on 13-12-30.
//  Copyright (c) 2013年 belink. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MMSearchBarDelegate;

@interface MMSearchBar : UIView{
   // id<MMSearchBarDelegate> delegate;
    UITextField *searchField;
    UIImageView *imgSearch;
    UIButton *btnCancel;
    
}
@property (nonatomic, weak) id<MMSearchBarDelegate> delegate;
@property (nonatomic, retain) UITextField *searchField;
@property (nonatomic, retain) UIImageView *imgSearch;
@property (nonatomic, retain) UIButton *btnCancel;
@end

@protocol MMSearchBarDelegate <NSObject>

- (void)mmSearchBarCancelButtonClicked:(MMSearchBar *) searchBar;
- (void)mmSearchBarSearchButtonClicked:(MMSearchBar *) searchBar;
@end
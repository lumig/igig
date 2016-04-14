//
//  IGCustInfoView.h
//  iGig
//
//  Created by duanzd on 15/10/29.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IGCustInfoViewDelegate <NSObject>

- (void)custInfoViewDidSeleted;

@end


@interface IGCustInfoView : UIView

@property (nonatomic, weak) id<IGCustInfoViewDelegate> delegate;

@end


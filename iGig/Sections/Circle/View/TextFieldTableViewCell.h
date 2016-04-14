//
//  TextFieldTableViewCell.h
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kPublishTextRouterEvent @"kPublishTextRouterEvent"


@interface TextFieldTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

+ (CGFloat)cellHeight;


@end

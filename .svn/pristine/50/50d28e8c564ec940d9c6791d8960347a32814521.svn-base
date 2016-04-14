//
//  TextFieldTableViewCell.m
//  iGig
//
//  Created by LuMig on 15/11/10.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "TextFieldTableViewCell.h"

@interface TextFieldTableViewCell ()<UITextViewDelegate>

@end


@implementation TextFieldTableViewCell

- (void)awakeFromNib {
    self.textView.delegate = self;
    self.textView.returnKeyType = UIReturnKeyDone;
    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = RGBACOLOR(222, 222, 222, 1).CGColor;
}


#pragma mark --
#pragma mark -- textView Delegate

- (void)textViewDidChange:(UITextView *)textView
{
    if ([textView.text length] > 0) {
        self.placeholderLabel.text = @"";
        self.placeholderLabel.hidden = YES;
        
    }
    else
    {
        self.placeholderLabel.text =@"这一刻你的想法...";
        self.placeholderLabel.hidden = NO;
    }
    
    [super routerEventWithName:kPublishTextRouterEvent userInfo:@{@"content":textView.text}];
}



+ (CGFloat)cellHeight
{
    return 100;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

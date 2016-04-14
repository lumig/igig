//
//  MMSearchBar.m
//  SZMobileMall
//
//  Created by Joe Wang on 13-12-30.
//  Copyright (c) 2013年 belink. All rights reserved.
//

#import "MMSearchBar.h"

@implementation MMSearchBar
@synthesize delegate;
@synthesize searchField;
@synthesize imgSearch;
@synthesize btnCancel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.imgSearch = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0.f, SCREEN_WIDTH, 30.f)];
        self.imgSearch.image = [UIImage imageNamed:@"mm_searchbg.png"];
        [self addSubview:self.imgSearch];
        
        
        
        
        self.searchField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0.f, self.imgSearch.bounds.size.width- 65 , 30.f)];
        self.searchField.returnKeyType = UIReturnKeySearch;
        self.searchField.font = [UIFont systemFontOfSize:15.0];
        self.searchField.textColor = [UIColor whiteColor];
        self.searchField.clearButtonMode=UITextFieldViewModeWhileEditing;
        self.searchField.backgroundColor = UIColorFromRGB(0x383838, 1);
        
        
        UIView *bgLeft =  [[UIView alloc] init];
       // bgLeft.backgroundColor = [UIColor redColor];
        bgLeft.frame = CGRectMake(0, 0,20,self.searchField.bounds.size.height);
       
        
        UIView *empty = [[UIView alloc] init];
        empty.frame = CGRectMake(0, 0, 5, CGRectGetHeight(bgLeft.frame));
        UIImageView *imgIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10,10, 10, 10)];
        imgIcon.image = [UIImage imageNamed:@"search2.png"];
        
        
        
        
        [bgLeft addSubview:empty];
        [bgLeft addSubview:imgIcon];
        
        self.searchField.leftView = bgLeft;
        self.searchField.leftViewMode = UITextFieldViewModeAlways;
     
     
        
        [self.searchField addTarget:self action:@selector(searchButtonClicked) forControlEvents:UIControlEventEditingDidEndOnExit];
        [self addSubview:searchField];
        
       
        
        
        self.btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnCancel.frame = CGRectMake(SCREEN_WIDTH - 65, 0, 50, 31);
        self.btnCancel.layer.cornerRadius=2.0;
        [self.btnCancel setTitle:@"取消" forState:UIControlStateNormal];
        [self.btnCancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[self.btnCancel setBackgroundColor:[UIColor lightGrayColor]];
        self.btnCancel.titleLabel.font=[UIFont systemFontOfSize:14.f];
        [self.btnCancel addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btnCancel];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) cancelButtonClicked{
//    [self.searchField resignFirstResponder];
//    self.hidden=YES;
    
    if ([self.delegate respondsToSelector:@selector(mmSearchBarCancelButtonClicked:)]) {
        [self.delegate mmSearchBarCancelButtonClicked:self];
    }
}

-(void) searchButtonClicked{
    if ([self.delegate respondsToSelector:@selector(mmSearchBarSearchButtonClicked:)]) {
        [self.delegate mmSearchBarSearchButtonClicked:self];
    }
}
@end

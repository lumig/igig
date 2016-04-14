//
//  JTCalendarMenuMonthView.m
//  JTCalendar
//
//  Created by Jonathan Tribouharet
//

#import "JTCalendarMenuMonthView.h"

@interface JTCalendarMenuMonthView(){
    UILabel *textLabel;
    UIButton *btnALL;
    UIButton *btnRed;
    UIButton *btnBlue;
    UIButton *btnRight;
    UIButton *btnLeft;
}

@end

@implementation JTCalendarMenuMonthView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    {
        textLabel = [[UILabel alloc]init];
        [self addSubview:textLabel];
        btnALL = [[UIButton alloc]init];
        [self addSubview:btnALL];
        
        btnLeft = [[UIButton alloc]init];
        btnRight = [[UIButton alloc]init];
        
        [self addSubview:btnLeft];
        [self addSubview:btnRight];
        [btnLeft setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
        [btnRight setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];

        [btnLeft addTarget:self action:@selector(actionBtnLeft:) forControlEvents:UIControlEventTouchUpInside];
        [btnRight addTarget:self action:@selector(actionBtnRight:) forControlEvents:UIControlEventTouchUpInside];
        
        btnRed = [[UIButton alloc]init];

        [self addSubview:btnRed];
        
        btnBlue = [[UIButton alloc]init];
        [self addSubview:btnBlue];
        
        [btnRed addTarget:self action:@selector(actionBtnRed:) forControlEvents:UIControlEventTouchUpInside];
        [btnBlue addTarget:self action:@selector(actionBtnBlue:) forControlEvents:UIControlEventTouchUpInside];
        
        
        // btn 设置
        [btnALL setTitle:@"全部" forState:UIControlStateNormal];
        [btnALL setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnALL setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [btnALL addTarget:self action:@selector(actionBtnAll:) forControlEvents:UIControlEventTouchUpInside];
        btnALL.titleLabel.font = [UIFont systemFontOfSize:12];
        textLabel.textAlignment = NSTextAlignmentCenter;

    }
}

          
- (void)actionBtnLeft:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarActionBtnLeft" object:nil];
}
 
- (void)actionBtnRight:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarActionBtnRight" object:nil];

}

- (void)actionBtnRed:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarActionBtnRed" object:nil];
}

- (void)actionBtnBlue:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarActionBtnBlue" object:nil];
}

- (void)actionBtnAll:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarActionBtnAll" object:nil];
}

- (void)setMonthIndex:(NSInteger)monthIndex
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.timeZone = self.calendarManager.calendarAppearance.calendar.timeZone;
//        dateFormatter.dateFormat = @"yyyy-MM";
    }

    while(monthIndex <= 0){
        monthIndex += 12;
    }
    
    textLabel.text = [[dateFormatter standaloneMonthSymbols][monthIndex - 1] capitalizedString];
    
}

- (void)setMonthLable:(NSString *)string
{
    textLabel.text = string;
}


- (void)layoutSubviews
{
    textLabel.frame = CGRectMake(50, 0, self.frame.size.width/5, self.frame.size.height);
    btnLeft.frame = CGRectMake(textLabel.frame.origin.x-self.frame.size.height, 0,self.frame.size.height, self.frame.size.height);

    btnRight.frame = CGRectMake(CGRectGetMaxX(textLabel.frame), 0,self.frame.size.height, self.frame.size.height);

    
    CGFloat btnWidth = self.frame.size.height;
    btnALL.frame = CGRectMake(self.frame.size.width - self.frame.size.width/3, 0,btnWidth, btnWidth);
    btnRed.frame = CGRectMake(self.frame.size.width - self.frame.size.width/3+btnWidth+10, btnWidth*0.25, btnWidth*0.5, btnWidth*0.5);
    btnBlue.frame = CGRectMake(self.frame.size.width - self.frame.size.width/3+btnWidth*2+10, btnWidth*0.25, btnWidth*0.5, btnWidth*0.5);

    // No need to call [super layoutSubviews]
}

- (void)reloadAppearance
{
    textLabel.textColor = self.calendarManager.calendarAppearance.menuMonthTextColor;
    textLabel.font = self.calendarManager.calendarAppearance.menuMonthTextFont;
    [btnRed setBackgroundColor:self.calendarManager.calendarAppearance.colorRed];
    [btnBlue setBackgroundColor:self.calendarManager.calendarAppearance.colorBlue];
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 

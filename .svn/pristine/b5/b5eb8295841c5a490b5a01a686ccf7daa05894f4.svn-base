//
//  JTCalendarDayView.m
//  JTCalendar
//
//  Created by Jonathan Tribouharet
//

#import "JTCalendarDayView.h"

#import "JTCircleView.h"

@interface JTCalendarDayView (){
    JTCircleView *circleView;
    UILabel *textLabel;
    JTCircleView *dotView;
    UIImageView *imageView;
    UILabel *textLabelRed;
    UILabel *textLabelBlue;
    
    UIView *blueAndRedView;
    
    
    
    BOOL isSelected;
    BOOL isWeek;
    
    int cacheIsToday;
    NSString *cacheCurrentDateText;
}
@end

static NSString *kJTCalendarDaySelected = @"kJTCalendarDaySelected";

@implementation JTCalendarDayView

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

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]  removeObserver:self];
}

- (void)commonInit
{
    isSelected = NO;
    self.isOtherMonth = NO;
    
    
    {
        imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"public_setup_hg"];
        [self addSubview:imageView];
        
        circleView = [JTCircleView new];
        [self addSubview:circleView];
        
        textLabel = [UILabel new];
        [self addSubview:textLabel];

        blueAndRedView = [[UIView alloc]init];
        [self addSubview:blueAndRedView];
        blueAndRedView.hidden = YES;

        textLabelRed = [[UILabel alloc]init];
        [blueAndRedView addSubview:textLabelRed];
        [textLabelRed setBackgroundColor:[UIColor redColor]];
        
        
        textLabelBlue = [[UILabel alloc]init];
        [blueAndRedView addSubview:textLabelBlue];
        [textLabelBlue setBackgroundColor:[UIColor blueColor]];
        
        
        
        

    }
    
    {
        // 小白点
//        dotView = [JTCircleView new];
//        [self addSubview:dotView];
//        dotView.hidden = YES;
    }
    
    {
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouch)];

        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:gesture];
    }
    
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didDaySelected:) name:kJTCalendarDaySelected object:nil];
    }
    
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeWeek:) name:@"kJTCalendarChangWeek" object:nil];
    }
}




- (void)layoutSubviews
{
    [self configureConstraintsForSubviews];
    
    // No need to call [super layoutSubviews]
}

+(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

// Avoid to calcul constraints (very expensive)
- (void)configureConstraintsForSubviews
{
   
    
    CGFloat blueAndRedViewWidth = self.frame.size.width;
    CGFloat blueAndRedViewHeight = self.frame.size.height/3;
    
    CGFloat textLabelWidth = self.frame.size.height/3;
    CGFloat textLabelHeight = self.frame.size.height/3;
    
    CGFloat textLabelColorXBlue = blueAndRedViewWidth/2 - textLabelWidth-2;
    CGFloat textLabelColorXRed = blueAndRedViewWidth/2 +2;
    CGFloat textLabelColorY = 0;
//    [textLabel setBackgroundColor:[JTCalendarDayView randomColor]];


    
    textLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-self.frame.size.height/4);
    blueAndRedView.frame = CGRectMake(0, self.frame.size.height-self.frame.size.height/3, blueAndRedViewWidth, blueAndRedViewHeight);
    
    textLabelBlue.frame = CGRectMake(textLabelColorXBlue, textLabelColorY,textLabelWidth,textLabelHeight);
    
    textLabelBlue.textColor = self.calendarManager.calendarAppearance.colorLableColor;
    textLabelBlue.font = self.calendarManager.calendarAppearance.colorLabyeFont;
    textLabelBlue.textAlignment = NSTextAlignmentCenter;
    
    textLabelRed.frame = CGRectMake(textLabelColorXRed,textLabelColorY,textLabelWidth,textLabelHeight);
    
    textLabelRed.textColor = self.calendarManager.calendarAppearance.colorLableColor;
    textLabelRed.font = self.calendarManager.calendarAppearance.colorLabyeFont;
    textLabelRed.textAlignment = NSTextAlignmentCenter;
    
    CGFloat sizeCircle = MIN(self.frame.size.width, self.frame.size.height);
    CGFloat sizeDot = sizeCircle;
    
    sizeCircle = sizeCircle * self.calendarManager.calendarAppearance.dayCircleRatio;
    sizeDot = sizeDot * self.calendarManager.calendarAppearance.dayDotRatio;
    
    sizeCircle = roundf(sizeCircle);
    sizeDot = roundf(sizeDot);
    
    circleView.frame = CGRectMake(0, 0, sizeCircle, sizeCircle);
    circleView.center = CGPointMake(self.frame.size.width / 2., self.frame.size.height / 2.-self.frame.size.height/8);
    circleView.layer.cornerRadius = sizeCircle / 2.;
    
    dotView.frame = CGRectMake(0, 0, sizeDot, sizeDot);
    dotView.center = CGPointMake(self.frame.size.width / 2., (self.frame.size.height / 2.) + sizeDot * 2.5);
    dotView.layer.cornerRadius = sizeDot / 2.;
    
    imageView.frame = CGRectMake(0, 0, sizeCircle+4, sizeCircle+4);
    imageView.center = circleView.center;

    
    
}

- (void)setDate:(NSDate *)date
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.timeZone = self.calendarManager.calendarAppearance.calendar.timeZone;
        [dateFormatter setDateFormat:@"dd"];
    }
    
    self->_date = date;
    
    textLabel.text = [dateFormatter stringFromDate:date];
    
    cacheIsToday = -1;
    cacheCurrentDateText = nil;
}

-(void)setShow:(NSString *)showStr AndChang:(NSString *)chanceStr{

    textLabelBlue.text =chanceStr;
    textLabelRed.text = showStr;

    textLabelBlue.alpha = 1;
    textLabelRed.alpha = 1;
    textLabelBlue.backgroundColor = self.calendarManager.calendarAppearance.colorBlue;
    textLabelRed.backgroundColor = self.calendarManager.calendarAppearance.colorRed;
    imageView.image = [UIImage imageNamed:@"homepage_datechoosed"];
    if ([showStr isEqual:@"0"] || showStr ==nil) {
        textLabelRed.alpha = 0.2;
        imageView.image = [UIImage imageNamed:@"homepage_dateBlue"];

        
    }
    
    if ([chanceStr isEqual:@"0"] || chanceStr == nil) {
        textLabelBlue.alpha = 0.2;
        imageView.image = [UIImage imageNamed:@"homepage_dateRed"];
    }
    
    if ([showStr isEqual:@"0"]&&[chanceStr isEqual:@"0"]){
        imageView.image = nil;
    }
    
    if (showStr == nil &&  chanceStr == nil) {
         imageView.image = nil;
    }
}

- (void)didTouch
{
    [self setSelected:YES animated:YES];
    [self.calendarManager setCurrentDateSelected:self.date];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kJTCalendarDaySelected object:self.date];
    

    
    [self.calendarManager.dataSource calendarDidDateSelected:self.calendarManager date:self.date];
    
    if(!self.isOtherMonth){
        return;
    }
    
    NSInteger currentMonthIndex = [self monthIndexForDate:self.date];
    NSInteger calendarMonthIndex = [self monthIndexForDate:self.calendarManager.currentDate];
        
    currentMonthIndex = currentMonthIndex % 12;
    
    if(currentMonthIndex == (calendarMonthIndex + 1) % 12){
        [self.calendarManager loadNextMonth];
    }
    else if(currentMonthIndex == (calendarMonthIndex + 12 - 1) % 12){
        [self.calendarManager loadPreviousMonth];
    }
}

- (void)didDaySelected:(NSNotification *)notification
{
    NSDate *dateSelected = [notification object];
    
    if([self isSameDate:dateSelected]){
        if(!isSelected){
            [self setSelected:YES animated:YES];
        }
    }
    else if(isSelected){
        [self setSelected:NO animated:YES];
    }
}


- (void)didChangeWeek:(NSNotification *)notification
{
    
    bool isWeekDay =[[notification object] boolValue];
    isWeek = isWeekDay;
    imageView.hidden = isWeekDay;
    blueAndRedView.hidden = !isWeekDay;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if(isSelected == selected){
        animated = NO;
    }
    
    isSelected = selected;
    
    circleView.transform = CGAffineTransformIdentity;
    CGAffineTransform tr = CGAffineTransformIdentity;
    CGFloat opacity = 1.;
    
    if(selected){
        if(!self.isOtherMonth){
            circleView.color = [self.calendarManager.calendarAppearance dayCircleColorSelected];
            textLabel.textColor = [self.calendarManager.calendarAppearance dayTextColorSelected];
            dotView.color = [self.calendarManager.calendarAppearance dayDotColorSelected];
        }
        else{
            circleView.color = [self.calendarManager.calendarAppearance dayCircleColorSelectedOtherMonth];
            textLabel.textColor = [self.calendarManager.calendarAppearance dayTextColorSelectedOtherMonth];
            dotView.color = [self.calendarManager.calendarAppearance dayDotColorSelectedOtherMonth];
        }
        
        circleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
        tr = CGAffineTransformIdentity;
    }
    else if([self isToday]){
        if(!self.isOtherMonth){
            circleView.color = [self.calendarManager.calendarAppearance dayCircleColorToday];
            textLabel.textColor = [self.calendarManager.calendarAppearance dayTextColorToday];
            dotView.color = [self.calendarManager.calendarAppearance dayDotColorToday];
        }
        else{
            circleView.color = [self.calendarManager.calendarAppearance dayCircleColorTodayOtherMonth];
            textLabel.textColor = [self.calendarManager.calendarAppearance dayTextColorTodayOtherMonth];
            dotView.color = [self.calendarManager.calendarAppearance dayDotColorTodayOtherMonth];
        }
    }
    else{
        if(!self.isOtherMonth){
            textLabel.textColor = [self.calendarManager.calendarAppearance dayTextColor];
            dotView.color = [self.calendarManager.calendarAppearance dayDotColor];
        }
        else{
            textLabel.textColor = [self.calendarManager.calendarAppearance dayTextColorOtherMonth];
            dotView.color = [self.calendarManager.calendarAppearance dayDotColorOtherMonth];
        }
        
        opacity = 0.;
    }
    
    if(animated){
        [UIView animateWithDuration:.3 animations:^{
            circleView.layer.opacity = opacity;
            circleView.transform = tr;
        }];
    }
    else{
        circleView.layer.opacity = opacity;
        circleView.transform = tr;
    }
}

- (void)setIsOtherMonth:(BOOL)isOtherMonth
{
    self->_isOtherMonth = isOtherMonth;
    [self setSelected:isSelected animated:NO];
}

- (void)reloadData
{
//    dotView.hidden = ![self.calendarManager.dataSource calendarHaveEvent:self.calendarManager date:self.date];
    
    BOOL selected = [self isSameDate:[self.calendarManager currentDateSelected]];
    [self setSelected:selected animated:NO];
}

- (BOOL)isToday
{
    if(cacheIsToday == 0){
        return NO;
    }
    else if(cacheIsToday == 1){
        return YES;
    }
    else{
        if([self isSameDate:[NSDate date]]){
            cacheIsToday = 1;
            return YES;
        }
        else{
            cacheIsToday = 0;
            return NO;
        }
    }
}

- (BOOL)isSameDate:(NSDate *)date
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.timeZone = self.calendarManager.calendarAppearance.calendar.timeZone;
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    }
    
    if(!cacheCurrentDateText){
        cacheCurrentDateText = [dateFormatter stringFromDate:self.date];
    }
    
    NSString *dateText2 = [dateFormatter stringFromDate:date];
    
    if ([cacheCurrentDateText isEqualToString:dateText2]) {
        return YES;
    }
    
    return NO;
}

- (NSInteger)monthIndexForDate:(NSDate *)date
{
    NSCalendar *calendar = self.calendarManager.calendarAppearance.calendar;
    NSDateComponents *comps = [calendar components:NSCalendarUnitMonth fromDate:date];
    return comps.month;
}

- (void)reloadAppearance
{
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = self.calendarManager.calendarAppearance.dayTextFont;
    
    [self configureConstraintsForSubviews];
    [self setSelected:isSelected animated:NO];
}



@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 

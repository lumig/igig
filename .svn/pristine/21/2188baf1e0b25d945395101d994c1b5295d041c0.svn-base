//
//  JTCalendarView.m
//  dwt1220
//
//  Created by dwt on 15/11/1.
//  Copyright © 2015年 dwt. All rights reserved.
//

#import "JTCalendarView.h"
#import "DatelistTool.h"

@implementation JTCalendarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.calendar = [JTCalendar new];
        self.isFirstLoad = true;
        self.backgroundColor = [UIColor blackColor];
//        CGRect boundsFrame = [[[UIApplication sharedApplication]delegate]window].bounds;
        
        JTCalendarMenuView *calendarMenuView = [[JTCalendarMenuView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 25)];
        self.calendarMenuView = calendarMenuView;
        self.calendarMenuView.backgroundColor = [UIColor blackColor];
        
        JTCalendarContentView *calendarContentView = [[JTCalendarContentView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 200 - 10, self.frame.size.width, 200)];
        self.calendarContentView = calendarContentView;
        self.calendarContentView.backgroundColor = [UIColor blackColor];
        
        
        // All modifications on calendarAppearance have to be done before setMenuMonthsView and setContentView
        // Or you will have to call reloadAppearance
        {
            self.calendar.calendarAppearance.calendar.firstWeekday = 2; // Sunday == 1, Saturday == 7
            self.calendar.calendarAppearance.dayCircleRatio = 6.5 / 10.;
            self.calendar.calendarAppearance.ratioContentMenu = 1.;
        }
        
        [self.calendar setMenuMonthsView:self.calendarMenuView];
        [self.calendar setContentView:self.calendarContentView];
        [self.calendar setDataSource:self];
        [self addSubview:self.calendarMenuView];
        [self addSubview:self.calendarContentView];
    
    
    }
    return self;
}



- (void)reloadData{
    [self.calendar reloadData]; // Must be call in viewDidAppear
}

- (void)reloadDatelistWithDict:(NSDictionary *)dict{
    [DatelistTool shardInstance].dataDic = dict;
}


#pragma mark - JTCalendarDataSource

- (BOOL)calendarHaveEvent:(JTCalendar *)calendar date:(NSDate *)date
{
    return (rand() % 10) == 1;
}

- (void)calendarDidDateSelected:(JTCalendar *)calendar date:(NSDate *)date
{
    if (self.isFirstLoad) {
        self.calendar.currentDate = date;
        self.isFirstLoad = false;
        return ;
    }
    /**
     *  共3中通知
        kJTCalendarChangWeek
        kJTCalendarDateSelected
        kJTCalendarDateSameSelected
     */
    if (!self.calendar.calendarAppearance.isWeekMode) {
        
        self.calendar.currentDate = date;
        self.calendar.calendarAppearance.isWeekMode = !self.calendar.calendarAppearance.isWeekMode;
        [self transitionExample];
        
        self.calendar.calendarAppearance.dayCircleColorSelected = [UIColor whiteColor];
        self.calendar.calendarAppearance.dayTextColorSelected = [UIColor blackColor];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarChangWeek" object:@(self.calendar.calendarAppearance.isWeekMode)];

        [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarDateSelected" object:date];
        
     
    }else if (self.calendar.currentDate == date && self.calendar.calendarAppearance.isWeekMode) {
        
        self.calendar.calendarAppearance.isWeekMode = !self.calendar.calendarAppearance.isWeekMode;
        [self transitionExample];
        
        self.calendar.calendarAppearance.dayCircleColorSelected = [UIColor blackColor];
        self.calendar.calendarAppearance.dayTextColorSelected = [UIColor whiteColor];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarDateSameSelected" object:date];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarChangWeek" object:@(self.calendar.calendarAppearance.isWeekMode)];

    }else if(self.calendar.calendarAppearance.isWeekMode){
        
        self.calendar.currentDate = date;
        self.calendar.calendarAppearance.dayCircleColorSelected = [UIColor whiteColor];
        self.calendar.calendarAppearance.dayTextColorSelected = [UIColor blackColor];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"kJTCalendarDateSelected" object:date];
    }
    


}

#pragma mark - Transition examples

- (void)transitionExample
{
    CGFloat newHeight = 200;
    
    CGFloat selfy = self.frame.origin.y;
    NSLog(@"%i,%f",self.calendar.calendarAppearance.isWeekMode,selfy);

    if(self.calendar.calendarAppearance.isWeekMode){
        newHeight = 75.;
        selfy = selfy + 200-75;

    }else{
        selfy = selfy - (200-75);

    }
    
    [UIView animateWithDuration:.25
                     animations:^{
                         
                         CGRect newFrame = self.frame;
                         
                         newFrame.size.height = newHeight+25+10;
                         newFrame.origin.y = selfy;
                         
                         self.frame = newFrame;
                         
                        CGRect newContentViewFrame = self.calendarContentView.frame;
                         
                         newContentViewFrame.size.height = newHeight;
                         
                         self.calendarContentView.frame = newContentViewFrame;

                     }];
    
    [UIView animateWithDuration:.25
                     animations:^{
                         //                         self.calendarContentView.layer.opacity = 0.5;
                     }
                     completion:^(BOOL finished) {
                         [self.calendar reloadAppearance];
                         
                         [UIView animateWithDuration:.25
                                          animations:^{
                                              //                                              self.calendarContentView.layer.opacity = 1;
                                          }];
                     }];
    
    
}


@end

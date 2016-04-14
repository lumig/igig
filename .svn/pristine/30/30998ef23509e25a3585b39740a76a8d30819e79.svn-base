//
//  JTCalendarView.h
//  dwt1220
//
//  Created by dwt on 15/11/1.
//  Copyright © 2015年 dwt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTCalendar.h"

@interface JTCalendarView : UIView <JTCalendarDataSource>
@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;
@property (strong, nonatomic) JTCalendar *calendar;

@property (nonatomic,assign)BOOL isFirstLoad;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)reloadData;
- (void)reloadDatelistWithDict:(NSDictionary *)dict;
- (void)calendarDidDateSelected:(JTCalendar *)calendar date:(NSDate *)date;

@end

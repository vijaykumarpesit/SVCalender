//
//  SVCalenderDayPickerDataSource.m
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderDayPickerDataSource.h"
#import "NSDate+Utils.h"
#import <UIKit/UIKit.h>

@interface SVCalenderDayPickerDataSource ()
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *lastDate;
@property (nonatomic) NSCalendar *calendar;
@property (nonatomic) NSDate *startDateOfMonth;
@property (nonatomic) NSDate *lastDateOfMonth;
@end

@implementation SVCalenderDayPickerDataSource

- (instancetype)initWithStartDate:(NSDate *)startDate
                         lastDate:(NSDate *)lastDate
                         calender:(NSCalendar *)calendar {
    self = [super init];
    if (self) {
        self.calendar = calendar;
        self.startDate = startDate;
        self.lastDate = lastDate;
    }
    return self;
}

//Month is represented by section
- (NSInteger)numberOfSections {
    NSUInteger months = [[self.calendar components:NSCalendarUnitMonth
                                          fromDate:self.startDateOfMonth
                                            toDate:self.lastDateOfMonth
                                           options:0] month];
    return months+1; //Becoming little dumb here , Better way would be day>1||hour>1|| seconds>1 then only add +1 to month
}

//Assuming 7 days in a week, We can actually get the number of days from current calender, leaving as enhancement.
- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    NSDate *firstOfMonth = [self firstDateOfMonthFromDate:self.startDateOfMonth withMonthOffset:section];
    NSUInteger numberOfWeeksInMonth = [firstOfMonth numberOfWeeksRemainingInCurrentMonth] * 7;
    return numberOfWeeksInMonth;
}

- (NSDate *)dateAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDate *firstDayOfMonth = [self firstDateOfMonthFromDate:self.startDateOfMonth withMonthOffset:indexPath.section];
    NSInteger weekday = [[self.calendar components: NSCalendarUnitWeekday fromDate: firstDayOfMonth] weekday];
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDayOfMonth];
    NSUInteger numberOfDaysInMonth = range.length;
    
    if (indexPath.row < weekday || indexPath.row >= numberOfDaysInMonth + weekday) {
        return nil;
    } else {
        NSDateComponents *dateComponents = [NSDateComponents new];
        dateComponents.day = indexPath.item - weekday;
        NSDate *date = [self.calendar dateByAddingComponents:dateComponents toDate:firstDayOfMonth options:0];
        return date;
    }
}

- (NSIndexPath *)indexPathForDate:(NSDate *)date {
    
    NSUInteger section = [self sectionForDate:date];
    NSDate *firstDayOfMonth = [self firstDateOfMonthFromDate:self.startDateOfMonth withMonthOffset:section];
    NSInteger weekday = [[self.calendar components: NSCalendarUnitWeekday fromDate: firstDayOfMonth] weekday];
    NSInteger day = [[self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date] day];
    NSUInteger row = weekday+day;
    return [NSIndexPath indexPathForRow:row inSection:section];
}

- (NSInteger)sectionForDate:(NSDate *)date {
    return [self.calendar components:NSCalendarUnitMonth fromDate:self.startDateOfMonth toDate:date options:0].month;
}

- (NSDate *)firstDateOfMonthFromDate:(NSDate *)date withMonthOffset:(NSInteger)offset {
    NSDateComponents *dateOffset = [NSDateComponents new];
    dateOffset.month = offset;
    NSDate *offsetDate = [self.calendar dateByAddingComponents:dateOffset toDate:date options:0];
    return offsetDate;
}


//Starting of current month, current month day 1
- (NSDate *)startDateOfMonth {
    if (!_startDateOfMonth) {
        NSDateComponents *components = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                        fromDate:self.startDate];
        components.day = 1;
        _startDateOfMonth = [self.calendar dateFromComponents:components];
    }
    return _startDateOfMonth;
}

//current month end = 0th day of next month;
- (NSDate *)lastDateOfMonth {
    if(!_lastDateOfMonth) {
        NSDateComponents *components = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                        fromDate:self.lastDate];
        components.month++;
        components.day = 0;
        _lastDateOfMonth = [self.calendar dateFromComponents:components];
    }
    return _lastDateOfMonth;
}

- (void)setLastDate:(NSDate *)lastDate {
    NSDateComponents *components = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:lastDate];
    _lastDate =  [self.calendar dateFromComponents:components];
}

- (void)setStartDate:(NSDate *)startDate {
    NSDateComponents *components = [self.calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:startDate];
    _startDate =  [self.calendar dateFromComponents:components];
}
@end

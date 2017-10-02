//
//  SVCalenderDayPickerDataSource.m
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderDayPickerDataSource.h"
#import "NSDate+Utils.h"

@interface SVCalenderDayPickerDataSource ()
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *lastDate;
@property (nonatomic) NSCalendar *calendar;
@property (nonatomic) NSDate *startDateOfMonth;
@property (nonatomic) NSDate *lastDateOfMonth;
@end

@implementation SVCalenderDayPickerDataSource

- (instancetype)initWithFirstDate:(NSDate *)firstDate
                         lastDate:(NSDate *)lastDate
                         calender:(NSCalendar *)calendar {
    self = [super init];
    if (self) {
        _startDate = firstDate;
        _lastDate = lastDate;
        _calendar = calendar;
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

@end

//
//  NSDate+Utils.m
//  Calender
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

- (NSUInteger)numberOfWeeksRemainingInCurrentMonth {
    NSRange rangeOfWeeks = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                                              inUnit:NSCalendarUnitMonth
                                                             forDate:self];
    return rangeOfWeeks.length;
}

@end

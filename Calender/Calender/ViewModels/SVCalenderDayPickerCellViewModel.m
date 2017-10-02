//
//  SVCalenderDayPickerCellViewModel.m
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderDayPickerCellViewModel.h"

@interface SVCalenderDayPickerCellViewModel()
@property (nonatomic) NSDate *date;
@end

@implementation SVCalenderDayPickerCellViewModel

- (instancetype)initWithDate:(NSDate *)date {
    self = [super init];
    if (self) {
        _date = date;
        [self prepareViewModelWithDate:date];
    }
    return self;
}

- (void)prepareViewModelWithDate:(NSDate *)date {
    if (date) {
        self.titleLabelText = [[[self class] dateFormatter] stringFromDate:date];
        self.isToday = [[NSCalendar currentCalendar] isDateInToday:date];
    } else {
        self.titleLabelText = @"";
        self.isToday = NO;
    }
}

//Date Formatter initialisation is little costly, So using static one
+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"d";
    });
    return dateFormatter;
}


@end

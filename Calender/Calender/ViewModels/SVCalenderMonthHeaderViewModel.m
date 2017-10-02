//
//  SVCalenderMonthHeaderViewModel.m
//  Calender
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderMonthHeaderViewModel.h"

@interface SVCalenderMonthHeaderViewModel ()
@property (nonatomic) NSDate *date;
@end

@implementation SVCalenderMonthHeaderViewModel

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
    } else {
        self.titleLabelText = @"";
    }
}

//Date Formatter initialisation is little costly, So using static one
+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy LLLL" options:0 locale:[NSCalendar currentCalendar].locale];
    });
    return dateFormatter;
}

@end

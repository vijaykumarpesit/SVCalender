//
//  SVCalenderAgendaViewModel.m
//  Calender
//
//  Created by Vijay on 03/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderAgendaViewModel.h"

@implementation SVCalenderAgendaViewModel

- (NSArray < NSString *> *)hours {
    NSArray *hours = nil;
    if (self.isIn24HoursFormat) {
        hours = @[@"00:00",@"01:00",@"02:00",@"03:00",@"04:00",@"05:00",@"06:00",@"07:00",@"08:00",@"09:00",@"10:00",@"11:00",@"12:00",
                 @"13:00",@"14:00",@"15:00",@"16:00",@"17:00",@"18:00",@"19:00",@"20:00",@"21:00",@"22:00",@"23:00",@"00:00"];
    } else {
        hours =  @[@"12 AM",@"1 AM",@"2 AM",@"3 AM",@"4 AM",@"5 AM",@"6 AM",@"7 AM",@"8 AM",@"9 AM",@"10 AM",@"11 AM",
                   @"1 PM",@"2 PM",@"3 PM",@"4 PM",@"5 PM",@"6 PM",@"7 PM",@"8 PM",@"9 PM",@"10 PM",@"11 PM",@"12 PM"];
    }
    return hours;
}

@end

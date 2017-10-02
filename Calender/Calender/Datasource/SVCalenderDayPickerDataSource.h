//
//  SVCalenderDayPickerDataSource.h
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVCalenderDayPickerDataSourceProtocol.h"

@interface SVCalenderDayPickerDataSource : NSObject <SVCalenderDayPickerDataSourceProtocol>

- (instancetype)initWithStartDate:(NSDate *)firstDate
                         lastDate:(NSDate *)lastDate
                         calender:(NSCalendar *)calender;

@end

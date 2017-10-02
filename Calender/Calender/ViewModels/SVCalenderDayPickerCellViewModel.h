//
//  SVCalenderDayPickerCellViewModel.h
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVCalenderDayPickerCellViewModel : NSObject

- (instancetype)initWithDate:(NSDate *)date;

@property (nonatomic) NSString *titleLabelText;
@property (nonatomic) BOOL isToday;

@end

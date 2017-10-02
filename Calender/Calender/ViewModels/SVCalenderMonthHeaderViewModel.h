//
//  SVCalenderMonthHeaderViewModel.h
//  Calender
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVCalenderMonthHeaderViewModel : NSObject

- (instancetype)initWithDate:(NSDate *)date;

@property (nonatomic) NSString *titleLabelText;

@end

//
//  SVCalenderDayPickerDataSourceProtocol.h
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SVCalenderDayPickerDataSourceProtocol <NSObject>

- (NSInteger)numberOfSections;

- (NSInteger)numberOfItemsInSection:(NSInteger)section;


@end

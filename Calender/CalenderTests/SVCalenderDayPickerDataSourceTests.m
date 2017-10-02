//
//  SVCalenderDayPickerDataSourceTests.m
//  CalenderTests
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SVCalenderDayPickerDataSource.h"

@interface SVCalenderDayPickerDataSourceTests : XCTestCase
@end

//Could have created dataSource as property,didn't prefer since we loose the flexibility of creating dataSource with different startDate endDate

@implementation SVCalenderDayPickerDataSourceTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testNumberOfSections {
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [[NSDate date] dateByAddingTimeInterval:365*24*60*60];
    SVCalenderDayPickerDataSource *dataSource = [[SVCalenderDayPickerDataSource alloc]
                                                 initWithStartDate:startDate
                                                 lastDate:endDate
                                                 calender:[NSCalendar currentCalendar]];
    XCTAssertEqual([dataSource numberOfSections],13);
}

- (void)testNumberOfItemsInSection {
    
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [[NSDate date] dateByAddingTimeInterval:365*24*60*60];
    SVCalenderDayPickerDataSource *dataSource = [[SVCalenderDayPickerDataSource alloc]
                                                 initWithStartDate:startDate
                                                 lastDate:endDate
                                                 calender:[NSCalendar currentCalendar]];
    
    XCTAssertEqual([dataSource numberOfItemsInSection:3],35);
    XCTAssertEqual([dataSource numberOfItemsInSection:1],35);
    
}
@end

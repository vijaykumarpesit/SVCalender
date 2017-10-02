//
//  SVCalenderContainerViewController.m
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderContainerViewController.h"
#import "SVCalenderDayPicker.h"

@interface SVCalenderContainerViewController ()

@end

@implementation SVCalenderContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *lastDate = [NSDate dateWithTimeIntervalSinceNow:365*42*60*60];
    //Clean this shit once its tested
    SVCalenderDayPicker *dayPicker = [[SVCalenderDayPicker alloc] initWithFirstDate:[NSDate date] lastDate:lastDate calender:[NSCalendar currentCalendar]];
    [self.view addSubview:dayPicker.view];
    [self addChildViewController:dayPicker];
    [dayPicker.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [dayPicker.view setFrame:self.view.bounds];
}

@end

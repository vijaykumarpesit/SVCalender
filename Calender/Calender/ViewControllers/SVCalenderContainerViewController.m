//
//  SVCalenderContainerViewController.m
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderContainerViewController.h"
#import "SVCalenderDayPicker.h"
#import "SVCalenderAgendaViewController.h"

@interface SVCalenderContainerViewController ()

@end

@implementation SVCalenderContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Testing code, Actual container code will be written once I am done with agendaVC
    //Clean this shit once its tested
//    SVCalenderDayPicker *dayPicker = [[SVCalenderDayPicker alloc] init];
//    [self.view addSubview:dayPicker.view];
//    [self addChildViewController:dayPicker];
//    [dayPicker.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
//    [dayPicker.view setFrame:self.view.bounds];
    
        SVCalenderAgendaViewController *agendaVC = [[SVCalenderAgendaViewController alloc] init];
        [self.view addSubview:agendaVC.view];
        [self addChildViewController:agendaVC];
        [agendaVC.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [agendaVC.view setFrame:self.view.bounds];
    
}

@end

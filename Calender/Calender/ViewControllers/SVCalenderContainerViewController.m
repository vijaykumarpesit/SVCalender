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

static const CGFloat SVCalenderDayPickerHeight = 200.0f;

@interface SVCalenderContainerViewController ()
@property (nonatomic)SVCalenderAgendaViewController *agendaVC;
@property (nonatomic)SVCalenderDayPicker *dayPicker;

@end

@implementation SVCalenderContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureDayPickerView];
    [self configureAgendaView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)configureDayPickerView {
    //We can configure date range too using initialisation method
    SVCalenderDayPicker *dayPicker = [[SVCalenderDayPicker alloc] init];
    [self.view addSubview:dayPicker.view];
    dayPicker.view.translatesAutoresizingMaskIntoConstraints = NO;
    [dayPicker.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [dayPicker.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [dayPicker.view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;

    [dayPicker.view.heightAnchor constraintEqualToConstant:SVCalenderDayPickerHeight].active = YES;
    
    [dayPicker willMoveToParentViewController:self];
    [self addChildViewController:dayPicker];
    [dayPicker didMoveToParentViewController:self];
    self.dayPicker = dayPicker;
}

- (void)configureAgendaView {
    SVCalenderAgendaViewController *agendaVC = [[SVCalenderAgendaViewController alloc] init];
    [self.view addSubview:agendaVC.view];
    agendaVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [agendaVC.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [agendaVC.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [agendaVC.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [agendaVC.view.topAnchor constraintEqualToAnchor:self.dayPicker.view.bottomAnchor constant:20].active = YES;

    [agendaVC willMoveToParentViewController:self];
    [self addChildViewController:agendaVC];
    [agendaVC didMoveToParentViewController:self];
    self.agendaVC = agendaVC;
}

@end

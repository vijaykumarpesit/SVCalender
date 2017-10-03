//
//  SVCalenderAgendaViewController.m
//  Calender
//
//  Created by Vijay on 03/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderAgendaViewController.h"
#import "SVCalenderAgendaView.h"
#import "SVCalenderAgendaViewModel.h"

@interface SVCalenderAgendaViewController ()

@end

@implementation SVCalenderAgendaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureAgendaView];
}

- (void)configureAgendaView {
    SVCalenderAgendaView *agendaView = [[SVCalenderAgendaView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:agendaView];
    agendaView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [agendaView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [agendaView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [agendaView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [agendaView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    
    SVCalenderAgendaViewModel *model = [SVCalenderAgendaViewModel new];
    [agendaView setHours:[model hours]];
}

@end

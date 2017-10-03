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
    SVCalenderAgendaView *agendaView = [[SVCalenderAgendaView alloc] initWithFrame:self.view.bounds];
    agendaView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:agendaView];
    SVCalenderAgendaViewModel *model = [SVCalenderAgendaViewModel new];
    [agendaView setHours:[model hours]];
    
}
@end

//
//  SVCalenderAgendaView.m
//  Calender
//
//  Created by Vijay on 03/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderAgendaView.h"
#import "SVCalenderHourView.h"

static const CGFloat SVCalenderHourViewHeight = 40.0f;

@interface SVCalenderAgendaView()
@property (nonatomic) UIScrollView *scrollView;
@end

@implementation SVCalenderAgendaView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubViews];
    }
    return self;
}

- (void)configureSubViews {
    [self configureScrollView];
}
//ScrollView
- (void)configureScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:self.scrollView];
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [self.scrollView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.scrollView.widthAnchor constraintEqualToAnchor:self.widthAnchor].active = YES;
    [self.scrollView.heightAnchor constraintEqualToAnchor:self.heightAnchor].active = YES;
}

- (void)setHours:(NSArray<NSString *> *)hours {
    if (hours!= _hours) {
        [self configureHoursViewWithHours:hours];
        _hours = hours;
        
    }
}

//Could have written view model for this, But thought it may be over kill for this simple configuration
- (void)configureHoursViewWithHours:(NSArray *)hours {
    for(int i=0; i<hours.count; i++) {
        CGRect hourViewFrame = CGRectMake(0, i *SVCalenderHourViewHeight,CGRectGetWidth(self.bounds),SVCalenderHourViewHeight);
        NSString *hour = hours[i];
        SVCalenderHourView *hourView = [[SVCalenderHourView alloc] initWithFrame:hourViewFrame];
        hourView.hourLabel.text = hour;
        [self.scrollView addSubview:hourView];
    }
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.bounds), hours.count * SVCalenderHourViewHeight + 20);
}

@end

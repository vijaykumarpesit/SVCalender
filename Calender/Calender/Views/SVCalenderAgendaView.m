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
    [self.scrollView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
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
        NSString *hour = hours[i];
        SVCalenderHourView *hourView = [[SVCalenderHourView alloc] initWithFrame:CGRectZero];
        hourView.hourLabel.text = hour;
        [self.scrollView addSubview:hourView];
        [self configureConstraintsToHourView:hourView withIndex:i];
    }
    
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.bounds), hours.count * SVCalenderHourViewHeight + 20);
}

- (void)configureConstraintsToHourView:(UIView *)hourView withIndex:(NSUInteger)index {
    hourView.translatesAutoresizingMaskIntoConstraints = NO;
    [hourView.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor].active = YES;
    [hourView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:index *SVCalenderHourViewHeight].active = YES;
    [hourView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    [hourView.heightAnchor constraintEqualToConstant:SVCalenderHourViewHeight].active = YES;
}

@end

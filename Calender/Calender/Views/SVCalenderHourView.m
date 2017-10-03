//
//  SVCalenderHourView.m
//  Calender
//
//  Created by Vijay on 03/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderHourView.h"

@implementation SVCalenderHourView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubViews];
    }
    return self;
}

- (void)configureSubViews {
    self.hourLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.hourLabel];
    self.hourLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.hourLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5.0f].active = YES;
    [self.hourLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:0.0f].active = YES;
    [self.hourLabel setBackgroundColor:[UIColor clearColor]];
    
    UIView *seperator = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:seperator];
    seperator.translatesAutoresizingMaskIntoConstraints = NO;
    [seperator.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:50].active = YES;
    [seperator.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0].active = YES;
    [seperator.centerYAnchor constraintEqualToAnchor:self.hourLabel.centerYAnchor].active = YES;
    [seperator.heightAnchor constraintEqualToConstant:0.5].active = YES;
    [seperator setBackgroundColor:[UIColor grayColor]];
    
}

@end

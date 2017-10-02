//
//  SVCalenderMonthHeaderView.m
//  Calender
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderMonthHeaderView.h"

@implementation SVCalenderMonthHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubViews];
    }
    return self;
}
- (void)configureSubViews {
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleLabel];
    
    //Constraints
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
}

@end

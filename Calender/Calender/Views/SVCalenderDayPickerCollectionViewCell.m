//
//  SVCalenderDayPickerCollectionViewCell.m
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderDayPickerCollectionViewCell.h"
static const CGFloat SVCalenderDayPickerCellLabelSize = 30.0f;


@implementation SVCalenderDayPickerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubViews];
    }
    return self;
}

- (void)configureSubViews {
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_titleLabel];
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    self.titleLabel.layer.cornerRadius = SVCalenderDayPickerCellLabelSize/2;
    self.titleLabel.layer.masksToBounds = YES;

    //Constraints
    [self.titleLabel.widthAnchor constraintEqualToConstant:SVCalenderDayPickerCellLabelSize].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:SVCalenderDayPickerCellLabelSize].active = YES;
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    //Set the custom color 
}
@end

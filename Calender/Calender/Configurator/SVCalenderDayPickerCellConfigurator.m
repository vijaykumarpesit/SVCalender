//
//  SVCalenderDayPickerCellConfigurator.m
//  Calender
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderDayPickerCellConfigurator.h"
#import "SVCalenderDayPickerCellViewModel.h"
#import "SVCalenderDayPickerCollectionViewCell.h"

@implementation SVCalenderDayPickerCellConfigurator

+ (void)configureCell:(SVCalenderDayPickerCollectionViewCell *)cell withViewModel:(SVCalenderDayPickerCellViewModel *)viewModel {
    cell.titleLabel.text = viewModel.titleLabelText;
    if (viewModel.isToday) {
        [cell.titleLabel setBackgroundColor:[UIColor grayColor]];
    } else {
        [cell.titleLabel setBackgroundColor:[UIColor clearColor]];
        
    }
}

@end

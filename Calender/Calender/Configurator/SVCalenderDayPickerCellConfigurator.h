//
//  SVCalenderDayPickerCellConfigurator.h
//  Calender
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVCalenderDayPickerCollectionViewCell.h"
#import "SVCalenderDayPickerCellViewModel.h"

@interface SVCalenderDayPickerCellConfigurator : NSObject

+ (void)configureCell:(SVCalenderDayPickerCollectionViewCell *)cell withViewModel:(SVCalenderDayPickerCellViewModel *)viewModel;

@end

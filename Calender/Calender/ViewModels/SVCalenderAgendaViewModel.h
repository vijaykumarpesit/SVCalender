//
//  SVCalenderAgendaViewModel.h
//  Calender
//
//  Created by Vijay on 03/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVCalenderAgendaViewModel : NSObject

//Default is 12 hours format
@property(nonatomic) BOOL isIn24HoursFormat;
- (NSArray < NSString *> *)hours;
@end

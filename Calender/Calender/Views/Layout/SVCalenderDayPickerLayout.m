//
//  SVCalenderDayPickerLayout.m
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderDayPickerLayout.h"

@implementation SVCalenderDayPickerLayout

-(id)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 0.0f;
        self.minimumLineSpacing = 0.0f;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(2.0f,
                                             0,
                                             2.0f,
                                             0.0f);
        self.headerReferenceSize = CGSizeMake(0, 10.0f);
    }
    
    return self;
}

@end

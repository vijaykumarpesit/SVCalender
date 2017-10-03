//
//  SVCalenderDayPicker.m
//  Calender
//
//  Created by Vijay on 01/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderDayPicker.h"
#import "SVCalenderDayPickerLayout.h"
#import "SVCalenderDayPickerDataSource.h"
#import "SVCalenderDayPickerCollectionViewCell.h"
#import "SVCalenderDayPickerCellConfigurator.h"
#import "SVCalenderDayPickerCellViewModel.h"
#import "SVCalenderMonthHeaderView.h"
#import "SVCalenderMonthHeaderViewModel.h"

static NSTimeInterval const SVCALENDERYEAR_TIME_INTERVAL = 1*365*24*60*60;
static NSString *const SVCalendarDayPickerCellReuseIdentifier = @"sv.calendar.dayPicker.cell.identifier";
static NSString *const SVCalendarDayPickerHeaderReuseIdentifier = @"sv.calendar.dayPicker.header.identifier";

@interface SVCalenderDayPicker () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic) NSDate *firstDate;
@property (nonatomic) NSDate *lastDate;
@property (nonatomic) NSCalendar *calender;
@property (nonatomic) UICollectionView *dayPickerCollectionView;
@property (nonatomic) SVCalenderDayPickerDataSource *dataSource;
@end

@implementation SVCalenderDayPicker

#pragma mark -- Life Cycle methods

- (instancetype)initWithFirstDate:(NSDate *)firstDate lastDate:(NSDate *)lastDate  calender:(NSCalendar *)calender {
    self = [super init];
    if (self) {
        _firstDate = firstDate;
        _lastDate = lastDate;
        _calender = calender;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialiseDataSource];
    [self configureCollectionView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //Scroll calender to current date
    [self scrollCollectionViewToDate:[NSDate date]];
}

#pragma mark -- Collection View Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSource.numberOfSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource numberOfItemsInSection:section];
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SVCalenderDayPickerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SVCalendarDayPickerCellReuseIdentifier forIndexPath:indexPath];
    SVCalenderDayPickerCellViewModel *model = [[SVCalenderDayPickerCellViewModel alloc] initWithDate:[self.dataSource dateAtIndexPath:indexPath]];
    [SVCalenderDayPickerCellConfigurator configureCell:cell withViewModel:model];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //Take numberOf days in week as variable
    CGFloat itemWidth = CGRectGetWidth(collectionView.bounds)/7;
    return CGSizeMake(itemWidth, itemWidth);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        SVCalenderMonthHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                   withReuseIdentifier:SVCalendarDayPickerHeaderReuseIdentifier
                                                                                          forIndexPath:indexPath];
        SVCalenderMonthHeaderViewModel *model = [[SVCalenderMonthHeaderViewModel alloc] initWithDate:[self.dataSource dateAtIndexPath:[NSIndexPath indexPathForRow:15 inSection:indexPath.section]]];
        headerView.titleLabel.text = model.titleLabelText;
        return headerView;
        
    }
    
    return nil;
}

#pragma mark -- Collection View Delegate


#pragma mark -- Private methods

- (void)configureCollectionView {
    SVCalenderDayPickerLayout *layout = [[SVCalenderDayPickerLayout alloc] init];
    self.dayPickerCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.dayPickerCollectionView.delegate = self;
    self.dayPickerCollectionView.dataSource = self;
    self.dayPickerCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.dayPickerCollectionView];
    [self.dayPickerCollectionView setBackgroundColor:[UIColor whiteColor]];
    [self.dayPickerCollectionView registerClass:[SVCalenderDayPickerCollectionViewCell class] forCellWithReuseIdentifier:SVCalendarDayPickerCellReuseIdentifier];
    [self.dayPickerCollectionView registerClass:[SVCalenderMonthHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SVCalendarDayPickerHeaderReuseIdentifier];

    //Constraints
    [self.dayPickerCollectionView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
    [self.dayPickerCollectionView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    [self.dayPickerCollectionView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.dayPickerCollectionView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}

- (void)scrollCollectionViewToDate:(NSDate *)date {
    [self.view layoutIfNeeded];
    NSIndexPath *indexPath = [self.dataSource indexPathForDate:date];
    [self.dayPickerCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}


#pragma mark -- Lazy Accessors

- (NSDate *)firstDate {
    if (!_firstDate) {
        _firstDate = [[NSDate alloc] initWithTimeIntervalSinceNow: -SVCALENDERYEAR_TIME_INTERVAL];
    }
    return _firstDate;
}

- (NSDate *)lastDate {
    if (!_lastDate) {
        _lastDate = [[NSDate alloc] initWithTimeIntervalSinceNow: +SVCALENDERYEAR_TIME_INTERVAL];
    }
    return _lastDate;
}

- (NSCalendar *)calender {
    if (!_calender) {
        _calender = [NSCalendar currentCalendar];
    }
    return _calender;
}

- (void)initialiseDataSource {
    self.dataSource = [[SVCalenderDayPickerDataSource alloc]
                       initWithStartDate:self.firstDate
                       lastDate:self.lastDate
                       calender:self.calender];
}

@end

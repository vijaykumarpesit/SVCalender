//
//  SVCalenderCoreDataStack.h
//  Calender
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface SVCalenderCoreDataStack : NSObject

+ (SVCalenderCoreDataStack *)sharedStack;

@property (nonatomic) NSPersistentStoreCoordinator *storeCoordinator;
@property (nonatomic) NSManagedObjectContext *rootMOC;
@property (nonatomic) NSManagedObjectModel *managedObjectModel;

@end

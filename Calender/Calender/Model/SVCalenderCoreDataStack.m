//
//  SVCalenderCoreDataStack.m
//  Calender
//
//  Created by Vijay on 02/10/17.
//  Copyright © 2017 Svakriti. All rights reserved.
//

#import "SVCalenderCoreDataStack.h"

static NSString *const SVCalenderDBFilePath = @"SVCalenderEvent.sqlite";

@implementation SVCalenderCoreDataStack

+ (SVCalenderCoreDataStack *)sharedStack {
    static SVCalenderCoreDataStack *sharedStack = nil;
    static dispatch_once_t onceToken;
    if (!sharedStack) {
        dispatch_once(&onceToken, ^{
            sharedStack = [[SVCalenderCoreDataStack alloc] init];
        });
    }
    return sharedStack;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createCoreDataStack];
    }
    
    return self;
}

- (void)createCoreDataStack {
    [self setupManagedObjectModel];
    [self setupPersistentStoreCoordinator];
    [self setupRootMOC];
}

- (void)setupRootMOC {
    NSPersistentStoreCoordinator *coordinator = [self storeCoordinator];
    self.rootMOC =  [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [self.rootMOC setPersistentStoreCoordinator:coordinator];
    [self.rootMOC setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
}

- (void)setupManagedObjectModel {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Calender" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
}

- (void)setupPersistentStoreCoordinator {
    NSURL *storeURL = nil;
    NSString *storePath = [self dbDirectory];
    storePath = [storePath stringByAppendingPathComponent:SVCalenderDBFilePath];
    storeURL = [NSURL fileURLWithPath:storePath];
    NSManagedObjectModel *model = [self managedObjectModel];
    self.storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    NSError *error = nil;
    
    NSPersistentStore *eventStore = [self.storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                        configuration:nil
                                                                                  URL:storeURL
                                                                              options:options
                                                                                error:&error];
    if (!eventStore) {
        NSLog(@"Event store could not be created with error %@", [error description]);
    }
}

- (NSString *)dbDirectory {
    NSString *dirPath = nil;
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([filePaths count] > 0) {
        dirPath =  [[filePaths objectAtIndex:0] copy];
    }
    dirPath = [dirPath stringByAppendingPathComponent:@"CalenderEvent"];
    [self createDirIfNeededAtPath:dirPath];
    
    return dirPath;
}

- (void)createDirIfNeededAtPath:(NSString *)path {
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = nil;
    
    if (![fm fileExistsAtPath:path]) {
        [fm createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    if (error) {
        NSLog(@"Error while Creating directory at path %@ error %@",path,error);
    }
}
@end

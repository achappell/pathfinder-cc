//
//  PFCPersistentStack.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCPersistentStack.h"
#import <RestKit/RestKit.h>

@interface PFCPersistentStack ()

@property (nonatomic,strong,readwrite) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) NSURL* modelURL;
@property (nonatomic,strong) NSString* storePath;

@end

@implementation PFCPersistentStack

- (id)initWithStorePath:(NSString *)storePath modelURL:(NSURL*)modelURL
{
    self = [super init];
    if (self) {
        self.storePath = storePath;
        self.modelURL = modelURL;
        [self setupManagedObjectContext];
    }
    return self;
}

- (void)setupManagedObjectContext
{
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    // Initialize the Core Data stack
    [managedObjectStore createPersistentStoreCoordinator];
    
    NSError *error;
    NSPersistentStore __unused *persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:self.storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    [managedObjectStore createManagedObjectContexts];
    
    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    
    self.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
    
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
    
    [RKObjectManager sharedManager].managedObjectStore = managedObjectStore;
}

- (NSManagedObjectModel*)managedObjectModel
{
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
}

@end

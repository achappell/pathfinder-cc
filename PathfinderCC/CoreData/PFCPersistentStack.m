//
//  PFCPersistentStack.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCPersistentStack.h"

@interface PFCPersistentStack ()

@property (nonatomic,strong,readwrite) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,strong) NSURL* modelURL;
@property (nonatomic,strong) NSString* storePath;
@property (nonatomic,strong) NSString* configuration;
@property (nonatomic,strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation PFCPersistentStack

- (id)initWithStorePath:(NSString *)storePath modelURL:(NSURL*)modelURL configuration:(NSString *)configuration
{
    self = [super init];
    if (self) {
        _storePath = storePath;
        _modelURL = modelURL;
        _configuration = configuration;
    }
    return self;
}

- (void)setupManagedObjectContext
{
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    self.persistentStoreCoordinator = persistentStoreCoordinator;
    
    NSURL *storeURL = [NSURL fileURLWithPath:self.storePath];
    
    NSError *error;
    NSPersistentStore __unused *persistentStore = [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:self.configuration URL:storeURL options:nil error:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    
    self.managedObjectContext = managedObjectContext;
    
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
}

- (NSManagedObjectModel*)managedObjectModel
{
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
}

@end

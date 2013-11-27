//
//  PFCCoreRulebookBuilderTests.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCCoreRulebookBuilder.h"
#import <RestKit/RestKit.h>
#import <RKEntityMapping.h>
#import <RKManagedObjectStore.h>
#import "PFCPersistentStack.h"

@interface PFCCoreRulebookBuilderTests : XCTestCase

@property (nonatomic, strong) PFCCoreRulebookBuilder *builder;
@property (nonatomic, strong) PFCPersistentStack *coreRulebookPersistentStack;

@end

@implementation PFCCoreRulebookBuilderTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.

    self.coreRulebookPersistentStack = [[PFCPersistentStack alloc] initWithStorePath:[[self coreRulebookStoreURL] path] modelURL:[self coreRulebookModelURL]];
    self.builder = [[PFCCoreRulebookBuilder alloc] init];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (NSURL*)coreRulebookStoreURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"testCoreRulebookDB.sqlite"];
}

- (NSURL*)coreRulebookModelURL
{
    return [[NSBundle mainBundle] URLForResource:@"CoreRulebook" withExtension:@"momd"];
}

- (void)testImportHappensSuccessfully
{
    RKManagedObjectStore *rkStore = [RKManagedObjectStore defaultStore];
    
    NSString *seedPath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"MySeedDatabase.sqlite"];
    RKManagedObjectImporter *importer = [[RKManagedObjectImporter alloc] initWithManagedObjectModel:rkStore.managedObjectModel storePath:seedPath];

    XCTAssertTrue([self.builder importDataWithImporter:importer], @"Import should happen successfully");
}

@end

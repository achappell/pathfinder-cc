//
//  PathfinderCCTests.m
//  PathfinderCCTests
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCPersistentStack.h"
#import "PFCStore.h"
#import "PFCCharacter.h"
#import <OCMock/OCMock.h>

@interface PathfinderCCTests : XCTestCase

@property (nonatomic, strong) PFCPersistentStack* persistentStack;

@end

@implementation PathfinderCCTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    [[NSFileManager defaultManager] removeItemAtURL:[self storeURL] error:nil];
}

- (NSURL*)storeURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"testdb.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
}

- (void)testPersistentStack
{
    self.persistentStack = [[PFCPersistentStack alloc] initWithStorePath:[[self storeURL] path] modelURL:[self modelURL]];
    
    PFCStore *store = [[PFCStore alloc] init];
    store.managedObjectContext = self.persistentStack.managedObjectContext;
    PFCCharacter *selectedCharacter = [store selectedCharacter];
    
    XCTAssertNil(selectedCharacter, @"Selected Character should be nil for empty database");
}

@end

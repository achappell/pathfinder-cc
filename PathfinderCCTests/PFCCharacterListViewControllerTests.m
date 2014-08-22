//
//  PFCCharacterListViewControllerTests.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 4/21/14.
//  Copyright (c) 2014 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCCharacterListViewController.h"
#import "PFCPersistentStack.h"

@interface PFCCharacterListViewControllerTests : XCTestCase

@property (nonatomic, strong) PFCCharacterListViewController *viewController;
@property (nonatomic, strong) PFCPersistentStack *characterPersistentStack;

@end

@implementation PFCCharacterListViewControllerTests

- (void)setUp
{
    [super setUp];
    
    self.characterPersistentStack = [[PFCPersistentStack alloc] initWithStorePath:[[self storeURL] path] modelURL:[self modelURL] configuration:@"UserData"];
    [self.characterPersistentStack setupManagedObjectContext];
    PFCStore *store = [[PFCStore alloc] init];
    store.characterManagedObjectContext = self.characterPersistentStack.managedObjectContext;
    
    self.viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CharacterList"];
    [self.viewController setStore:store];
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.viewController viewDidLoad];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewDidLoad
{
    XCTAssert(TRUE, @"If it gets here, it passes");
}

- (NSURL*)storeURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"characterDB.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"CoreRulebook" withExtension:@"momd"];
}

@end

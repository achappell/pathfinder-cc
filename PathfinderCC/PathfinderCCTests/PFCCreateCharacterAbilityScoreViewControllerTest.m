//
//  PFCCreateCharacterAbilityScoreViewControllerTest.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/16/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCCreateCharacterAbilityScoreViewController.h"
#import <OCMock/OCMock.h>
#import "PFCPersistentStack.h"
#import "PFCStore.h"

@interface PFCCreateCharacterAbilityScoreViewControllerTest : XCTestCase

@property (nonatomic, strong) id viewControllerMock;
@property (nonatomic, strong) PFCCreateCharacterAbilityScoreViewController *viewController;

@end

@implementation PFCCreateCharacterAbilityScoreViewControllerTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    self.viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PFCCreateCharacterAbilityScoreViewController"];
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
    self.viewControllerMock = [OCMockObject partialMockForObject:self.viewController];
    
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
    
    self.viewControllerMock = nil;
    self.viewController = nil;
}

- (void)testMakeViewController
{
    PFCCreateCharacterAbilityScoreViewController *viewController = [[PFCCreateCharacterAbilityScoreViewController alloc] initWithNibName:nil bundle:nil];
    
    XCTAssertNotNil(viewController, @"View Controller should not be nil");
}

- (void)testShouldRegisterForNotificationsOnViewDidLoad
{
    [[self.viewControllerMock expect] registerForKeyboardNotifications];
    
    [self.viewControllerMock viewDidLoad];
    
    [self.viewControllerMock verify];
}

- (void)testRegisterForNotificationsProperly
{
    [[self.viewControllerMock expect] keyboardWasShown:[OCMArg any]];
    [[self.viewControllerMock expect] keyboardWillBeHidden:[OCMArg any]];
    
    [self.viewControllerMock registerForKeyboardNotifications];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillHideNotification object:nil];
    
    [self.viewControllerMock verify];
}

- (void)testShouldGoToNextInRightScenario
{
    self.viewController.strengthTextField.text = @"12";
    self.viewController.dexterityTextField.text = @"12";
    self.viewController.constitutionTextField.text = @"12";
    self.viewController.wisdomTextField.text = @"12";
    self.viewController.intelligenceTextField.text = @"12";
    self.viewController.charismaTextField.text = @"12";
    
    XCTAssertTrue([self.viewController shouldAllowNextNavigation], @"When all fields are valid, should allow next navigation");
}

- (void)testShouldNotGoToNextWithNoData
{
    XCTAssertFalse([self.viewController shouldAllowNextNavigation], @"When all fields are not valid, should not allow next navigation");
}

- (void)testShouldNotGotToNextWithoutDexterity
{
    self.viewController.strengthTextField.text = @"12";
    self.viewController.constitutionTextField.text = @"12";
    self.viewController.wisdomTextField.text = @"12";
    self.viewController.intelligenceTextField.text = @"12";
    self.viewController.charismaTextField.text = @"12";
    
    XCTAssertFalse([self.viewController shouldAllowNextNavigation], @"When all fields are not valid, should not allow next navigation");
}

- (void)testShouldNotGotToNextWithoutConstitution
{
    self.viewController.strengthTextField.text = @"12";
    self.viewController.dexterityTextField.text = @"12";
    self.viewController.wisdomTextField.text = @"12";
    self.viewController.intelligenceTextField.text = @"12";
    self.viewController.charismaTextField.text = @"12";
    
    XCTAssertFalse([self.viewController shouldAllowNextNavigation], @"When all fields are not valid, should not allow next navigation");
}

- (void)testShouldNotGotToNextWithoutWisdom
{
    self.viewController.strengthTextField.text = @"12";
    self.viewController.dexterityTextField.text = @"12";
    self.viewController.constitutionTextField.text = @"12";
    self.viewController.intelligenceTextField.text = @"12";
    self.viewController.charismaTextField.text = @"12";
    
    XCTAssertFalse([self.viewController shouldAllowNextNavigation], @"When all fields are not valid, should not allow next navigation");
}

- (void)testShouldNotGotToNextWithoutIntelligence
{
    self.viewController.strengthTextField.text = @"12";
    self.viewController.dexterityTextField.text = @"12";
    self.viewController.constitutionTextField.text = @"12";
    self.viewController.wisdomTextField.text = @"12";
    self.viewController.charismaTextField.text = @"12";
    
    XCTAssertFalse([self.viewController shouldAllowNextNavigation], @"When all fields are not valid, should not allow next navigation");
}

- (void)testShouldNotGotToNextWithoutCharisma
{
    self.viewController.strengthTextField.text = @"12";
    self.viewController.dexterityTextField.text = @"12";
    self.viewController.constitutionTextField.text = @"12";
    self.viewController.wisdomTextField.text = @"12";
    self.viewController.intelligenceTextField.text = @"12";
    
    XCTAssertFalse([self.viewController shouldAllowNextNavigation], @"When all fields are not valid, should not allow next navigation");
}

- (void)testCreateCharacterWithValidInfo
{
    PFCPersistentStack *persistentStack = [[PFCPersistentStack alloc] initWithStorePath:[[self storeURL] path] modelURL:[self modelURL]];
    
    PFCStore *store = [[PFCStore alloc] init];
    store.characterManagedObjectContext = persistentStack.managedObjectContext;
    self.viewController.store = store;
    
    self.viewController.strengthTextField.text = @"12";
    self.viewController.dexterityTextField.text = @"12";
    self.viewController.constitutionTextField.text = @"12";
    self.viewController.wisdomTextField.text = @"12";
    self.viewController.intelligenceTextField.text = @"12";
    self.viewController.charismaTextField.text = @"12";

    PFCCharacter *character = [self.viewController createCharacter];
    
    XCTAssertNotNil(character, @"Character should be created successfully.");
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

@end

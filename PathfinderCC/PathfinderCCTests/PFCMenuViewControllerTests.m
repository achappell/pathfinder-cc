//
//  PFCMenuViewControllerTests.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCMenuViewController.h"
#import <objc/runtime.h>

@interface PFCMenuViewControllerTests : XCTestCase

@property (nonatomic, strong) PFCMenuViewController *viewController;

@end

@implementation PFCMenuViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    self.viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PFCMenuViewController"];
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
    
    self.viewController = nil;
}

- (void)testViewControllerHasTableViewProperty
{
    objc_property_t tableviewProperty = class_getProperty([self.viewController class], "tableView");
    XCTAssertTrue(tableviewProperty != NULL, @"ViewController should have a tableview");
}

- (void)testViewControllerHasOneSection
{
    [self.viewController viewDidLoad];
    
    NSInteger numberOfSections = [self.viewController.tableView numberOfSections];
    
    XCTAssertTrue(numberOfSections == 1, @"There should only be one section in the tableview");
}

- (void)testViewControllerHasOneRow
{
    [self.viewController viewDidLoad];
    
    NSInteger numberOfRows = [self.viewController.tableView numberOfRowsInSection:0];
    
    XCTAssertTrue(numberOfRows == 1, @"There should only be one row in the first section");
}

- (void)testViewControllerHasManageCharactersRow
{
    [self.viewController viewDidLoad];
    [self.viewController.tableView reloadData];
    
    UITableViewCell *cell = [self.viewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    XCTAssertTrue([cell.textLabel.text isEqualToString:@"Manage Characters"], @"The first row should be to manage characters");
}

@end

//
//  PFCCreateCharacterNameViewControllerTests.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCCreateCharacterNameViewController.h"

@interface PFCCreateCharacterNameViewControllerTests : XCTestCase

@property (nonatomic, strong) PFCCreateCharacterNameViewController *viewController;

@end

@implementation PFCCreateCharacterNameViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    self.viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PFCCreateCharacterNameViewController"];
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testViewDidLoadCreates9Alignments
{
    [self.viewController viewDidLoad];
    XCTAssertTrue([self.viewController.alignments count] == 9, @"There should be 9 alignments created");
}

- (void)testViewDidLoadSetsSelectedAlignment
{
    [self.viewController viewDidLoad];
    XCTAssertTrue([self.viewController.selectedAlignment isEqualToString:PFCAlignmentLawfulGood], @"The default selected alignment should be Lawful Good");
}

@end

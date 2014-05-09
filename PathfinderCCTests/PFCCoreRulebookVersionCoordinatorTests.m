//
//  PFCCoreRulebookVersionCoordinatorTests.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCCoreRulebookVersionCoordinator.h"

@interface PFCCoreRulebookVersionCoordinatorTests : XCTestCase

@property (nonatomic, strong) PFCCoreRulebookVersionCoordinator *versionCoordinator;

@end

@implementation PFCCoreRulebookVersionCoordinatorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    self.versionCoordinator = [[PFCCoreRulebookVersionCoordinator alloc] initWithJSONURL:[[NSBundle mainBundle] URLForResource:@"testcorerulebook" withExtension:@"json"]];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testLatestVersion
{
    XCTAssertTrue([self.versionCoordinator latestVersion] == 10, @"Latest version of test json should be 10");
}

- (void)testIfUpToDate
{
    XCTAssertFalse([self.versionCoordinator isCoreRulebookUpToDate], @"CoreRulebook should not be up to date");
}

@end

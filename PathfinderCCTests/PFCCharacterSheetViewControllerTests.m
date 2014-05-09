//
//  PFCCharacterSheetViewControllerTests.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCCharacterSheetViewController.h"
#import "PFCAbilityScoreCollectionViewCell.h"
#import <OCMock/OCMock.h>

@interface PFCCharacterSheetViewControllerTests : XCTestCase

@property (nonatomic, strong) PFCCharacterSheetViewController *viewController;

@end

@implementation PFCCharacterSheetViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    self.viewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"CharacterSheet"];
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.viewController viewDidLoad];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testShouldConfigureViewOnAwakeFromNib
{
    PFCAbilityScoreCollectionViewCell *cell = (PFCAbilityScoreCollectionViewCell *)[self.viewController.collectionView dequeueReusableCellWithReuseIdentifier:@"AbilityHeader" forIndexPath:nil];
    id cellMock = [OCMockObject partialMockForObject:cell];
    
    [[cellMock expect] configureViews];
    
    [cellMock awakeFromNib];
    
    [cellMock verify];
}



@end

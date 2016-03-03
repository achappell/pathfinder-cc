//
//  PathfinderCCTests.m
//  PathfinderCCTests
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PFCStore.h"
#import <OCMock/OCMock.h>
#import "PFCWrittenTextField.h"

@interface PathfinderCCTests : XCTestCase

@property (nonatomic, strong) PFCStore* store;

@end

@implementation PathfinderCCTests

//- (void)setUp
//{
//    [super setUp];
//    // Put setup code here. This method is called before the invocation of each test method in the class.
//    
//    self.persistentStack = [[PFCPersistentStack alloc] initWithStorePath:[[self storeURL] path] modelURL:[self modelURL] configuration:@"UserData"];
//    [self.persistentStack setupManagedObjectContext];
//    self.coreRulebookPersistentStack = [[PFCPersistentStack alloc] initWithStorePath:[[self storeURL] path] modelURL:[self modelURL] configuration:@"CoreRulebook"];
//    
//    self.store = [[PFCStore alloc] init];
//    self.store.characterManagedObjectContext = self.persistentStack.managedObjectContext;
//    self.store.coreRulebookManagedObjectContext = self.coreRulebookPersistentStack.managedObjectContext;
//}
//
//- (void)tearDown
//{
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//    
//    [[NSFileManager defaultManager] removeItemAtURL:[self storeURL] error:nil];
//}
//
//- (NSURL*)storeURL
//{
//    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
//    return [documentsDirectory URLByAppendingPathComponent:@"testCharacterDB.sqlite"];
//}
//
//- (NSURL*)modelURL
//{
//    return [[NSBundle mainBundle] URLForResource:@"CoreRulebook" withExtension:@"momd"];
//}
//
//- (PFCCharacter *)defaultCharacterWithName:(NSString *)name
//{
//    NSNumber *strength = @(11);
//    AbilityScore *strengthScore = [AbilityScore insertItemWithBaseScore:strength type:PFCAbilityTypeStrength inManagedObjectContext:self.store.characterManagedObjectContext];
//    
//    NSNumber *dexterity = @(12);
//    AbilityScore *dexterityScore = [AbilityScore insertItemWithBaseScore:dexterity type:PFCAbilityTypeDexterity inManagedObjectContext:self.store.characterManagedObjectContext];
//    
//    NSNumber *constitution = @(13);
//    AbilityScore *constitutionScore = [AbilityScore insertItemWithBaseScore:constitution type:PFCAbilityTypeConstitution inManagedObjectContext:self.store.characterManagedObjectContext];
//    
//    NSNumber *intelligence = @(14);
//    AbilityScore *intelligenceScore = [AbilityScore insertItemWithBaseScore:intelligence type:PFCAbilityTypeIntelligence inManagedObjectContext:self.store.characterManagedObjectContext];
//    
//    NSNumber *wisdom = @(15);
//    AbilityScore *wisdomScore = [PFCAbilityScore insertItemWithBaseScore:wisdom type:PFCAbilityTypeWisdom inManagedObjectContext:self.store.characterManagedObjectContext];
//    
//    NSNumber *charisma = @(16);
//    AbilityScore *charismaScore = [PFCAbilityScore insertItemWithBaseScore:charisma type:PFCAbilityTypeCharisma inManagedObjectContext:self.store.characterManagedObjectContext];
//    
//    PFCCharacter *character = [PFCCharacter insertItemWithAbilityScores:[NSSet setWithObjects:strengthScore, dexterityScore, constitutionScore, intelligenceScore, wisdomScore, charismaScore, nil] inManagedObjectContext:self.store.characterManagedObjectContext];
//    character.name = name;
//    
//    return character;
//}
//
//- (void)testEmptyPersistentStack
//{
//    PFCCharacter *selectedCharacter = [self.store selectedCharacter];
//    
//    XCTAssertNil(selectedCharacter, @"Selected Character should be nil for empty database");
//}
//
//- (void)testCreateCharacter
//{
//    PFCCharacter *character = [self defaultCharacterWithName:@"Amanda"];
//    
//    NSError *error;
//    [self.store.characterManagedObjectContext save:&error];
//    
//    XCTAssertNil(error, @"Save error should be nil");
//    XCTAssertNotNil(character, @"Can create character in context.");
//    XCTAssertTrue([character.strength.baseScore integerValue] == 11, @"Strength score is valid");
//    XCTAssertTrue([character.dexterity.baseScore integerValue] == 12, @"Strength score is valid");
//    XCTAssertTrue([character.constitution.baseScore integerValue] == 13, @"Strength score is valid");
//    XCTAssertTrue([character.intelligence.baseScore integerValue] == 14, @"Strength score is valid");
//    XCTAssertTrue([character.wisdom.baseScore integerValue] == 15, @"Strength score is valid");
//    XCTAssertTrue([character.charisma.baseScore integerValue] == 16, @"Strength score is valid");
//}
//
//- (void)testSetSelectedCharacter
//{
//    PFCCharacter *character = [self defaultCharacterWithName:@"Amanda"];
//    PFCCharacter *character2 = [self defaultCharacterWithName:@"John"];
//    
//    NSError *error;
//    [self.store.characterManagedObjectContext save:&error];
//    
//    [self.store setSelectedCharacter:character];
//    
//    XCTAssertNil(error, @"Saving should not have error");
//    XCTAssertNotNil([self.store selectedCharacter], @"After setting selected character, should be able to retrieve it");
//    XCTAssertTrue(character.selected, @"Character should be marked as selected");
//    XCTAssertFalse(character2.selected, @"Character 2 should not be marked as selected");
//}
//
//- (void)testRecoverFromMultipleSelectedCharacters
//{
//    PFCCharacter *character = [self defaultCharacterWithName:@"Amanda"];
//    character.selected = YES;
//    PFCCharacter *character2 = [self defaultCharacterWithName:@"John"];
//    character2.selected = YES;
//    [self.store setSelectedCharacter:character];
//    
//    NSError *error;
//    [self.store.characterManagedObjectContext save:&error];
//    
//    XCTAssertNil(error, @"Saving should not have error");
//    XCTAssertNotNil([self.store selectedCharacter], @"After setting selected character, should be able to retrieve it");
//    XCTAssertTrue(character.selected, @"Character should be marked as selected");
//    XCTAssertFalse(character2.selected, @"Character 2 should not be marked as selected");
//}
//
//- (void)testFetchCharacterByName
//{
//    PFCCharacter *character = [self defaultCharacterWithName:@"Amanda"];
//    
//    PFCCharacter *character2 = [self.store characterWithName:@"Amanda"];
//    
//    NSError *error;
//    [self.store.characterManagedObjectContext  save:&error];
//    
//    XCTAssertNil(error, @"Saving should not have error");
//    XCTAssertEqualObjects(character, character2, @"Character fetched by name should be the one just created");
//}
//
//- (void)testWrittenTextField
//{
//    PFCWrittenTextField *textField = [[PFCWrittenTextField alloc] init];
//    
//    textField.text = @"test";
//    
//    XCTAssertEqualObjects(textField.text, @"test", @"The written text field should properly take text");
//}

@end

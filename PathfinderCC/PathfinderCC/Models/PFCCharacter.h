//
//  PFCCharacter.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PFCAbilityScore;

@interface PFCCharacter : NSManagedObject

@property (nonatomic, retain) NSSet *baseAbilityScores;
@end

@interface PFCCharacter (CoreDataGeneratedAccessors)

- (void)addBaseAbilityScoresObject:(PFCAbilityScore *)value;
- (void)removeBaseAbilityScoresObject:(PFCAbilityScore *)value;
- (void)addBaseAbilityScores:(NSSet *)values;
- (void)removeBaseAbilityScores:(NSSet *)values;

+ (NSString*)entityName;
+ (instancetype)insertItemWithAbilityScores:(NSSet *)abilityScores
                     inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

- (PFCAbilityScore *)strength;
- (PFCAbilityScore *)dexterity;
- (PFCAbilityScore *)constitution;
- (PFCAbilityScore *)intelligence;
- (PFCAbilityScore *)wisdom;
- (PFCAbilityScore *)charisma;

@end

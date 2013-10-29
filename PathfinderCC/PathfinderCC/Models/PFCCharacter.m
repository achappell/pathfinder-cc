//
//  PFCCharacter.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCharacter.h"
#import "PFCAbilityScore.h"


@implementation PFCCharacter

@dynamic baseAbilityScores;

+ (instancetype)insertItemWithAbilityScores:(NSSet *)abilityScores
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    PFCCharacter* character = [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                               inManagedObjectContext:managedObjectContext];
    
    character.baseAbilityScores = abilityScores;
    
    return character;
}

+ (NSString*)entityName
{
    return @"PFCCharacter";
}

- (PFCAbilityScore *)strength
{
    for (PFCAbilityScore *abilityScore in self.baseAbilityScores)
        if ([abilityScore.type integerValue] == PFCAbilityTypeStrength )
            return abilityScore;

    return nil;
}

- (PFCAbilityScore *)dexterity
{
    for (PFCAbilityScore *abilityScore in self.baseAbilityScores)
        if ([abilityScore.type integerValue] == PFCAbilityTypeDexterity )
            return abilityScore;
    
    return nil;
}

- (PFCAbilityScore *)constitution
{
    for (PFCAbilityScore *abilityScore in self.baseAbilityScores)
        if ([abilityScore.type integerValue] == PFCAbilityTypeConstitution )
            return abilityScore;
    
    return nil;
}

- (PFCAbilityScore *)intelligence
{
    for (PFCAbilityScore *abilityScore in self.baseAbilityScores)
        if ([abilityScore.type integerValue] == PFCAbilityTypeIntelligence )
            return abilityScore;
    
    return nil;
}

- (PFCAbilityScore *)wisdom
{
    for (PFCAbilityScore *abilityScore in self.baseAbilityScores)
        if ([abilityScore.type integerValue] == PFCAbilityTypeWisdom )
            return abilityScore;
    
    return nil;
}

- (PFCAbilityScore *)charisma
{
    for (PFCAbilityScore *abilityScore in self.baseAbilityScores)
        if ([abilityScore.type integerValue] == PFCAbilityTypeCharisma )
            return abilityScore;
    
    return nil;
}

@end

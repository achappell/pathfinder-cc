//
//  PFCAbilityScore.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCAbilityScore.h"


@implementation PFCAbilityScore

@dynamic baseScore;
@dynamic abilityModifier;
@dynamic tempAdjustment;
@dynamic tempModifier;
@dynamic character;
@dynamic type;

+ (instancetype)insertItemWithBaseScore:(NSNumber *)baseScore type:(PFCAbilityType)type
                     inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    PFCAbilityScore* abilityScore = [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                                            inManagedObjectContext:managedObjectContext];
    
    abilityScore.baseScore = baseScore;
    abilityScore.type = @(type);
    
    return abilityScore;
}

+ (NSString*)entityName
{
    return @"PFCAbilityScore";
}

@end

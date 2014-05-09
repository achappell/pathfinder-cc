//
//  PFCAbilityScore.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef enum PFCAbilityType : NSInteger {
    PFCAbilityTypeStrength = 0,
    PFCAbilityTypeDexterity = 1,
    PFCAbilityTypeConstitution = 2,
    PFCAbilityTypeIntelligence = 3,
    PFCAbilityTypeWisdom = 4,
    PFCAbilityTypeCharisma = 5
} PFCAbilityType;

@interface PFCAbilityScore : NSManagedObject

@property (nonatomic, retain) NSNumber * baseScore;
@property (nonatomic, retain) NSNumber * abilityModifier;
@property (nonatomic, retain) NSNumber * tempAdjustment;
@property (nonatomic, retain) NSNumber * tempModifier;
@property (nonatomic, retain) NSManagedObject *character;
@property (nonatomic, retain) NSNumber * type;

+ (NSString*)entityName;
+ (instancetype)insertItemWithBaseScore:(NSNumber *)baseScore type:(PFCAbilityType)type
                 inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

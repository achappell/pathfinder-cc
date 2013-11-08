//
//  PFCRace.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/8/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PFCAbilityScore, PFCCoreRulebook;

@interface PFCRace : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * physicalDescription;
@property (nonatomic, retain) NSString * society;
@property (nonatomic, retain) NSString * relations;
@property (nonatomic, retain) NSString * alignmentAndReligion;
@property (nonatomic, retain) NSString * adventures;
@property (nonatomic, retain) PFCCoreRulebook *coreRulebook;
@property (nonatomic, retain) NSSet *modifiers;
@end

@interface PFCRace (CoreDataGeneratedAccessors)

- (void)addModifiersObject:(PFCAbilityScore *)value;
- (void)removeModifiersObject:(PFCAbilityScore *)value;
- (void)addModifiers:(NSSet *)values;
- (void)removeModifiers:(NSSet *)values;

@end

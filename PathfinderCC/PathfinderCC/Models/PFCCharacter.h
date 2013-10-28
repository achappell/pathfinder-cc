//
//  PFCCharacter.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PFCAbilityScore.h"

@interface PFCCharacter : NSObject

- (id)initWithAbilityScores:(NSArray *)abilityScores;

@property (nonatomic, readonly) PFCAbilityScore *strength;
@property (nonatomic, readonly) PFCAbilityScore *dexterity;
@property (nonatomic, readonly) PFCAbilityScore *constitution;
@property (nonatomic, readonly) PFCAbilityScore *intelligence;
@property (nonatomic, readonly) PFCAbilityScore *wisdom;
@property (nonatomic, readonly) PFCAbilityScore *charisma;

@end

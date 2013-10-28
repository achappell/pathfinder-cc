//
//  PFCCharacter.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCharacter.h"

@interface PFCCharacter()

@property (nonatomic, strong) PFCAbilityScore *strength;
@property (nonatomic, strong) PFCAbilityScore *dexterity;
@property (nonatomic, strong) PFCAbilityScore *constitution;
@property (nonatomic, strong) PFCAbilityScore *intelligence;
@property (nonatomic, strong) PFCAbilityScore *wisdom;
@property (nonatomic, strong) PFCAbilityScore *charisma;

@end

@implementation PFCCharacter

- (id)initWithAbilityScores:(NSArray *)abilityScores
{
    self = [super init];
    if (self) {
        
        if ([abilityScores count] == 6)
        {
            _strength = abilityScores[0];
            _dexterity = abilityScores[1];
            _constitution = abilityScores[2];
            _intelligence = abilityScores[3];
            _wisdom = abilityScores[4];
            _charisma = abilityScores[5];
        }
    }
    return self;
}

@end

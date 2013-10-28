//
//  PFCAbilityScore.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFCAbilityScore : NSObject

@property (nonatomic, copy) NSNumber *baseAbilityScore;
@property (nonatomic, copy) NSNumber *abilityModifier;
@property (nonatomic, copy) NSNumber *tempAdjustment;
@property (nonatomic, copy) NSNumber *tempModifier;
@property (nonatomic) NSInteger calculatedAbilityScore;

@end

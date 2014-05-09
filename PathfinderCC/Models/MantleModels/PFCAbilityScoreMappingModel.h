//
//  PFCAbilityScoreMappingModel.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/1/14.
//  Copyright (c) 2014 Amanda Chappell. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface PFCAbilityScoreMappingModel : MTLModel <MTLManagedObjectSerializing, MTLJSONSerializing>

@property (nonatomic, retain) NSNumber * baseScore;
@property (nonatomic, retain) NSNumber * abilityModifier;
@property (nonatomic, retain) NSNumber * tempAdjustment;
@property (nonatomic, retain) NSNumber * tempModifier;
@property (nonatomic, retain) NSNumber * type;

@end

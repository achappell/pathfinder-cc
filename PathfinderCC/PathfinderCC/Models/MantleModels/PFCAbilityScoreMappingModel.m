//
//  PFCAbilityScoreMappingModel.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/1/14.
//  Copyright (c) 2014 Amanda Chappell. All rights reserved.
//

#import "PFCAbilityScoreMappingModel.h"
#import "PFCAbilityScore.h"

@implementation PFCAbilityScoreMappingModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"baseScore": @"baseScore",
             @"type": @"type",
             @"abilityModifier": @"abilityModifier"};
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{@"baseScore": @"baseScore",
             @"type": @"type",
             @"abilityModifier": @"abilityModifier"};
}

+ (NSString *)managedObjectEntityName
{
    return @"PFCAbilityScore";
}

@end

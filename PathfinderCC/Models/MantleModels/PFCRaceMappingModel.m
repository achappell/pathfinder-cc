//
//  PFCRaceMappingModel.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/1/14.
//  Copyright (c) 2014 Amanda Chappell. All rights reserved.
//

#import "PFCRaceMappingModel.h"
#import "PFCAbilityScore.h"
#import "PFCAbilityScoreMappingModel.h"

@implementation PFCRaceMappingModel 

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"name": @"name",
             @"physicalDescription": @"physicalDescription",
             @"alignmentAndReligion": @"alignmentAndReligion"};
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{@"name": @"name",
             @"physicalDescription": @"physicalDescription",
             @"alignmentAndReligion": @"alignmentAndReligion"};
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey
{
    return @{@"modifiers": [PFCAbilityScore class]};
}

+ (NSString *)managedObjectEntityName
{
    return @"PFCRace";
}

+ (NSValueTransformer *)modifiersJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[PFCAbilityScoreMappingModel class]];
}

@end

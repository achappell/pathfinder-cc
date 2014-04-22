//
//  PFCCoreRulebookMappingModel.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/1/14.
//  Copyright (c) 2014 Amanda Chappell. All rights reserved.
//

#import "PFCCoreRulebookMappingModel.h"
#import "PFCRace.h"
#import "PFCRaceMappingModel.h"

@implementation PFCCoreRulebookMappingModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"races": @"races"};
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{@"races": @"races"};
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey
{
    return @{@"races": [PFCRace class]};
}

+ (NSString *)managedObjectEntityName
{
    return @"PFCCoreRulebook";
}

+ (NSValueTransformer *)racesJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[PFCRaceMappingModel class]];
}

@end

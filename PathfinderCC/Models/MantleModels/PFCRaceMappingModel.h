//
//  PFCRaceMappingModel.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/1/14.
//  Copyright (c) 2014 Amanda Chappell. All rights reserved.
//

#import <Mantle/Mantle.h>

@class PFCCoreRulebook;

@interface PFCRaceMappingModel : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * physicalDescription;
@property (nonatomic, retain) NSString * society;
@property (nonatomic, retain) NSString * relations;
@property (nonatomic, retain) NSString * alignmentAndReligion;
@property (nonatomic, retain) NSString * adventures;
@property (nonatomic, retain) NSSet *modifiers;

@end

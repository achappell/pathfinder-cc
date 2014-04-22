//
//  PFCCoreRulebookMappingModel.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/1/14.
//  Copyright (c) 2014 Amanda Chappell. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface PFCCoreRulebookMappingModel : MTLModel <MTLManagedObjectSerializing, MTLJSONSerializing>

@property (nonatomic, copy) NSArray *races;

@end

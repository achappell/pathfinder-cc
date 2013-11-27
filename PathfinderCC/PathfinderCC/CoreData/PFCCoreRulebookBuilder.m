//
//  PFCCoreRulebookBuilder.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCoreRulebookBuilder.h"
#import <RestKit/RestKit.h>
#import <RKEntityMapping.h>
#import <RKManagedObjectStore.h>

@implementation PFCCoreRulebookBuilder

- (void)buildLatestCoreRulebook
{
    RKManagedObjectStore *rkStore = [RKManagedObjectStore defaultStore];
    
    NSString *seedPath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"MySeedDatabase.sqlite"];
    RKManagedObjectImporter *importer = [[RKManagedObjectImporter alloc] initWithManagedObjectModel:rkStore.managedObjectModel storePath:seedPath];
    
    BOOL success = [self importDataWithImporter:importer];
    if (success) {
        [importer logSeedingInfo];
    }
}

- (BOOL)importDataWithImporter:(RKManagedObjectImporter *)importer
{
    RKManagedObjectStore *rkStore = [RKManagedObjectStore defaultStore];
    
    RKEntityMapping *abilityMapping = [RKEntityMapping mappingForEntityForName:@"PFCAbilityScore" inManagedObjectStore:rkStore];
    [abilityMapping addAttributeMappingsFromArray:@[@"baseScore", @"type"]];
    
    RKEntityMapping *raceMapping = [RKEntityMapping mappingForEntityForName:@"PFCRace" inManagedObjectStore:rkStore];
    [raceMapping addAttributeMappingsFromArray:@[@"name",@"physicalDescription", @"adventures", @"alignmentAndReligion", @"relations", @"society"]];
    [raceMapping addRelationshipMappingWithSourceKeyPath:@"modifiers" mapping:abilityMapping];
    
    RKEntityMapping *rulebookMapping = [RKEntityMapping mappingForEntityForName:@"PFCCoreRulebook" inManagedObjectStore:rkStore];
    [rulebookMapping addRelationshipMappingWithSourceKeyPath:@"races" mapping:raceMapping];
    
    NSError *error;
    NSBundle *mainBundle = [NSBundle mainBundle];
    [importer importObjectsFromItemAtPath:[mainBundle pathForResource:@"corerulebook" ofType:@"json"]
                              withMapping:rulebookMapping
                                  keyPath:@"coreRulebook"
                                    error:&error];
    
    return [importer finishImporting:&error];
}

@end

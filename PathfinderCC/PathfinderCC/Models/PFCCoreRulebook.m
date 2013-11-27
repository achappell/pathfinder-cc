//
//  PFCCoreRulebook.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/8/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCoreRulebook.h"
#import "PFCRace.h"


@implementation PFCCoreRulebook

@dynamic races;

+ (instancetype)insertItemInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    PFCCoreRulebook* coreRulebook = [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                                            inManagedObjectContext:managedObjectContext];
    
    return coreRulebook;
}

+ (NSString*)entityName
{
    return @"PFCCoreRulebook";
}


@end

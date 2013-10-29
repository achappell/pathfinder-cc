//
//  PFCStore.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCStore.h"
#import <CoreData/CoreData.h>
#import "PFCCharacter.h"

@implementation PFCStore

- (PFCCharacter *)rootCharacter
{
    // todo: use a cache?
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"PFCCharacter"];
    NSArray* objects = [self.managedObjectContext executeFetchRequest:request error:NULL];
    PFCCharacter* rootCharacter = [objects lastObject];
    return rootCharacter;
}

@end

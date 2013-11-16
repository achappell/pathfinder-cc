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

- (PFCCharacter *)selectedCharacter
{
    // todo: use a cache?
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"PFCCharacter"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"selected == 1"];
    request.predicate = predicate;
    NSArray* objects = [self.managedObjectContext executeFetchRequest:request error:NULL];
    PFCCharacter* rootCharacter = [objects lastObject];
    return rootCharacter;
}

- (void)setSelectedCharacter:(PFCCharacter *)character
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"PFCCharacter"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"selected == 1"];
    request.predicate = predicate;
    NSArray* objects = [self.managedObjectContext executeFetchRequest:request error:NULL];
    
    [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        PFCCharacter *deselectedCharacter = (PFCCharacter *)obj;
        deselectedCharacter.selected = NO;
    }];
    
    character.selected = YES;
}

- (PFCCharacter *)characterWithName:(NSString *)name
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"PFCCharacter"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",name];
    request.predicate = predicate;
    NSArray* objects = [self.managedObjectContext executeFetchRequest:request error:NULL];
    PFCCharacter* rootCharacter = [objects lastObject];
    return rootCharacter;
}

@end

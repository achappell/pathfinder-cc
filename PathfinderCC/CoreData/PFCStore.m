//
//  PFCStore.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCStore.h"
#import <CoreData/CoreData.h>
#import "PathfinderCC-Swift.h"

@implementation PFCStore

- (Character *)selectedCharacter
{
    // todo: use a cache?
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"PFCCharacter"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"selected == 1"];
    request.predicate = predicate;
    NSArray* objects = [self.characterManagedObjectContext executeFetchRequest:request error:NULL];
    Character* rootCharacter = [objects lastObject];
    return rootCharacter;
}

- (void)setSelectedCharacter:(Character *)character
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"PFCCharacter"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"selected == 1"];
    request.predicate = predicate;
    NSArray* objects = [self.characterManagedObjectContext executeFetchRequest:request error:NULL];
    
    [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Character *deselectedCharacter = (Character *)obj;
        deselectedCharacter.selected = NO;
    }];
    
    character.selected = @(YES);
}

- (Character *)characterWithName:(NSString *)name
{
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"PFCCharacter"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",name];
    request.predicate = predicate;
    NSArray* objects = [self.characterManagedObjectContext executeFetchRequest:request error:NULL];
    Character* rootCharacter = [objects lastObject];
    return rootCharacter;
}

- (CoreRulebook *)coreRulebook
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"PFCCoreRulebook"];
    NSArray *objects = [self.coreRulebookManagedObjectContext executeFetchRequest:request error:NULL];
    CoreRulebook *coreRulebook = [objects lastObject];
    return coreRulebook;
}

@end

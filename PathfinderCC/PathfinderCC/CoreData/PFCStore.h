//
//  PFCStore.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFCCharacter;

@interface PFCStore : NSObject

@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;

- (PFCCharacter *)selectedCharacter;
- (void)setSelectedCharacter:(PFCCharacter *)character;

@end

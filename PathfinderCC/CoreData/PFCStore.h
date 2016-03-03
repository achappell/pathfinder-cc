//
//  PFCStore.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//



#import <Foundation/Foundation.h>

@class Character;
@class CoreRulebook;

@interface PFCStore : NSObject

@property (nonatomic, strong) NSManagedObjectContext *characterManagedObjectContext;
@property (nonatomic, strong) NSManagedObjectContext *coreRulebookManagedObjectContext;

- (Character *)selectedCharacter;
- (void)setSelectedCharacter:(Character *)character;
- (Character *)characterWithName:(NSString *)name;
- (CoreRulebook *)coreRulebook;

@end

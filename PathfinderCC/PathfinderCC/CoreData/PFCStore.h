//
//  PFCStore.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFCCharacter;
@class PFCCoreRulebook;

@interface PFCStore : NSObject

@property (nonatomic, strong) NSManagedObjectContext *characterManagedObjectContext;
@property (nonatomic, strong) NSManagedObjectContext *coreRulebookManagedObjectContext;

- (PFCCharacter *)selectedCharacter;
- (void)setSelectedCharacter:(PFCCharacter *)character;
- (PFCCharacter *)characterWithName:(NSString *)name;
- (PFCCoreRulebook *)coreRulebook;

@end

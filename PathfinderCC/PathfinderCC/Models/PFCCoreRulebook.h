//
//  PFCCoreRulebook.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/8/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PFCRace;

@interface PFCCoreRulebook : NSManagedObject

@property (nonatomic, retain) NSSet *races;
@end

@interface PFCCoreRulebook (CoreDataGeneratedAccessors)

- (void)addRacesObject:(PFCRace *)value;
- (void)removeRacesObject:(PFCRace *)value;
- (void)addRaces:(NSSet *)values;
- (void)removeRaces:(NSSet *)values;

@end

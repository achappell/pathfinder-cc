//
//  PFCCoreRulebookBuilder.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PFCStore.h"
#import <RKManagedObjectImporter.h>

@interface PFCCoreRulebookBuilder : NSObject

@property (nonatomic, strong) PFCStore *store;

- (void)buildLatestCoreRulebook;
- (BOOL)importDataWithImporter:(RKManagedObjectImporter *)importer;

@end

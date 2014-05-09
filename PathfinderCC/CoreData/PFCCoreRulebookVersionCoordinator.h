//
//  PFCCoreRulebookVersionCoordinator.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PFCStore.h"

@interface PFCCoreRulebookVersionCoordinator : NSObject

@property (nonatomic, strong) PFCStore *store;
@property (nonatomic, strong) NSDictionary *coreRulebookDictionary;

- (NSInteger)latestVersion;
- (id)initWithJSONURL:(NSURL *)jsonURL;
- (BOOL)isCoreRulebookUpToDate;

@end

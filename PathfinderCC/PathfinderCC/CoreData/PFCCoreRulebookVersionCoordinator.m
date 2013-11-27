//
//  PFCCoreRulebookVersionCoordinator.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 11/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCoreRulebookVersionCoordinator.h"

@interface PFCCoreRulebookVersionCoordinator ()

@property (nonatomic, strong) NSURL *jsonURL;

@end

@implementation PFCCoreRulebookVersionCoordinator

- (id)initWithJSONURL:(NSURL *)jsonURL
{
    self = [super init];
    if (self) {
        _jsonURL = jsonURL;
    }
    return self;
}

- (BOOL)isCoreRulebookUpToDate
{
    return ([self currentVersion] >= [self latestVersion]);
}

- (NSInteger)currentVersion
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"PFCCoreRulebookVersion"];
}

- (NSInteger)latestVersion
{
    NSNumber *version = [self.coreRulebookDictionary objectForKey:@"version"];
    
    if (version)
        return [version integerValue];
    
    return 0;
}

- (NSURL *)coreRulebookJSONURL
{
    if (self.jsonURL)
    {
        return self.jsonURL;
    }
    return [[NSBundle mainBundle] URLForResource:@"corerulebook" withExtension:@"json"];
}

- (NSDictionary *)coreRulebookDictionary
{
    if (_coreRulebookDictionary)
        return _coreRulebookDictionary;
    
    NSError *error = nil;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[self coreRulebookJSONURL] path] options:0 error:&error];
    _coreRulebookDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    return _coreRulebookDictionary;
}

@end

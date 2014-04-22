//
//  PFCPersistentStack.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/28/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PFCPersistentStack : NSObject

- (id)initWithStorePath:(NSString *)storePath modelURL:(NSURL*)modelURL configuration:(NSString *)configuration;

@property (nonatomic,strong,readonly) NSManagedObjectContext* managedObjectContext;

@end

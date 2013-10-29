//
//  PFCAppDelegate.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCAppDelegate.h"
#import "PFCCharacterSheetViewController.h"
#import "PFCAbilityScore.h"
#import "PFCPersistentStack.h"
#import "PFCStore.h"

@interface PFCAppDelegate ()

@property (nonatomic, strong) PFCPersistentStack* persistentStack;
@property (nonatomic, strong) PFCStore *store;

@end

@implementation PFCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.persistentStack = [[PFCPersistentStack alloc] initWithStoreURL:[self storeURL] modelURL:[self modelURL]];
    self.store = [[PFCStore alloc] init];
    self.store.managedObjectContext = self.persistentStack.managedObjectContext;
    
    PFCCharacter *rootCharacter = [self.store rootCharacter];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    PFCCharacterSheetViewController *characterSheetViewController = tabBarController.viewControllers[0];
    characterSheetViewController.store = self.store;
    characterSheetViewController.character = rootCharacter;
    
    return YES;
}

- (NSURL*)storeURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSError *error;
    
    [self.store.managedObjectContext save:&error];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

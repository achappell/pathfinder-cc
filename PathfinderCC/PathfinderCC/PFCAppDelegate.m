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
#import "PFCMenuViewController.h"
#import <RestKit/RestKit.h>

@interface PFCAppDelegate ()

@property (nonatomic, strong) PFCPersistentStack *characterPersistentStack;
@property (nonatomic, strong) PFCPersistentStack *coreRulebookPersistentStack;
@property (nonatomic, strong) PFCStore *store;

@end

@implementation PFCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.characterPersistentStack = [[PFCPersistentStack alloc] initWithStorePath:[[self characterStoreURL] path] modelURL:[self characterModelURL]];
    self.store = [[PFCStore alloc] init];
    self.store.characterManagedObjectContext = self.characterPersistentStack.managedObjectContext;
    
    self.coreRulebookPersistentStack = [[PFCPersistentStack alloc] initWithStorePath:[[self coreRulebookStoreURL] path] modelURL:[self coreRulebookModelURL]];
    self.store.coreRulebookManagedObjectContext = self.coreRulebookPersistentStack.managedObjectContext;
    
    PFCCharacter *selectedCharacter = [self.store selectedCharacter];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    PFCCharacterSheetViewController *characterSheetViewController = tabBarController.viewControllers[0];
    characterSheetViewController.store = self.store;
    characterSheetViewController.character = selectedCharacter;
    
    UINavigationController *navController = tabBarController.viewControllers[1];
    PFCMenuViewController *menuViewController = (PFCMenuViewController *)navController.topViewController;
    menuViewController.store = self.store;
    
    return YES;
}

- (NSURL*)characterStoreURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"characterDB.sqlite"];
}

- (NSURL*)characterModelURL
{
    return [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
}

- (NSURL*)coreRulebookStoreURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"coreRulebookDB.sqlite"];
}

- (NSURL*)coreRulebookModelURL
{
    return [[NSBundle mainBundle] URLForResource:@"CoreRulebook" withExtension:@"momd"];
}

#ifdef DEBUG
+ (void)initialize {
    [[NSUserDefaults standardUserDefaults] setValue:@"XCTestLog,GTMCodeCoverageTests"
                                             forKey:@"XCTestObserverClass"];
}
#endif

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
    
    [self.store.characterManagedObjectContext saveToPersistentStore:&error];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

extern void __gcov_flush(void);

- (void)applicationWillTerminate:(UIApplication*)application {
    __gcov_flush();
}

@end

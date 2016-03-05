//
//  AppDelegate.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import CoreData
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        MagicalRecord.setupCoreDataStack()
        
        let coreRulebookCoordinator = CoreRulebookCoordinator(jsonURL: nil)
        coreRulebookCoordinator.isCoreRulebookUpToDate()
        
        return true
    }
}


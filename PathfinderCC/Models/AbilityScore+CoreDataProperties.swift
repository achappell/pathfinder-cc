//
//  AbilityScore+CoreDataProperties.swift
//  
//
//  Created by Amanda Chappell on 3/2/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension AbilityScore {

    @NSManaged var abilityModifier: NSNumber?
    @NSManaged var baseScore: NSNumber?
    @NSManaged var tempAdjustment: NSNumber?
    @NSManaged var tempModifier: NSNumber?
    @NSManaged var type: NSNumber?
    @NSManaged var race: Race?

}

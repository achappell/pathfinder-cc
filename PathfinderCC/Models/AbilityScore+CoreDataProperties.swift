//
//  AbilityScore+CoreDataProperties.swift
//  
//
//  Created by Amanda Chappell on 3/3/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension AbilityScore {

    @NSManaged var abilityModifier: Int16
    @NSManaged var baseScore: Int16
    @NSManaged var tempAdjustment: Int16
    @NSManaged var tempModifier: Int16
    @NSManaged var type: Int16
    @NSManaged var character: Character?
    @NSManaged var race: Race?

}

//
//  Skill+CoreDataProperties.swift
//  
//
//  Created by Amanda Chappell on 3/5/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Skill {

    @NSManaged var modifier: Modifier?
    @NSManaged var abilityScore: AbilityScore?

}

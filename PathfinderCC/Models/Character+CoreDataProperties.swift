//
//  Character+CoreDataProperties.swift
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

extension Character {

    @NSManaged var age: NSNumber?
    @NSManaged var alignment: String?
    @NSManaged var gender: String?
    @NSManaged var name: String?
    @NSManaged var selected: NSNumber?
    @NSManaged var baseAbilityScores: NSSet?

}

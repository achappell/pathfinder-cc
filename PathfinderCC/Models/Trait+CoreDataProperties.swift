//
//  Trait+CoreDataProperties.swift
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

extension Trait {

    @NSManaged var value: Int16
    @NSManaged var type: Int16
    @NSManaged var originalText: String
    @NSManaged var race: Race?

}

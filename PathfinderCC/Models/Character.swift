//
//  Character.swift
//  
//
//  Created by Amanda Chappell on 3/2/16.
//
//

import Foundation
import CoreData

@objc(Character)
class Character: NSManagedObject {

    class func insertItemWithAbilityScores(abilityScores: Set<AbilityScore>) -> Character {
        
        let character = Character.MR_createEntity()!
        
        character.baseAbilityScores = abilityScores
        
        return character
    }
    
    class func allCharactersFetchedResultsController() -> NSFetchedResultsController {
        return Character.MR_fetchAllWithDelegate(nil)
    }
    
    func abilityScoreOfType(abilityType: AbilityType) -> AbilityScore? {
        if let abilityScores = baseAbilityScores {
            for abilityScore in abilityScores as! Set<AbilityScore> {
                if let type = abilityScore.type {
                    if type.integerValue == abilityType.rawValue {
                        return abilityScore
                    }
                }
            }
        }
        
        return nil
    }
    
    func strength() -> AbilityScore? {
        return abilityScoreOfType(.Strength)
    }
    
    func dexterity() -> AbilityScore? {
        return abilityScoreOfType(.Dexterity)
    }
    
    func constitution() -> AbilityScore? {
        return abilityScoreOfType(.Constitution)
    }
    
    func intelligence() -> AbilityScore? {
        return abilityScoreOfType(.Intelligence)
    }
    
    func wisdom() -> AbilityScore? {
        return abilityScoreOfType(.Wisdom)
    }
    
    func charisma() -> AbilityScore? {
        return abilityScoreOfType(.Charisma)
    }

}

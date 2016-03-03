//
//  AbilityScore.swift
//  
//
//  Created by Amanda Chappell on 3/2/16.
//
//

import Foundation
import CoreData

@objc enum AbilityType : Int {
    case Strength
    case Dexterity
    case Constitution
    case Intelligence
    case Wisdom
    case Charisma
}

@objc(AbilityScore)
class AbilityScore: NSManagedObject {

    class func insertItemWithBaseScore(baseScore: NSNumber, type: AbilityType) -> AbilityScore {
        
        let abilityScore = AbilityScore.MR_createEntity()!
        abilityScore.baseScore = baseScore
    
    
        return abilityScore
    }

}

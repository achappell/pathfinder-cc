//
//  AbilityScoreCollectionViewCell.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import Foundation

class AbilityScoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet var strengthLabel: UILabel!
    @IBOutlet var dexterityLabel: UILabel!
    @IBOutlet var constitutionLabel: UILabel!
    @IBOutlet var intelligenceLabel: UILabel!
    @IBOutlet var wisdomLabel: UILabel!
    @IBOutlet var charismaLabel: UILabel!
    
    @IBOutlet var strengthModLabel: UILabel!
    @IBOutlet var dexterityModLabel: UILabel!
    @IBOutlet var constitutionModLabel: UILabel!
    @IBOutlet var intelligenceModLabel: UILabel!
    @IBOutlet var wisdomModLabel: UILabel!
    @IBOutlet var charismaModLabel: UILabel!
    
    @IBOutlet var strengthTempAdjLabel: UILabel!
    @IBOutlet var dexterityTempAdjLabel: UILabel!
    @IBOutlet var constitutionTempAdjLabel: UILabel!
    @IBOutlet var intelligenceTempAdjLabel: UILabel!
    @IBOutlet var wisdomTempAdjLabel: UILabel!
    @IBOutlet var charismaTempAdjLabel: UILabel!
    
    @IBOutlet var strengthTempModLabel: UILabel!
    @IBOutlet var dexterityTempModLabel: UILabel!
    @IBOutlet var constitutionTempModLabel: UILabel!
    @IBOutlet var intelligenceTempModLabel: UILabel!
    @IBOutlet var wisdomTempModLabel: UILabel!
    @IBOutlet var charismaTempModLabel: UILabel!
    
    var character : Character? {
        didSet {
            
            if let character = self.character {
                strengthLabel.text = String(format: "%\(2)d", character.strength().baseScore)
                dexterityLabel.text = String(format: "%\(2)d", character.dexterity().baseScore)
                constitutionLabel.text = String(format: "%\(2)d", character.constitution().baseScore)
                intelligenceLabel.text = String(format: "%\(2)d", character.intelligence().baseScore)
                wisdomLabel.text = String(format: "%\(2)d", character.wisdom().baseScore)
                charismaLabel.text = String(format: "%\(2)d", character.charisma().baseScore)
                
                strengthModLabel.text = String(format: "%\(2)d", character.strength().abilityModifier)
                dexterityModLabel.text = String(format: "%\(2)d", character.dexterity().abilityModifier)
                constitutionModLabel.text = String(format: "%\(2)d", character.constitution().abilityModifier)
                intelligenceModLabel.text = String(format: "%\(2)d", character.intelligence().abilityModifier)
                wisdomModLabel.text = String(format: "%\(2)d", character.wisdom().abilityModifier)
                charismaModLabel.text = String(format: "%\(2)d", character.charisma().abilityModifier)
                
                strengthTempAdjLabel.text = String(format: "%\(2)d", character.strength().tempAdjustment)
                dexterityTempAdjLabel.text = String(format: "%\(2)d", character.dexterity().tempAdjustment)
                constitutionTempAdjLabel.text = String(format: "%\(2)d", character.constitution().tempAdjustment)
                intelligenceTempAdjLabel.text = String(format: "%\(2)d", character.intelligence().tempAdjustment)
                wisdomTempAdjLabel.text = String(format: "%\(2)d", character.wisdom().tempAdjustment)
                charismaTempAdjLabel.text = String(format: "%\(2)d", character.charisma().tempAdjustment)
                
                strengthTempModLabel.text = String(format: "%\(2)d", character.strength().tempModifier)
                dexterityTempModLabel.text = String(format: "%\(2)d", character.dexterity().tempModifier)
                constitutionTempModLabel.text = String(format: "%\(2)d", character.constitution().tempModifier)
                intelligenceTempModLabel.text = String(format: "%\(2)d", character.intelligence().tempModifier)
                wisdomTempModLabel.text = String(format: "%\(2)d", character.wisdom().tempModifier)
                charismaTempModLabel.text = String(format: "%\(2)d", character.charisma().tempModifier)
            }
        }
    }
    
    func configureViews() {
        
        strengthLabel.layer.borderColor = UIColor.blackColor().CGColor
        strengthLabel.layer.borderWidth = 1
        dexterityLabel.layer.borderColor = UIColor.blackColor().CGColor
        dexterityLabel.layer.borderWidth = 1
        constitutionLabel.layer.borderColor = UIColor.blackColor().CGColor
        constitutionLabel.layer.borderWidth = 1
        intelligenceLabel.layer.borderColor = UIColor.blackColor().CGColor
        intelligenceLabel.layer.borderWidth = 1
        wisdomLabel.layer.borderColor = UIColor.blackColor().CGColor
        wisdomLabel.layer.borderWidth = 1
        charismaLabel.layer.borderColor = UIColor.blackColor().CGColor
        charismaLabel.layer.borderWidth = 1
        
        strengthModLabel.layer.borderColor = UIColor.blackColor().CGColor
        strengthModLabel.layer.borderWidth = 1
        dexterityModLabel.layer.borderColor = UIColor.blackColor().CGColor
        dexterityModLabel.layer.borderWidth = 1
        constitutionModLabel.layer.borderColor = UIColor.blackColor().CGColor
        constitutionModLabel.layer.borderWidth = 1
        intelligenceModLabel.layer.borderColor = UIColor.blackColor().CGColor
        intelligenceModLabel.layer.borderWidth = 1
        wisdomModLabel.layer.borderColor = UIColor.blackColor().CGColor
        wisdomModLabel.layer.borderWidth = 1
        charismaModLabel.layer.borderColor = UIColor.blackColor().CGColor
        charismaModLabel.layer.borderWidth = 1
        
        strengthTempAdjLabel.layer.borderColor = UIColor.blackColor().CGColor
        strengthTempAdjLabel.layer.borderWidth = 1
        dexterityTempAdjLabel.layer.borderColor = UIColor.blackColor().CGColor
        dexterityTempAdjLabel.layer.borderWidth = 1
        constitutionTempAdjLabel.layer.borderColor = UIColor.blackColor().CGColor
        constitutionTempAdjLabel.layer.borderWidth = 1
        intelligenceTempAdjLabel.layer.borderColor = UIColor.blackColor().CGColor
        intelligenceTempAdjLabel.layer.borderWidth = 1
        wisdomTempAdjLabel.layer.borderColor = UIColor.blackColor().CGColor
        wisdomTempAdjLabel.layer.borderWidth = 1
        charismaTempAdjLabel.layer.borderColor = UIColor.blackColor().CGColor
        charismaTempAdjLabel.layer.borderWidth = 1
        
        strengthTempModLabel.layer.borderColor = UIColor.blackColor().CGColor
        strengthTempModLabel.layer.borderWidth = 1
        dexterityTempModLabel.layer.borderColor = UIColor.blackColor().CGColor
        dexterityTempModLabel.layer.borderWidth = 1
        constitutionTempModLabel.layer.borderColor = UIColor.blackColor().CGColor
        constitutionTempModLabel.layer.borderWidth = 1
        intelligenceTempModLabel.layer.borderColor = UIColor.blackColor().CGColor
        intelligenceTempModLabel.layer.borderWidth = 1
        wisdomTempModLabel.layer.borderColor = UIColor.blackColor().CGColor
        wisdomTempModLabel.layer.borderWidth = 1
        charismaTempModLabel.layer.borderColor = UIColor.blackColor().CGColor
        charismaTempModLabel.layer.borderWidth = 1
    }
    
}

//
//  CreateCharacterNameViewController.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit

class CreateCharacterNameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var character: Character?
    var selectedAlignment: String = Constants.Alignment.LawfulGood
    var alignments: [String] {
        return [Constants.Alignment.LawfulGood, Constants.Alignment.NeutralGood, Constants.Alignment.ChaoticGood, Constants.Alignment.LawfulNeutral, Constants.Alignment.Neutral, Constants.Alignment.ChaoticNeutral, Constants.Alignment.LawfulEvil, Constants.Alignment.NeutralEvil, Constants.Alignment.ChaoticEvil]
    }
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    @IBOutlet var alignmentButton: UIButton!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var alignmentPickerView: UIPickerView!

    @IBAction func save(sender: AnyObject) {
        if let character = character {
            character.name = self.nameTextField.text
            if let age = ageTextField.text, ageInt = Int16(age) {
                character.age = ageInt
            }
        
            if genderSegmentedControl.selectedSegmentIndex == 0 {
                character.gender = Constants.Gender.Male
            } else {
                character.gender = Constants.Gender.Female
            }
        
            character.alignment = selectedAlignment
            Character.setSelectedCharacter(character)
        
            dismissViewControllerAnimated(true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alignments.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if alignments.count > row {
            return alignments[row]
        }
        return Constants.Alignment.LawfulGood
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if alignments.count > row {
            selectedAlignment = alignments[row]
            
            alignmentButton.setTitle(selectedAlignment, forState: .Normal)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

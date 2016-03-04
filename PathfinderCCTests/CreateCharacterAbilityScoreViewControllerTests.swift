//
//  CreateCharacterAbilityScoreViewControllerTests.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
import UIKit
import MagicalRecord
@testable import PathfinderCC

class CreateCharacterAbilityMock : CreateCharacterAbilityScoreViewController {
    
    var didCallRegisterForKeyboardNotifications = false
    var didCallKeyboardWasShown = false
    var didCallKeyboardWillBeHidden = false
    
    internal override func registerForKeyboardNotifications() {
        didCallRegisterForKeyboardNotifications = true
        super.registerForKeyboardNotifications()
    }
    
    internal override func keyboardWasShown(aNotification: NSNotification) {
        didCallKeyboardWasShown = true
        super.keyboardWasShown(aNotification)
    }
    
    internal override func keyboardWillBeHidden(aNotification: NSNotification) {
        didCallKeyboardWillBeHidden = true
        super.keyboardWillBeHidden(aNotification)
    }
}

class CreateCharacterAbilityScoreViewControllerTests: XCTestCase {
    
    var viewController : CreateCharacterAbilityScoreViewController!
    var viewControllerMock : CreateCharacterAbilityMock!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CreateCharacterAbilityScoreViewController") as! CreateCharacterAbilityScoreViewController
        viewController.performSelectorOnMainThread("loadView", withObject: nil, waitUntilDone: true)
        
        viewControllerMock = CreateCharacterAbilityMock()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
    }
    
    func testMakeViewController() {
        let viewController = CreateCharacterAbilityScoreViewController(nibName: nil, bundle: nil)
        XCTAssertNotNil(viewController, "View Controller failed initialization")
    }
    
    func testSholudRegisterForNotificationsOnViewDidLoad() {
        
        let createMock = CreateCharacterAbilityMock()
        createMock.viewDidLoad()
        
        XCTAssertTrue(createMock.didCallRegisterForKeyboardNotifications, "View Controller failed to register for notifications")
        
    }
    
    func testRegisterForNotificationsProperly() {
        viewControllerMock.scrollView = UIScrollView()
        viewControllerMock.registerForKeyboardNotifications()
        
        NSNotificationCenter.defaultCenter().postNotificationName(UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().postNotificationName(UIKeyboardWillHideNotification, object: nil);
        
        XCTAssertTrue(viewControllerMock.didCallKeyboardWasShown, "View Controller did not call keyBoardWasShown:")
        XCTAssertTrue(viewControllerMock.didCallKeyboardWillBeHidden, "View Controller did not call keyBroadWillBeHidden:")
    }
    
    func testShouldGoToNextInRightScenario() {
        viewController.strengthTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"
        
        XCTAssertTrue(viewController.shouldAllowNextNavigation(), "View Controller did not allow next when it should have")
    }
    
    func testShouldNotGoToNextWithNoData() {
        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller allowed next when it should not have")
    }
    
    func testShouldNotGotToNextWithoutDexterity() {
        viewController.strengthTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"
        
        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Dexterity")
    }
    
    func testShouldNotGotToNextWithoutStrength() {
        viewController.dexterityTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"
        
        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Strength")
    }
    
    func testShouldNotGotToNextWithoutConstitution() {
        viewController.strengthTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"
        
        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Constitution")
    }
    
    func testShouldNotGotToNextWithoutWisdom() {
        viewController.strengthTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"
        
        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Wisdom")
    }
    
    func testShouldNotGotToNextWithoutIntelligence() {
        viewController.strengthTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.charismaTextField.text = "12"
        
        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Intelligence")
    }
    
    func testShouldNotGotToNextWithoutCharisma() {
        viewController.strengthTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        
        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Charisma")
    }
    
    func testCreateCharacterWithValidInfo() {
        MagicalRecord.setupCoreDataStack()
        
        viewController.strengthTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"
        
        let character = viewController.createCharacter()
        
        XCTAssertNotNil(character, "Character was not created correctly")
        XCTAssertEqual(character.baseAbilityScores?.count, 6, "There should be 6 ability scores on the character now")
    }
}

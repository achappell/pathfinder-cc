//
//  Modifier+FEMMappingTests.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import PathfinderCC

class Modifier_FEMMappingTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFEMMapping() {
        
        let bundle = NSBundle(forClass: CoreRulebook_FEMMappingTests.self)
        let path = bundle.pathForResource("testcorerulebook", ofType: "json")
        
        let data = NSData(contentsOfFile: path!)
        
        do {
            let JSONDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject]
            
            
            let deserializer = JSONDeserializer()
            
            if let book = JSONDict["coreRulebook"] as? [String: AnyObject], races = book["races"] as? [[String: AnyObject]], size = races[0]["size"] as? [String:AnyObject] {
                let modifier = deserializer.objectFromDictionary(size, classType: Modifier.self)! as Modifier
                
                XCTAssertEqual(modifier.value, 0)
                XCTAssertEqual(modifier.type, 0)
                XCTAssertEqual(modifier.originalText, "Dwarves are Medium creatures and have no bonuses or penalties due to their size.")
            }
        } catch {
            
        }
    }

}

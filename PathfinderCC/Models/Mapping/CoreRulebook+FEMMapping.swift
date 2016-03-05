//
//  CoreRulebook+FEMMapping.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import FastEasyMapping
import MagicalRecord

extension CoreRulebook: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: CoreRulebook.MR_entityName())
        
        mapping.addToManyRelationshipMapping(Race.mapping(), forProperty: "races", keyPath: "coreRulebook.races")
        
        return mapping
    }

}

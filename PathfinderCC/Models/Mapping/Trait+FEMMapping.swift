//
//  Trait+FEMMapping.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import MagicalRecord
import FastEasyMapping

extension Trait: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: Trait.MR_entityName())
        mapping.addAttributesFromArray(["value","originalText","type", "name"])
        
        return mapping
    }
    
}

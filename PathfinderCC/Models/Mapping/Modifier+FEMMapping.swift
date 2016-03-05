//
//  Modifier+FEMMapping.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import MagicalRecord
import FastEasyMapping

extension Modifier: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: Modifier.MR_entityName())
        mapping.addAttributesFromArray(["value","originalText","type"])
        
        return mapping
    }
    
}

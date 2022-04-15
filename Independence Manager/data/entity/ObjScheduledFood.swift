//
//  ObjScheduledFood.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

struct ObjScheduledFood {
    
    var food: ObjFood
    var composition: [ObjIngredientComposition]
    var available: Bool?
    var date: Date
    var type: ElementType

}

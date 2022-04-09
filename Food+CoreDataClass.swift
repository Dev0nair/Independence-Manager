//
//  Food+CoreDataClass.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData

@objc(Food)
public class Food: NSManagedObject {

    init(context: NSManagedObjectContext) {
        super.init(entity: NSEntityDescription.entity(forEntityName: "Food", in: context)!, insertInto: context)
        
        self.id = UUID.init()
        self.name = "Comida de prueba"
        self.desc = "Descripcion de prueba"
        self.image = "url img"
    }
    
}

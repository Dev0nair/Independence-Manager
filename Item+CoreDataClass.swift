//
//  Item+CoreDataClass.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    init(context: NSManagedObjectContext) {
        super.init(entity: NSEntityDescription.entity(forEntityName: "Item", in: context)!, insertInto: context)
        
        self.id = UUID.init()
        self.idType = UUID.init()
        self.name = "Producto de prueba"
        self.desc = "Descripcion de producto de prueba"
        self.image = "url image"
        self.actualQuantity = 2.0
        self.minQuantity = 1.0
        self.quantity = 2.0
        
    }
}

//
//  Item+CoreDataProperties.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var idType: UUID?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var image: String?
    @NSManaged public var quantity: Double
    @NSManaged public var actualQuantity: Double
    @NSManaged public var minQuantity: Double

}

extension Item : Identifiable {

}

//
//  Shop+CoreDataProperties.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData


extension Shop {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shop> {
        return NSFetchRequest<Shop>(entityName: "Shop")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var schedule: String?
    @NSManaged public var image: String?
    @NSManaged public var address: String?

}

extension Shop : Identifiable {

}

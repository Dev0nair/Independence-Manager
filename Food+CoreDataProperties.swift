//
//  Food+CoreDataProperties.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var image: String?

}

extension Food : Identifiable {

}

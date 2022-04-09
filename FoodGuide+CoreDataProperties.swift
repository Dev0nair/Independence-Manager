//
//  FoodGuide+CoreDataProperties.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData


extension FoodGuide {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodGuide> {
        return NSFetchRequest<FoodGuide>(entityName: "FoodGuide")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var idFood: UUID?
    @NSManaged public var order: NSDecimalNumber?
    @NSManaged public var desc: String?

}

extension FoodGuide : Identifiable {

}

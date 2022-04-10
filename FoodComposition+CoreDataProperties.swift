//
//  FoodComposition+CoreDataProperties.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData


extension FoodComposition {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodComposition> {
        return NSFetchRequest<FoodComposition>(entityName: "FoodComposition")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var idFood: UUID?
    @NSManaged public var idItem: UUID?
    @NSManaged public var itemQuantity: Double

}

extension FoodComposition : Identifiable {

}

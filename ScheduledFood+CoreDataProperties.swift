//
//  ScheduledFood+CoreDataProperties.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData


extension ScheduledFood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduledFood> {
        return NSFetchRequest<ScheduledFood>(entityName: "ScheduledFood")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var idFood: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var idType: UUID?

}

extension ScheduledFood : Identifiable {

}

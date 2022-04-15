//
//  Type+CoreDataProperties.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//
//

import Foundation
import CoreData


extension ElementType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementType> {
        return NSFetchRequest<ElementType>(entityName: "ElementType")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var internalType: String?

}

extension ElementType : Identifiable {

}

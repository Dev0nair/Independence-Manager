//
//  ObjItem.swift
//  Independence Manager
//
//  Created by Ismael González on 13/4/22.
//

import Foundation

struct ObjItem {
    
    var idItem: UUID
    var idType: UUID
    var name: String
    var quantity: Double
    var actualQuantity: Double
    var minQuantity: Double
    var idFoodCompReference: UUID? = nil
    var idFoodReference: UUID? = nil
    var image: String
    var desc: String
    
    
    init(_ item: Item) {
        self.idItem = item.id ?? UUID()
        self.idType = item.idType ?? UUID()
        self.name = item.name ?? ""
        self.desc = item.desc ?? ""
        self.quantity = item.quantity
        self.actualQuantity = item.actualQuantity
        self.minQuantity = item.minQuantity
        self.image = item.image ?? ""
    }
    
    init(item: Item, ingredientof: FoodComposition) {
        self.init(item)
        
        self.idFoodCompReference = ingredientof.id
        self.idFoodReference = ingredientof.idFood
        
    }
    
    func map(entity: Item) -> (entity: Item, idFoodCompRef: UUID?) {
        entity.id = self.idItem
        entity.idType = self.idType
        entity.name = self.name
        entity.desc = self.desc
        entity.quantity = self.quantity
        entity.actualQuantity = self.actualQuantity
        entity.minQuantity = self.minQuantity
        entity.image = self.image
        
        return (entity: entity, idFoodCompRef: idFoodCompReference)
    }
    
    func map(entity: FoodComposition?) -> FoodComposition? {
        guard let idFoodComp = self.idFoodCompReference, let item = entity else {
            return nil
        }
        
        item.idFood = self.idFoodReference
        item.idItem = self.idItem
        item.id = idFoodComp
        
        return item
    }
    
}

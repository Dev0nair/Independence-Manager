//
//  PItemRepository.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation
import CoreData

class PItemRepository : BaseRepo, ItemProtocol {
    
    func newItem(item: ObjItem) -> Bool {
        
        guard let nsEntity = NSEntityDescription.entity(forEntityName: "Item", in: self.context) else { return false; }
        
        let entity = Item(entity: nsEntity, insertInto: self.context)
        let obj = item.map(entity: entity)
        
        guard let foodRef = obj.idFoodCompRef else {
            return save()
        }
        
        guard let nsIngredientEntity = NSEntityDescription.entity(forEntityName: "FoodComposition", in: self.context) else {
            return save()
        }
        
        let ingredientEntity = FoodComposition(entity: nsIngredientEntity, insertInto: self.context)
        
        guard let ingredientEntity = item.map(entity: ingredientEntity) else {
            return save()
        }
            
        
        return save()
    }
    
    func getIngredientsOf(idFood: UUID) -> [Item] {
        do {
            return try context.fetch(FoodComposition.fetchRequest())
                .filter{ item in
                    return item.idFood == idFood && item.idItem != nil
                }
                .map{ foodComp in
                    return getItem(idItem: foodComp.idItem!)!
                }
        } catch {
            return []
        }
    }
    
    func getShops() -> [Shop] {
        do {
            return try context.fetch(Shop.fetchRequest())
        } catch {
            return []
        }
    }
    
    func getShop(idShop: UUID) -> Shop? {
        return getShops().first { item in
            item.id == idShop
        }
    }
    
    func setShop(shop: Shop) -> Bool {
        guard let nsEntity = NSEntityDescription.entity(forEntityName: "Shop", in: self.context) else { return false; }
        
        Shop(entity: nsEntity, insertInto: self.context)
        
        return save()
    }
    
    
    func getAllIngredients() -> [Item] {
        do {
            return try context.fetch(Item.fetchRequest())
                .filter({ item in
                    return item.idType == AppConfig.DBConstants.INGREDIENT_TYPE
                })
        } catch {
            return []
        }
    }
    
    func getNonIngredientProducts() -> [Item] {
        do {
            return try context.fetch(Item.fetchRequest())
                .filter({ item in
                    return item.idType != AppConfig.DBConstants.INGREDIENT_TYPE
                })
        } catch {
            return []
        }
    }
    
    func getItem(idItem: UUID) -> Item? {
        do {            
            return try context.fetch(Item.fetchRequest())
                .first(where: { item in
                    item.id == idItem
                })
        } catch {
            return nil
        }
    }
    
    func newItem(item: Item) -> Bool {
        context.insert(item)
        return save()
    }
    
    func deleteItem(idItem: UUID) -> Bool {
        if let item = getItem(idItem: idItem) {
            context.delete(item)
            return save()
        } else {
            return false
        }
    }
    
    private func save() -> Bool {
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
}

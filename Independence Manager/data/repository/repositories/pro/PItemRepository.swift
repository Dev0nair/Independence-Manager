//
//  PItemRepository.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class PItemRepository : BaseRepo, ItemProtocol {
    
    func getAllIngredients() -> [Item] {
        do {
            return try context.fetch(Item.fetchRequest())
                .filter({ item in
                    return item.idType == AppConstants.DBConstants.INGREDIENT_TYPE
                })
        } catch {
            return []
        }
    }
    
    func getNonIngredientProducts() -> [Item] {
        do {
            return try context.fetch(Item.fetchRequest())
                .filter({ item in
                    return item.idType != AppConstants.DBConstants.INGREDIENT_TYPE
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

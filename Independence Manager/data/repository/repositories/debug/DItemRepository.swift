//
//  DItemRepository.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation
import CoreData

class DItemRepository : BaseRepo, ItemProtocol {
    private var listItems = [Item]()
    
    override init() {
        super.init()
        
        introducirDatosDePrueba()
    }
    
    private func introducirDatosDePrueba() {
        let ingr1 = self.createEntity()
        ingr1.idType = UUID.init()
        self.newItem(item: ingr1)
        
        let ingr2 = self.createEntity()
        ingr2.idType = AppConstants.DBConstants.INGREDIENT_TYPE
        self.newItem(item: ingr2)
        
        let prod1 = self.createEntity()
        prod1.idType = UUID.init()
        self.newItem(item: prod1)
    }
    
    private func createEntity() -> Item {
        return Item(entity: NSEntityDescription.entity(forEntityName: "Item", in: context)!, insertInto: nil)
    }
    
    func getAllIngredients() -> [Item] {
        return listItems.filter { item in
            item.idType == AppConstants.DBConstants.INGREDIENT_TYPE
        }
    }
    
    func getNonIngredientProducts() -> [Item] {
        return listItems.filter { item in
            item.idType != AppConstants.DBConstants.INGREDIENT_TYPE
        }
    }
    
    func getItem(idItem: UUID) -> Item? {
        return listItems.first
    }
    
    func newItem(item: Item) -> Bool {
        listItems.append(item)
        return true;
    }
    
    func deleteItem(idItem: UUID) -> Bool {
        if let index = listItems.firstIndex(where: { i in i.id == idItem }) {
            listItems.remove(at: index)
            return true
        } else {
            return false
        }
    }
    
}

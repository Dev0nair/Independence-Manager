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
        
        self.listItems = [Item(context: super.context), Item(context: super.context), Item(context: super.context) ]
    }
    
    func getAllIngredients() -> [Item] {
        return listItems
    }
    
    func getNonIngredientProducts() -> [Item] {
        return listItems
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

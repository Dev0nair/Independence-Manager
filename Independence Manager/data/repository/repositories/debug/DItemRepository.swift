//
//  DItemRepository.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation
import UIKit
import CoreData

class DItemRepository : ItemProtocol {
    
    let context: NSManagedObjectContext

    private var listItems: [Item]
    
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.listItems = [Item(context: context), Item(context: context), Item(context: context) ]
    }
    
    func getAllIngredients() -> [Item] {
        return listItems
    }
    
    func getAllProducts() -> [Item] {
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

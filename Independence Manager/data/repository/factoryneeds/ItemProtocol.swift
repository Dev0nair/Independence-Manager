//
//  ItemProtocol.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

protocol ItemProtocol {
    
    func getAllIngredients() -> [Item]
    func getNonIngredientProducts() -> [Item]
    
    func getItem(idItem: UUID) -> Item?
    func newItem(item: ObjItem) -> Bool
    func deleteItem(idItem: UUID) -> Bool
    
    func getIngredientsOf(idFood: UUID) -> [Item]

    func getShops() -> [Shop]
    func getShop(idShop: UUID) -> Shop?
    func setShop(shop: Shop) -> Bool

}

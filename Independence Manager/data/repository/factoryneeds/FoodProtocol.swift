//
//  FoodProtocol.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import Foundation

protocol FoodProtocol {
    
    func getListFood() -> [Food]
    func insertFood(food: Food) -> Bool
    func deleteFood(idFood: UUID) -> Bool
    func getFood(idFood: UUID) -> Food?
    
}

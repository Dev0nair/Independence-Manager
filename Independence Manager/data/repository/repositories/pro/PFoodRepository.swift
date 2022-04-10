//
//  PFoodRepository.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import Foundation
import UIKit

class PFoodRepository : BaseRepo, FoodProtocol {
            
    func getListFood() -> [Food] {
        
        do {
            return try context.fetch(Food.fetchRequest())
        } catch {
            return []
        }
        
    }
    
    func insertFood(food: Food) -> Bool {
    
        context.insert(food)
        return save()
        
    }
    
    func deleteFood(idFood: UUID) -> Bool {
        
        if let food = getFood(idFood: idFood) {
            
            context.delete(food)
            return save()
            
        } else {
            return false
        }
    
    }
    
    func getFood(idFood: UUID) -> Food? {
        return getListFood().first(where: { $0.id == idFood })
    }
    
    private func save() -> Bool {
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    func getIngredients(idFood: UUID) -> [FoodComposition] {
        do {
            return try context.fetch(FoodComposition.fetchRequest()).filter({ foodComp in
                foodComp.idFood == idFood
            })
        } catch {
            return []
        }
    }
}

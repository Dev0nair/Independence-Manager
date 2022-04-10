//
//  DFoodRepository.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import Foundation
import UIKit
import CoreData

class DFoodRepository : FoodProtocol {
    
    let context: NSManagedObjectContext

    private var listFood: [Food]
    
    init() {
        self.context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.listFood = [Food(context: context), Food(context: context), Food(context: context) ]
    }
    
    func getListFood() -> [Food] {
        return self.listFood
    }
    
    func insertFood(food: Food) -> Bool {
        listFood.append(food)
        return true
    }
    
    func deleteFood(idFood: UUID) -> Bool {
        if let food = getFood(idFood: idFood), let index = self.listFood.firstIndex(of: food) {
            self.listFood.remove(at: index)
            return true
        } else {
            return false
        }
    }
    
    func getFood(idFood: UUID) -> Food? {
        return self.listFood.first(where: { $0.id == idFood } )
    }
    
    func getIngredients(idFood: UUID) -> [FoodComposition] {
        return []
    }
}

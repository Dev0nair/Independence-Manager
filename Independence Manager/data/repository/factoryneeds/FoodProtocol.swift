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
    func getIngredients(idFood: UUID) -> [FoodComposition]
    
    func getFoodScheduleNext7Days(idFood: UUID) -> [ScheduledFood]
    func setFoodScheduleForDay(obj scheduledFood: ObjScheduledFood) -> Bool
    
    func getFoodGuide(idFood: UUID) -> [FoodGuide]
    func setFoodGuide(step: ObjFoodStep) -> Bool
}

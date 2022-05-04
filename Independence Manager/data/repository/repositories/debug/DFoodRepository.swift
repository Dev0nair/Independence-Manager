//
//  DFoodRepository.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import Foundation
import CoreData

class DFoodRepository : BaseRepo, FoodProtocol {
    
    private var listFood = [Food]()
    private var listFoodGuide = [FoodGuide]()
    private var listScheduledFood = [ScheduledFood]()
    
    override init() {
        super.init()
        
		let food1 = Food(context: context)
		food1.id = UUID()
		food1.desc = "Solomillo al whisky"
		food1.image = "Solomillo Whisky"
		
		
		let food2 = Food(context: context)
		food2.id = UUID()
		food2.desc = "Tortilla Francesa"
		food2.image = "Tortilla Francesa"
		
		self.listFood = [ food1, food2 ]
    }
    
    func getFoodScheduleNext7Days(idFood: UUID) -> [ScheduledFood] {
        let now = Date()
        var dateComponent = DateComponents()
        dateComponent.day = 1
        guard let nowAfter7Days = Calendar.current.date(byAdding: dateComponent, to: now) else {
            return []
        }
        
        return self.listScheduledFood.filter { item in
            item.idFood == idFood && item.date != nil && item.date! <= nowAfter7Days
        }
    }
    
    func setFoodScheduleForDay(obj scheduledFood: ObjScheduledFood) -> Bool {
        guard let nsEntity = NSEntityDescription.entity(forEntityName: "ScheduledFood", in: self.context) else { return false; }
        
        let entity = ScheduledFood(entity: nsEntity, insertInto: nil)
        
        self.listScheduledFood.append(entity)
        
        return true
    }
    
    func getFoodGuide(idFood: UUID) -> [FoodGuide] {
        return self.listFoodGuide.filter { item in
            item.idFood == idFood
        }
    }
    
    func setFoodGuide(step: ObjFoodStep) -> Bool {
        guard let nsEntity = NSEntityDescription.entity(forEntityName: "FoodGuide", in: self.context) else { return false; }
        
        let entity = FoodGuide(entity: nsEntity, insertInto: nil)
        
        self.listFoodGuide.append(entity)
        
        return true
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

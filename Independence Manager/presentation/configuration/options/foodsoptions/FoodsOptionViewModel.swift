//
//  FoodsOptionViewModel.swift
//  Independence Manager
//
//  Created by Ismael González on 14/4/22.
//

import Foundation

class FoodsOptionViewModel {
    
    var foods: Box<[ObjFood]>
    private let getFoodList: UCGetAllFood
    
    init(getFoodList: UCGetAllFood, foodList: Box<[ObjFood]> = Box()) {
        
        self.getFoodList = getFoodList
        self.foods = foodList
    }
    
    
    func loadFoods() {
        self.getFoodList.execute { list in
            self.foods.item = list
        }
    }
    
}

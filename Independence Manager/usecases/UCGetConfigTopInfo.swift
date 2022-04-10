//
//  UCGetConfigTopInfo.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class UCGetConfigTopInfo : BaseUseCase {
    
    private let foodRepo = FoodRepositoryFactory.getRepository()
    private let itemRepo = ItemRepositoryFactory.getInstance()
    
    func execute(onLoad: @escaping (ObjConfigTopInfo) -> Void) {
        execBackground {
            let foods = self.foodRepo.getListFood()
            let ingrs = self.itemRepo.getAllIngredients()
            let prods = self.itemRepo.getAllProducts()
            
            self.execMain {
                let objInfo = ObjConfigTopInfo(lastDatabaseCopy: Date.now, numFoods: Decimal(foods.count), numIngredients: Decimal(ingrs.count), numProducts: Decimal(prods.count))
                onLoad(objInfo)
            }
        }
        
    }
    
}

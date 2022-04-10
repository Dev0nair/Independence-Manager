//
//  UCGetConfigTopInfo.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class UCGetConfigTopInfo : BaseUseCase<ObjConfigTopInfo> {
    
    private let foodRepo = FoodRepositoryFactory.getRepository()
    private let itemRepo = ItemRepositoryFactory.getInstance()
    
    func execute(onLoad: @escaping (ObjConfigTopInfo) -> Void) {
        
        self.doWork {
            let foods = self.foodRepo.getListFood()
            let ingrs = self.itemRepo.getAllIngredients()
            let prods = self.itemRepo.getNonIngredientProducts()
            
            return ObjConfigTopInfo(
                lastDatabaseCopy: Date.now,
                numFoods: Decimal(foods.count),
                numIngredients: Decimal(ingrs.count),
                numProducts: Decimal(prods.count)
            )
        } front: { objInfo in
            onLoad(objInfo)
        }
        
    }

}

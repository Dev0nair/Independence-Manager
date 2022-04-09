//
//  FoodRepositoryFactory.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import Foundation

class FoodRepositoryFactory {
    
    static func getRepository() -> FoodProtocol {
        switch(AppConstants.APP_COMPILATION) {
            case CompilationType.DEBUG: return DFoodRepository()
            case CompilationType.PRO: return PFoodRepository()
        }
    }
    
}

//
//  FoodRepositoryFactory.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import Foundation

class FoodRepositoryFactory {
    
    private static let INSTANCE: FoodProtocol = createRepository()
    
    private static func createRepository() -> FoodProtocol {
        print("FoodRepository: Created")
        switch(AppConstants.APP_COMPILATION) {
            case CompilationType.DEBUG: return DFoodRepository()
            case CompilationType.PRO: return PFoodRepository()
        }
    }
    
    static func getRepository() -> FoodProtocol {
        return INSTANCE;
    }
    
}

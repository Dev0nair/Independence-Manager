//
//  UCGetAllFood.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class UCGetAllFood : BaseUseCase {
    
    private let foodRepository: FoodProtocol = FoodRepositoryFactory.getRepository()

    func execute(onLoad: @escaping ([Food]) -> Void) {
        
        self.execBackground {
            let list = self.foodRepository.getListFood()
            
            self.execMain {
                onLoad(list)
            }
        }
    }
    
}

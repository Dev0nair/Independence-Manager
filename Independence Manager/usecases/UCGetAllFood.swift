//
//  UCGetAllFood.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class UCGetAllFood : BaseUseCase<[Food]> {
    private let foodRepository: FoodProtocol = FoodRepositoryFactory.getRepository()

    func execute(onLoad: @escaping ([Food]) -> Void) {
        
        self.doWork {
            self.foodRepository.getListFood()
        } front: { list in
            onLoad(list)
        }
        
    }
    
}

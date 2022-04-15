//
//  UCGetAllFood.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class UCGetAllFood : BaseUseCase<[ObjFood]> {
    private let foodRepository: FoodProtocol = FoodRepositoryFactory.getRepository()

    func execute(onLoad: @escaping ([ObjFood]) -> Void) {
        
        self.doWork {
            self.foodRepository
                .getListFood()
                .map { item in item.map()! }
        } front: { list in
            onLoad(list)
        }
        
    }
    
}

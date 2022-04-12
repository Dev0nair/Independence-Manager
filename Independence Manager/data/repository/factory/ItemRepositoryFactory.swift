//
//  ItemRepositoryFactory.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class ItemRepositoryFactory {
    
    private static let INSTANCE: ItemProtocol = createInstance()
    
    private static func createInstance() -> ItemProtocol {
        print("ItemRepository: Created")
        switch(AppConstants.APP_COMPILATION) {
            case CompilationType.DEBUG: return DItemRepository()
            case CompilationType.PRO: return PItemRepository()
        }
    }
    
    static func getInstance() -> ItemProtocol {
        return self.INSTANCE
    }
    
}

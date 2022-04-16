//
//  AppConstants.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import Foundation

enum CompilationType {
    case DEBUG, PRO
}

struct AppConfig {
    
    static let SPLASH_TIME = 2.0
    static let APP_COMPILATION = CompilationType.DEBUG
    
    struct DBConstants {
        static let INGREDIENT_TYPE = UUID.init(uuidString: "001")
    }
    
    struct Navigation {
        static let MAIN_NAV = "goToMainNav"
        static let SHOW_FOODS = "showFoods"
    }
}

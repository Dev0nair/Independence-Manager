//
//  BaseRepo.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation
import UIKit

class BaseRepo {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private func save() -> Bool {
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
}

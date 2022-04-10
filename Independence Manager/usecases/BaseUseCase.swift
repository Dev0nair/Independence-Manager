//
//  BaseUseCase.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class BaseUseCase {
    
    func execBackground(work: @escaping () -> Void) {
        DispatchQueue.global().async(execute: work)
    }
    
    func execMain(work: @escaping () -> Void) {
        DispatchQueue.main.async(execute: work)
    }

}

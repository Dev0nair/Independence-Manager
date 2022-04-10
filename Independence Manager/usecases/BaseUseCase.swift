//
//  BaseUseCase.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class BaseUseCase <T> {
    
    private var workItems: [DispatchWorkItem] = [DispatchWorkItem]()
    
    func execBackground(work: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async(execute: createWorkItem {
            work()
        })
    }
    
    func execMain(work: @escaping () -> Void) {
        DispatchQueue.main.async(execute: createWorkItem {
            work()
        })
    }
    
    private func createWorkItem(work: @escaping () -> Void) -> DispatchWorkItem {
        let dwi = DispatchWorkItem { work() }
        self.workItems.append(dwi)
        
        return dwi
    }
    
    func doWork(back: @escaping () -> T, front: @escaping (T) -> Void) {
        
        execBackground {
            let thing = back()
            
            self.execMain {
                front(thing)
            }
        }
    }
    
    func cancelAll() {
        for item in self.workItems {
            item.cancel()
        }
    }
}

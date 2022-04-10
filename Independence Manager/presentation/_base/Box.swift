//
//  Box.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation

class Box<T> {
    
    private var item: T? = nil {
        didSet {
            listener(item)
        }
    }
    
    private var listener: (T?) -> Void = { (_: T?) in } {
        didSet {
            listener(item)
        }
    }
    
    func notifyItemChange() {
        listener(item)
    }
    
    func setItem(item: T?) {
        self.item = item
    }
    
    func getItem() -> T? {
        return self.item
    }
    
    func listen(onItemSet: @escaping (T?) -> Void) {
        self.listener = onItemSet
    }
    
    func cancel() {
        self.listener = { (_: T?) in }
    }
}

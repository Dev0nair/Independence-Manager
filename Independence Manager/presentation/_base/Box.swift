//
//  Box.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation
import UIKit

class Box<T> {
    
    private var item: T? = nil
    
    private var listener: ((T?) -> Void)? = nil {
        didSet {
            notifyItemChange()
        }
    }
    
    func notifyItemChange() {
        if let listenerMethod = listener {
            listenerMethod(item)
        }
    }
    
    func setItem(item: T?) {
        self.item = item
        self.notifyItemChange()
    }
    
    func getItem() -> T? {
        return self.item
    }
    
    func listen(onItemSet: @escaping (T?) -> Void) {
        self.listener = onItemSet
        self.notifyItemChange()
    }
    
    func cancel() {
        self.listener = nil
    }
}

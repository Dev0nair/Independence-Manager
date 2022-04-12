//
//  Box.swift
//  Independence Manager
//
//  Created by Ismael González on 10/4/22.
//

import Foundation
import UIKit

class Box<T> {
    
    init(_ defaultValue: T? = nil) {
        if let defVal = defaultValue {
            item = defVal
        }
    }
    
    var item: T? = nil {
        didSet {
            notifyItemChange()
        }
    }
    
    private var listener: ((T?) -> Void)? = nil {
        didSet {
            notifyItemChange()
        }
    }
    
    private func notifyItemChange() {
        if let listenerMethod = listener {
            listenerMethod(item)
        }
    }
    
    func listen(onItemSet: @escaping (T?) -> Void) {
        self.listener = onItemSet
    }
    
    func cancel() {
        self.listener = nil
    }
    
}

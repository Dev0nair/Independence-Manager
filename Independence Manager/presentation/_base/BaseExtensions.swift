//
//  Extensions.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import UIKit

extension UIViewController {
        
    func doAfter(seconds: Double, work: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: work)
    }
    
    func navigateTo(segueId: String) {
        self.performSegue(withIdentifier: segueId, sender: self)
    }
}


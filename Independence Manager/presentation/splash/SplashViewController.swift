//
//  SplashViewController.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import UIKit

class SplashViewController: UIBaseViewController {

    @IBOutlet weak var lbCenterText: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lbCenterText.text = "Splash!"
        
        doAfter(seconds: AppConstants.SPLASH_TIME) {
            self.navigateTo(Constants.Navigation.MAIN_NAV, params: ("Hola", 20))
        }
    }
    
}

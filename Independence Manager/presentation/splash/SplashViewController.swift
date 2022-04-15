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
        
        doAfter(seconds: AppConfig.SPLASH_TIME) {
            self.navigateTo(AppConfig.Navigation.MAIN_NAV)
        }
    }
    
}

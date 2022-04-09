//
//  SplashViewController.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var lbCenterText: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lbCenterText.text = "Splash!"
        
        doAfter(seconds: AppConstants.SPLASH_TIME) {
            self.navigateTo(segueId: Constants.Navigation.MAIN_NAV)
        }
    }
    
}

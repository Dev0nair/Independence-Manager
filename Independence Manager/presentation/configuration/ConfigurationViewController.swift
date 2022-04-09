//
//  ConfigurationViewController.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import UIKit

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var lbCenterText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Configuration"
        lbCenterText.text = "Configuration!"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

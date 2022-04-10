//
//  ConfigurationViewController.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import UIKit

class ConfigurationViewController: UIViewController {

    
    @IBOutlet weak var lbUltimaCopiaSeguridad: UILabel!
    @IBOutlet weak var lbNumComidas: UILabel!
    @IBOutlet weak var lbNumIngredientes: UILabel!
    @IBOutlet weak var lbNumProducts: UILabel!
    
    private let confVM = ConfigurationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Configuration"
        
        
        configListener()
        
        confVM.loadInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        confVM.cancel()
    }
}

extension ConfigurationViewController {
    
    func configListener() {
        self.confVM.configInfo.listen { (_info: ObjConfigTopInfo?) in
            if let info = _info {
                self.applyInfo(info: info)
            }
        }
    }
    
    func applyInfo(info: ObjConfigTopInfo) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        
        self.lbUltimaCopiaSeguridad.text = dateFormater.string(from: info.lastDatabaseCopy)
        self.lbNumComidas.text = info.numFoods.formatted()
        self.lbNumIngredientes.text = info.numIngredients.formatted()
        self.lbNumProducts.text = info.numProducts.formatted()
    }
}

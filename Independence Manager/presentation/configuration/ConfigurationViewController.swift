//
//  ConfigurationViewController.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import UIKit

class ConfigurationViewController: UIBaseViewController{

    
    @IBOutlet weak var lbUltimaCopiaSeguridad: UILabel!
    @IBOutlet weak var lbNumComidas: UILabel!
    @IBOutlet weak var lbNumIngredientes: UILabel!
    @IBOutlet weak var lbNumProducts: UILabel!
    
    @IBOutlet weak var optionsLayout: UIStackView!
    @IBOutlet weak var opcionTL: UIView!
    @IBOutlet weak var opcionTR: UIView!
    @IBOutlet weak var opcionBL: UIView!
    @IBOutlet weak var opcionBR: UIView!
    
    private let confVM = ConfigurationViewModel()
    private let roundSize = 45
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Información"
        
        configListener()
        roundOptionsCornersLayout()
        roundOptionsCorners()
        
        confVM.loadInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        confVM.cancel()
    }
}

extension ConfigurationViewController {
    
    private func configListener() {
        self.confVM.configInfo.listen { [weak self] _info in
            if let info = _info {
                self?.applyInfo(info: info)
            }
        }
    }
    
    private func applyInfo(info: ObjConfigTopInfo) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        
        self.lbUltimaCopiaSeguridad.text = dateFormater.string(from: info.lastDatabaseCopy)
        self.lbNumComidas.text = info.numFoods.formatted()
        self.lbNumIngredientes.text = info.numIngredients.formatted()
        self.lbNumProducts.text = info.numProducts.formatted()
    }
    
    private func roundOptionsCornersLayout() {
        // Se redondea las esquinas superiores del layout de opcoiones
        let path = UIBezierPath(roundedRect: self.optionsLayout.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: self.roundSize, height: self.roundSize))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.optionsLayout.layer.mask = mask
    }
    
    private func roundOptionsCorners() {
        // Se redondea las esquinas de las opciones
        self.opcionTL.layer.cornerRadius = 45
        self.opcionTR.layer.cornerRadius = 45
        self.opcionBL.layer.cornerRadius = 45
        self.opcionBR.layer.cornerRadius = 45
    }
}

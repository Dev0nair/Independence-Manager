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
    @IBOutlet weak var opcionComidas: UIView!
    @IBOutlet weak var opcionProductos: UIView!
    @IBOutlet weak var opcionIngredientes: UIView!
    @IBOutlet weak var opcionBackup: UIView!
    
    
    private let confVM = ConfigurationViewModel()
    private let roundSize = 45
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Información"
        
        roundViews()
        configListener()
        configOptionsClick()
        
        roundOptionsCornersLayout()
        roundOptionsCorners()
        
        confVM.loadInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        confVM.cancel()
    }
}

extension ConfigurationViewController {
    @objc private func onClickProductsOption() {
        print("Productos")
    }
    
    @objc private func onClickFoodsOption() {
        navigateTo(AppConfig.Navigation.SHOW_FOODS)
    }
    
    @objc private func onClickIngredientsOption() {
        print("Ingredientes!")
    }
    
    @objc private func onClickBackupOption() {
        print("Backup!")
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
    
    private func configOptionsClick() {
        self.opcionProductos.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickProductsOption)))
        self.opcionIngredientes.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickIngredientsOption)))
        self.opcionComidas.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickFoodsOption)))
        self.opcionBackup.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickBackupOption)))
    }
    
    private func roundViews() {
        roundOptionsCornersLayout()
        roundOptionsCorners()
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
        self.opcionComidas.layer.cornerRadius = 45
        self.opcionProductos.layer.cornerRadius = 45
        self.opcionIngredientes.layer.cornerRadius = 45
        self.opcionBackup.layer.cornerRadius = 45
    }
}

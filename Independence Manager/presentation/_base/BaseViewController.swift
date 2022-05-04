//
//  Extensions.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import UIKit

open class UIBaseViewController : UIViewController {
    
    private var sending = [(dest: String, params: Any?)]()
    var params: Any? = nil
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
		print("Clase: \(self.description.split(separator: ":")[0])>. Params: \(String(describing: params))")
    }
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Recuperamos el item que queríamos enviar al destino
        guard let sendingItem = sending.first(where: { item in
            item.dest == segue.identifier
        }) else { return; }
        
        // Recuperamos el ViewController destino (la pantalla destino)
        guard let newBaseViewController = segue.destination as? UIBaseViewController else { return; }
        
        // Le inyectamos el parámetro
        newBaseViewController.params = sendingItem.params
        
        // Lo borramos de la lista para que no se quede "cacheado"
        self.sending.removeAll { (dest: String, params: Any?) in
            dest == segue.identifier
        }
        
//        if let sheet = newBaseViewController.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.preferredCornerRadius = 45
//            sheet.prefersGrabberVisible = true
//        }
    }
    
}

/**
 *  Public Region
 */
extension UIBaseViewController {
    
    func doAfter(seconds: Double, work: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: work)
    }
    
    func navigateTo(_ segueId: String, params: Any? = nil) {
        self.sending.append(newSending(dest: segueId, params: params))
        
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    func showModal(_ modalViewController: CustomModal, params: Any? = nil) {
        modalViewController.params = params
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: false, completion: nil)
    }
}

/**
 *  Private Region
 */
extension UIBaseViewController {
    private func newSending(dest: String, params: Any?) -> (dest: String, params: Any?) {
        return (dest, params)
    }
    
    func dropShadow(color: UIColor, opacity: Float = 1, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true, layer: CALayer) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        let alphaColor = color.cgColor.copy(alpha: 0.05)

        
        layer.borderWidth = 1
        layer.borderColor = alphaColor
        layer.shadowPath = UIBezierPath(rect: self.view.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

//
//  Extensions.swift
//  Independence Manager
//
//  Created by Ismael González on 9/4/22.
//

import UIKit

class UIBaseViewController : UIViewController {
    
    private var sending = [(dest: String, params: Any?)]()
    var params: Any? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Clase: \(self.description). Params: \(String(describing: params))")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
    
}

/**
 *  Private Region
 */
extension UIBaseViewController {
    private func newSending(dest: String, params: Any?) -> (dest: String, params: Any?) {
        return (dest, params)
    }
}

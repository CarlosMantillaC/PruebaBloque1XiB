//
//  ViewController.swift
//  PruebaBloque1XiB
//
//  Created by Gopenux on 5/06/25.
//

import UIKit


class ViewController: UIViewController {

    
    let usuarioValido = "admin"
    let contrasenaValida = "1234"
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func login(_ sender: Any) {
        
        let usuario = userTextField.text ?? ""
        let contrasena = passwordTextField.text ?? ""
        
        if usuario == usuarioValido && contrasena == contrasenaValida {
            
            self.navigationController?.pushViewController(ViewControllerReproductor(nibName: "ViewControllerReproductor", bundle: nil), animated: true)

        } else {
            let alerta = UIAlertController(title: "Error", message: "Credenciales Incorrectas", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default))
            present(alerta, animated: true)
        }
    }
    
    
}

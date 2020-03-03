//
//  ViewController.swift
//  divisas
//
//  Created by Alumno on 13/02/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTipo: UITextField!
    @IBOutlet weak var tfPesos: UITextField!
    @IBOutlet weak var tfDolares: UITextField!
    @IBOutlet weak var imgDinero: UIImageView!
    
    @IBAction func calculaDolares(_ sender: UIButton) {
        
        if let tipoCambio = Double(tfTipo.text!),
            let pesos = Double(tfPesos.text!) {
            
            let dolares = pesos / tipoCambio
            tfDolares.text = "\(dolares)"
        }
        else {
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener valor numerico", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            
            present(alerta, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgDinero.image = UIImage(named: "dollarSign")
    }

    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}


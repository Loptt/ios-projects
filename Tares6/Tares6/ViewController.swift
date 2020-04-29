//
//  ViewController.swift
//  Tares6
//
//  Created by user168639 on 4/28/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfDesc: UITextField!
    @IBOutlet weak var tfCant: UITextField!
    
    var articulo: Articulo!
    var add: Bool = false
    
    var delegate: administradorArticulos!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !add {
            tfId.text = articulo.id
            tfDesc.text = articulo.desc
            tfCant.text = String(articulo.cant)
        }
    }

    @IBAction func guardar(_ sender: Any) {
        if let id = tfId.text, let desc = tfDesc.text, let cant = Int(tfCant.text!) {
            if add {
                delegate.agregarArticulo(articulo: Articulo(id: id, desc: desc, cant: cant))
            } else {
                articulo.id = id
                articulo.desc = desc
                articulo.cant = cant
                delegate.modificarArticulo(articulo: articulo)
            }
            
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Asegurate de llenar todos los campos y que cantidad sea entero", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}


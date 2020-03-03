//
//  ViewControllerEditar.swift
//  storyboardsE20 p-completar
//
//  Created by Alumno on 24/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerEditar: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfNombre: UITextField!
    
    var nombre : String!
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.text = email
        tfNombre.text = nombre
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  vistaIni = segue.destination as! ViewController
        vistaIni.nombre = tfNombre.text
        vistaIni.email = tfEmail.text
    }
}

//
//  ViewController.swift
//  ActClaseStoryboardsE20
//
//  Created by Yolanda Martinez on 25/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var tfCelular: UITextField!
    @IBOutlet weak var imgFoto: UIImageView!
    
    var nombre : String!
    var celular : String!
    var foto : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "azul" {
            let vistaAzul = segue.destination as! ViewControllerAzul
            vistaAzul.nombre = lbNombre.text
        }
        else {
            let vistaVerde = segue.destination as! ViewControllerVerde
            vistaVerde.celular = tfCelular.text
        }
    }
    
    @IBAction func unwindAzul (unwindSegue: UIStoryboardSegue) {
        lbNombre.text = nombre
    }
    
    @IBAction func unwindVerde (unwindSegue: UIStoryboardSegue) {
        tfCelular.text = celular
        imgFoto.image = foto
    }

}


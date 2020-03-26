//
//  ViewController.swift
//  EjerTableViewController
//
//  Created by Yolanda Martinez on 2/12/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var jug : Jugador!
    
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalle jugador"
        
        lbNombre.text = jug.nombre
        lbPuntos.text = String(jug.puntos)
        lbEmail.text = jug.email
        if let foto = jug.foto {
            imgFoto.image = foto
        }
    }


}


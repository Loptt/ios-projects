//
//  ViewController.swift
//  TableViewController
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var imgPP: UIImageView!
    
    var jugador: Jugador!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbNombre.text = jugador.nombre
        lbPuntos.text = "\(jugador.puntos)"
        lbEmail.text = jugador.email
        imgPP.image = jugador.image
        
        title = "Detalle del jugador"
    }


}


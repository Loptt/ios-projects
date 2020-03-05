//
//  Jugador.swift
//  TableViewController
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class Jugador: NSObject {
    var nombre: String = ""
    var puntos: Int = 0
    var email : String = ""
    var image : UIImage!
    
    init(nombre: String, puntos: Int, email: String, image: UIImage) {
        self.nombre = nombre
        self.puntos = puntos
        self.email = email
        self.image = image
    }
    
    
}

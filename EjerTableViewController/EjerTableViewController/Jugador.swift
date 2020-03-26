//
//  Jugador.swift
//  EjerTableViewController
//
//  Created by Yolanda Martinez on 2/12/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//

import UIKit

class Jugador: NSObject {
    
    var nombre : String = ""
    var puntos : Int = 0
    var email : String = ""
    var foto : UIImage!
    
    
    init(nombre : String, puntos : Int, email : String, foto : UIImage!) {
        self.nombre = nombre
        self.puntos = puntos
        self.email = email
        self.foto = foto
    }
    

}

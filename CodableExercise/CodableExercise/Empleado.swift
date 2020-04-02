//
//  Empleado.swift
//  CodableExercise
//
//  Created by user168639 on 4/2/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class Empleado: NSObject, Codable {
    var nombre: String
    var ident: Int
    
    init(nombre: String, ident: Int) {
        self.nombre = nombre
        self.ident = ident
    }
}

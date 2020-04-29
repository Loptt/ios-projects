//
//  Articulo.swift
//  Tares6
//
//  Created by user168639 on 4/28/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class Articulo: NSObject, Codable {
    var id: String
    var desc: String
    var cant: Int
    
    init(id: String, desc: String, cant: Int) {
        self.id = id
        self.desc = desc
        self.cant = cant
    }
}

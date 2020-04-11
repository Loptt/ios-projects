//
//  Categoria.swift
//  Minireto2
//
//  Created by user168639 on 4/11/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class Categoria: NSObject {
    var title: String
    var color: UIColor
    
    init(title: String, color: UIColor) {
        self.title = title
        self.color = color
    }
}

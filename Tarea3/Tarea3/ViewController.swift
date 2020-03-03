//
//  ViewController.swift
//  Tarea3
//
//  Created by Alumno on 03/03/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbMetrics: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var imgFigura: UIImageView!
    
    var metrics: String!
    var result: String!
    var figura: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        lbMetrics.text = metrics
        lbResult.text = result
        imgFigura.image = figura
    }
    
    @IBAction func limpiarDatos(_ sender: Any) {
        lbMetrics.text = ""
        lbResult.text = ""
        imgFigura.image = nil
    }
}


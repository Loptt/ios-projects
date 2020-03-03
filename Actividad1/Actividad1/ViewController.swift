//
//  ViewController.swift
//  Actividad1
//
//  Created by Alumno on 17/02/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var vFondo: UIView!
    @IBOutlet weak var ivPeolta: UIImageView!
    @IBOutlet weak var lTexto: UILabel!
    @IBOutlet weak var vFondoTexto: UIView!
    @IBOutlet weak var vFondo2: UIView!
    
    @IBAction func mueveSlider(_ sender: UISlider) {
        let width = Float(vFondo.frame.size.width)
        let sliderPos = sender.value
        
        let newX = (width * sliderPos) - (Float(ivPeolta.frame.size.width) / 2)
        
        ivPeolta.frame.origin.x = CGFloat(newX)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cambiaButton(_ sender: UISegmentedControl) {
        var newX : Float
        if sender.selectedSegmentIndex == 0 {
            newX = 25
        } else {
            newX = 180
        }
        
        UIView.animate(withDuration: 1, animations: {
            self.vFondoTexto.frame.origin.x = CGFloat(newX)
        })
    }
    
    
}


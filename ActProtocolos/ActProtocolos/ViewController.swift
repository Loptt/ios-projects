//
//  ViewController.swift
//  ActProtocolos
//
//  Created by user168639 on 3/30/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class ViewController: UIViewController, protocoloSeleccionar {
    
    @IBOutlet weak var viewColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func seleccionaColor(color : UIColor) {
        viewColor.backgroundColor = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewSelect = segue.destination as! ViewControllerAgregar
        viewSelect.delegado = self
    }
}


//
//  ViewControllerAzul.swift
//  ActClaseStoryboardsE20
//
//  Created by Alumno on 27/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerAzul: UIViewController {

    @IBOutlet weak var tfNombre: UITextField!
    
    var nombre: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNombre.text = nombre
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  vistaIni = segue.destination as! ViewController
        vistaIni.nombre = tfNombre.text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

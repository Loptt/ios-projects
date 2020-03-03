//
//  ViewControllerVerde.swift
//  ActClaseStoryboardsE20
//
//  Created by Alumno on 27/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerVerde: UIViewController {

    @IBOutlet weak var tfCelular: UITextField!
    @IBOutlet weak var imgPerfil: UIImageView!
    
    var celular: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfCelular.text = celular
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  vistaIni = segue.destination as! ViewController
        vistaIni.foto = imgPerfil.image
        vistaIni.celular = tfCelular.text
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

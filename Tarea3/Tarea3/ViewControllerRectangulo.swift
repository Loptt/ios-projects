//
//  ViewControllerRectangulo.swift
//  Tarea3
//
//  Created by Alumno on 03/03/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewControllerRectangulo: UIViewController {

    @IBOutlet weak var tfLargo: UITextField!
    @IBOutlet weak var tfAncho: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var imgRect: UIImageView!
    
    var metrics: String!
    var volumen: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let largo = Double(tfLargo.text!), let ancho = Double(tfAncho.text!), let altura = Double(tfAltura.text!) {
            
            let vol = largo * ancho * altura
            
            metrics = "largo = \(largo)\nancho = \(ancho)\naltura = \(altura)"
            volumen = "\(vol)"
            
            return true
        } else {
            showAlerta()
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vista = segue.destination as! ViewController
        vista.metrics = metrics
        vista.result = volumen
        vista.figura = imgRect.image
    }
    
    func showAlerta() {
        let alerta = UIAlertController(title: "Error", message: "Valores numéricos inválidos", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alerta, animated: true, completion: nil)
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

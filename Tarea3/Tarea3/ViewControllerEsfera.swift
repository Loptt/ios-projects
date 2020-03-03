//
//  ViewControllerEsfera.swift
//  Tarea3
//
//  Created by Alumno on 03/03/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewControllerEsfera: UIViewController {

    @IBOutlet weak var tfRadio: UITextField!
    @IBOutlet weak var imgEsfera: UIImageView!
    
    var metrics : String!
    var result : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let radio = Double(tfRadio.text!) {
            metrics = "Radio = \(radio)"
            let vol = radio * radio * radio * (4.0/3.0) * 3.141592
            result = "\(vol)"
            return true
        } else {
            showAlerta()
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vista = segue.destination as! ViewController
        
        vista.metrics = metrics
        vista.result = result
        vista.figura = imgEsfera.image
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

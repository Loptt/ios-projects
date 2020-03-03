//
//  ViewController.swift
//  Tarea1
//
//  Created by Alumno on 18/02/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfActividades: UITextField!
    @IBOutlet weak var tfParciales: UITextField!
    @IBOutlet weak var tfExamenFinal: UITextField!
    @IBOutlet weak var sSwitch: UISwitch!
    @IBOutlet weak var tfResultado: UITextField!

    @IBOutlet weak var lExamenFinal: UILabel!
    @IBOutlet weak var bCalcula: UIButton!
    @IBOutlet weak var lMensaje: UILabel!
    
    @IBAction func calculaResultado(_ sender: UIButton) {
        if sSwitch.isOn {
            if let parciales = Double(tfParciales.text!),
                let actividades = Double(tfActividades.text!),
                let eFinal = Double(tfExamenFinal.text!) {
                
                let final = parciales * 0.5 + actividades * 0.2 + eFinal * 0.3
                
                tfResultado.text = String(final)
            } else {
                let alert = UIAlertController(title: "Error", message: "Favor de ingresar numeros en todos los campos", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                alert.addAction(accion)
                present(alert, animated: true, completion: nil)
            }
        } else {
            if let parciales = Double(tfParciales.text!),
                let actividades = Double(tfActividades.text!) {
                
                let acc = parciales * 0.5 + actividades * 0.2
                let req = 70 - acc
                
                let result = (req / 30.0) * 100
                    
                tfResultado.text = String(result)
            } else {
                let alert = UIAlertController(title: "Error", message: "Favor de ingresar numeros en todos los campos", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                alert.addAction(accion)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cambiaEstado(_ sender: UISwitch) {
        if sender.isOn {
            lExamenFinal.isHidden = false
            tfExamenFinal.isHidden = false
            bCalcula.setTitle("Calcula Nota Final", for: .normal)
            lMensaje.text = "Nota final"
        } else {
            lExamenFinal.isHidden = true
            tfExamenFinal.isHidden = true
            bCalcula.setTitle("Calcula Nota Pasar", for: .normal)
            lMensaje.text = "Nota para pasar"
        }
        
        tfResultado.text = ""
        tfExamenFinal.text = ""
        tfActividades.text = ""
        tfParciales.text = ""
    }
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


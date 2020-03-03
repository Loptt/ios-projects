//
//  ViewController.swift
//  TableViewEx
//
//  Created by Alumno on 02/03/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var lista = ["Moises", "Eriq", "Memo", "Ferca"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lista de Datos"
    }
    
    //MARK: - Metodos de Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        
        let tipoLetra = UIFont(name: "Palatino", size: 35)
        celda.textLabel?.text = lista[indexPath.row]
        celda.textLabel?.textColor = UIColor.white
        celda.textLabel?.font = tipoLetra
        celda.detailTextLabel?.text = String(indexPath.row)
        celda.detailTextLabel?.textColor = UIColor.white
        celda.imageView?.image = UIImage(named: "monster")
        
        return celda
    }
    
    //MARK - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaDetalle = segue.destination as! ViewControllerDetalle
        
        let indice = tableView.indexPathForSelectedRow!
        
        vistaDetalle.datoMostrar = lista[indice.row]
    }
}


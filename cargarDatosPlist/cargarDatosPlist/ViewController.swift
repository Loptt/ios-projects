//
//  ViewController.swift
//  cargarDatosPlist
//
//  Created by Alumno on 12/03/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbTipo: UILabel!
    @IBOutlet weak var lbCapacidad: UILabel!
    @IBOutlet weak var lbPrecio: UILabel!
    var arrDiccionarios : NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        arrDiccionarios = NSArray(contentsOfFile: path!)
    }

    //MARK: - Metodos de Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDiccionarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda")!
        
        let dic = arrDiccionarios[indexPath.row] as! NSDictionary
        
        celda.textLabel?.text = dic["tipo"] as? String
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dic = arrDiccionarios[indexPath.row] as! NSDictionary
        
        lbTipo.text = dic["tipo"] as? String
        lbCapacidad.text = dic["capacidad"] as? String
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        let NSNumPrecio = dic["precio"] as! NSNumber
        lbPrecio.text = formatter.string(from: NSNumPrecio)
        
        let sUrl = dic["urlFoto"] as? String
        let url = URL(string: sUrl!)
        let imgData = NSData(contentsOf: url!)
        
        imgFoto.image = UIImage(data: imgData! as Data)
    }
}


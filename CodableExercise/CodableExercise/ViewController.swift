//
//  ViewController.swift
//  CodableExercise
//
//  Created by user168639 on 4/2/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfIdent: UITextField!
    @IBOutlet weak var table: UITableView!
    
    var listaEmpleados: [Empleado]!

    override func viewDidLoad() {
        super.viewDidLoad()
        listaEmpleados = []
        
        table.dataSource = self
        table.delegate = self
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(guardarEmpleados), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        if FileManager.default.fileExists(atPath: dataFileURL().path) {
            obtenerEmplados()
        }
    }
    
    @IBAction func agregarEmpleado(_ sender: Any) {
        if let nombre = tfNombre.text, let ident = Int(tfIdent.text!) {
            let emp = Empleado(nombre: nombre, ident: ident)
            listaEmpleados.append(emp)
        }
        
        table.reloadData()
    }
    
    @IBAction func guardarEmpleados() {
        do {
            let data = try PropertyListEncoder().encode(listaEmpleados)
            try data.write(to: dataFileURL())
        }
        catch {
            print("Error al guardar datos")
        }
    }
    
    func obtenerEmplados() {
        listaEmpleados.removeAll()
        
        do {
            let data = try Data.init(contentsOf: dataFileURL())
            listaEmpleados = try PropertyListDecoder().decode([Empleado].self, from: data)
        }
        catch {
            print("Error al cargar datos")
        }
        
        table.reloadData()
    }

    func dataFileURL () -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let pathArchivo = url.appendingPathComponent("Empleados.plist")
        print(pathArchivo.path)
        
        return pathArchivo
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaEmpleados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = table.dequeueReusableCell(withIdentifier: "celda")!
        let empleado = listaEmpleados[indexPath.row]
        celda.textLabel?.text = empleado.nombre
        celda.detailTextLabel?.text = "\(empleado.ident)"
        
        return celda
    }

}


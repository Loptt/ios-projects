//
//  TableViewController.swift
//  Tares6
//
//  Created by user168639 on 4/28/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, administradorArticulos {
    
    var listaArticulos: [Articulo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(guardarArticulos), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        if FileManager.default.fileExists(atPath: dataFileURL().path) {
            obtenerArticulos()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaArticulos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let art = listaArticulos[indexPath.row]
        cell.textLabel?.text = art.id
        cell.detailTextLabel?.text = art.desc

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! ViewController
        
        view.delegate = self
        
        if segue.identifier == "add" {
            view.add = true
        } else {
            view.add = false
            view.articulo = listaArticulos[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    
    func agregarArticulo(articulo: Articulo) {
        listaArticulos.append(articulo)
        tableView.reloadData()
    }
    
    func modificarArticulo(articulo: Articulo) {
        tableView.reloadData()
    }
    
    func dataFileURL() -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("Articulos.plist")
        return pathArchivo
    }
    
    @objc func guardarArticulos() {
        do {
            let data = try PropertyListEncoder().encode(listaArticulos)
            try data.write(to: dataFileURL())
        }
        catch {
            print("Error al guardar archivos")
        }
    }
    
    func obtenerArticulos() {
        listaArticulos.removeAll()
        
        do {
            let data = try Data.init(contentsOf: dataFileURL())
            listaArticulos = try PropertyListDecoder().decode([Articulo].self, from: data)
        }
        catch {
            print("Error al cargar archivos")
        }
        
        tableView.reloadData()
    }
}

protocol administradorArticulos {
    func agregarArticulo(articulo: Articulo)
    func modificarArticulo(articulo: Articulo)
}

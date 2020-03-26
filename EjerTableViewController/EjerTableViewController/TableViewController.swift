//
//  TableViewController.swift
//  EjerTableViewController
//
//  Created by Yolanda Martinez on 2/12/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, protocoloAgregarJugador {

    var listaJugadores = [Jugador]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var jugador = Jugador(nombre: "Juan", puntos: 2500, email: "juan@hotmail.com", foto: nil)
        listaJugadores.append(jugador)
        
        jugador = Jugador(nombre: "Carolina", puntos: 2800, email: "caro@gmail.com", foto: UIImage(named: "Mickey"))
        listaJugadores.append(jugador)
        
        jugador = Jugador(nombre: "Karla", puntos: 3200, email: "karla@gmail.com", foto: UIImage(named: "Donald"))
        listaJugadores.append(jugador)
        
        title = "Jugadores"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaJugadores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let foto = listaJugadores[indexPath.row].foto {
            cell.imageView?.image = foto
        }
        else {
            cell.imageView?.image = UIImage(named: "user")
        }
        cell.textLabel?.text = listaJugadores[indexPath.row].nombre

        return cell
    }
    

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaJug = segue.destination as! ViewController
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        vistaJug.jug = listaJugadores[indexPath.row]
        
    }
    
    func agregaJugador(jug: Jugador) {
        listaJugadores.append(jug)
        tableView.reloadData()
    }
    

}

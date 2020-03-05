//
//  TableViewController.swift
//  TableViewController
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listaJugadores = [Jugador]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jug1 = Jugador(nombre: "Erick", puntos: 20, email: "eriq.lokillo@live.com", image: UIImage(named: "p2")!)
        let jug2 = Jugador(nombre: "Moises", puntos: 50, email: "rekmoy881@gmail.com", image: UIImage(named: "p3")!)
        let jug3 = Jugador(nombre: "Ferca", puntos: 100, email: "ferca@google.com", image: UIImage(named: "p1")!)
        
        listaJugadores += [jug1, jug2, jug3]
        
        title = "Lista de Jugadores"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = listaJugadores[indexPath.row].nombre
        cell.imageView?.image = listaJugadores[indexPath.row].image

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailView = segue.destination as! ViewController
        
        let idx = tableView.indexPathForSelectedRow!
        detailView.jugador = listaJugadores[idx.row]
        
    }

}

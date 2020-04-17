//
//  TableViewController.swift
//  Tarea5
//
//  Created by user168639 on 4/16/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var tfNombre: UILabel!
    @IBOutlet weak var tfSueldo: UILabel!
    @IBOutlet weak var tfDepartamento: UILabel!
}

class TableViewController: UITableViewController {
    
    var empleados: [Empleado] = [Empleado(nombre: "Erick", sueldo: 15, foto: UIImage(named: "e1")!, departamento: "Finanzas"), Empleado(nombre: "Moises", sueldo: 32, foto: UIImage(named: "e2")!, departamento: "HR"), Empleado(nombre: "Victor", sueldo: 324, foto: UIImage(named: "e3")!, departamento: "Merca"), Empleado(nombre: "Jorge", sueldo: 524, foto: UIImage(named: "e4")!, departamento: "Finanzas")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.title = "Empleados"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return empleados.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomTableViewCell

        cell.tfNombre.text = empleados[indexPath.row].nombre
        cell.tfSueldo.text = "\(empleados[indexPath.row].sueldo)"
        cell.tfDepartamento.text = empleados[indexPath.row].departamento
        cell.imgFoto.image = empleados[indexPath.row].foto
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.green
        }

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            empleados.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
        tableView.reloadData()
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let temp = empleados[fromIndexPath.row]
        empleados[fromIndexPath.row] = empleados[to.row]
        empleados[to.row] = temp
        
        tableView.reloadData()

    }

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 163
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

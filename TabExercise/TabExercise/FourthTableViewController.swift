//
//  FourthTableViewController.swift
//  TabExercise
//
//  Created by user168639 on 4/13/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class FourthTableViewController: UITableViewController {
    
    var listaDatos = ["uno", "dos", "tres", "cuatro", "cinco", "seis"]
    
    var datoLogin: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        isModalInPresentation = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaDatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = "\(listaDatos[indexPath.row])"

        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vista = segue.destination as! FifthViewController
        
        vista.text = "\(listaDatos[tableView.indexPathForSelectedRow!.row]) \(datoLogin!)"
    }
    

    @IBAction func botonBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

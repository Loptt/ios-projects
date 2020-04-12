//
//  TableViewController.swift
//  Minireto2
//
//  Created by user168639 on 4/11/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

protocol administraCategoria {
    func agregaCategoria(categoria: Categoria)
    func modificaCategoria(categoria: Categoria)
}

class TableViewController: UITableViewController, administraCategoria {
    
    var possibleColors: [UIColor] = [UIColor.blue, UIColor.red, UIColor.green, UIColor.yellow, UIColor.orange, UIColor.purple, UIColor.cyan]
    
    var categories: [Categoria] = []
    
    var modifyIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Categorias"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = categories[indexPath.row].title
        cell.backgroundColor = categories[indexPath.row].color
        cell.backgroundColor?.withAlphaComponent(0.75)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        
        destination.administrador = self
        destination.possibleColors = possibleColors
        
        if segue.identifier == "add" {
            destination.add = true
        } else {
            modifyIndex = tableView.indexPathForSelectedRow!.row
            destination.add = false
            destination.modifyCateogory = categories[modifyIndex]
        }
    }
    
    // MARK: - Implementacion protocolo
    
    func modificaCategoria(categoria: Categoria) {
        let removedColor = categoria.color
        let index = possibleColors.firstIndex(where: {$0 == removedColor})
        
        possibleColors.remove(at: index!)
        
        let addedColor = categories[modifyIndex].color
        
        possibleColors.append(addedColor)
        categories[modifyIndex].color = categoria.color
        
        tableView.reloadData()
    }
    
    func agregaCategoria(categoria: Categoria) {

        let index = possibleColors.firstIndex(where: {$0 == categoria.color})
        
        possibleColors.remove(at: index!)
        categories.append(categoria)
        
        tableView.reloadData()
    }
}

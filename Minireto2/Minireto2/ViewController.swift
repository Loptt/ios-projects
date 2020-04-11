//
//  ViewController.swift
//  Minireto2
//
//  Created by user168639 on 4/11/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tfTitle: UITextField!
    
    var possibleColors: [UIColor] = []
    var administrador: administraCategoria!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return possibleColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.backgroundColor = possibleColors[indexPath.row]
        cell.backgroundColor?.withAlphaComponent(0.75)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let newTitle = tfTitle.text {
            if newTitle.isEmpty {
                return
            }
            let color = possibleColors[indexPath.row]
            
            administrador.agregaCategoria(categoria: Categoria(title: newTitle, color: color))
            navigationController?.popViewController(animated: true)
        }
    }
}


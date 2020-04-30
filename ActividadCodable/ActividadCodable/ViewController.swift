//
//  ViewController.swift
//  ActividadCodable
//
//  Created by user168639 on 4/30/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    var lista: [Int] = []
    
    var counter = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveAll), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        if FileManager.default.fileExists(atPath: numbersFileURL().path) && FileManager.default.fileExists(atPath: selectedFileURL().path) {
            print("Loading all")
            loadAll()
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lista.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(lista[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let title = UILabel()
        
        title.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        title.textColor = UIColor.green
        title.text = String(lista[row])
        title.textAlignment = .center
        
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent: Int) -> CGFloat {
        return 50
    }
    
    @IBAction func addElement(_ sender: Any) {
        lista.append(counter)
        counter += 100
        picker.reloadAllComponents()
    }
    
    func numbersFileURL () -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let pathArchivo = url.appendingPathComponent("Numbers.plist")
        return pathArchivo
    }
    
    func selectedFileURL () -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let pathArchivo = url.appendingPathComponent("Selected.plist")
        return pathArchivo
    }
    
    func saveList() {
        do {
            let data = try PropertyListEncoder().encode(lista)
            try data.write(to: numbersFileURL())
        }
        catch {
            print("Error al guardar lista")
        }
    }
    
    func saveSelected() {
        do {
            let data = try PropertyListEncoder().encode([picker.selectedRow(inComponent: 0)])
            try data.write(to: selectedFileURL())
        }
        catch {
            print("Error guardando selected")
        }
    }
    
    @objc func saveAll() {
        saveList()
        saveSelected()
    }
    
    func loadAll() {
        loadList()
        loadSelected()
    }
    
    func loadList() {
        lista.removeAll()
        
        do {
            let data = try Data.init(contentsOf: numbersFileURL())
            lista = try PropertyListDecoder().decode([Int].self, from: data)
        }
        catch {
            print("Error al cargar datos")
        }
        
        counter = lista[lista.count-1]+100
        
        picker.reloadAllComponents()
    }
    
    func loadSelected() {
        do {
            let data = try Data.init(contentsOf: selectedFileURL())
            let selected = try PropertyListDecoder().decode([Int].self, from: data)
            picker.selectRow(selected[0], inComponent: 0, animated: true)
        }
        catch {
            print("Error al cargar datos")
        }
        
        picker.reloadAllComponents()
    }
}


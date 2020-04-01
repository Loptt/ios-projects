//
//  ViewController.swift
//  Tarea4
//
//  Created by user168639 on 3/31/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
        
    
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var wonView: UIView!
    
    let icons: [UIImage] = [UIImage(named: "seven")!, UIImage(named: "bar")!, UIImage(named: "banana")!, UIImage(named: "cherry")!, UIImage(named: "watermelon")!, UIImage(named: "bell")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker1.delegate = self
        self.picker1.dataSource = self
        
        wonView.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return icons.count
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent  component: Int, reusing view: UIView?) -> UIView {
        
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        view.image = icons[row]
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return CGFloat(70)
    }
    
    @IBAction func goAction(_ sender: Any) {
        randomize()
        
        var rows: [Int] = []
        
        for i in 0...2 {
            rows.append(picker1.selectedRow(inComponent: i))
        }
        
        var won = true
        let initial = rows[0]
        
        for row in rows {
            if row != initial {
                won = false
            }
        }
        
        if won {
            wonView.isHidden = false
        }
    }
    
    @IBAction func resetAction(_ sender: Any) {
        for i in 0...2 {
            picker1.selectRow(0, inComponent: i, animated: true)
        }
        wonView.isHidden = true
    }
    
    func randomize() {
        for i in 0...2 {
            picker1.selectRow(Int.random(in: 0..<icons.count), inComponent: i, animated: true)
        }
    }
    
}


//
//  ViewController.swift
//  Tarea2
//
//  Created by Alumno on 25/02/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbMonth: UILabel!
    @IBOutlet weak var lbDay: UILabel!
    @IBOutlet weak var lbWeekday: UILabel!
    
    var stateDate = Date()
    
    func updateDateInfo() {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        lbYear.text = formatter.string(from: stateDate)
        
        formatter.dateFormat = "MMMM"
        lbMonth.text = formatter.string(from: stateDate)
        
        formatter.dateFormat = "d"
        lbDay.text = formatter.string(from: stateDate)
        
        formatter.dateFormat = "EEEE"
        lbWeekday.text = formatter.string(from: stateDate)
    }
    
    
    @IBAction func gestureAction1(_ sender: Any) {
        swipeActionLeft()
    }
    
    @IBAction func gestureAction2(_ sender: Any) {
        swipeActionRight()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDateInfo()
    }
    
    func swipeActionLeft() {
        stateDate.addTimeInterval(60*60*24)
        updateDateInfo()
    }
    
    func swipeActionRight() {            stateDate.addTimeInterval(60*60*24*(-1))
        updateDateInfo()
    }

}


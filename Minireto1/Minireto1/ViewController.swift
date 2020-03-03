//
//  ViewController.swift
//  Minireto1
//
//  Created by Alumno on 27/02/20.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var respuesta: UIView!
    @IBOutlet weak var viewRes1: UIButton!
    @IBOutlet weak var viewRes2: UIButton!
    @IBOutlet weak var viewRes3: UIButton!
    @IBOutlet weak var viewRes4: UIButton!
    
    @IBOutlet weak var viewChoice1: UIButton!
    @IBOutlet weak var viewChoice2: UIButton!
    @IBOutlet weak var viewChoice3: UIButton!
    @IBOutlet weak var viewChoice4: UIButton!
    
    var answerViews: [UIButton] = []
    var choiceViews: [UIButton] = []
    
    let possibleColors = [UIColor.green, UIColor.blue, UIColor.purple, UIColor.red, UIColor.yellow, UIColor.cyan]
    
    var answer: [UIColor] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        respuesta.isHidden = true
        
        answerViews.append(viewRes1)
        answerViews.append(viewRes2)
        answerViews.append(viewRes3)
        answerViews.append(viewRes4)
        
        choiceViews.append(viewChoice1)
        choiceViews.append(viewChoice2)
        choiceViews.append(viewChoice3)
        choiceViews.append(viewChoice4)
        
        initializeColors()
        initializeChoices()
    }
    
    func initializeColors() {
        var randIndex: Int
        var remaining = possibleColors
        
        answer = []
                
        for _ in 0...3 {
            randIndex = Int.random(in: 0 ... (remaining.count-1))
            answer.append(remaining[randIndex])
            remaining.remove(at: randIndex)
        }
        
        for (color, view) in zip(answer, answerViews) {
            view.backgroundColor = color
        }
    }
    
    func initializeChoices() {
        for i in 0...3 {
            choiceViews[i].backgroundColor = possibleColors[i]
        }
    }

    @IBAction func cambiarEstado(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            respuesta.isHidden = false
        } else {
            respuesta.isHidden = true
        }
    }
    @IBAction func iniciar(_ sender: Any) {
        initializeColors()
        initializeChoices()
    }
    
    
    @IBAction func cambiarColor(_ sender: UIButton) {
        var idx = possibleColors.firstIndex(of: sender.backgroundColor!)!
        
        idx += 1
        idx = idx % possibleColors.count
        
        sender.backgroundColor = possibleColors[idx]
    }
    
    @IBAction func probar(_ sender: UIButton) {
        var encontrados = [false, false, false, false, false, false]
        
        var idx: Int
        var error = false
        
        for choice in choiceViews {
            idx = possibleColors.firstIndex(of: choice.backgroundColor!)!
            
            if encontrados[idx] {
                error = true
                break
            }
            
            encontrados[idx] = true
        }
        
        if error {
            let alert = UIAlertController(title: "Error", message: "No puede haber colores repetidos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            
            return
        }
        
        
    }
}


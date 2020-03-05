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
    
    @IBOutlet weak var viewHint1: UIButton!
    @IBOutlet weak var viewHint2: UIButton!
    @IBOutlet weak var viewHint3: UIButton!
    @IBOutlet weak var viewHint4: UIButton!
    
    
    var answerViews: [UIButton] = []
    var choiceViews: [UIButton] = []
    var hintViews: [UIButton] = []
    
    let possibleColors = [UIColor.green, UIColor.blue, UIColor.purple, UIColor.red, UIColor.yellow, UIColor.cyan]
    
    var answer: [UIColor] = []
    
    var backColor = UIColor.lightGray
        
    override func viewDidLoad() {
        super.viewDidLoad()
        respuesta.isHidden = true
        
        view.backgroundColor = backColor
        
        answerViews.append(viewRes1)
        answerViews.append(viewRes2)
        answerViews.append(viewRes3)
        answerViews.append(viewRes4)
        
        choiceViews.append(viewChoice1)
        choiceViews.append(viewChoice2)
        choiceViews.append(viewChoice3)
        choiceViews.append(viewChoice4)
        
        hintViews.append(viewHint4)
        hintViews.append(viewHint3)
        hintViews.append(viewHint2)
        hintViews.append(viewHint1)
        
        initializeColors()
        initializeChoices()
        initializeHints()
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
    
    func initializeHints() {
        for view in hintViews {
            view.backgroundColor = backColor
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
        
        initializeHints()
        
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
        
        var correctColor: Int = 0
        var correctAll: Int = 0
    
        
        for (i, choice) in choiceViews.enumerated() {
            let idx = answer.firstIndex(of: choice.backgroundColor!)
            
            if idx == nil {
                continue
            }
            
            if idx == i {
                correctAll += 1
            } else {
                correctColor += 1
            }
        }
        
        for hint in hintViews {
            if correctAll > 0 {
                hint.backgroundColor = UIColor.red
                correctAll -= 1
            } else if correctColor > 0 {
                hint.backgroundColor = UIColor.white
                correctColor -= 1
            }
        }
    }
}


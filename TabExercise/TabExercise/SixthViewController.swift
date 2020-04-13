//
//  SixthViewController.swift
//  TabExercise
//
//  Created by user168639 on 4/13/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var tfDato: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationControllerView = segue.destination as! UINavigationController
        
        let tableViewController = navigationControllerView.topViewController as! FourthTableViewController
        
        tableViewController.datoLogin = tfDato.text
    }
}

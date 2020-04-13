//
//  FifthViewController.swift
//  TabExercise
//
//  Created by user168639 on 4/13/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var lbText: UILabel!
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbText.text = text
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

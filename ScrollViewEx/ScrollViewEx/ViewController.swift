//
//  ViewController.swift
//  ScrollViewEx
//
//  Created by user168639 on 4/20/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vistaVerde: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = vistaVerde.frame.size
    }


}


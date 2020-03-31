//
//  ViewControllerAgregar.swift
//  ActProtocolos
//
//  Created by user168639 on 3/30/20.
//  Copyright © 2020 user168639. All rights reserved.
//

import UIKit

protocol protocoloSeleccionar {
    func seleccionaColor(color: UIColor) -> Void
 }

class ViewControllerAgregar: UIViewController {
    
    var delegado : protocoloSeleccionar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func oprimirColor(_ sender: UIButton) {
        delegado.seleccionaColor(color: sender.backgroundColor!)
        dismiss(animated: true, completion: nil)
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

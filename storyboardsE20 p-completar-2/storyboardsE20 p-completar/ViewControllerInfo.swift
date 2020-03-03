//
//  ViewControllerInfo.swift
//  storyboardsE20 p-completar
//
//  Created by Alumno on 24/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerInfo: UIViewController {

    @IBOutlet weak var imgFotoEditar: UIImageView!
    @IBOutlet weak var lbAncho: UILabel!
    @IBOutlet weak var lbAltura: UILabel!
    
    var foto : UIImage!
    var ancho : CGFloat!
    var altura : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgFotoEditar.image = foto
        lbAncho.text = String(describing: ancho!)
        lbAltura.text = String(describing: altura!)
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

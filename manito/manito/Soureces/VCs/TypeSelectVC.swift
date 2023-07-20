//
//  TypeSelectVC.swift
//  manito
//
//  Created by 우진 on 2023/07/18.
//

import UIKit

class TypeSelectVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func mailMatchingButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowInputMail", sender: sender)
    }
    

}

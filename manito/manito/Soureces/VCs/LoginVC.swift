//
//  LoginVC.swift
//  manito
//
//  Created by 우진 on 2023/07/16.
//

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func LoginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowMain", sender: sender)
    }
    
}

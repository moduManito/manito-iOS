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
        setKeyboardObserver() // 키보드 올라오고 내려갈때 전체 뷰를 키보드 높이 만큼 올렸다 내림
       
    }

    @IBAction func LoginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowMain", sender: sender)
    }
    
    @IBAction func tapBackgroundView(_ sender: Any) {
        // 배경 터치시 키보드 내리게 함
        view.endEditing(true)
    }
    
}

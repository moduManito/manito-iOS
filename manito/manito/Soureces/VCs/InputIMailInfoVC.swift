//
//  InputMailInfoVC.swift
//  manito
//
//  Created by 우진 on 2023/07/18.
//

import UIKit

class InputMailInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboardObserver() // 키보드 올라오고 내려갈때 전체 뷰를 키보드 높이 만큼 올렸다 내림
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowCheckInfo", sender: sender)
    }
    
    @IBAction func tapBackgroundView(_ sender: Any) {
        // 배경 터치시 키보드 내리게 함
        view.endEditing(true)
    }

}



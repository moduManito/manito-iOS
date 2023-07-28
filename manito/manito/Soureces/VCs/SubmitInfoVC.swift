//
//  SubmitInfoVC.swift
//  manito
//
//  Created by 우진 on 2023/07/28.
//

import UIKit

class SubmitInfoVC: UIViewController {
    
    var createdManitoCount: Int?

    // IBOutlet
    @IBOutlet weak var createdMamitoCountLabel: UILabel!
    
    // IBAction
    @IBAction func goHomeButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 뷰 컨트롤러가 나타날 때 NavBar 숨기기
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 뷰 컨트롤러가 사라질 때 NavBar 나타내기
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func updateUI() {
        createdMamitoCountLabel.text = "\(createdManitoCount ?? 0)명"
    }
    

}

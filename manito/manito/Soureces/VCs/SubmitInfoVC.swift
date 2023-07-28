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
    
    private func updateUI() {
        createdMamitoCountLabel.text = "\(createdManitoCount ?? 0)명"
    }
    

}

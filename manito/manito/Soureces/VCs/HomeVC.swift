//
//  HomeVC.swift
//  manito
//
//  Created by 우진 on 2023/07/17.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myManitoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MyManitoCell", bundle: nil)
        myManitoTableView.register(nib, forCellReuseIdentifier: "MyManitoCell")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyManitoCell", for: indexPath) as? MyManitoCell else {
            return UITableViewCell()
        }
        
        cell.manitoNumLabel.text = "#1"
        cell.manitoTypeLabel.text = "함께 알아봐요"
        cell.manitoTitleLabel.text = "영업팀 마니또"
        cell.manitoDateLabel.text = "2023.01.01 ~ 2023.01.02"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click Cell Number: \(indexPath.row)")
    }
    

}

//
//  MyManitoCell.swift
//  manito
//
//  Created by 우진 on 2023/07/17.
//

import UIKit

class MyManitoCell: UITableViewCell {
    // UILabel
    @IBOutlet weak var manitoNumLabel: UILabel!
    @IBOutlet weak var manitoTypeLabel: UILabel!
    @IBOutlet weak var manitoTitleLabel: UILabel!
    @IBOutlet weak var manitoDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

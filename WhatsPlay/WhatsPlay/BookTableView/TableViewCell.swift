//
//  TableViewCell.swift
//  WhatsPlay
//
//  Created by Joker Hook on 2019/3/14.
//  Copyright © 2019 com.icloud@h76joker. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView! {
        didSet {
            backgroundImage.layer.cornerRadius = 15.0
            backgroundImage.layer.masksToBounds = true
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    

}

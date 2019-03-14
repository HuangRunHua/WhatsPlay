//
//  FeaturedTableViewCell.swift
//  WhatsPlay
//
//  Created by Joker Hook on 2019/3/14.
//  Copyright © 2019 com.icloud@h76joker. All rights reserved.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.layer.cornerRadius = 10.0
            bookImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var bookTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

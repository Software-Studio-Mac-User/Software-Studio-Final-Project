//
//  ItemTableViewCell.swift
//  Software_Studio_Final_Project
//
//  Created by C_Nak on 2021/06/16.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    static let identifier = "ItemCell"

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitle: UITextView!
    @IBOutlet weak var itemTime: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.itemImageView.layer.cornerRadius = 8
        self.itemImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

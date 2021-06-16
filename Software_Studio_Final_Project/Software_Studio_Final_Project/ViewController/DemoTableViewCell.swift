//
//  DemoTableViewCell.swift
//  Software_Studio_Final_Project
//
//  Created by 김석재 on 2021/06/17.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet var ChattingLabel: UILabel!
    @IBOutlet var ChattingUser: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

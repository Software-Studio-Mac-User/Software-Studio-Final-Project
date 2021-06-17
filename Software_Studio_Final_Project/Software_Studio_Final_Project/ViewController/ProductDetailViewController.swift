//
//  ProductDetailViewController.swift
//  Software_Studio_Final_Project
//
//  Created by m3u on 2021/06/18.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    var numOfpage: String?
    var numOfpage2: String?
    var numOfpage3: String?
    var numOfpage4: UIImageView?
    
    @IBOutlet weak var showLabel: UILabel!
    
    @IBOutlet weak var showLabel2: UILabel!
    
    @IBOutlet weak var showLabel3: UILabel!
    
    @IBOutlet weak var showImage: UIImageView!
    
    func updateUI() {
        if let numOfpage = numOfpage{
            showLabel.text = "\(numOfpage)"
        }
        else if let numOfpage2 = numOfpage2{
            showLabel2.text = "\(numOfpage2)"
        }
        else if let numOfpage3 = numOfpage3{
            showLabel3.text = "\(numOfpage3)"
        }
        else if let numOfpage4 = numOfpage4{
            showImage = numOfpage4
        }
    }

}

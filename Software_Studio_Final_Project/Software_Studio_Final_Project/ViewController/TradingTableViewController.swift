//
//  TradingTableViewController.swift
//  Software_Studio_Final_Project
//
//  Created by C_Nak on 2021/06/16.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class TradingTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let maxHeight: CGFloat = 100.0 //headerView의 최대 높이값
    let minHeight: CGFloat = 100.0 //headerView의 최소 높이값
    
    @IBOutlet weak var TradingTableView: UITableView! {
        didSet {
            TradingTableView.contentInset = UIEdgeInsets(top: maxHeight, left: 0, bottom: 0, right: 0)
        }
    }
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint! {
        didSet {
            heightConstraint.constant = maxHeight
        }
    }
    
    @IBAction func onHomeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Chat 버튼 액션
    @IBAction func onChatBtnClicked(_ sender: Any) {
        
    }
    
    // MyPage 버튼 액션
    @IBAction func onMyPageBtnClicked(_ sender: Any) {
        
    }
    
    // 상품 버튼 액션
    @IBAction func onProductBtnClicked(_ sender: Any) {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TradingTableViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            heightConstraint.constant = max(abs(scrollView.contentOffset.y), minHeight)
        }else {
            heightConstraint.constant = minHeight
        }
        let offset = -scrollView.contentOffset.y
        let percentage = (offset-100)/50
        headerView.alpha = percentage
    }
}

//
//  ProductsViewController.swift
//  Software_Studio_Final_Project
//
//  Created by C_Nak on 2021/06/16.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tradingTableView: UITableView!
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "ItemCell"
    
    var itemName:[String] = ["패스트트랙3 판매", "전신 거울 무료 나눔", "캣 타워 판매합니다."]
    var itemPrice:[String] = ["30,000원", "0원", "530,000원"]
    var itemTime:[String] = ["방금 전", "1시간 전", "3일 전"]
    var imageName:[String] = ["item1", "item2", "item3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tradingTableView.dataSource = self
        self.tradingTableView.delegate = self
    }
    
    //하나의 섹션 안에 행의 개수가 몇개인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemName.count
    }
    
    //Adapter안에 row관련 xml을 사용해서 하나의 아이템을 사용할 때
    //하나의 셀을 구성할 때
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tradingTableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.itemTitle.text = itemName[indexPath.row]
        cell.itemPrice.text = itemPrice[indexPath.row]
        cell.itemTime.text = itemTime[indexPath.row]
        cell.itemImageView.image = UIImage(named: imageName[indexPath.row])

        return cell
    }
    
    @IBOutlet weak var homeBtn: UIButton!
    
    // Home 버튼 액션
    @IBAction func onHomeBtnClicked(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        vc.signInDelegate = self.signInDelegate
        self.present(vc, animated: true, completion: nil)
    }
    
    // Chat 버튼 액션
    @IBAction func onChatBtnClicked(_ sender: Any) {
        
    }
    
    // MyPage 버튼 액션
    @IBAction func onMyPageBtnClicked(_ sender: Any) {
        
        // 마이페이지 화면 present
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MyPageViewController") as! MyPageViewController
        vc.signInDelegate = self.signInDelegate
        self.present(vc, animated: true, completion: nil)
    }
    
    // 상품 버튼 액션
    @IBAction func onProductBtnClicked(_ sender: Any) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        vc.signInDelegate = self.signInDelegate
        self.present(vc, animated: true, completion: nil)

    }
    
    
     @IBAction func onProductAddBtnClicked(_ sender: Any) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ProductAddViewController") as! ProductAddViewController
        vc.signInDelegate = self.signInDelegate
        self.present(vc, animated: true, completion: nil)
    }
    
    var signInDelegate: SignInDelegate?
   
}


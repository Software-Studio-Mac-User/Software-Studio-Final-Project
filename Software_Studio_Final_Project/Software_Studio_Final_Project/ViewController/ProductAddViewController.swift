//
//  ProductDetailViewController.swift
//  Software_Studio_Final_Project
//
//  Created by C_Nak on 2021/06/17.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class ProductAddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    // 완료 버튼 액션
    @IBAction func onCompleteBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 닫기 버튼 액션
    @IBAction func onCloseBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var signInDelegate: SignInDelegate?

}

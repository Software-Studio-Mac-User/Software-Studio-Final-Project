//
//  ChattingViewController.swift
//  Software_Studio_Final_Project
//
//  Created by 김석재 on 2021/06/16.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class ChattingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let chatname: [String] = ["유재석", "박명수", "정준하", "노홍철", "정형돈", "하하", "길", "황광희"]
        
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.ChattingLabel?.text = chatname[indexPath.row]
        cell.ChattingUser?.image = UIImage(named: "User")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    
    
    var signInDelegate: SignInDelegate?
}





































//    var signInDelegate: SignInDelegate?
//    @IBOutlet weak var tableView: UITableView!
//
//    private let language:[String] = ["d", "d"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        self.tableView.dataSource = self
//        self.tableView.delegate = self
//    }
//
//    //하나의 섹션 안에 행의 개수가 몇 개인지
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.language.count
//    }
//
//    //Adapter안에 row관련 xml을 사용해서 하나의 아이템을 사용할 때
//    //하나의 셀을 구성할 때
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        return cell
//    }



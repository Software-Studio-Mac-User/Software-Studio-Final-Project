//
//  ChattingViewController.swift
//  Software_Studio_Final_Project
//
//  Created by 김석재 on 2021/06/16.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class ChattingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let chatname: [String] = ["한민수", "양가현", "정상욱", "김석재"]
        
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
            cell.ChattingLabel.text = chatname[indexPath.row]
        cell.ChattingLabel?.text = chatname[indexPath.row]
        cell.ChattingUser?.image = UIImage(named: "User")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
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


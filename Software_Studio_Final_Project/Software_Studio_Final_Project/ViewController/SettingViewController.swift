//
//  SettingViewController.swift
//  Software_Studio_Final_Project
//
//  Created by 정상욱 on 2021/06/16.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit



class SettingViewController: UIViewController {
    
    var signInDelegate: SignInDelegate?
    
    // 공지사항 버튼 액션
    @IBAction func onNoticeBtnClicked(_ sender: Any) {
        
    }
    
    // 로그아웃 버튼 액션
    @IBAction func onLogoutBtnClicked(_ sender: Any) {
        signInDelegate?.logout()
    }
    
    // 버전 정보 버튼 액션
    @IBAction func onVersionInfoBtnClicked(_ sender: Any) {
        self.showVersionAlert()
    }
    
    // 뒤로가기 버튼 액션
    @IBAction func onBackBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func showVersionAlert() {
        
        // 현재 버전 가져오기
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        
        let alertController = UIAlertController(title: "", message: "현재 동근마켓 버전은 \(version)으로 최신버전입니다", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
}


//
//  MyPageViewController.swift
//  Software_Studio_Final_Project
//
//  Created by 정상욱 on 2021/06/16.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit
import MobileCoreServices


class MyPageViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!      // 회원 이름 텍스트필드
    @IBOutlet weak var passwordTextFiled: UITextField!      // 수정할 비밀번호 텍스트필드
    @IBOutlet weak var confirmPwdTextField: UITextField!    // 비밀번호 확인 텍스트필드
    @IBOutlet weak var profileImg: UIImageView!             // 프로필 이미지뷰
    
    @IBOutlet weak var constScrollViewBottom: NSLayoutConstraint!   // 스크롤뷰 Bottom Constraint
    
    @IBOutlet weak var myPageBtn: UIButton!
    
    // 설정 버튼 액션
    @IBAction func onSettingBtnClicked(_ sender: Any) {
        
        // 설정 화면 present
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        vc.signInDelegate = self.signInDelegate
        self.present(vc, animated: true, completion: nil)
        
    }
    
    // 프로필 수정 버튼 액션
    @IBAction func onProfileModifyBtnClicked(_ sender: Any) {
        
        if self.checkData() {
            // TODO: 프로필 수정 DB 적용
            self.showModifyProfileAlert()
        }
    }
    
    // Home 버튼 액션
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
    
    // 갤러리 버튼 액션
    @IBAction func onGalleryBtnClicked(_ sender: Any) {
        self.showLibrary()
    }
    
    var signInDelegate: SignInDelegate?
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createKeyboardEvent()
        createTextfieldEvent()
        
        if let user = UserModel.getCurrentUser() {
            usernameTextField.text = user.username
        }
        
        self.myPageBtn.isSelected = true
    }
    
    /// 키보드 기본 처리
    func createKeyboardEvent() {
        // 키보드가 팝업되거나 숨김 처리될 때 화면 처리 noti
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
        
        // 화면 터치 시 키보드 숨김
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // 키보드 팝업 처리
    @objc func keyboardWillShow(_ sender: Notification) {
        // 키보드 높이 구하기
        let userInfo:NSDictionary = sender.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        // 키보드 높이 만큼 Bottom 마진 높이기 (키보드가 보일 때 뷰 숨김 방지)
        constScrollViewBottom.constant = keyboardHeight - 100
    }
    
    // 키보드 숨김 처리
    @objc func keyboardWillHide(_ sender: Notification) {
        // 높인 Bottom 되돌려 놓기
        constScrollViewBottom.constant = 0
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
   // TestField Return 처리
    func createTextfieldEvent() {
        
        usernameTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
        passwordTextFiled.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
        confirmPwdTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
    }
    
    @objc func didEndOnExit(_ sender: UITextField) {
        if usernameTextField.isFirstResponder {
            passwordTextFiled.becomeFirstResponder()
        } else if passwordTextFiled.isFirstResponder {
            confirmPwdTextField.becomeFirstResponder()
        }
    }
    
    // 데이터 체크 함수
    func checkData() -> Bool {
        
        if let name = self.usernameTextField.text {
            if name.isEmpty {
                // 이름 미입력
                self.showCheckNameAlert()
                return false
            }
        } else {
            // 이름 미입력
            self.showCheckNameAlert()
            return false
        }
        
        if let pwd = self.passwordTextFiled.text, let confirmPwd = self.confirmPwdTextField.text {
            if pwd.isEmpty || confirmPwd.isEmpty {
                // 비밀번호 미입력
                self.showCheckPasswordAlert()
                return false
            }
            
            if pwd != confirmPwd {
                // 비밀번호 불일치
                self.showMisMatchPasswordAlert()
                return false
            }
        } else {
            // 비밀번호 미입력
            self.showCheckPasswordAlert()
            return false
        }
        
        return true
    }
    
    // 비밀번호 미입력 알럿
    func showCheckPasswordAlert() {
        self.showAlert(title: "", message: "비밀번호를 입력하세요.")
    }
    
    // 비밀번호 불일치 알럿
    func showMisMatchPasswordAlert() {
        self.showAlert(title: "", message: "비밀번호가 불일치 합니다.")
    }
    
    // 이름 미입력 알럿
    func showCheckNameAlert() {
        self.showAlert(title: "", message: "이름을 입력하세요.")
    }
    
    // 프로필 수정 완료 알럿
    func showModifyProfileAlert() {
        self.showAlert(title: "", message: "프로필이 수정되었습니다.")
    }
    
    // 공통 알럿 함수
    func showAlert(title: String = "", message: String = "") {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 시스템 라이브러리 호출 함수
    func showLibrary() {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
}

extension MyPageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        
        self.profileImg.image = image
    }
    
    @available(iOS 2.0, *)
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated: true, completion: nil)
    }
}


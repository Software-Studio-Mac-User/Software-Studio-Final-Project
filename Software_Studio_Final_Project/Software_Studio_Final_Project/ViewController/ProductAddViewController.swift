//
//  ProductDetailViewController.swift
//  Software_Studio_Final_Project
//
//  Created by C_Nak on 2021/06/17.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

class ProductAddViewController: UIViewController {

    @IBOutlet weak var AddImageView: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        // Do any additional setup after loading the view.
    }
    //제품 사진 등록 버튼 액션
    @IBAction func AddAction(_ sender: Any) {
        let alert = UIAlertController(title: "판매제품 사진 등록", message: "", preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "사진앨범", style: .default) {
            (action) in self.openLibrary()
        }
        
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
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

//제품 사진 등록 버튼 관련 imagePicker 함수
extension ProductAddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }else {
            print("Camera not available")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String:Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            AddImageView.image = image
            print(info)
        }
        dismiss(animated: true, completion: nil)
    }
}

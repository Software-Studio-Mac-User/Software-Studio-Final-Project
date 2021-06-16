import UIKit
class MainViewController: UIViewController {

    
    @IBOutlet weak var homeBtn: UIButton!
    
    
    // Home 버튼 액션
    @IBAction func onHomeBtnClicked(_ sender: Any) {
        
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
        let tv = sb.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        self.present(tv, animated: true, completion: nil)
        
    }
    
    var signInDelegate: SignInDelegate?
    
    override func viewDidLoad() {
        self.homeBtn.isSelected = true
    }
    
}


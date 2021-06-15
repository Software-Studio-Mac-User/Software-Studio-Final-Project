import UIKit
class MainViewController: UIViewController {
    
    // 기존 코드로 짠 UI
//    var exploreLabel: UILabel!
//    var exploreImg: UIImageView!
//    var dimmedImg: UIView!
//    var exitIcon: UIButton!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.black
//        exploreLabel = UILabel()
//        exploreImg = UIImageView()
//        dimmedImg = UIView()
//        exploreLabel.frame = CGRect(x: 0, y: 160, width: self.view.frame.size.width, height: 60)
//        exploreLabel.textColor = .black
//        exploreLabel.text = "Main"
//        exploreLabel.font = UIFont.systemFont(ofSize: 46, weight: .heavy)
//        exploreLabel.textAlignment = .center
//        exploreImg.alpha = 0.6
//        exploreImg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//        exploreImg.contentMode = .scaleToFill
//        dimmedImg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//        dimmedImg.backgroundColor = .white
//        exitIcon = UIButton(frame: CGRect(x: self.view.frame.size.width/2-15, y: self.view.frame.size.height-46, width: 30, height: 30))
//        exitIcon.setTitle("Exit", for: .normal)
//        exitIcon.setTitleColor(.white, for: .normal)
//        exitIcon.titleLabel?.font = UIFont.systemFont(ofSize: 12)
//        exitIcon.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
//        self.view.addSubview(exploreImg)
//        self.view.addSubview(dimmedImg)
//        self.view.addSubview(exploreLabel)
//        self.view.addSubview(exitIcon)
//    }
//
//    @objc func didTapExitButton(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil) // 화면 내리기
//    }
    
    //
    
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
        
    }
    
    var signInDelegate: SignInDelegate?
    
    override func viewDidLoad() {
        self.homeBtn.isSelected = true
    }
    
}


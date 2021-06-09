import UIKit

class SignUpViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("SignUpViewController loadView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("SignUpViewController viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("SignUpViewController viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("SignUpViewController viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("SignUpViewController viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("SignUpViewController viewWillDisappear")
    }
 
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("SignUpViewController viewDidDisappear")
    }
    
    /*****Property*****/
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var conformPwd: UITextField!
    
    // SignInViewController 에서 넘어올 클로저를 받을 변수
    // var didTaskClosure: ((String, String) -> Void)? = nil
    
    /*****Action*****/
    @IBAction func signUpBtn(_ sender: UIButton) {
        guard let username = username.text else { return }
        guard let password = password.text else { return }
        guard let conformPwd = conformPwd.text else { return }
        if password == conformPwd {
            // didTaskClosure?(username,password)
            
            // Plist에 파일 넣기 (영구 저장)
            // userList는 dictionary를 담고 있는 배열
            var userList: [[String: String]]
            if let tempList = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] {
                userList = tempList
            }else {
                userList = []
            }
        
            // userData는 ID와 PWD를 담고있는 dictionary
            let userData: [String:String] = ["ID":username, "PWD":password]
            userList.append(userData)
            UserDefaults.standard.set(userList, forKey: "UserList")
            
            
            // Alert
            let signUpSuccessAlert = UIAlertController(title: "SignUp", message: "회원가입이 완료되었습니다😉", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                (alert) in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let signInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                
//                let signInViewController = SignInViewController()
                self.present(signInViewController, animated: true, completion: nil)}
            )
            
            signUpSuccessAlert.addAction(okAction)
            
            self.present(signUpSuccessAlert, animated: true, completion: nil)
        }else {
            // Alert
            let signUpFailedAlert = UIAlertController(title: "SignUp", message: "패스워드가 일치하지 않습니다☹️", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "닫기", style: .default){
                (action: UIAlertAction) -> Void in return
                if let tf = signUpFailedAlert.textFields?.first {
                    //code
                }
            }
            signUpFailedAlert.addAction(cancelAction)
            self.present(signUpFailedAlert, animated: true, completion: nil)
        }
    }
    
    // Exit Action
    @IBAction func didTapExitButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil) // 화면 내리기
    }
    
    /*****ViewDidLoad*****/
    /*****Return Key addTarget*****/
    override func viewDidLoad() {
        print("SignUpViewController viewDidLoad")
        super.viewDidLoad()
        username.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
        password.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
        conformPwd.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
    }
    
    /*****Keyboard 내리기 Function*****/
    @objc func didEndOnExit(_ sender: UITextField) {
        if username.isFirstResponder {
            password.becomeFirstResponder()
        }else if password.isFirstResponder {
            conformPwd.becomeFirstResponder()
        }
    }
    
}

import UIKit
@IBDesignable // 이 클래스는 Interface Builder에서 디자인 할 수 있는 클래스입니다.

class RoundButton: UIButton {
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
}

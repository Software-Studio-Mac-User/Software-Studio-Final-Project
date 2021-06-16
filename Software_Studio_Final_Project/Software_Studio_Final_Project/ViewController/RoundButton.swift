import UIKit
@IBDesignable // Interface Builder에서 디자인 할 수 있는 클래스.

class RoundButton: UIButton {
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
}

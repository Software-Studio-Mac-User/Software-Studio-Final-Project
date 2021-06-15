//
//  UIView+Extension.swift
//  Software_Studio_Final_Project
//
//  Created by 정상욱 on 2021/06/16.
//  Copyright © 2021 younari. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     UIView의 layer에 넘어온 값 만큼 두께의 border 적용
     */
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    /**
     UIView의 layer에 넘어온 값 만큼의 corner radius 적용
     */
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    /**
     UIView의 layer에 넘어온 색상의 border color 적용
     */
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

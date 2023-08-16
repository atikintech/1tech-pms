//
//  UIView.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 10/07/23.
//

import UIKit


extension UIView {
    
    func rounded(radius: CGFloat = 0, border: CGFloat = 0, borderColor: UIColor = .white) {
        let layer = self.layer
        layer.cornerRadius = radius == 0 ? self.bounds.height/2 : radius
        if border > 0 {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = border
        }
        layer.masksToBounds = true
    }
    
    func rounded(radius: CGFloat, corners: UIRectCorner) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        layer.masksToBounds = true
    }
    
    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 0.5)
        bottomLine.backgroundColor = UIColor.black.cgColor
        layer.addSublayer(bottomLine)
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var rounded: Bool {
        get {
            return true
        }
        set {
            if newValue {
                self.roundView()
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var isTopRounded: Bool {
        get {
            return true
        }
        set {
            if newValue {
                DispatchQueue.main.async {
                    self.roundCorners([.topLeft, .topRight], radius: 3)
                }
            }
        }
    }
    
    func roundView() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

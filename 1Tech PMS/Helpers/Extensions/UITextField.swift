//
//  UITextField.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 10/07/23.
//

import UIKit

extension UITextField {
        
    func setLeftPaddingPoints(_ amount:CGFloat = 8.0) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func customise() {
        self.borderStyle = .none
        self.addBottomBorder()
        self.setLeftPaddingPoints()
        self.font = .primary(size: .medium)
    }
    
    func customiseWithImage(named: String) {
        let imageView = UIImageView(frame: CGRect(x: 16.0, y: 8.0, width: 24.0, height: 15.0))
        let image = UIImage(named: named)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        view.addSubview(imageView)
        self.leftViewMode = .always
        self.leftView = view
    }
    
}

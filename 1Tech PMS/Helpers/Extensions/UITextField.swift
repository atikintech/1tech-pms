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
    
}

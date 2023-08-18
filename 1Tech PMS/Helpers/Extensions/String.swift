//
//  String.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 29/07/23.
//

import Foundation
import UIKit

extension String {
    func removeSpacing() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension NSMutableAttributedString {
    var fontSize: CGFloat { return 16 }
//    var boldFont: UIFont { return UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.bold)}
    var normalFont: UIFont { return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    var regularFont: UIFont { return UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)}
    
    func bold(_ value: String, _ size: CGFloat) -> NSMutableAttributedString {
        var boldFont: UIFont { return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)}
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func regular(_ value: String, _ size: CGFloat) -> NSMutableAttributedString {
        var normalFont: UIFont { return UIFont(name: "NotoSans-Medium", size: size) ?? UIFont.systemFont(ofSize: size)}
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func colorText(_ value: String, _ size: CGFloat, _ color: UIColor) -> NSMutableAttributedString {
        var normalFont: UIFont { return UIFont(name: "NotoSans-Medium", size: size) ?? UIFont.systemFont(ofSize: size)}
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: color
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func strikeText(_ value: String, _ size: CGFloat, _ color: UIColor) -> NSMutableAttributedString {
            var normalFont: UIFont { return UIFont(name: "NotoSans-Medium", size: size) ?? UIFont.systemFont(ofSize: size)}
            let attributes: [NSAttributedString.Key: Any] = [
                .font: normalFont,
                .foregroundColor: color,
                .strikethroughStyle: 2.0
            ]
            
            self.append(NSAttributedString(string: value, attributes: attributes))
            return self
        }
    
    /* Other styling methods */
    func orangeHighlight(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.orange
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func blackHighlight(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.black
            
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func underlined(_ value: String, _ size: CGFloat) -> NSMutableAttributedString {
        var normalFont: UIFont { return UIFont(name: "NotoSans-Medium", size: size) ?? UIFont.systemFont(ofSize: size)}
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .underlineStyle: NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
}


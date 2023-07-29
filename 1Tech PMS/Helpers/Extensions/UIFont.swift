//
//  UIFont.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 10/07/23.
//

import UIKit
extension UIFont {
    
    enum Style: String {
        case regular = "Regular"
        case bold = "Bold"
        case italic = "Italic"
        case light = "UltraLight"
        case semibold = "DemiBold"
        var val: String {
            return self.rawValue
        }
    }
    
    enum Size: CGFloat {
        /// Size  = 34
        case headingTitle = 34
        /// Size  = 30
        case xxLarge = 30
        /// Size  = 24
        case extraLarge = 24
        /// Size  = 18
        case large = 18
        /// Size = 14
        case medium = 14
        /// Size  = 12
        case small = 12
        /// Size  = 10
        case extraSmall = 10
    }
    
    class func primary(size: Size, style: Style = .regular) -> UIFont {
        return UIFont(name: "AvenirNext-\(style.rawValue)" , size: size.rawValue)!
    }
    
    class func nunito(size: Size, style: Style = .regular) -> UIFont {
        return UIFont(name: "NunitoSans-\(style.rawValue)" , size: size.rawValue)!
    }
}

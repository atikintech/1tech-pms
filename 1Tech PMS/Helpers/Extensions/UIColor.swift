//
//  UIColor.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 03/07/23.
//

import UIKit

extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
    
    class func primary(dark: Bool = false, light: Bool = false, medium: Bool = false) -> UIColor {
        if dark {
            return UIColor(named: "DarkPrimary")!
        }
        else if light {
            return UIColor(named: "LightPrimary")!
        }
        else if medium {
            return UIColor(named: "MediumPrimary")!
        }
        return UIColor(named: "Primary")!
    }

    class func accent() -> UIColor {
        return UIColor(named: "Accent")!
    }

    class func navBarBackground() -> UIColor {
        return UIColor(named: "Accent")!
    }
    
    class func borderColor() -> UIColor {
        return UIColor(hexString: "#EBE9E9FF")!
    }
    
    class func textColor() -> UIColor {
        return .accent()
    }
    
    class func secondaryTextColor() -> UIColor {
        return UIColor(hexString: "#434343ff")!
    }

}

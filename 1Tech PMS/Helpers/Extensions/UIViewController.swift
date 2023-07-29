//
//  UIViewController.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 27/07/23.
//

import UIKit

extension UIViewController {
    class func loadVC(_ name:String = "Main") -> Self {
        let storyBoard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}

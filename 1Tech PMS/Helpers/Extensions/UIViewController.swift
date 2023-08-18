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
    
    func registerCell(cellArr: [String], tableView: UITableView) {
        for cell in cellArr {
            let nib = UINib(nibName: cell, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: cell)
        }
    }
}

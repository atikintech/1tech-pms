//
//  UIViewController.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 27/07/23.
//

import UIKit

extension UIViewController {
    class func loadVC(role: Role = .admin) -> Self {
        let storyBoard: UIStoryboard = UIStoryboard(name: role.rawValue, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
    
    func registerCell(cells: [String], tableView: UITableView) {
        for cell in cells {
            let nib = UINib(nibName: cell, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: cell)
        }
    }
    
    func registerCollectionCell(cells: [String], collectionView: UICollectionView) {
        for cell in cells {
            let nib = UINib(nibName: cell, bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: cell)
        }
    }
}

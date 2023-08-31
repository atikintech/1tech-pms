//
//  ClientInfoVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 07/08/23.
//

import UIKit

class ClientInfoVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameTf: HeadingTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupView()
        setupTf()
    }
    
    func setupView() {
//        containerView.rounded(radius: 20)
//        containerView.layer.shadowColor = UIColor.gray.cgColor
//        containerView.layer.shadowRadius = 20
    }
    
    func setupTf() {
//        nameTf.placeHolderColor = .accent()
//        nameTf.textColor = .secondaryTextColor()
//        nameTf.font = .primary(size: .medium)
//        nameTf.labelPlaceholderTitle.font = .primary(size: .medium, style: .semibold)
    }
}

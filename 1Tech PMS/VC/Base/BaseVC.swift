//
//  BaseVC.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 19/07/23.
//

import UIKit

class BaseVC: UIViewController {
    
    private lazy var backBtnItem: UIBarButtonItem = {
        UIBarButtonItem(image: UIImage(named: "back_btn"), style: .plain, target: self, action: #selector(goBack))
    }()
    
    private lazy var userProfileBtn: UIBarButtonItem = {
        let btnIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        btnIcon.backgroundColor = .greyBackground()
        btnIcon.rounded()
        
        let btnTitle = UIButton(frame: .zero)
        btnTitle.setTitle("Hello Bhavesh", for: .normal)
        btnTitle.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        btnTitle.titleLabel?.font = .primary(size: .extraSmall)
        btnTitle.setTitleColor(.soothingBlue(), for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [btnIcon, btnTitle])
        stackView.axis = .horizontal
        stackView.spacing = 4
        return UIBarButtonItem(customView: stackView)
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .greyBackground()
    }
    
    override func viewWillLayoutSubviews() {
        setupNavBar()
    }
    
    //MARK: NavigationBar Setup
    private func setupNavBar() {
        if let navVC = self.navigationController {
            self.navigationController?.navigationBar.barTintColor = .navBarBackground()
            self.navigationController?.navigationBar.backgroundColor = .navBarBackground()
            self.navigationItem.hidesBackButton = true
            var leftBarItems = [UIBarButtonItem]()
            if navVC.viewControllers.count > 1 {
                leftBarItems.append(backBtnItem)
            }
            else {
                leftBarItems.append(userProfileBtn)
            }
            self.navigationItem.leftBarButtonItems = leftBarItems
            //Setup Title Font
            setupTitleView()
        }
    }
    
    private func setupTitleView() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "logo_bold"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//extension BaseAuthVC {
//        @objc func keyboardWillAppear(_ notification: Notification) {
//            let userInfo: NSDictionary = notification.userInfo! as NSDictionary
//            let keyboardSize = (userInfo.object(forKey: UIResponder.keyboardFrameEndUserInfoKey)! as AnyObject).cgRectValue.size
//
//            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions(), animations: {
//                self.view.frame.origin.y = -keyboardSize.height
//            })
//        }
//
//        @objc func keyboardWillDisappear(_ notification: Notification) {
//            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions(), animations: {
//                self.view.frame.origin.y = 0
//            })
//        }
//}
//

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
    
    private lazy var sideMenuBtn: UIBarButtonItem = {
        let barBtn = UIBarButtonItem(image: UIImage(named: "side_menu")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        return barBtn
    }()
    
    private lazy var rightBtnItem: UIBarButtonItem = {
        let btnIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        btnIcon.backgroundColor = .primary()
        btnIcon.rounded()
        btnIcon.setTitle("BG", for: .normal)
        btnIcon.addTarget(self, action: #selector(showProfileView), for: .touchUpInside)
        return UIBarButtonItem(customView: btnIcon)
    }()
    
    private lazy var addBtnItem: UIBarButtonItem = {
        let btnIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        btnIcon.backgroundColor = .clear
        btnIcon.setTitle("+", for: .normal)
        btnIcon.addTarget(self, action: #selector(addClientClicked), for: .touchUpInside)
        return UIBarButtonItem(customView: btnIcon)
    }()
    
    private lazy var appearance: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .navBarBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        return appearance
    }()
    
    var hideSideMenu = false
    var showAddBtn = false
    
    override func viewDidLoad() {
        self.view.backgroundColor = .primary(light: true)
    }
    
    override func viewWillLayoutSubviews() {
        setupNavBar()
    }
    
    //MARK: NavigationBar Setup
    private func setupNavBar() {
        if let _ = self.navigationController {
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.barTintColor = .navBarBackground()
            self.navigationController?.navigationBar.backgroundColor = .navBarBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            self.navigationItem.hidesBackButton = true
            
            //            var leftBarItems = [UIBarButtonItem]()
            //            if navVC.viewControllers.count > 1 {
            //                leftBarItems.append(backBtnItem)
            //            }
            //            else {
            //                leftBarItems.append(sideMenuBtn)
            //            }
            if !hideSideMenu {
                self.navigationItem.leftBarButtonItem = sideMenuBtn
            }
            else {
                self.navigationItem.hidesBackButton = false
            }
            if showAddBtn {
                self.navigationItem.rightBarButtonItems = [rightBtnItem, addBtnItem]
            }
            else {
                self.navigationItem.rightBarButtonItem = rightBtnItem
            }
            self.navigationItem.title = self.title
            
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
    
    @objc private func showProfileView() {
        let vc = ProfileVC.loadVC(role: .notLoggedIn)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addClientClicked() {
        let vc = CreateClientVC.loadVC(role: .member)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension BaseVC {
    @objc func keyboardWillAppear(_ notification: Notification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (userInfo.object(forKey: UIResponder.keyboardFrameEndUserInfoKey)! as AnyObject).cgRectValue.size
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions(), animations: {
            self.view.frame.origin.y = -keyboardSize.height
        })
    }
    
    @objc func keyboardWillDisappear(_ notification: Notification) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions(), animations: {
            self.view.frame.origin.y = 0
        })
    }
}


//
//private lazy var userProfileBtn: UIBarButtonItem = {
//    let btnIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
////        btnIcon.backgroundColor = .greyBackground()
//    btnIcon.rounded()
//
//    let btnTitle = UIButton(frame: .zero)
//    btnTitle.setTitle("Hello Bhavesh", for: .normal)
//    btnTitle.addTarget(self, action: #selector(goBack), for: .touchUpInside)
//    btnTitle.titleLabel?.font = .primary(size: .extraSmall)
//    btnTitle.setTitleColor(.soothingBlue(), for: .normal)
//
//    let stackView = UIStackView(arrangedSubviews: [btnIcon, btnTitle])
//    stackView.axis = .horizontal
//    stackView.spacing = 4
//    return UIBarButtonItem(customView: stackView)
//}()

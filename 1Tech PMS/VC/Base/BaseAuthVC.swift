//
//  BaseVC.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 03/07/23.
//

import UIKit

class BaseAuthVC : UIViewController {
    
    var bgImageView: UIImageView?
    
    override func viewDidLoad() {
        if bgImageView == nil {
            bgImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
            bgImageView?.image = UIImage(named: "background")
            bgImageView?.contentMode = .scaleAspectFill
            self.view.addSubview(bgImageView!)
        }
        setupNavBar()
    }
    
    override func viewDidLayoutSubviews() {
        if bgImageView != nil {
            self.view.sendSubviewToBack(bgImageView!)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: NavigationBar Setup
    private func setupNavBar() {
        
//        if let navVC = self.navigationController {
//            var leftBarItems = [UIBarButtonItem]()
//            //            if navVC.viewControllers.count > 1 && !self.navigationItem.hidesBackButton {
//            //                leftBarItems.append(UIBarButtonItem(image:  #imageLiteral(resourceName: "icons8-back"), style: .plain, target: self, action: #selector(goBack)))
//            //            }
//            self.navigationItem.leftBarButtonItems = leftBarItems
//            //Setup Title Font
//            setuptitleBarForNav()
//        }
    }
    
    private func setuptitleBarForNav() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "amity_logo_small"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
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

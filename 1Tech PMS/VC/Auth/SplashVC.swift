//
//  SplashVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 22/07/23.
//

import UIKit

class SplashVC: UIViewController {
    
    //MARK: Variables
    private var bgImageView: UIImageView!
    
    //MARK: View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        showNextView()
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    func setup() {
        if bgImageView == nil {
            //View Initialisations
            bgImageView = UIImageView(frame: .zero)
            bgImageView.image = #imageLiteral(resourceName: "splash_screen")
            bgImageView.contentMode = .scaleAspectFill
            bgImageView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(bgImageView)
            
            //Constraint Setup
            self.view.addConstraints([
                NSLayoutConstraint(item: bgImageView!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: bgImageView!, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: bgImageView!, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: bgImageView!, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
            ])
            
        }
    }
    
    //MARK: Navigation
    func showNextView() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            if UserDefaults.standard.bool(forKey: "isMemberLogged") {
                self.showMembersVC()
            }
            else if UserDefaults.standard.bool(forKey: "isAdminLogged") {
                self.showAdminVC()
            }
            else {
                self.showLoginVC()
            }
        }
        
    }
    
    func showLoginVC() {
        let loginVC = LoginVC.loadVC(role: .notLoggedIn)
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    
    func showAdminVC() {
        let homeVC = AdminHomeVC.loadVC(role: .notLoggedIn)
        self.navigationController?.pushViewController(homeVC, animated: false)
    }
    
    func showMembersVC() {
        let createVC = MembersHomeVC.loadVC(role: .member)
        //        createVC.pageType = createPageType.createMember.rawValue
        //        createVC.pageType = createPageType.editMember.rawValue
        //        createVC.pageType = createPageType.inviteMember.rawValue
        //        createVC.pageType = createPageType.createTeam.rawValue
        self.navigationController?.pushViewController(createVC, animated: false)
    }
    
}

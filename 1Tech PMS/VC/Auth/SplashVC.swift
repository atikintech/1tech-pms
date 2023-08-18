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
            //If user is not logged in show log in screen
            if !UserDefaults.standard.bool(forKey: "isLogged") {
                self.showLoginVC()
            }
            //If user is logged in then show a particular view
            else {
//                self.showAdminVC()
                self.showMembersVC()
            }
        }
        
    }
    
    func showLoginVC() {
        let loginVC = LoginVC.loadVC()
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    
    func showAdminVC() {
        let homeVC = AdminHomeVC.loadVC()
        self.navigationController?.pushViewController(homeVC, animated: false)
    }
    
    func showMembersVC() {
        let createVC = MembersHomeVC.loadVC("Members")
//        createVC.pageType = createPageType.createMember.rawValue
//        createVC.pageType = createPageType.editMember.rawValue
//        createVC.pageType = createPageType.inviteMember.rawValue
//        createVC.pageType = createPageType.createTeam.rawValue
        self.navigationController?.pushViewController(createVC, animated: false)
    }
    
}

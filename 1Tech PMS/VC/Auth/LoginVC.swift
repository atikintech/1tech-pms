//
//  LoginVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 24/07/23.
//

import UIKit

class LoginVC: BaseAuthVC {
    
    //MARK: IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var headingTitle: UILabel!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    private var isValidated: Bool {
        if usernameTf.text!.isEmpty || passwordTf.text!.isEmpty {
            ToastHelper.toast("Empty Text Fields", presenter: self)
            return false
        }
        else if passwordTf.text!.count < 6 {
            ToastHelper.toast("Password is less than 6 characters", presenter: self)
            return false
        }
        return true
    }
    
    //MARK: Variables
    private lazy var backgroundView: UIImageView = {
        
        //View Initialisation
        let imgView = UIImageView(frame: .zero)
        imgView.image = UIImage(named: "login_page")
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imgView)
        
        //Constraint Setup
        self.view.addConstraints([
            NSLayoutConstraint(item: imgView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imgView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imgView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imgView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        ])
        
        return imgView
    }()
    
    //MARK: View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usernameTf.customiseWithImage(named: "user_profile_icon")
        passwordTf.customiseWithImage(named: "password_icon")
    }
    
    func setup() {
        setupBg()
        setupLabels()
        setupBtns()
        setupTf()
    }
    
    func setupBg() {
        self.view.sendSubviewToBack(backgroundView)
        containerView.backgroundColor = .primary(dark: true)
        containerView.rounded(radius: 10)
    }
    
    func setupLabels() {
        headingTitle.font = .primary(size: .extraLarge)
        headingTitle.textColor = .white
    }
    
    func setupBtns() {
        loginBtn.titleLabel?.font = .primary(size: .medium, style: .bold)
        loginBtn.backgroundColor = .accent()
        loginBtn.rounded()
        forgotPasswordBtn.titleLabel?.font = .primary(size: .medium)
    }
    
    func setupTf() {
        usernameTf.font = .primary(size: .medium)
        passwordTf.font = .primary(size: .medium)
        usernameTf.backgroundColor = .white
        passwordTf.backgroundColor = .white
        usernameTf.rounded()
        passwordTf.rounded()
    }
    
    @IBAction func loginClicked() {
        if isValidated {
            ToastHelper.toast("Success", presenter: self, type: .success)
            
            if usernameTf.text! == "admin" {
                UserDefaults.standard.set(true, forKey: "isAdminLogged")
                showAdminHome()
            }
            else {
                UserDefaults.standard.set(true, forKey: "isMemberLogged")
                showMembersHome()
            }
        }
    }
    
    func showAdminHome() {
        let admin = AdminHomeVC.loadVC(role: .notLoggedIn)
        self.navigationController?.pushViewController(admin, animated: true)
    }
    
    func showMembersHome() {
        let admin = MembersHomeVC.loadVC(role: .member)
        self.navigationController?.pushViewController(admin, animated: true)
    }
}

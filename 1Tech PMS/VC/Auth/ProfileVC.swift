//
//  ProfileVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 31/08/23.
//
import UIKit

class ProfileVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var changePasswordBtn: UIButton!
    
    private var isValidated: Bool {
        if usernameTf.text!.isEmpty {
            ToastHelper.toast("Empty Text Fields", presenter: self)
            return false
        }
        return true
    }
    
    //MARK: View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usernameTf.customiseWithImage(named: "user_profile_icon")
    }
    
    func setup() {
        setupBg()
        setupBtns()
        setupTf()
    }
    
    func setupBg() {
        
        containerView.backgroundColor = .primary(dark: true)
        containerView.rounded(radius: 10)
    }
        
    func setupBtns() {
        logoutBtn.titleLabel?.font = .primary(size: .medium, style: .bold)
        logoutBtn.backgroundColor = .accent()
        logoutBtn.rounded()
        
        changePasswordBtn.titleLabel?.font = .primary(size: .medium, style: .bold)
        changePasswordBtn.backgroundColor = .darkGray
        changePasswordBtn.rounded()
    }
    
    func setupTf() {
        usernameTf.font = .primary(size: .medium)
        usernameTf.backgroundColor = .white
        usernameTf.rounded()
    }
    
    @IBAction func loginClicked() {
        if isValidated {
            ToastHelper.toast("Success", presenter: self, type: .success)
        }
    }
    
}

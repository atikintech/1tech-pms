//
//  CreateVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 15/08/23.
//

import UIKit

class CreateVC: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblProject: UILabel!
    
    @IBOutlet weak var imgTitle: UIImageView!
    @IBOutlet weak var imgDropdown: UIImageView!
    
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldProject: UITextField!
    
    @IBOutlet weak var vewName: UIView!
    @IBOutlet weak var vewEmail: UIView!
    @IBOutlet weak var vewProject: UIView!
    @IBOutlet weak var vewBtns: UIView!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnInvite: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var layoutTopLblEmail: NSLayoutConstraint!
    @IBOutlet weak var layoutHeightEmail: NSLayoutConstraint!
    
    var pageType = "create"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        // Do any additional setup after loading the view.
    }
    
    func customizeView() {
        if pageType == CreatePageType.createMember.rawValue {
            btnHideShow(isInvite: true, isCancel: true, isSave: false)
            imgDropdown.isHidden = true
            lblTitle.text = "Create Team Member"
            lblProject.text = "Designation"
            imgTitle.image = UIImage(named: "create_teammembers")
            txtFldProject.placeholder = ""
        } else if pageType == CreatePageType.editMember.rawValue {
            btnHideShow(isInvite: true, isCancel: false, isSave: false)
            imgDropdown.isHidden = true
            lblTitle.text = "Edit Team Member"
            lblProject.text = "Designation"
            imgTitle.image = UIImage(named: "edit_teammembers")
            txtFldProject.placeholder = ""
        } else if pageType == CreatePageType.inviteMember.rawValue {
            btnHideShow(isInvite: false, isCancel: true, isSave: true)
            vewHideShow(isName: true, isEmail: false , isProject: false)
            layoutTopLblEmail.constant = 20
            layoutHeightEmail.constant = 100
            lblTitle.text = "Invite Member"
            imgTitle.image = UIImage(named: "edit_teammembers")
            txtFldProject.placeholder = ""
        } else if pageType == CreatePageType.createTeam.rawValue {
            btnHideShow(isInvite: true, isCancel: true, isSave: false)
            vewHideShow(isName: false, isEmail: true, isProject: true)
            lblTitle.text = "Create Team"
            lblSubtitle.text = "If you are creating Team which is already existing, please go to edit team."
            imgTitle.image = UIImage(named: "create_team")
        }
    }
    
    func btnHideShow(isInvite: Bool, isCancel: Bool, isSave: Bool) {
        btnInvite.isHidden = isInvite
        btnCancel.isHidden = isCancel
        btnSave.isHidden = isSave
    }
    
    func vewHideShow(isName: Bool, isEmail: Bool, isProject: Bool) {
        vewName.isHidden = isName
        vewEmail.isHidden = isEmail
        vewProject.isHidden = isProject
    }
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
//            let createVC = TeamMemberVC.loadVC("Members")
//            createVC.modalPresentationStyle = .overFullScreen
//            self.navigationController?.present(createVC, animated: false)
            self.dismiss(animated: true)
            
        case 2:
//            let createVC = TeamMemberVC.loadVC("Members")
//            createVC.modalPresentationStyle = .overFullScreen
//            self.navigationController?.present(createVC, animated: false)
            self.dismiss(animated: true)
            
        case 3:
            self.dismiss(animated: true)
            
        default:
            self.dismiss(animated: true)
        }
    }
    
}

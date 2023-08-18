//
//  AlertControllerVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 18/08/23.
//

import UIKit

class AlertControllerVC: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var imgAlert: UIImageView!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    
    var alert: String = ""
    var message: String = ""
    var alertTitle: String = ""
    var imgtype: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateBtn(alertType: alert)
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        lblTitle.text = alertTitle
        lblMessage.attributedText = NSMutableAttributedString().regular("Are you sure you want to ", 14).bold("\(message)", 16)
        imgAlert.image = imgtype//imgName.teamStaus
    }
    
    func updateBtn(alertType: String) {
        switch alertType{
            
        case alertTypes.change.rawValue:
            btnHideShow(isCancel: false, isChange: false, isDelete: true, isYes: true, isNo: true)
            
        case alertTypes.delete.rawValue:
            btnHideShow(isCancel: false, isChange: true, isDelete: false, isYes: true, isNo: true)
            
        case alertTypes.yes.rawValue:
            btnHideShow(isCancel: true, isChange: true, isDelete: true, isYes: false, isNo: false)
        
        default:
            break
        }
    }
    
    func btnHideShow(isCancel: Bool, isChange: Bool, isDelete: Bool, isYes: Bool, isNo: Bool) {
        btnCancel.isHidden = isCancel
        btnChange.isHidden = isChange
        btnDelete.isHidden = isDelete
        btnYes.isHidden = isYes
        btnNo.isHidden = isNo
    }
    
    
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        switch sender.tag {
        case btnAlerts.cancel.rawValue:
            break
            
        case btnAlerts.delete.rawValue:
            break
            
        case btnAlerts.change.rawValue:
            break
            
        case btnAlerts.yes.rawValue:
            break
            
        case btnAlerts.no.rawValue:
            break
            
        default:
            self.dismiss(animated: true)
            break
        }
    }
}

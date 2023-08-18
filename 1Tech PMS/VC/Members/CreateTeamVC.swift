//
//  CreateTeamVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 18/08/23.
//

import UIKit

class CreateTeamVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAction(_ sender: Any) {
        let alertVC = AlertControllerVC.loadVC()
        alertVC.alertTitle = "TEAM STATUS"
        alertVC.message = "change status of the team?"
        alertVC.alert = alertTypes.yes.rawValue
        alertVC.imgtype = imgName.teamStaus
        alertVC.modalPresentationStyle = .overFullScreen
        self.present(alertVC, animated: false)
    }
    

}

//
//  CreateNotesVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 21/08/23.
//

import UIKit

class CreateNotesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var vewAddNotes: UIView!
    @IBOutlet weak var vewDottedBorder: UIView!
    
    
    var isRowSelected : Int = -1
    var showAddNotes: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell(cells: ["CreateNotesCell"], tableView: self.tableView)
        vewDottedBorder.createDottedLine(color: UIColor.black.cgColor)
        vewAddNotes.isHidden = !showAddNotes
        tableView.isHidden = showAddNotes
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAction(_ sender: Any) {
        vewAddNotes.isHidden = true
        tableView.isHidden = false
    }
    
    @IBAction func addNotesClicked(_ sender: Any) {
        vewAddNotes.isHidden = false
        tableView.isHidden = true
    }
}

extension CreateNotesVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateNotesCell", for: indexPath) as! CreateNotesCell
        cell.imgMsg.isHidden = indexPath.row == isRowSelected ? false : true
        cell.btnEdit.addTarget(self, action: #selector(btnEditAct), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(btnDeleteAct), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == isRowSelected {
            return 200
        }else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == isRowSelected {
            isRowSelected = -1
        } else {
            isRowSelected = indexPath.row
        }
        self.tableView.reloadData()
    }
    
    @objc func btnEditAct() {
        vewAddNotes.isHidden = false
    }
    
    @objc func btnDeleteAct() {
        let deleteVc = AlertControllerVC.loadVC(role: .notLoggedIn)
        deleteVc.alertTitle = "DELETE NOTE"
        deleteVc.message = "Delete this note?"
        deleteVc.alert = alertTypes.delete.rawValue
        deleteVc.imgtype = ImgName.delete
        deleteVc.modalPresentationStyle = .overFullScreen
        self.present(deleteVc, animated: false)
    }
    
}

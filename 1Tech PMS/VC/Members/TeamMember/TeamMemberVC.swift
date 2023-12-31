//
//  TeamMemberVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 15/08/23.
//

import UIKit

class TeamMemberVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var vmTeamMember: VMTeamMember?
    var showSelection: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        vmTeamMember = VMTeamMember()
        // Register TableView Cell
        registerCell(cells: ["MemberCell"], tableView: self.tableView)
        if showSelection {
            self.title = "ALLOCATE TEAM MEMBERS"
            tableView.allowsMultipleSelection = true
        }
        // Do any additional setup after loading the view.
    }
}

extension TeamMemberVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vmTeamMember?.teamMemberArr.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberCell
        cell.populateData(data: vmTeamMember?.teamMemberArr[indexPath.row] ?? ModelTeamMember(name: "", mail: "", designation: ""), showSelected: showSelection)
        cell.btnFwd.addTarget(self, action: #selector(btnAct), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! MemberCell
        cell.setSelected(cell.isSelected, animated: true)
    }
    
    @objc func btnAct(){
        self.dismiss(animated: true)
    }
    
}

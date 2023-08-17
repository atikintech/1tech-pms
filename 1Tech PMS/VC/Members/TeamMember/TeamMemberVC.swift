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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vmTeamMember = VMTeamMember()
        
        // Register TableView Cell
        let cell = UINib(nibName: "MemberCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "MemberCell")

        // Do any additional setup after loading the view.
    }

}

extension TeamMemberVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vmTeamMember?.teamMemberArr.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberCell
        cell.populateData(data: vmTeamMember?.teamMemberArr[indexPath.row] ?? ModelTeamMember(name: "", mail: "", designation: ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

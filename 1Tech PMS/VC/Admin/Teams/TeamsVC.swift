//
//  TeamMemberVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 15/08/23.
//

import UIKit

class TeamsVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    var vmTeamMember: VMTeamMember?
    
    override func viewDidLoad() {
        self.title = "TEAMS"
        super.viewDidLoad()
        vmTeamMember = VMTeamMember()
        
        // Register TableView Cell
        registerCell(cells: ["TeamsCell"], tableView: self.tableView)
        // Do any additional setup after loading the view.
    }

}

extension TeamsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vmTeamMember?.teamMemberArr.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsCell", for: indexPath) as! TeamsCell
        cell.populateData(data: vmTeamMember!.teams[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TeamMemberVC.loadVC(role: .member)
        vc.showSelection = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnAct(){
        self.dismiss(animated: true)
    }
    
}

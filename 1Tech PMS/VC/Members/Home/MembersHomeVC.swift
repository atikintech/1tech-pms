//
//  MembersHomeVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 12/08/23.
//

import UIKit

class MembersHomeVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    var vmMemberHome: VMMemberHome?
    
    override func viewDidLoad() {
        self.title = "HOME"
        super.viewDidLoad()
        vmMemberHome = VMMemberHome()
        // Register TableView Cell
        registerCell(cells: ["MembersHomeCell", "MemberHomeHeaderCell"], tableView: self.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        switch sender.tag {
        case btnMembersHome.goto.rawValue :
//            let alertVC = AlertControllerVC.loadVC()
//            alertVC.alertTitle = "TEAM STATUS"
//            alertVC.message = "change status of the team?"
//            alertVC.alert = alertTypes.yes.rawValue
//            alertVC.imgtype = ImgName.teamStaus
//            alertVC.modalPresentationStyle = .overFullScreen
//            self.present(alertVC, animated: false)
            
            let createVC = CreateVC.loadVC(role: .member)
            createVC.pageType = CreatePageType.createMember.rawValue
            createVC.modalPresentationStyle = .overFullScreen
            self.navigationController?.present(createVC, animated: false)
            print("goto")
            
        case btnMembersHome.projectManagement.rawValue :
            let projectsVC = ProjectsVC.loadVC(role: .admin)
            self.navigationController?.pushViewController(projectsVC, animated: true)
            
        case btnMembersHome.recruitment.rawValue :
            let createVC = CreateVC.loadVC(role: .member)
            createVC.pageType = CreatePageType.inviteMember.rawValue
            createVC.modalPresentationStyle = .overFullScreen
            self.navigationController?.present(createVC, animated: false)
            print("recruitment")
            
        case btnMembersHome.salesPipeline.rawValue :
            let createVC = CreateVC.loadVC(role: .member)
            createVC.pageType = CreatePageType.createTeam.rawValue
            createVC.modalPresentationStyle = .overFullScreen
            self.navigationController?.present(createVC, animated: false)
            
            print("salesPipeline")
            
        default:
            break
        }
        
    }
    
}

extension MembersHomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return vmMemberHome?.issueArr.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vmMemberHome?.issueArr[section].dayIssueArr.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberHomeHeaderCell") as? MemberHomeHeaderCell
        cell?.lblHeader.text = vmMemberHome?.issueArr[section].day ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MembersHomeCell", for: indexPath) as? MembersHomeCell
        cell?.lblIssueName.text = vmMemberHome?.issueArr[indexPath.section].dayIssueArr[indexPath.row].issue
        cell?.lblIssueComment.text = vmMemberHome?.issueArr[indexPath.section].dayIssueArr[indexPath.row].issueComment
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ManageTaskVC.loadVC(role: .task)
        self.navigationController?.pushViewController(vc, animated: true)
//        if indexPath.section == 0 {
//            if indexPath.row == 0 {
//                let createVC = TeamMemberVC.loadVC(role: .member)
//                createVC.modalPresentationStyle = .overFullScreen
//                self.navigationController?.present(createVC, animated: false)
//            } else {
//                let createVC = CreateTeamVC.loadVC(role: .member)
//                createVC.modalPresentationStyle = .overFullScreen
//                self.navigationController?.present(createVC, animated: false)
//            }
//        } else if indexPath.section == 1 {
//            let createVC = ClientInfoVC.loadVC(role: .member)
//            createVC.modalPresentationStyle = .overFullScreen
//            self.navigationController?.present(createVC, animated: false)
//        } else if indexPath.section == 2 {
//            if indexPath.row == 0 {
//                let createVC = CreateClientVC.loadVC(role: .member)
//                createVC.modalPresentationStyle = .overFullScreen
//                self.navigationController?.present(createVC, animated: false)
//            } else if indexPath.row == 1{
//                let createNotesVC = CreateNotesVC.loadVC(role: .task)
//                createNotesVC.modalPresentationStyle = .overFullScreen
//                self.navigationController?.present(createNotesVC, animated: false)
//            } else if indexPath.row == 2 {
//                let taskVC = ManageTaskVC.loadVC(role: .task)
//                taskVC.modalPresentationStyle = .overFullScreen
//                self.navigationController?.present(taskVC, animated: false)
//            } else {
//                let boardsVC = ManageBoardsVC.loadVC(role: .task)
//                boardsVC.modalPresentationStyle = .overFullScreen
//                self.navigationController?.pushViewController(boardsVC, animated: true)
//            }
//        }
    }
    
}

//
//  ProjectsVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 31/08/23.
//

import UIKit

class ProjectsVC: BaseVC {

    private let CLIENT_CELL = "ClientsCell"
    @IBOutlet weak var projectsTv: UITableView!
    
    override func viewDidLoad() {
        self.title = "PROJECTS"
        self.hideSideMenu = true
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        projectsTv.register(UINib(nibName: CLIENT_CELL, bundle: nil), forCellReuseIdentifier: CLIENT_CELL)
    }
}

extension ProjectsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CLIENT_CELL, for: indexPath) as! ClientsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ManageBoardsVC.loadVC(role: .task)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


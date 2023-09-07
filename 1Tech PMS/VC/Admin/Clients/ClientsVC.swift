//
//  ClientsVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 07/08/23.
//

import UIKit

class ClientsVC: BaseVC {
    
    private let CLIENT_CELL = "ClientsCell"
    @IBOutlet weak var clientsTv: UITableView!
    
    override func viewDidLoad() {
        self.title = "CLIENTS"
        self.showAddBtn = true
        self.hideSideMenu = true
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        clientsTv.register(UINib(nibName: CLIENT_CELL, bundle: nil), forCellReuseIdentifier: CLIENT_CELL)
    }
    
}

extension ClientsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CLIENT_CELL, for: indexPath) as! ClientsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ClientInfoVC.loadVC(role: .member)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: nil) { action, view, completion in
            // Perform your action here
            completion(true)
        }
        
        let editAction = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
            // Perform your action here
            completion(true)
        }
        
        let bookmarkAction = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
            // Perform your action here
            completion(true)
        }
        
        bookmarkAction.backgroundColor = .primary()
        bookmarkAction.image = UIImage(named: "bookmark_icon_white")
        
        editAction.backgroundColor = .primary()
        editAction.image = UIImage(named: "edit_icon_white")
        
        deleteAction.image = UIImage(named: "delete_icon_white")
        deleteAction.backgroundColor = .primary()
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction, bookmarkAction])
    }
    
}

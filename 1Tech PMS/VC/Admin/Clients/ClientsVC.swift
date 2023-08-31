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
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        clientsTv.register(UINib(nibName: CLIENT_CELL, bundle: nil), forCellReuseIdentifier: CLIENT_CELL)
    }
    
    @IBAction func addClientClicked() {
        let vc = CreateClientVC.loadVC(role: .member)
        self.navigationController?.pushViewController(vc, animated: true)
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
}

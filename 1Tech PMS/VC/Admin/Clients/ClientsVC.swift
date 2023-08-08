//
//  ClientsVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 07/08/23.
//

import UIKit

class ClientsVC: BaseVC {

    @IBOutlet weak var clientsTv: UITableView!
    
    override func viewDidLoad() {
        self.title = "CLIENTS"
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        clientsTv.register(UINib(nibName: "ClientsCell", bundle: nil), forCellReuseIdentifier: "ClientsCell")
    }
}

extension ClientsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientsCell", for: indexPath) as! ClientsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ClientInfoVC.loadVC("Admin")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

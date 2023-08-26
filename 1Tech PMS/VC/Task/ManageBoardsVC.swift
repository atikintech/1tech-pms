//
//  ManageBoardsVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 26/08/23.
//

import UIKit

class ManageBoardsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        registerCell(cellArr: ["BoardsCell"], tableView: self.tableView)
        // Do any additional setup after loading the view.
    }
    
}

extension ManageBoardsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardsCell", for: indexPath) as! BoardsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}

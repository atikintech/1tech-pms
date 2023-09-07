//
//  ManageBoardsVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 26/08/23.
//

import UIKit

class ManageBoardsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popOverView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popOverView.isHidden = true
        registerCell(cells: ["BoardsCell"], tableView: self.tableView)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func optionsBtnClicked() {
        popOverView.isHidden = !popOverView.isHidden
    }
    
    @IBAction func addBtnClicked() {
        popOverView.isHidden = !popOverView.isHidden
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        popOverView.isHidden = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        popOverView.isHidden = true
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ManageTaskVC.loadVC(role: .task)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

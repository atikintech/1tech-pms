//
//  SideMenuVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 29/07/23.
//

import UIKit

protocol SideMenuVCDelegate {
    func showVC(vc: UIViewController)
}

class SideMenuVC: UIViewController {
    
    enum MenuCase: String, CaseIterable {
        case home
        case clients
        case templates
        case projects
        case teams
        case members
        case invite
        case profile
        case logout
        
        var vc: UIViewController? {
            switch self {
            case .home:
                return AdminHomeVC.loadVC(role: .notLoggedIn)
            default:
                return nil
            }
        }
    }
    
    //Custom Menu Struct
    struct Menu {
        let image: String
        let name: String
        var vc: UIViewController?
        
        static var menus: Menus {
            MenuCase.allCases.map { Menu(image: $0.self.rawValue + "_side_icon", name: $0.self.rawValue, vc: $0.vc) }
        }
    }
    typealias Menus = [Menu]
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Other Declarations
    var menus: Menus = Menu.menus
    var delegate: SideMenuVCDelegate?
    
    //MARK: View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .accent()
    }
}

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuCell
        let menu = menus[indexPath.row]
        cell.imageView?.image = UIImage(named: menu.image)!
        cell.textLabel?.text = menu.name.uppercased()
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .primary(size: .large, style: .semibold)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = menus[indexPath.row]
        delegate?.showVC(vc: menu.vc!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

class SideMenuCell: UITableViewCell {
    
}

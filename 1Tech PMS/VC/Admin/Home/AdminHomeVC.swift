//
//  AdminHomeVC.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 29/07/23.
//

import UIKit

class AdminHomeVC: BaseVC {
    
    enum MenuCase: String, CaseIterable {
        case clients
        case projects
        case calendar
        case todos
        case notes
        case folder
        case alerts
        case team
        
        var vc: UIViewController {
            switch self {
            case .clients:
                return ClientsVC.loadVC()
            case .projects:
                return ProjectsVC.loadVC()
            case .calendar:
                return UIViewController()
            case .todos:
                return UIViewController()
            case .notes:
                let vc = CreateNotesVC.loadVC(role: .task)
                vc.showAddNotes = true
                return vc
            case .folder:
                return UIViewController()
            case .alerts:
                return UIViewController()
            case .team:
                return TeamMemberVC.loadVC(role: .member)
            }
        }
    }
    //Custom Menu Struct
    struct Menu {
        let image: String
        let name: String
        let vc: UIViewController
        
        static var menus: Menus {
            MenuCase.allCases.map { Menu(image: $0.self.rawValue + "_icon", name: $0.self.rawValue, vc: $0.vc) }
        }
    }
    typealias Menus = [Menu]
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Other Declarations
    var menus: Menus = Menu.menus
    
    //MARK: View Setup
    override func viewDidLoad() {
        self.title = "HOME"
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setupView() {
        collectionView.register(UINib(nibName: "AdminHomeCollCell", bundle: nil), forCellWithReuseIdentifier: "AdminHomeCell")
        collectionView.reloadData()
    }
}


extension AdminHomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdminHomeCell", for: indexPath) as! AdminHomeCollCell
        
        let menu = menus[indexPath.row]
        let title = menu.name.uppercased()
        cell.setModel(image: UIImage(named: menu.image)!, title: title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = menus[indexPath.row].vc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2 - 5, height: collectionView.bounds.width/2 - 5)
    }
}



//
//  Constants.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 03/07/23.
//

import UIKit

struct R {
    static let success = "success"
    static let error = "error"
}

struct ImgName {
    static let teamStaus = UIImage(named: "team_status")
    static let delete = UIImage(named: "delete_client")
}

struct SideMenuModel {
    var icon: UIImage
    var title: String
}

struct Config {
    static let menu: [SideMenuModel] = [
        SideMenuModel(icon: UIImage(named: "home")!, title: "HOME"),
        SideMenuModel(icon: UIImage(named: "clients")!, title: "CLIENTS"),
        SideMenuModel(icon: UIImage(named: "projectTemplate")!, title: "PROJECT TEMPLATES"),
        SideMenuModel(icon: UIImage(named: "projects")!, title: "PROJECT"),
        SideMenuModel(icon: UIImage(named: "teams")!, title: "TEAMS"),
        SideMenuModel(icon: UIImage(named: "members")!, title: "MEMBERS"),
        SideMenuModel(icon: UIImage(named: "invite")!, title: "INVITE"),
        SideMenuModel(icon: UIImage(named: "profile")!, title: "PROFILE"),
        SideMenuModel(icon: UIImage(named: "logout")!, title: "LOGOUT")
    ]
}

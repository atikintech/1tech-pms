//
//  Enums.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 15/08/23.
//

import Foundation

enum createPageType: String {
    
    case createMember
    case editMember
    case inviteMember
    case createTeam
    
}

enum btnMembersHome: Int {
    case goto = 1
    case projectManagement = 2
    case recruitment = 3
    case salesPipeline = 4
}

enum alertTypes: String{
    case change
    case delete
    case yes
}

enum btnAlerts: Int {
    
    case cancel = 1
    case change = 2
    case delete = 3
    case yes = 4
    case no = 5
    
}

enum btnCreataClients: Int {
    
    case basic = 1
    case contact = 2
    case template = 3
    
}

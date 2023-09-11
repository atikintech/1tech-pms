//
//  ModelTeamMember.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 15/08/23.
//

import Foundation

struct ModelTeamMember {
    var name: String
    var mail: String
    var designation: String
}

struct ModelTeam {
    var name: String
    var status: Bool
    var image: String
}

class VMTeamMember {
    let teamMemberArr: [ModelTeamMember] = [
        ModelTeamMember(name: "Anand Kumar", mail: "anand@gmail.com", designation: "Manager"),
        ModelTeamMember(name: "Hari Krishna", mail: "harikrishna@gmail.com", designation: "Tester"),
        ModelTeamMember(name: "Srinivas", mail: "srinivas@gmail.com", designation: "Developer"),
    ]
    
    let teams: [ModelTeam] = [
        ModelTeam(name: "Development Team", status: true, image: "development_team_icon"),
        ModelTeam(name: "Recruitment Team", status: false, image: "recruitment_team_icon"),
        ModelTeam(name: "Testing Team", status: true, image: "testing_team_icon")
    ]
}

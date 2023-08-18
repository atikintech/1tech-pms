//
//  ModelMemberHome.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 18/08/23.
//

import Foundation

struct ModelMemberHome {
    var day: String
    var dayIssueArr: [ModelIssue]
}

struct ModelIssue {
    var issue: String
    var issueComment: String
    var status: Bool
}

class VMMemberHome {
    
    let issueArr: [ModelMemberHome] = [
        ModelMemberHome(day: "Today", dayIssueArr: [
            ModelIssue(issue: "Web App Module Document", issueComment: "CBQI-1 = TO DO", status: true),
            ModelIssue(issue: "What is requested", issueComment: "DEMO-1 = Viewed", status: true)
        ]),
        ModelMemberHome(day: "Yesterday", dayIssueArr: [
            ModelIssue(issue: "Web App Module Document", issueComment: "CBQI-1 = TO DO", status: true)
        ]),
        ModelMemberHome(day: "This Month", dayIssueArr: [
            ModelIssue(issue: "Web App Module Document", issueComment: "CBQI-1 = TO DO", status: true),
            ModelIssue(issue: "What is requested", issueComment: "DEMO-1 = Viewed", status: true)
        ])
    ]
}
    

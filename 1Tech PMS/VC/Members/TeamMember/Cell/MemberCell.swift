//
//  MemberCell.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 15/08/23.
//

import UIKit
import Foundation

class MemberCell: UITableViewCell {
    
    @IBOutlet weak var lblInitial: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    
    @IBOutlet weak var btnFwd: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(data: ModelTeamMember) {
        lblName.text = data.name
        lblMail.text = data.mail
        lblDesignation.text = data.designation
        lblInitial.text = getInitals(fullName: data.name)
    }
    
    func getInitals(fullName : String) -> String {
        let formatter = PersonNameComponentsFormatter()

        guard let personNameComponents = formatter.personNameComponents(from: fullName) else {
          return ""
        }

        return personNameComponents.initials
    }
    
}

extension PersonNameComponents {
  var fullName: String {
    return [givenName, middleName, familyName].compactMap{ $0 }.joined(separator: " ")
  }

  var fullNameWithSuffix: String {
    return [givenName, middleName, familyName, nameSuffix].compactMap{ $0 }.joined(separator: " ")
  }

  var initials: String {
    let firstName = givenName?.first ?? Character(" ")
    let lastName = familyName?.first ?? Character(" ")
    return "\(firstName)\(lastName)".trimmingCharacters(in: .whitespaces)
  }

  // Note: If You need first, middle, last
  /*
  var initials: String {
    let firstName = givenName?.first ?? Character(" ")
    let middleName = middleName?.first ?? Character(" ")
    let lastName = familyName?.first ?? Character(" ")
    return "\(firstName)\(middleName)\(lastName)".trimmingCharacters(in: .whitespaces)
  }
  */
}

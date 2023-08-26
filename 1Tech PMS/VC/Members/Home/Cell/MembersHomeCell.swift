//
//  MembersHomeCell.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 18/08/23.
//

import UIKit

class MembersHomeCell: UITableViewCell {

    @IBOutlet weak var lblIssueName: UILabel!
    @IBOutlet weak var lblIssueComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

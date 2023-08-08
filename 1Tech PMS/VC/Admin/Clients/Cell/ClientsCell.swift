//
//  ClientsCell.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 07/08/23.
//

import UIKit

class ClientsCell: UITableViewCell {

    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainLabel.font = .primary(size: .medium)
        secondaryLabel.font = .primary(size: .small)
        mainLabel.textColor = .textColor()
        secondaryLabel.textColor = .secondaryTextColor()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

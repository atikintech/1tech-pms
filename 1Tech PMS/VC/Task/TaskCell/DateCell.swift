//
//  DateCell.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 11/09/23.
//

import UIKit

class DateCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateTf: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

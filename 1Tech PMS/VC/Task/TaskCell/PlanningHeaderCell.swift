//
//  PriorityCell.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 11/09/23.
//

import UIKit

class PlanningHeaderCell: UITableViewCell {

    @IBOutlet weak var expandedBtn: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    
    var expandAction: (()->Void)?
    var isExpanded: Bool = false {
        didSet {
            expandedBtn.setImage(isExpanded ? UIImage(systemName: "chevron.down")! : UIImage(systemName: "chevron.up")!, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        isExpanded = selected
    }
    
    @IBAction func expandClicked() {
        if let action = expandAction {
            action()
        }
    }
    
}

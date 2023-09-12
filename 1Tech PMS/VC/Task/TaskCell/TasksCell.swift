//
//  TasksCell.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 24/08/23.
//

import UIKit

class TasksCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ImgType: UIImageView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var expandBtn: UIButton!
    
    var expandAction: (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func expandClicked() {
        if let action = expandAction {
            action()
        }
    }
}

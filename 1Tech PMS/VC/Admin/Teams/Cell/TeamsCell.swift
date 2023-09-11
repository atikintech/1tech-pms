//
//  TeamsCell.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 11/09/23.
//

import UIKit

class TeamsCell: UITableViewCell {

    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(data: ModelTeam) {
        lblName.text = data.name
        iconImg.image = UIImage(named: data.image)!
        statusImg.image = data.status ? UIImage(named: "green_icon")! : UIImage(named: "red_icon")!
    }
    
}

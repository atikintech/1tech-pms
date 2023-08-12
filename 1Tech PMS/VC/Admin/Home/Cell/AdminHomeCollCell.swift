//
//  AdminHomeCollCell.swift
//  1Tech PMS
//
//  Created by Bhavesh Gupta on 07/08/23.
//

import UIKit

class AdminHomeCollCell: UICollectionViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    
    let insetValue: CGFloat = -16
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuTitle.font = .primary(size: .medium, style: .bold)
        menuTitle.textColor = .textColor()
    }
    
    func setModel(image: UIImage, title: String) {
        self.menuTitle.text = title
        self.menuImage.image = image
    }

}

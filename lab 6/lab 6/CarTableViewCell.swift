//
//  CarTableViewCell.swift
//  lab 6
//
//  Created by user252703 on 7/7/24.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    

        
        @IBOutlet weak var carImageView: UIImageView!
        @IBOutlet weak var makeLabel: UILabel!
        @IBOutlet weak var modelLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
        
    



}

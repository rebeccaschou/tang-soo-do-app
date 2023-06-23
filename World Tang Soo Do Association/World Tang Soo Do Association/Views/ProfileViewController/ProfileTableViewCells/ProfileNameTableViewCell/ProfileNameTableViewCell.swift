//
//  ProfileTableViewCell.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/24/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        
        if let name = defaults.string(forKey: "name") {
            nameLabel.text = name
        } else {
            nameLabel.text = "No Name"
        }
        
        nameLabel.font = UIFont(name: Theme.mainFontName, size: 30)
        
    }
}

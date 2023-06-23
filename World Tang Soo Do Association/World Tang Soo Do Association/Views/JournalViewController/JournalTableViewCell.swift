//
//  JournalTableViewCell.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/12/22.
//

import UIKit

class JournalTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        cardView.backgroundColor = Theme.accentColor
        cardView.addShadowAndRoundedCorners()
    }
    
    func setup(entry: Entry) {
        
        var type = "No type"
        
        if entry.type == 1 {
            type = "Practice"
        } else if entry.type == 2 {
            type = "Class"
        } else if entry.type == 3 {
            type = "Tournament"
        } else if entry.type == 4 {
            type = "Test"
        }
        
        titleLabel.text = type
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 30)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        
        dateLabel.text = dateFormatter.string(from: entry.date!)
        dateLabel.font = UIFont(name: Theme.secondaryFontName, size: 15)
        
    }

}

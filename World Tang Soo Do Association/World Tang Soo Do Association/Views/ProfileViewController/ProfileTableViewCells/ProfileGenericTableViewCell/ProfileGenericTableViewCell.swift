//
//  ProfileGenericTableViewCell.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/24/22.
//

import UIKit

class ProfileGenericTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // https://stackoverflow.com/questions/36486761/make-part-of-a-uilabel-bold-in-swift
    func boldHeader(key: String, title: String) -> NSAttributedString {
        let boldText = "\(key.capitalizingFirstLetter()): "
        let attrs = [NSAttributedString.Key.font: UIFont(name: "\(Theme.mainFontName)-Bold", size: 15)]
        let attributedString = NSMutableAttributedString(string: boldText, attributes: attrs as [NSAttributedString.Key: Any])

        let normalText = title
        let attrsNormal = [NSAttributedString.Key.font: UIFont(name: "\(Theme.mainFontName)", size: 15)]
        let normalString = NSMutableAttributedString(string: normalText, attributes: attrsNormal as [NSAttributedString.Key: Any])
        
        attributedString.append(normalString)
        
        return attributedString
    }
    
    func setup(key: String) {
        
        // let keys = ["name", "rank", "username", "password", "number"]
        
        if key == "password" {
            if let title = defaults.string(forKey: key) {
                nameLabel.attributedText = boldHeader(key: key, title: String(repeating: "*", count: title.count))
            }
        } else if key == "rank" {
            var title: String {
                switch defaults.integer(forKey: "rank") { 
                case 10:
                    return "10th Gup (White Belt)"
                case 9:
                    return "9th Gup (Advanced White Belt)"
                case 8:
                    return "8th Gup (Orange Belt)"
                case 7:
                    return "7th Gup (Orange-Green Belt)"
                case 6:
                    return "6th Gup (Green Belt)"
                case 5:
                    return "5th Gup (Green-Brown Belt)"
                case 4:
                    return "4th Gup (Brown Belt)"
                case 3:
                    return "3rd Gup (Brown-Red Belt)"
                case 2:
                    return "2nd Gup (Red Belt)"
                case 1:
                    return "1st Gup (Red-Blue Belt)"
                case 0:
                    return "Cho Dan Bo (Black Belt Candidate)"
                case -1:
                    return "Cho Dan (1st Degree Black Belt)"
                case -2:
                    return "E Dan (2nd Degree Black Belt)"
                case -3:
                    return "Sam Dan (3rd Degree Black Belt)"
                case -4:
                    return "Sah Dan (4th Degree Black Belt)"
                case -5:
                    return "Oh Dan (5th Degree Black Belt)"
                case -6:
                    return "Yuk Dan (6th Degree Black Belt)"
                case -7:
                    return "Chil Dan (7th Degree Black Belt)"
                case -8:
                    return "Pahl Dan (8th Degree Black Belt)"
                case -9:
                    return "Ku Dan (9th Degree Black Belt)"
                default:
                    return "No Rank"
                }
            }
            nameLabel.attributedText = boldHeader(key: key, title: title)
        } else if let title = defaults.string(forKey: key) {
            nameLabel.attributedText = boldHeader(key: key, title: title)
        } else {
            nameLabel.text = "No entry"
        }
        
    }
    
}

//
//  SyllabusTableViewCell.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/8/22.
//

import UIKit

class SyllabusTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        cardView.backgroundColor = Theme.accentColor
        cardView.addShadowAndRoundedCorners()
    }
    
    func setup(categoryModel: CategoryModel) {
        titleLabel.text = categoryModel.title
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 40)
        
    }

}

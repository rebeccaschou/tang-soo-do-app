//
//  ProfileLogOutTableViewCell.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/14/22.
//

import UIKit

class ProfileLogOutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logOutButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        logOutButton.createAppButton()
        logOutButton.titleLabel?.font = UIFont(name: Theme.secondaryFontName, size: 15)
        // Configure the view for the selected state
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        defaults.set(nil, forKey: "name")
        defaults.set(nil, forKey: "rank")
        defaults.set(nil, forKey: "username")
        defaults.set(nil, forKey: "password")
        defaults.set(nil, forKey: "number")

        let storyboard = UIStoryboard(name: "SyllabusViewController", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
    
    func setup() {
        
        logOutButton.createAppButton()
        
    }
    
}

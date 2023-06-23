//
//  TabBarViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/12/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayHelpScreen() {
        self.performSegue(withIdentifier: "toHelpScreenSegue", sender: nil)
    }

}

//
//  HelpScreenViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/12/22.
//

import UIKit

class HelpScreenViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var showSwitch: UISwitch!
    @IBOutlet weak var dismissButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont(name: Theme.mainFontName, size: 30)
        showLabel.font = UIFont(name: Theme.mainFontName, size: 20)
        textView.font = UIFont(name: Theme.mainFontName, size: 16)
    
        // The following use custom extensions to create the stylized version of the basic component
        popupView.backgroundColor = Theme.backgroundColor
        textView.backgroundColor = Theme.backgroundColor
        popupView.addShadowAndRoundedCorners()
    
        dismissButton.createAppButton()
        
        showSwitch.isOn = false
    }

    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        if showSwitch.isOn == true {
            defaults.set(true, forKey: "doNotShowHelpScreen")
        } else {
            defaults.set(false, forKey: "doNotShowHelpScreen")
        }
            
        dismiss(animated: true)
    }
    
}

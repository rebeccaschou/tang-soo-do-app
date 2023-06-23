//
//  EditPasswordViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/26/22.
//

import UIKit

class EditPasswordViewController: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    var key = ""
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        titleLabel.text = "Change \(key.capitalizingFirstLetter())"
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 30)
        
        // The following use custom extensions to create the stylized version of the basic component
        popupView.backgroundColor = Theme.backgroundColor
        popupView.addShadowAndRoundedCorners()
        
        cancelButton.createAppButton()
        saveButton.createAppButton()
        
        // defaults.set("password", forKey: "password")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        let currentPassword = defaults.string(forKey: "password")
        
        oldPasswordTextField.setDefaultState()
        newPasswordTextField.setDefaultState()
        confirmNewPasswordTextField.setDefaultState()
        
        if oldPasswordTextField.text != currentPassword {
            oldPasswordTextField.setErrorState()
            
            let alert = UIAlertController(title: "Password Change Failed", message: "Current password inputted incorrectly. Please try again.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else if newPasswordTextField.text != confirmNewPasswordTextField.text {
            newPasswordTextField.setErrorState()
            confirmNewPasswordTextField.setErrorState()
            
            let alert = UIAlertController(title: "Password Change Failed", message: "New password must match the password in the confirm field.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else if newPasswordTextField.text == "" {
            newPasswordTextField.setErrorState()
            confirmNewPasswordTextField.setErrorState()
            
            let alert = UIAlertController(title: "Password Change Failed", message: "New password cannot be blank.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else if oldPasswordTextField.text == currentPassword && newPasswordTextField.text == confirmNewPasswordTextField.text && newPasswordTextField.text != "" {
            defaults.set(newPasswordTextField.text, forKey: "password")
            
            if let doneSaving = doneSaving { // Unwrap optional callback function passed in from main view controller
                doneSaving() // Execute callback function if passed in from main view controller
            }

            dismiss(animated: true)
        }
    }

}

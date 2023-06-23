//
//  SignInViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/16/22.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        signInButton.createAppButton()
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 23)
    }

    @IBAction func signIn(_ sender: UIButton) {
        
        usernameTextField.setDefaultState()
        passwordTextField.setDefaultState()
        
        if usernameTextField.text == "rebeccachou" && passwordTextField.text == "password" {
            let storyboard = UIStoryboard(name: "SyllabusViewController", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            
            // Log in with stored data (in the future, should fetch from SQLite)
            defaults.set("Rebecca Chou", forKey: "name")
            defaults.set(1, forKey: "rank")
            defaults.set("rebeccachou", forKey: "username")
            defaults.set("password", forKey: "password")
            defaults.set("90329", forKey: "number")
            defaults.set(false, forKey: "doNotShowHelpScreen")
                
            // This is to get the SceneDelegate object from your view controller
            // then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        } else if usernameTextField.text == "" {
            usernameTextField.setErrorState()
            
            let alert = UIAlertController(title: "Sign In Failed", message: "Username cannot be blank.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else if passwordTextField.text == "" {
            passwordTextField.setErrorState()
            
            let alert = UIAlertController(title: "Sign In Failed", message: "Password cannot be blank.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Sign In Failed", message: "Username and password do not match, or account does not exist.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

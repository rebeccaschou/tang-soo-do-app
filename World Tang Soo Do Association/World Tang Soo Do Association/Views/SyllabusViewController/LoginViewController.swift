//
//  LoginViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/14/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.set(false, forKey: "showSyllabus")
        
        signInButton.createAppButton()
        createAccountButton.createAppButton()
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        
    }

}

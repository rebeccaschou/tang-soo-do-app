//
//  CreateAccountViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/16/22.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var sectionOneLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var sectionTwoLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rankTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    let rankPickerViewData = ["10th Gup (White Belt)", "9th Gup (Advanced White Belt)", "8th Gup (Orange Belt)", "7th Gup (Orange-Green Belt)", "6th Gup (Green Belt)", "5th Gup (Green-Brown Belt)", "4th Gup (Brown Belt)", "3rd Gup (Brown-Red Belt)", "2nd Gup (Red Belt)", "1st Gup (Red-Blue Belt)", "Cho Dan Bo (Black Belt Candidate)", "Cho Dan (1st Degree Black Belt)", "E Dan (2nd Degree Black Belt)", "Sam Dan (3rd Degree Black Belt)", "Sah Dan (4th Degree Black Belt)", "Oh Dan (5th Degree Black Belt)", "Yuk Dan (6th Degree Black Belt)", "Chil Dan (7th Degree Black Belt)", "Pahl Dan (8th Degree Black Belt)", "Ku Dan (9th Degree Black Belt)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        let rankPickerView = UIPickerView()
        rankTextField.inputView = rankPickerView
        rankTextField.text = "10th Gup (White Belt)"
        
        rankPickerView.delegate = self
        rankPickerView.dataSource = self
        
        sectionOneLabel.font = UIFont(name: Theme.mainFontName, size: 23)
        sectionTwoLabel.font = UIFont(name: Theme.mainFontName, size: 23)
        
        createAccountButton.createAppButton()
        
    }
    
    @IBAction func createAccount(_ sender: Any) {
        usernameTextField.setDefaultState()
        passwordTextField.setDefaultState()
        confirmPasswordTextField.setDefaultState()
        nameTextField.setDefaultState()
        rankTextField.setDefaultState()
        numberTextField.setDefaultState()
        
        if usernameTextField.text == "" {
            usernameTextField.setErrorState()
            
            let alert = UIAlertController(title: "Account Creation Failed", message: "Username cannot be blank.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else if passwordTextField.text == "" {
            passwordTextField.setErrorState()
            
            let alert = UIAlertController(title: "Account Creation Failed", message: "Password cannot be blank.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else if passwordTextField.text != confirmPasswordTextField.text {
            passwordTextField.setErrorState()
            confirmPasswordTextField.setErrorState()
            
            let alert = UIAlertController(title: "Account Creation Failed", message: "Password must match the password in the confirm field.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else if nameTextField.text == "" {
            nameTextField.setErrorState()
            
            let alert = UIAlertController(title: "Account Creation Failed", message: "Name cannot be blank.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else if numberTextField.text == "" {
            numberTextField.setErrorState()
            
            let alert = UIAlertController(title: "Account Creation Failed", message: "Number cannot be blank.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        } else {
            defaults.set(usernameTextField.text, forKey: "username")
            defaults.set(passwordTextField.text, forKey: "password")
            defaults.set(nameTextField.text, forKey: "name")
            defaults.set(rankToNumber(rankString: rankTextField.text!), forKey: "rank")
            defaults.set(numberTextField.text, forKey: "number")
            
            defaults.set(false, forKey: "doNotShowHelpScreen")
            
            let storyboard = UIStoryboard(name: "SyllabusViewController", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
    }
    
    func rankToNumber(rankString: String) -> Int {
        var rank: Int {
            switch rankString {
            case "10th Gup (White Belt)":
                return 10
            case "9th Gup (Advanced White Belt)":
                return 9
            case "8th Gup (Orange Belt)":
                return 8
            case "7th Gup (Orange-Green Belt)":
                return 7
            case "6th Gup (Green Belt)":
                return 6
            case "5th Gup (Green-Brown Belt)":
                return 5
            case "4th Gup (Brown Belt)":
                return 4
            case "3rd Gup (Brown-Red Belt)":
                return 3
            case "2nd Gup (Red Belt)":
                return 2
            case "1st Gup (Red-Blue Belt)":
                return 1
            case "Cho Dan Bo (Black Belt Candidate)":
                return 0
            case "Cho Dan (1st Degree Black Belt)":
                return -1
            case "E Dan (2nd Degree Black Belt)":
                return -2
            case "Sam Dan (3rd Degree Black Belt)":
                return -3
            case "Sah Dan (4th Degree Black Belt)":
                return -4
            case "Oh Dan (5th Degree Black Belt)":
                return -5
            case "Yuk Dan (6th Degree Black Belt)":
                return -6
            case "Chil Dan (7th Degree Black Belt)":
                return -7
            case "Pahl Dan (8th Degree Black Belt)":
                return -8
            case "Ku Dan (9th Degree Black Belt)":
                return -9
            default:
                return 10
            }
        }
        
        return rank
    }

}

extension CreateAccountViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rankPickerViewData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rankPickerViewData[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rankTextField.text = rankPickerViewData[row]
    }
    
}

//
//  EditNameViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/25/22.
//

import UIKit
import Photos

class EditNameViewController: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    var key = ""
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        textField.text = defaults.string(forKey: key)
        
        titleLabel.text = "Change \(key.capitalizingFirstLetter())"
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 30)
        
        // The following use custom extensions to create the stylized version of the basic component
        popupView.backgroundColor = Theme.backgroundColor
        popupView.addShadowAndRoundedCorners()
        
        cancelButton.createAppButton()
        saveButton.createAppButton()
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        textField.setDefaultState()
        
        if textField.text != "" {
            defaults.set(textField.text, forKey: key)
            
            if let doneSaving = doneSaving { // Unwrap optional callback function passed in from main view controller
                doneSaving() // Execute callback function if passed in from main view controller
            }

            dismiss(animated: true)
        } else { 
            textField.setErrorState()
            
            let alert = UIAlertController(title: "\(key.capitalizingFirstLetter()) Change Failed", message: "New \(key) cannot be blank.", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
            
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func editPictureButtonPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    let imagePickerController = UIImagePickerController()
                    imagePickerController.sourceType = .photoLibrary
                    self.present(imagePickerController, animated: true)
                default:
                    break
                }
            }
        }
    }
    
}

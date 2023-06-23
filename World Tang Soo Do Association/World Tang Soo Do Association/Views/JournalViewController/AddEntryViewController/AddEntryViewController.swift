//
//  AddEntryViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/12/22.
//

import UIKit
import CoreData

class AddEntryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    let typePickerViewData = ["Practice", "Class", "Tournament", "Test"]
    var doneSaving: (() -> ())? // Define callback function to be passed in from main view controller
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        // https://peterwitham.com/swift/how-to-use-a-uipickerview-as-input-for-a-uitextfield/
        let typePickerView = UIPickerView()
        // let techniquesPickerView = UIPickerView()
        
        typeTextField.text = "Practice"
        typeTextField.inputView = typePickerView
        
        typePickerView.delegate = self
        typePickerView.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
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

        let newEntry = Entry(context: self.context)
        newEntry.setValue(datePicker.date.removeTimeStamp, forKey: "date")
        
        var typeNumber = 1 // Could change to store as string in CoreData
        var points = 0
        
        if typeTextField.text == "Practice" {
            typeNumber = 1
            points = 30
        } else if typeTextField.text == "Class" {
            typeNumber = 2
            points = 50
        } else if typeTextField.text == "Tournament" {
            typeNumber = 3
            points = 70
        } else if typeTextField.text == "Test" {
            typeNumber = 4
            points = 100
        }
        
        newEntry.setValue(typeNumber, forKey: "type")
        newEntry.setValue(points, forKey: "points") // Add function to calculate points for different entries
        newEntry.setValue(UUID(), forKey: "id")

        self.saveEntries()

        if let doneSaving = doneSaving { // Unwrap optional callback function passed in from main view controller
            doneSaving() // Execute callback function if passed in from main view controller
        }

        dismiss(animated: true)
    }

    func saveEntries() {
        do {
          try context.save()
        } catch {
           print("Error saving context \(error)")
        }
    }

}

extension AddEntryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typePickerViewData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typePickerViewData[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeTextField.text = typePickerViewData[row]
    }
    
}

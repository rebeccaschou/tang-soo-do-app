//
//  EditRankViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/26/22.
//

import UIKit

class EditRankViewController: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    var key = ""
    
    let rankPickerViewData = ["10th Gup (White Belt)", "9th Gup (Advanced White Belt)", "8th Gup (Orange Belt)", "7th Gup (Orange-Green Belt)", "6th Gup (Green Belt)", "5th Gup (Green-Brown Belt)", "4th Gup (Brown Belt)", "3rd Gup (Brown-Red Belt)", "2nd Gup (Red Belt)", "1st Gup (Red-Blue Belt)", "Cho Dan Bo (Black Belt Candidate)", "Cho Dan (1st Degree Black Belt)", "E Dan (2nd Degree Black Belt)", "Sam Dan (3rd Degree Black Belt)", "Sah Dan (4th Degree Black Belt)", "Oh Dan (5th Degree Black Belt)", "Yuk Dan (6th Degree Black Belt)", "Chil Dan (7th Degree Black Belt)", "Pahl Dan (8th Degree Black Belt)", "Ku Dan (9th Degree Black Belt)"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        // https://peterwitham.com/swift/how-to-use-a-uipickerview-as-input-for-a-uitextfield/
        let rankPickerView = UIPickerView()
        // let techniquesPickerView = UIPickerView()
        
        textField.text = String(numberToRank(rankNumber: defaults.integer(forKey: "rank")))
        textField.inputView = rankPickerView
        
        rankPickerView.delegate = self
        rankPickerView.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        titleLabel.text = "Change \(key.capitalizingFirstLetter())"
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 30)
        
        // The following use custom extensions to create the stylized version of the basic component
        popupView.backgroundColor = Theme.backgroundColor
        popupView.addShadowAndRoundedCorners()
        
        cancelButton.createAppButton()
        saveButton.createAppButton()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        let rank = rankToNumber(rankString: textField.text!)
        
        defaults.set(rank, forKey: key)
        
        if let doneSaving = doneSaving { // Unwrap optional callback function passed in from main view controller
            doneSaving() // Execute callback function if passed in from main view controller
        }

        dismiss(animated: true)
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
    
    func numberToRank(rankNumber: Int) -> String {
        var rank: String {
            switch rankNumber { // Replace with case of i
            case 10:
                return "10th Gup (White Belt)"
            case 9:
                return "9th Gup (Advanced White Belt)"
            case 8:
                return "8th Gup (Orange Belt)"
            case 7:
                return "7th Gup (Orange-Green Belt)"
            case 6:
                return "6th Gup (Green Belt)"
            case 5:
                return "5th Gup (Green-Brown Belt)"
            case 4:
                return "4th Gup (Brown Belt)"
            case 3:
                return "3rd Gup (Brown-Red Belt)"
            case 2:
                return "2nd Gup (Red Belt)"
            case 1:
                return "1st Gup (Red-Blue Belt)"
            case 0:
                return "Cho Dan Bo (Black Belt Candidate)"
            case -1:
                return "Cho Dan (1st Degree Black Belt)"
            case -2:
                return "E Dan (2nd Degree Black Belt)"
            case -3:
                return "Sam Dan (3rd Degree Black Belt)"
            case -4:
                return "Sah Dan (4th Degree Black Belt)"
            case -5:
                return "Oh Dan (5th Degree Black Belt)"
            case -6:
                return "Yuk Dan (6th Degree Black Belt)"
            case -7:
                return "Chil Dan (7th Degree Black Belt)"
            case -8:
                return "Pahl Dan (8th Degree Black Belt)"
            case -9:
                return "Ku Dan (9th Degree Black Belt)"
            default:
                return "No Rank"
            }
        }
        
        return rank
    }
    
}

extension EditRankViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        textField.text = rankPickerViewData[row]
    }
    
}

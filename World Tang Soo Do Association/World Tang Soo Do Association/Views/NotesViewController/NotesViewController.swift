//
//  NotesViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/14/22.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var entry = Entry()
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        titleLabel.font = UIFont(name: Theme.mainFontName, size: 25)
        titleLabel.text = "\(createEntryTitle(entry: entry))"
        
        textView.text = entry.notes
        
        self.navigationController?.navigationBar.tintColor = Theme.tintColor
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))]
    }
    
    func createEntryTitle(entry: Entry) -> String {
        var type: String {
            switch entry.type {
            case 1:
                return "Practice"
            case 2:
                return "Class"
            case 3:
                return "Tournament"
            case 4:
                return "Test"
            default:
                return "No type"
            }
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let date = dateFormatter.string(from: entry.date!)
        
        return "\(type): \(date)"
    }
    
    func saveEntries() {
        do {
          try context.save()
        } catch {
           print("Error saving context \(error)")
        }
    }
    
    @IBAction func save(_ sender: Any) {
        entry.notes = textView.text

        saveEntries()

        if let doneSaving = doneSaving { // Unwrap optional callback function passed in from main view controller
            doneSaving() // Execute callback function if passed in from main view controller
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}

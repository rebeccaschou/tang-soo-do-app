//
//  JournalViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/12/22.
//

import UIKit
import CoreData

class JournalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    var entries = [Entry]()
    var sortedEntries = [[Entry]]()
    
    var currentFilter = 0
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadEntries()
        sortedEntries = sortEntries() // Create global variable to store entries sorted into dates
        
        tableView.dataSource = self
        tableView.delegate = self
        
        addButton.backgroundColor = Theme.tintColor
        addButton.createFloatingActionButton()
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "All Entries", style: .plain, target: self, action: #selector(barButtonItemClicked))]
        
        self.navigationItem.rightBarButtonItems?[0].setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: Theme.mainFontName, size: 19)!,
            NSAttributedString.Key.foregroundColor : Theme.tintColor as Any,
        ], for: .normal)
        
        navigationItem.title = "Journal"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddEntrySegue" {
            let popup = segue.destination as! AddEntryViewController
            popup.modalPresentationStyle = .overFullScreen // This also changes button style?

            
            popup.doneSaving = { [weak self] in
                self?.loadEntries()
                self?.sortedEntries = self?.sortEntries() ?? [[]]
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func barButtonItemClicked(_ sender: UIButton) {
        if currentFilter < 4 {
            currentFilter += 1
        } else {
            currentFilter = 0
        }
        
        var title: String {
            switch currentFilter { // Replace with case of i
            case 0:
                return "All Entries"
            case 1:
                return "Practices"
            case 2:
                return "Classes"
            case 3:
                return "Tournaments"
            case 4:
                return "Tests"
            default:
                return "Error"
            }
        }
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "\(title)", style: .plain, target: self, action: #selector(barButtonItemClicked))]
        
        self.navigationItem.rightBarButtonItems?[0].setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: Theme.mainFontName, size: 19)!,
            NSAttributedString.Key.foregroundColor : Theme.tintColor as Any,
        ], for: .normal)
        
        loadEntries()

        tableView.reloadData()
    }
    
    func saveEntries() {
        do {
            try context.save()
        } catch {
            print("Error saving category \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadEntries(with request: NSFetchRequest<Entry> = Entry.fetchRequest(), predicate: NSPredicate? = nil) {
        
        if currentFilter != 0 {
            let typePredicate = NSPredicate(format: "type == %@", NSNumber(value: currentFilter))

            if let addtionalPredicate = predicate {
                request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [typePredicate, addtionalPredicate])
            } else {
                request.predicate = typePredicate
            }
        }

        do {
            entries = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        sortedEntries = sortEntries()
        tableView.reloadData()
    }
    
    func sortEntries() -> [[Entry]] {
        let sortedArray = entries.sorted()
        var checker = [Entry]()
        var dividedEntries = [[Entry]]()
        if sortedArray.count == 0 {
            return []
        } else {
            for entry in sortedArray {
                if checker.contains(where: { e in
                    e.date!.removeTimeStamp == entry.date!.removeTimeStamp
                }) { continue }
                let s = sortedArray.filter({ e in
                    e.date!.removeTimeStamp == entry.date!.removeTimeStamp // Fails if there are no entries
                })
                checker += s
                dividedEntries.append(s)
            }
        }
        
        return dividedEntries
    }
    
    func calculateAllTimePoints() -> Int {
        var points = 0
        
        for entry in entries {
            points += Int(entry.points)
        }
        
        return points
    }

}

extension JournalViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedEntries.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        if sortedEntries.count == 0 || sortedEntries[section].count == 0 {
            return nil
        } else {
            return dateFormatter.string(from: sortedEntries[section][0].date!)
        } 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedEntries[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! JournalTableViewCell
        
        cell.setup(entry: sortedEntries[indexPath.section][indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = indexPath.section
        let row = indexPath.row

        let entry = sortedEntries[section][row]

        let storyboard = UIStoryboard(name: String(describing: NotesViewController.self), bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! NotesViewController
        vc.entry = entry
        vc.doneSaving = { [weak self] in
            self?.loadEntries()
            self?.sortedEntries = self?.sortEntries() ?? [[]]
            self?.tableView.reloadData()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in

            let alert = UIAlertController(title: "Delete Entry", message: "Are you sure you would like to delete this entry?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))

            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                
                // Set up shorthand for section and row
                let section = indexPath.section
                let row = indexPath.row
                
                // Delete from CoreData (does not yet delete from local tableView source)
                let entryUUID = self.sortedEntries[section][row].id
                let indexInEntries = self.entries.firstIndex(where: {$0.id == entryUUID}) // Find index of object in question in entries array
                let entry = self.entries[indexInEntries!]
                self.context.delete(entry)
                
                // Delete from entries array (local)
                self.entries.remove(at: indexInEntries!)
                self.sortedEntries[section].remove(at: row)
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                if self.sortedEntries[section].count < 1 {
                    self.sortedEntries.remove(at: section)
                    print(self.sortedEntries)
                    print(self.entries)
                    let indexSet = IndexSet(arrayLiteral: section)
                    tableView.deleteSections(indexSet, with: .fade)
                }
                
                // Delete row and section from tableView
                
                self.saveEntries()
                
                actionPerformed(true) // Never hits this line
            }))

            self.present(alert, animated: true)
        }

        return UISwipeActionsConfiguration(actions: [delete])
    }
    
}

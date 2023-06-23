//
//  SyllabusViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/5/22.
//

import UIKit

class SyllabusViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Syllabus"

        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = Theme.backgroundColor

        CategoryFunctions.readCategories(completion: { [weak self] in
            // Following code runs when completion handler is called
            self?.tableView.reloadData()
        })
        
        if defaults.bool(forKey: "doNotShowHelpScreen") == false {
            // Following line used help from Noah Trupin (to cover tab bar, popup must be called from tab bar controller)
            (self.parent!.parent! as! TabBarViewController).displayHelpScreen()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHelpScreenSegue" {
            let popup = segue.destination as! HelpScreenViewController
            popup.modalPresentationStyle = .overFullScreen
        }
    }

}

extension SyllabusViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.categoryModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SyllabusTableViewCell
        
        cell.setup(categoryModel: Data.categoryModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = Data.categoryModels[indexPath.row]

        let storyboard = UIStoryboard(name: String(describing: CategoryViewController.self), bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! CategoryViewController
        vc.categoryArray = category.techniqueModels
        vc.categoryTitle = category.title
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

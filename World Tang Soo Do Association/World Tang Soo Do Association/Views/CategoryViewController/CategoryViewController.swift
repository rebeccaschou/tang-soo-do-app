//
//  CategoryViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/11/22.
//

import UIKit
import SafariServices

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryArray = [TechniqueModel]()
    var categoryTitle: String = "Title"
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = categoryTitle
        
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = Theme.backgroundColor
        
        CategoryFunctions.readCategories(completion: { [weak self] in
            // Following code runs when completion handler is called
            self?.tableView.reloadData()
        })
        
    }
    
    func filterByRank() {
        
        let rank = defaults.integer(forKey: "rank") - 1
        var filteredCategoryArray = [TechniqueModel]()
        
        for technique in categoryArray {
            if technique.rank >= rank {
                filteredCategoryArray.append(technique)
            }
        }
        
        if filteredCategoryArray.count == 0 {
            filteredCategoryArray.append(TechniqueModel(title: "No Requirements for Current Rank", rank: 10, steps: [""], link: ""))
        }
        
        categoryArray = filteredCategoryArray
    }

}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterByRank()
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = categoryArray[indexPath.row].title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let technique = categoryArray[indexPath.row]
        
        guard let url = URL(string: technique.link) else { return }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true, completion: nil)
        
    }
    
}

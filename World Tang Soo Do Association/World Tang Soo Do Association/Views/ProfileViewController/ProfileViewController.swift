//
//  ProfileViewController.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/24/22.
//

import UIKit
// import XCTest

class ProfileViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    var currentKey = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
    }
    
    private func registerCell() {
        let nameCell = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        self.tableView.register(nameCell, forCellReuseIdentifier: "name")
        
        let genericCell = UINib(nibName: "ProfileGenericTableViewCell", bundle: nil)
        self.tableView.register(genericCell, forCellReuseIdentifier: "rank")
        self.tableView.register(genericCell, forCellReuseIdentifier: "username")
        self.tableView.register(genericCell, forCellReuseIdentifier: "password")
        self.tableView.register(genericCell, forCellReuseIdentifier: "number")
        
        let logOutCell = UINib(nibName: "ProfileLogOutTableViewCell", bundle: nil)
        self.tableView.register(logOutCell, forCellReuseIdentifier: "logOut")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditNameSegue" {
            let popup = segue.destination as! EditNameViewController
            popup.modalPresentationStyle = .overFullScreen
            
            popup.key = currentKey
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        } else if segue.identifier == "toEditPasswordSegue" {
            let popup = segue.destination as! EditPasswordViewController
            popup.modalPresentationStyle = .overFullScreen
            
            popup.key = currentKey
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        } else if segue.identifier == "toEditRankSegue" {
            let popup = segue.destination as! EditRankViewController
            popup.modalPresentationStyle = .overFullScreen
            
            popup.key = currentKey
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let keys = ["name", "rank", "username", "password", "number", "logOut"]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: keys[indexPath.row]) as? ProfileTableViewCell {
            cell.setup()
            return cell
        } else if let genericCell = tableView.dequeueReusableCell(withIdentifier: keys[indexPath.row]) as? ProfileGenericTableViewCell {
            genericCell.setup(key: keys[indexPath.row])
            return genericCell
        } else if let logOutCell = tableView.dequeueReusableCell(withIdentifier: keys[indexPath.row]) as? ProfileLogOutTableViewCell {
            logOutCell.setup()
            return logOutCell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let keys = ["name", "rank", "username", "password", "number"]
            self.currentKey = keys[indexPath.row]
            
            if indexPath.row == 2 {
                // https://medium.com/macoclock/swift-uialert-2e0959c931cd (for fixes to closure)
                let alert = UIAlertController(title: "Not Editable", message: "Username is not editable.", preferredStyle: .alert)
                
                let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert:UIAlertAction!) -> Void in})
                
                alert.addAction(dismiss)
                self.present(alert, animated: true, completion: nil)
            } else if indexPath.row == 0 || indexPath.row == 4 {
                self.performSegue(withIdentifier: "toEditNameSegue", sender: nil)
            } else if indexPath.row == 3 {
                self.performSegue(withIdentifier: "toEditPasswordSegue", sender: nil)
            } else if indexPath.row == 1 {
                self.performSegue(withIdentifier: "toEditRankSegue", sender: nil)
            }
            
        }
        
        if indexPath.row < 5 {
            return UISwipeActionsConfiguration(actions: [edit])
        } else {
            return nil
        }
        
    }

}


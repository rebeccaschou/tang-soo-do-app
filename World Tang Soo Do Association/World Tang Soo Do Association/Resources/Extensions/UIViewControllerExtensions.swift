//
//  UIViewControllerExtensions.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/16/22.
//

import UIKit

// Following code (used to create tap gesture to dismiss keyboard) used StackOverflow to modify code taken from previous personal project  https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

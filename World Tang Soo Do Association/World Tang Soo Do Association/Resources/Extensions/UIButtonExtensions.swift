//
//  UIButtonExtensions.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/9/22.
//

import UIKit

extension UIButton {
    
    func createFloatingActionButton() {
        // Set cardView layer properties for reuable custom cell
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    func createAppButton() {
        // Set cardView layer properties for reuable custom cell
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font =  UIFont(name: Theme.secondaryFontName, size: 15) // Only changes font when the following code is executed: popup.modalPresentationStyle = .overFullScreen
    }
    
}

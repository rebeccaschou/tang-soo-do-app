//
//  UIViewExtensions.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/8/22.
//

import UIKit

extension UIView {

    func addShadowAndRoundedCorners() {
        // Set cardView layer properties for reuable custom cell
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }

}

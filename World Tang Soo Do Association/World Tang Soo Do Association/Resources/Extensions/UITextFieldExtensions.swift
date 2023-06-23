//
//  UITextFieldExtensions.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/16/22.
//

import UIKit

extension UITextField {

// Below function from https://www.youtube.com/watch?v=xm0WK1L2DjI
    func createLineTextField() {
        // Function is unused but could be another potential style for textFields in future iterations (if accompanied by animation)
        
        let bottomLine = CALayer()

        bottomLine.frame = CGRect(x: 0, y: frame.height - 2, width: frame.width, height: 2)
        bottomLine.backgroundColor = Theme.tintColor?.cgColor

        borderStyle = .none

        layer.addSublayer(bottomLine)
    }
    
    func setDefaultState() { // Reset to default textField border color
        layer.borderColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00).cgColor
    }
    
    func setErrorState() {
        layer.borderColor = UIColor.systemRed.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
    
}

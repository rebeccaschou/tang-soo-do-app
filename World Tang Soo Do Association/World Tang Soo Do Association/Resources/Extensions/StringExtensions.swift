//
//  StringExtension.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/24/22.
//

import Foundation

extension String {
    
    // Following two functions (capitalize first letter of a given string) taken from https://www.hackingwithswift.com/example-code/strings/how-to-capitalize-the-first-letter-of-a-string
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

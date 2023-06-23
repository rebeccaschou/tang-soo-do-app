//
//  UserDefaultsExtensions.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 5/14/22.
//

import Foundation
import Combine

// Extension unused (observer did not work)
extension UserDefaults {
    @objc dynamic var showSyllabus: Bool {
        return bool(forKey: "showSyllabus")
    }
}

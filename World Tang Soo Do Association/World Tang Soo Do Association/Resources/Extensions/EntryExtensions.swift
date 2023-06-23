//
//  EntryExtensions.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/23/22.
//

import Foundation
import CoreData

extension Entry: Comparable {

    public static func < (lhs: Entry, rhs: Entry) -> Bool {
        if lhs.date != rhs.date {
            return lhs.date! > rhs.date!
        } else {
            return true
        }
    }

}

//
//  techniqueStruct.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/4/22.
//

import Foundation

struct TechniqueModel {
    
    let title: String
    let rank: Int
    let steps: [String]
    let link: String
    
    init(title: String, rank: Int, steps: [String], link: String) {
        self.title = title
        self.rank = rank
        self.steps = steps
        self.link = link
    }
    
}

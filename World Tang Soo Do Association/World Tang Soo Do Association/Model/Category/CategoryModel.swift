//
//  categoryStruct.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/4/22.
//

import Foundation

struct CategoryModel {
    
    let title: String
    var techniqueModels = [TechniqueModel]()
    
    init(title: String, techniqueModels: [TechniqueModel]) {
        self.title = title
        self.techniqueModels = techniqueModels 
    }
    
}

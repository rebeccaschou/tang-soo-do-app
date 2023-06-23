//
//  CategoryFunctions.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/7/22.
//

import Foundation

class CategoryFunctions {
    
    static func createCategory(syllabusModel: SyllabusModel) {
        
    }
    
    // Following syllabus material taken from Tang Soo Do student handbook
    static func readCategories(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.categoryModels.count == 0 {
                
                // Append all tutorials
                Data.categoryModels.append(
                    CategoryModel(title: "Tutorials", techniqueModels:[
                        
                        TechniqueModel(title: "How to Tie a Belt", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=ozZvUMRocx0")
                        
                    ]))
                
                // Append all forms to data model
                Data.categoryModels.append(
                    CategoryModel(title: "Traditional Forms", techniqueModels:[
                        TechniqueModel(title: "Sae Kye Hyung Il Bu", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=TRmRGgP97LI"),
                        
                        TechniqueModel(title: "Sae Kye Hyung E Bu", rank: 8, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/XOWy2AQLAw8"),
                        
                        TechniqueModel(title: "Sae Kye Hyung Sam Bu", rank: 7, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/dLtIpISul-A"),
                        
                        TechniqueModel(title: "Pyung Ahn Cho Dan", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=yjyFcFIyiXE"),
                        
                        TechniqueModel(title: "Pyung Ahn E Dan", rank: 5, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=a9jDNN0U6Pw"),
                        
                        TechniqueModel(title: "Pyung Ahn Sam Dan", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=GagQYAbps24"),
                        
                        TechniqueModel(title: "Pyung Ahn Sah Dan", rank: 3, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=aEl9A0J6b80"),
                        
                        TechniqueModel(title: "Pyung Ahn Oh Dan", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=lLlWJV8cbUo"),
                        
                        TechniqueModel(title: "Bassai", rank: 1, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=9e7S262Hf3c"),
                        
                        TechniqueModel(title: "Naihanchi Cho Dan", rank: 0, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=PXuPPd_g3k0")
                        
                    ]))
                
                // Append all weapons forms
                Data.categoryModels.append(
                    CategoryModel(title: "Weapons Forms", techniqueModels:[
                        
                        TechniqueModel(title: "Bong Hyung Il Bu", rank: 1, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=UBiJtYsn-LQ"),
                        
                        TechniqueModel(title: "Bong Hyung E Bu", rank: 0, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://www.youtube.com/watch?v=ldf9SDBxJaU")
                        
                    ]))
                
                // Append all hand techniques to data model
                Data.categoryModels.append(
                    CategoryModel(title: "Hand Techniques", techniqueModels: [
                        TechniqueModel(title: "Hand Technique #1", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/ckd4Ty3H0yA?t=110"),
                        
                        TechniqueModel(title: "Hand Technique #2", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/ckd4Ty3H0yA?t=137"),
                        
                        TechniqueModel(title: "Hand Technique #3", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/ckd4Ty3H0yA?t=170"),
                        
                        TechniqueModel(title: "Hand Technique #4", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/ckd4Ty3H0yA?t=196"),
                        
                        TechniqueModel(title: "Hand Technique #5", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/ckd4Ty3H0yA?t=224"),
                        
                        TechniqueModel(title: "Hand Technique #6", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=40"),
                        
                        TechniqueModel(title: "Hand Technique #7", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=46"),
                        
                        TechniqueModel(title: "Hand Technique #8", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=49"),
                        
                        TechniqueModel(title: "Hand Technique #9", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=53"),
                        
                        TechniqueModel(title: "Hand Technique #10", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=57"),
                        
                        TechniqueModel(title: "Hand Technique #11", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=62"),
                        
                        TechniqueModel(title: "Hand Technique #12", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=67"),
                        
                        TechniqueModel(title: "Hand Technique #13", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=71"),
                        
                        TechniqueModel(title: "Hand Technique #14", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=76"),
                        
                        TechniqueModel(title: "Hand Technique #15", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/aj-DtXbi1_E?t=85"),
                        
                        TechniqueModel(title: "Hand Technique #16", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/IesaeY_yxUs?t=8"),
                        
                        TechniqueModel(title: "Hand Technique #17", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/IesaeY_yxUs?t=12"),
                        
                        TechniqueModel(title: "Hand Technique #18", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/IesaeY_yxUs?t=17"),
                        
                        TechniqueModel(title: "Hand Technique #19", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/IesaeY_yxUs?t=25"),
                        
                        TechniqueModel(title: "Hand Technique #20", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/IesaeY_yxUs?t=32")
                    ])
                )
                
                // Append all kick techniques to data model
                Data.categoryModels.append(
                    CategoryModel(title: "Kick Techniques", techniqueModels: [

                        TechniqueModel(title: "Kick Technique #1", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=18"),
                        
                        TechniqueModel(title: "Kick Technique #2", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=22"),
                        
                        TechniqueModel(title: "Kick Technique #3", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=25"),
                        
                        TechniqueModel(title: "Kick Technique #4", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=28"),
                        
                        TechniqueModel(title: "Kick Technique #5", rank: 10, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=32"),
                        
                        TechniqueModel(title: "Kick Technique #6", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=36"),
                        
                        TechniqueModel(title: "Kick Technique #7", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=41"),
                        
                        TechniqueModel(title: "Kick Technique #8", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=44"),
                        
                        TechniqueModel(title: "Kick Technique #9", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=52"),
                        
                        TechniqueModel(title: "Kick Technique #10", rank: 6, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=60"),
                        
                        TechniqueModel(title: "Kick Technique #11", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=69"),
                        
                        TechniqueModel(title: "Kick Technique #12", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=75"),
                        
                        TechniqueModel(title: "Kick Technique #13", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=81"),
                        
                        TechniqueModel(title: "Kick Technique #14", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=90"),
                        
                        TechniqueModel(title: "Kick Technique #15", rank: 4, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/GTvkQFJDuIc?t=96"),
                        
                        TechniqueModel(title: "Kick Technique #16", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/nG8J6aZvCy4?t=22"),
                        
                        TechniqueModel(title: "Kick Technique #17", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/nG8J6aZvCy4?t=26"),
                        
                        TechniqueModel(title: "Kick Technique #18", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/nG8J6aZvCy4?t=33"),
                        
                        TechniqueModel(title: "Kick Technique #19", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/nG8J6aZvCy4?t=40"),
                        
                        TechniqueModel(title: "Kick Technique #20", rank: 2, steps: ["Step 1", "Step 2", "Step 3", "Step 4"], link: "https://youtu.be/nG8J6aZvCy4?t=53")
                    ])
                )
            }
            
            DispatchQueue.main.async {
                completion()
            }
            
        }
    }
}

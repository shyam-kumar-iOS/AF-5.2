//
//  DataModel.swift
//  urlwebview
//
//  Created by Shyam Kumar on 8/30/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import Foundation

struct Model : Codable {
        var completed: Bool?
        var id: Int?
        var title: String?
        var userId: Int?
    
}

class UserModel : Decodable {
    
     var abv = [Model]()
    
}

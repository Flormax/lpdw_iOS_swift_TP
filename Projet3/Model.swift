//
//  Model.swift
//  Projet1
//
//  Created by Maxime Florile on 15/02/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit
import ObjectMapper

class Model: Mappable {
    var content: String?
    
    init(content: String) {
        self.content = content
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        self.content <- map["content"]
    }
}

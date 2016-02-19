//
//  Address.swift
//  Projet1
//
//  Created by Maxime Florile on 15/02/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit
import ObjectMapper

class Address: Mappable {
    var address: String?
    var postcode: String?
    var city: String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        self.address <- map["address"]
        self.postcode <- map["postcode"]
        self.city <- map["city"]
    }
}

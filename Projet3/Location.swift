//
//  Location.swift
//  Projet1
//
//  Created by Maxime Florile on 15/02/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit
import ObjectMapper

class Location: Mappable {
    var lat: Float?
    var lon: Float?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        self.lat <- map["lat"]
        self.lon <- map["lon"]
    }
}

//
//  Fontaine.swift
//  Projet1
//
//  Created by Maxime Florile on 15/02/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit
import ObjectMapper
import MapKit

class Fontaine: NSObject, Mappable, MKAnnotation {
    var coordinate: CLLocationCoordinate2D{
        if let loc = self.loc,
            latitude = loc.lat,
            longitude = loc.lon {
                let coordinate = CLLocationCoordinate2D (
                    latitude: Double(latitude),
                    longitude: Double(longitude)
                )
                return coordinate
        }
        return CLLocationCoordinate2D (latitude: Double(0.0), longitude: Double(0.0))
    }
    
    var _id: Int?
    var loc: Location?
    var postal_address: Address?
    var name: String?
    var title: String?

    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        self._id <- map["_id"]
        self.loc <- map["loc"]
        self.postal_address <- map["postal_address"]
        self.name <- map["name"]
        self.title = self.postal_address?.address
    }
}

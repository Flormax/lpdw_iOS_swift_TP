//
//  ViewController.swift
//  Projet3
//
//  Created by Maxime Florile on 19/02/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var fontaines: [Fontaine]?
    var initialLocation = CLLocation(latitude: 48.831, longitude: 2.355)
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFontaines()
        centerMapOnLocation(initialLocation)
        
        mapView.delegate = self
        
//        switch CLLocationManager.authorizationStatus() {
//        case .NotDetermined:
//            locationManager?.requestWhenInUseAuthorization()
//        case .AuthorizedWhenInUse:
//            startLocate()
//        default:
//            break
//        }
    }
    
    func loadFontaines() {
        var JSONString: String?
        let URL = "http://api.eaupen.net/closest"
        let parameters: [String: AnyObject] = [
            "accept" : "application/json",
            "limit" : 50,
            "range" : 1500,
            "lat" : initialLocation.coordinate.latitude,
            "lon" : initialLocation.coordinate.longitude
        ]
        let request = Alamofire.request(.GET, URL, parameters: parameters)
        print(request.debugDescription)
        request
            .responseArray { (response: Response<[Fontaine], NSError>) in
                if let fontaines = response.result.value {
                    if fontaines.count > 0 {
                        
                        for fontaine in fontaines{
                            self.mapView.addAnnotation(fontaine)
                        }
                    }
                }
        }
    }
}


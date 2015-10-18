//
//  DyckMapViewController.swift
//  DycksSpecial
//
//  Created by Evan Baumgardner on 10/17/15.
//  Copyright © 2015 Evan Baumgardner. All rights reserved.
//

import UIKit
import MapKit

class DyckMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // set initial location in Seattle
        let initialLocation = CLLocation(latitude: 47.6097, longitude: -122.3331)
        centerMapOnLocation(initialLocation)
        
        // If we want more info (more than 2 lines), we have to create our own custom MKAnnotationView. In the meantime, putting a line break in after each store name with the established date for future reference.
        
        let wallingfordDicks = DicksDriveIn(storeName: "Dick's Drive-In: Wallingford\n (Est. 1954)", storeAddress: "111 N.E. 45th St. Seattle, WA,98105", coordinate: CLLocationCoordinate2D(latitude: 47.661117900, longitude: -122.327791100));
        
        let broadwayDicks = DicksDriveIn(storeName: "Dick's Drive-In: Broadway\n (Est. 1955)", storeAddress: "115 Broadway Ave E, Seattle, WA 98102", coordinate: CLLocationCoordinate2D(latitude: 47.624617600, longitude: -122.321006500));
        
        let holmanRoadDicks = DicksDriveIn(storeName: "Dick's Drive-In: Holman Road\n (Est. 1960)", storeAddress: "9208 Holman Rd NW, Seattle, WA 98117", coordinate: CLLocationCoordinate2D(latitude: 47.696401600, longitude: -122.371686900));
        
        let lakeCityDicks = DicksDriveIn(storeName: "Dick's Drive-In: Lake City\n (Est. 1963)", storeAddress: "12325 30th Ave NE, Seattle, WA 98125", coordinate: CLLocationCoordinate2D(latitude: 47.718217700, longitude: -122.296841400));
        
        let queenAnneDicks = DicksDriveIn(storeName: "Dick's Drive-In: Queen Anne\n (Est. 1974)", storeAddress: "500 Queen Anne Ave N, Seattle, WA 98109", coordinate: CLLocationCoordinate2D(latitude: 47.623463400, longitude: -122.356337100));
        
        let edmondsDicks = DicksDriveIn(storeName: "Dick's Drive-In: Edmonds\n (Est. 2011)", storeAddress: "21910 WA-99, Edmonds, WA 98026", coordinate: CLLocationCoordinate2D(latitude: 47.801058800, longitude: -122.331603900));
        
        mapView.addAnnotation(wallingfordDicks)
        mapView.addAnnotation(broadwayDicks)
        mapView.addAnnotation(holmanRoadDicks)
        mapView.addAnnotation(lakeCityDicks)
        mapView.addAnnotation(queenAnneDicks)
        mapView.addAnnotation(edmondsDicks)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    let regionRadius: CLLocationDistance = 14000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - location manager to authorize user location for Maps app
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
            centerMapOnLocation(locationManager.location!)
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //paste that stuff in here then go into storyboard and link up like it was before
    
    
    
}


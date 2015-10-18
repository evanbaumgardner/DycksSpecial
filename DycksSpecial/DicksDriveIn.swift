//
//  DicksDriveIn.swift
//  DycksSpecial
//
//  Created by Evan Baumgardner on 10/17/15.
//  Copyright © 2015 Evan Baumgardner. All rights reserved.
//

import MapKit


class DicksDriveIn: NSObject, MKAnnotation {
    let storeName : String
    let storeAddress : String
    
    
    let coordinate : CLLocationCoordinate2D
    
    init(storeName: String, storeAddress: String, coordinate: CLLocationCoordinate2D) {
        self.storeName = storeName
        self.storeAddress = storeAddress
        self.coordinate = coordinate
        
        super.init()
    }
    
    var title: String? {
        return storeName
    }
    
    var subtitle: String? {
        return storeAddress
    }
    
}
//
//  LocationManager.swift
//  SexManager
//
//  Created by oneplay on 2020/1/10.
//  Copyright © 2020 JackPan. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager : NSObject,CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
     func setLocation(){
        // 1. 還沒有詢問過用戶以獲得權限
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        // 2. 用戶不同意
        else if CLLocationManager.authorizationStatus() == .denied {
         
        }
        // 3. 用戶已經同意
        else if CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
        
        // 2. 配置 locationManager
           locationManager.delegate = self;
           locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
           locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        

    }
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        let latestLocation: CLLocation = locations[locations.count - 1]
        let latitude = String(latestLocation.coordinate.latitude)
        let longitude = String(latestLocation.coordinate.longitude)
        print("======================")

        print("latitude",latitude)
        print("longitude",longitude)

        print("======================")

    }
    
}

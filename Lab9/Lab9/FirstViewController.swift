//
//  FirstViewController.swift
//  Lab9
//
//  Created by Brian Pham on 2020-03-23.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        mapView.delegate = self
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        else {
            startLocationService()
        }
    }
    
    func startLocationService() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.setUserTrackingMode(.follow, animated: true)
        mapView.showsUserLocation = true
    }
    
    func stopLocationService() {
        locationManager.stopUpdatingLocation()
    }
    
    // MARK: - Location Manager Delegates
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            startLocationService()
        }
        else {
            stopLocationService()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
    // MARK: - Map View Delegates
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        print("withError \(error)")
    }
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        print("didFailToLocateUserWithError \(error)")
    }
    
    @IBAction func focusOnCurrentLocation(_ sender: UIButton) {
        mapView.setUserTrackingMode(.follow, animated: true)
    }
}


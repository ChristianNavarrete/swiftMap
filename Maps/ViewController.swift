//
//  ViewController.swift
//  Maps
//
//  Created by HoodsDream on 4/3/15.
//  Copyright (c) 2015 HoodsDream. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //changed this!
        
        //find the users locations using CoreLocation Framework!
        
//        self.locationManager.delegate = self
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.startUpdatingLocation()
        
        var latitude:CLLocationDegrees = 35.6833
        var longitude:CLLocationDegrees = 139.6833
        
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location,span)
        
        map.setRegion(region, animated:true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Tokyo hommie!"
        
        annotation.subtitle = "Someday i'll go here"
        
        map.addAnnotation(annotation)
        
        var longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "action:")
        
        longPressRecognizer.minimumPressDuration = 2
        
        map.addGestureRecognizer(longPressRecognizer)
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation:CLLocation = locations[0] as CLLocation
        
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location,span)
        
        self.map.setRegion(region, animated:true)
        
        
    }
    
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        
        var didAddAnnotation = false
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView:self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Spot"
        
        annotation.subtitle = "Someday i'll go here"
        

        self.map.addAnnotation(annotation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}


//
//  ViewController.swift
//  Maps
//
//  Created by HoodsDream on 4/3/15.
//  Copyright (c) 2015 HoodsDream. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView:self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Spot"
        
        annotation.subtitle = "Someday i'll go here"

        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}


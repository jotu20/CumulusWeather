//
//  InterfaceController.swift
//  Cumulus Watch Extension
//
//  Created by Joseph Szafarowicz on 8/3/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation
import ForecastIO

class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {
    
    let client = DarkSkyClient(apiKey: "90cfdd5277e3269bdd8f31a177508114")

    @IBOutlet weak var currentLocationLabel: WKInterfaceLabel!
    @IBOutlet weak var currentConditionLabel: WKInterfaceLabel!
    @IBOutlet weak var currentConditionIconImage: WKInterfaceImage!
    
    @IBOutlet weak var currentTemperatureLabel: WKInterfaceLabel!
    @IBOutlet weak var precipitationLabel: WKInterfaceLabel!
    @IBOutlet weak var accumulationLabel: WKInterfaceLabel!
    @IBOutlet weak var humidityLabel: WKInterfaceLabel!
    @IBOutlet weak var uvIndexLabel: WKInterfaceLabel!
    @IBOutlet weak var windLabel: WKInterfaceLabel!
    @IBOutlet weak var cloudCoverLabel: WKInterfaceLabel!
    
    @IBOutlet weak var day0ConditionImage: WKInterfaceImage!
    @IBOutlet weak var day0Label: WKInterfaceLabel!
    @IBOutlet weak var day0High: WKInterfaceLabel!
    @IBOutlet weak var day0Low: WKInterfaceLabel!
    
    @IBOutlet weak var day1ConditionImage: WKInterfaceImage!
    @IBOutlet weak var day1Label: WKInterfaceLabel!
    @IBOutlet weak var day1High: WKInterfaceLabel!
    @IBOutlet weak var day1Low: WKInterfaceLabel!
    
    @IBOutlet weak var day2ConditionImage: WKInterfaceImage!
    @IBOutlet weak var day2Label: WKInterfaceLabel!
    @IBOutlet weak var day2High: WKInterfaceLabel!
    @IBOutlet weak var day2Low: WKInterfaceLabel!
    
    @IBOutlet weak var day3ConditionImage: WKInterfaceImage!
    @IBOutlet weak var day3Label: WKInterfaceLabel!
    @IBOutlet weak var day3High: WKInterfaceLabel!
    @IBOutlet weak var day3Low: WKInterfaceLabel!
    
    func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ())  {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {
                completion(nil, error)
                return
            }
            completion(placemark, nil)
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let locationManager = CLLocationManager()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.distanceFilter = 100
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        let userLocation = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        
        geocode(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!) { placemark, error in
            guard let placemark = placemark, error == nil else { return }

            // Set state for locations in the US
            if placemark.country! == "United States" {
                self.currentLocationLabel.setText("\(placemark.locality!), \(placemark.administrativeArea!)")
            } else {
                 self.currentLocationLabel.setText("\(placemark.locality!), \(placemark.country!)")
            }
        }
        
        client.getForecast(location: userLocation) { result in
            switch result {
            case .success(let tuple):
                let (currentForecast, _) = tuple
                
                if let current = currentForecast.currently {
                    print(current)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

//
//  ForecastIntentHandler.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 10/5/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import CoreLocation
import ForecastIO

class ForecastIntentHandler: NSObject, ForecastIntentHandling, CLLocationManagerDelegate {
    
    func handle(intent: ForecastIntent, completion: @escaping (ForecastIntentResponse) -> Void) {
        let locationManager = CLLocationManager()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        let userLocation = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        client.getForecast(location: userLocation) { result in
            switch result {
            case .success(let tuple):
                let (currentForecast, _) = tuple
                TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!

                if let current = currentForecast.currently {
                    // Hour Zero
                    currentTemperature = Int(current.temperature!)
                    currentSummary = "\(current.summary!)"
                    precipHour0 = precipitation
                }
                
                // Get weather data for the day
                if let daily = currentForecast.daily {
                    let dayZeroArray = daily.data[0]
                    let fetchDayZeroArray = dayZeroArray
                    
                    // High and Low
                    day0High = Int(fetchDayZeroArray.temperatureHigh!)
                    day0Low = Int(fetchDayZeroArray.temperatureLow!)
                    
                    // Check if statements are equal
                    if currentSummary == hourSummary {
                        if currentSummary.contains("for the hour") {
                            currentSummary = "\(hourSummary)"
                        } else {
                            currentSummary = "\(hourSummary) for the hour."
                        }
                    }
                }
                completion(ForecastIntentResponse.success(weatherSummary: "It is currently \(currentTemperature)°, \(precipHour0)% chance of precipitation, and \(currentSummary.lowercased()). Today's high is \(day0High)° and the low is \(day0Low)°."))
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

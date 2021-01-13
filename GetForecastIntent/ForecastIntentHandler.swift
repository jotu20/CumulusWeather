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
        universalSettings()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        if universalDataSource == "Dark Sky" {
            fetchDarkSkyWeatherData()
        } else if universalDataSource == "OpenWeather" {
            fetchOpenWeatherData()
        }
        
        // Check if statements are equal
        if currentSummary == hourSummary {
            if currentSummary.contains("for the hour") {
                currentSummary = "\(hourSummary)"
            } else {
                currentSummary = "\(hourSummary) for the hour."
            }
        }
        
        completion(ForecastIntentResponse.success(weatherSummary: "It is currently \(currentTemperature)°, \(precipHour0)% chance of precipitation, and \(currentSummary.lowercased()). Today's high is \(day0High)° and the low is \(day0Low)°."))
    }
}

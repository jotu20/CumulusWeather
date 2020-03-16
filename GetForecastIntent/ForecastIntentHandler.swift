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
import AerisWeatherKit

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
            case .success(let currentForecast, _):
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
                    dayZeroHigh = Int(fetchDayZeroArray.temperatureHigh!)
                    dayZeroLow = Int(fetchDayZeroArray.temperatureLow!)
                    
                    // Check if statements are equal
                    if currentSummary == hourSummary {
                        if currentSummary.contains("for the hour") {
                            currentSummary = "\(hourSummary)"
                        } else {
                            currentSummary = "\(hourSummary) for the hour."
                        }
                    }
                }
                completion(ForecastIntentResponse.success(weatherSummary: "It is currently \(currentTemperature)°, \(precipHour0)% chance of precipitation, and \(currentSummary.lowercased()). Today's high is \(dayZeroHigh)° and the low is \(dayZeroLow)°."))
                
            case .failure(let error):
                print(error)
            }
        }
        
        if universalDataSource == "Aeris Weather" {
            universalSettings()
            
            geocode(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!) { placemark, error in
                guard let placemark = placemark, error == nil else { return }
                
                let place = AWFPlace(city: "\(placemark.locality!.lowercased())", state: "\(placemark.administrativeArea!.lowercased())", country: "\(placemark.country!.lowercased())")
                
                // Get current forecast observations
                AWFObservations.sharedService().get(forPlace: place, options: nil) { (result) in
                    guard let results = result?.results else { print("Data failed to load - \(String(describing: result?.error))"); return }
                    guard let obs = results.first as? AWFObservation else { return }
                    
                    if universalUnits == "USA" {
                        unitsTemperature = "F"
                        unitsDistance = "miles"
                        unitsWindSpeed = "mph"
                        unitsPressure = "mB"
                        unitsPrecipitation = "in"
                        
                        currentTemperature = Int(obs.tempF)
                    }
                    
                    if universalUnits == "UK" {
                        unitsTemperature = "C"
                        unitsDistance = "miles"
                        unitsWindSpeed = "mph"
                        unitsPressure = "hPa"
                        unitsPrecipitation = "mm"
                        
                        currentTemperature = Int(obs.tempC)
                    }
                    
                    if universalUnits == "Canada" {
                        unitsTemperature = "C"
                        unitsDistance = "kilometers"
                        unitsWindSpeed = "km/h"
                        unitsPressure = "hPa"
                        unitsPrecipitation = "mm"
                        
                        currentTemperature = Int(obs.tempC)
                    }
                    
                    if universalUnits == "International" {
                        unitsTemperature = "C"
                        unitsDistance = "kilometers"
                        unitsWindSpeed = "m/s"
                        unitsPressure = "hPa"
                        unitsPrecipitation = "mm"
                        
                        currentTemperature = Int(obs.tempC)
                    }
                    currentSummary = "\(obs.weather!.lowercased())"
                }
                
                // MARK : Get 7-day forecast
                let options = AWFWeatherRequestOptions()
                options.limit = 2
                
                AWFForecasts.sharedService().get(forPlace: place, options: options) { (result) in
                    guard let results = result?.results else { print("Data failed to load - \(String(describing: result?.error))"); return }
                    guard let forecast = results.first as? AWFForecast else { return }
                    
                    let dayZeroArray = forecast.periods?[0]
                    let fetchDayZeroArray = dayZeroArray
                    dayZeroHigh = Int(fetchDayZeroArray!.maxTempF)
                    dayZeroLow = Int(fetchDayZeroArray!.minTempF)
                }
            }
            completion(ForecastIntentResponse.success(weatherSummary: "It is currently \(currentTemperature)°, \(precipHour0)% chance of precipitation, and \(currentSummary.lowercased()). Today's high is \(dayZeroHigh)° and the low is \(dayZeroLow)°."))
        }
    }
}

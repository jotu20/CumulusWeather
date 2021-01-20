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
            if universalUnits == "USA" {
                client.units = .us
                client.language = .english
                unitsTemperature = "F"
                unitsDistance = "miles"
                unitsWindSpeed = "mph"
                unitsPressure = "mB"
                unitsPrecipitation = "in"
            }
            
            if universalUnits == "UK" {
                client.units = .uk
                client.language = .english
                unitsTemperature = "C"
                unitsDistance = "miles"
                unitsWindSpeed = "mph"
                unitsPressure = "hPa"
                unitsPrecipitation = "mm"
            }
            
            if universalUnits == "Canada" {
                client.units = .ca
                client.language = .english
                unitsTemperature = "C"
                unitsDistance = "kilometers"
                unitsWindSpeed = "km/h"
                unitsPressure = "hPa"
                unitsPrecipitation = "mm"
            }
            
            if universalUnits == "International" {
                client.units = .si
                client.language = .english
                unitsTemperature = "C"
                unitsDistance = "kilometers"
                unitsWindSpeed = "m/s"
                unitsPressure = "hPa"
                unitsPrecipitation = "mm"
            }
            
            let userLocation = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
            client.getForecast(location: userLocation) { result in
                switch result {
                case .success(let tuple):
                    let (currentForecast, _) = tuple
                    TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!
                    
                    if let current = currentForecast.currently {
                        currentTemperature = Int(current.temperature!)
                        highTemperature = Int(current.temperatureHigh!)
                        lowTemperature = Int(current.temperatureLow!)
                        currentSummary = "\(current.summary!)"
                        precipitation = dailyPrecipProb(day: current)
                    }
                    
                    completion(ForecastIntentResponse.success(weatherSummary: "It is currently \(currentTemperature)°, \(precipitation)% chance of precipitation, and \(currentSummary.lowercased()). Today's high is \(highTemperature)° and the low is \(lowTemperature)°."))
                    
                case .failure(let error):
                    print(error)
                }
            }
        } else if universalDataSource == "OpenWeather" {
            universalSettings()
            
            if universalUnits == "USA" {
                openWeatherUnits = "imperial"
                unitsTemperature = "F"
                unitsDistance = "miles"
                unitsWindSpeed = "mph"
                unitsPressure = "hPa"
                unitsPrecipitation = "mm"
            }
            
            if universalUnits == "UK" || universalUnits == "Canada" || universalUnits == "Intertnational" {
                openWeatherUnits = "metric"
                unitsTemperature = "C"
                unitsDistance = "meters"
                unitsWindSpeed = "m/s"
                unitsPressure = "hPa"
                unitsPrecipitation = "mm"
            }
            
            fetchOpenWeatherDataAlerts()
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\((locationManager.location?.coordinate.latitude)!)&lon=\((locationManager.location?.coordinate.longitude)!)&units=\(openWeatherUnits)&exclude=minutely,alerts&appid=8426f2e9a7736dbbb6db33e8bc36c0ed") else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) {data, response, error in
                if let data = data {
                  do {
                    let decodedResponse = try JSONDecoder().decode(OpenWeather.self, from: data)

                    currentTemperature = Int(decodedResponse.current.temp)
                    highTemperature = Int(decodedResponse.daily[0].temp.max)
                    lowTemperature = Int(decodedResponse.daily[0].temp.min)
                    currentSummary = decodedResponse.current.currentWeather[0].weatherDescription
                    precipitation = Int(decodedResponse.hourly[0].pop * 100)
                    
                    completion(ForecastIntentResponse.success(weatherSummary: "It is currently \(currentTemperature)°, \(precipitation)% chance of precipitation, and \(currentSummary.lowercased()). Today's high is \(highTemperature)° and the low is \(lowTemperature)°."))
    
                  } catch {
                    debugPrint(error)
                    print(error.localizedDescription)
                  }
                  return
                }
            }.resume()
        }
    }
}

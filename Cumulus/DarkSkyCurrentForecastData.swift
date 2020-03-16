//
//  DarkSkyHourlyData.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 6/29/19.
//  Copyright © 2019 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import CoreLocation
import ForecastIO

// MARK: - Fetches hourly weather data
public func fetchDarkSkyCurrentForecastData() {
    universalSettings()
    let userLocation = CLLocationCoordinate2D(latitude: latitudeValue, longitude: longitudeValue)
    
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
        
    if universalDataSource == "Aeris Weather" {
        client.getForecast(location: userLocation) { result in
            switch result {
            case .success(let currentForecast, _):
                TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!
                
                if let current = currentForecast.currently {
                    wind = Int(current.windSpeed!)
                    windGust = Int(current.windGust!)
                    windDirectionDegree = current.windBearing!
                    windDirectionString = windDirection(degree: windDirectionDegree)
                    windSpeedHour0 = wind
                }
            case .failure(let error):
                print(error)
            }
        }
    } else {
        client.getForecast(location: userLocation) { result in
            switch result {
            case .success(let currentForecast, _):
                TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!
                
                if let current = currentForecast.currently {
                    currentCondition = "\(current.icon!.rawValue)"
                    currentTemperature = Int(current.temperature!)
                    apparentTemperature = Int(current.apparentTemperature!)
                    currentSummary = "\(current.summary!)"
                    precipitation = dailyPrecipProb(day: current)
                    humidity = dailyHumidityProb(day: current)
                    cloudCover = dailyCloudCoverProb(day: current)
                    uvIndex = Int(current.uvIndex!)
                    visibility = Int(current.visibility!)
                    pressure = Int(current.pressure!)
                    wind = Int(current.windSpeed!)
                    windGust = Int(current.windGust!)
                    windDirectionDegree = current.windBearing!
                    windDirectionString = windDirection(degree: windDirectionDegree)
                    
                    if current.precipitationAccumulation != nil {
                        precipAccumulation = Double(current.precipitationAccumulation!)
                    }
                    
                    if current.precipitationType != nil {
                        precipitationType = "\(current.precipitationType!)"
                    } else {
                        precipitationType = "none"
                    }
                    
                    precipHour0 = precipitation
                    tempHour0 = currentTemperature
                    humidityHour0 = humidity
                    uvindexHour0 = uvIndex
                    windSpeedHour0 = wind
                    cloudCoverHour0 = cloudCover
                }            case .failure(let error):
                print(error)
            }
        }
    }
}

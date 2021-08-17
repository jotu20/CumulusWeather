//
//  WeatherData.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 6/23/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import CoreLocation
import ForecastIO

let client = DarkSkyClient(apiKey: "90cfdd5277e3269bdd8f31a177508114")

public func fetchDarkSkyWeatherData() {
    universalSettings()
    let userLocation = CLLocationCoordinate2D(latitude: latitudeValue, longitude: longitudeValue)
    let dayOneDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    let dayTwoDate = Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date()
    let dayThreeDate = Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date()
    let dayFourDate = Calendar.current.date(byAdding: .day, value: 4, to: Date()) ?? Date()
    let dayFiveDate = Calendar.current.date(byAdding: .day, value: 5, to: Date()) ?? Date()
    let daySixDate = Calendar.current.date(byAdding: .day, value: 6, to: Date()) ?? Date()
    let daySevenDate = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
    let dayEightDate = Calendar.current.date(byAdding: .day, value: 8, to: Date()) ?? Date()
    let dayNineDate = Calendar.current.date(byAdding: .day, value: 9, to: Date()) ?? Date()
    
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
    
    client.getForecast(location: userLocation) { result in
        switch result {
        case .success(let tuple):
            let (currentForecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!
            
            if let current = currentForecast.currently {
                currentCondition = "\(current.icon!.rawValue)"
                HourlyCondition.sharedInstance.hour0 = current.icon!.rawValue
                
                currentTemperature = Int(current.temperature!)
                feelsLikeTemperature = Int(current.apparentTemperature!)
                currentSummary = "\(current.summary!)"
                precipitation = dailyPrecipProb(day: current)
                humidity = dailyHumidityProb(day: current)
                cloudCover = dailyCloudCoverProb(day: current)
                uvIndex = Int(current.uvIndex!)
                visibility = Int(current.visibility!)
                pressure = Int(current.pressure!)
                wind = Int(current.windSpeed!)
                windGust = Int(current.windGust!)
                windBearing = windDirection(degree: current.windBearing!)
                
                if current.precipitationAccumulation != nil {
                    precipAccumulation = Double(current.precipitationAccumulation!)
                }
                
                if current.precipitationType != nil {
                    precipitationType = "\(current.precipitationType!)"
                } else {
                    precipitationType = "none"
                }
                
                HourlyPrecipitation.sharedInstance.hour0 = precipitation
                HourlyTemperature.sharedInstance.hour0 = currentTemperature
                HourlyHumidity.sharedInstance.hour0 = humidity
                HourlyUVIndex.sharedInstance.hour0 = uvIndex
                HourlyWindSpeed.sharedInstance.hour0 = wind
                HourlyCloudCover.sharedInstance.hour0 = cloudCover
            }
            
            if let daily = currentForecast.daily {
                let fetchDayArray = daily.data[0]
                
                highTemperature = Int(fetchDayArray.temperatureHigh ?? 0)
                lowTemperature = Int(fetchDayArray.temperatureLow ?? 0)
                sunrise = sunFormat(date: fetchDayArray.sunriseTime!)
                sunset = sunFormat(date: fetchDayArray.sunsetTime!)
                
                Day0.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
                Day0.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
                Day0.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
                
                Day0.sharedInstance.condition = fetchDayArray.icon!.rawValue
                Day0.sharedInstance.summary = fetchDayArray.summary
                
                Day0.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
                Day0.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
                Day0.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
                Day0.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
                Day0.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
                
                Day0.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
                Day0.sharedInstance.windGust = fetchDayArray.windGust ?? 0
                Day0.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
                Day0.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
                Day0.sharedInstance.pressure = fetchDayArray.pressure ?? 0
                Day0.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
                Day0.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
                
                Day0.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
                Day0.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
            }
            
            if let hourly = currentForecast.hourly {
                HourlyCloudCover.sharedInstance.hour1 = hourCloudCover(value: 1, hour: hourly)
                HourlyCloudCover.sharedInstance.hour2 = hourCloudCover(value: 2, hour: hourly)
                HourlyCloudCover.sharedInstance.hour3 = hourCloudCover(value: 3, hour: hourly)
                HourlyCloudCover.sharedInstance.hour4 = hourCloudCover(value: 4, hour: hourly)

                let fetchHourly0 = hourly.data[0]
                let precipArray0 = fetchHourly0
                
                hourSummary = "\(precipArray0.summary!)"
                
                if precipArray0.precipitationIntensity != nil {
                    precipIntensity = Double(precipArray0.precipitationIntensity!).rounded(toPlaces: 2)
                } else {
                    precipIntensity = 0
                }
                
                let fetchHourly1 = hourly.data[1]
                let precipArray1 = fetchHourly1
                nextHourCondition = "\(precipArray1.icon!.rawValue)"
                
                Hour.sharedInstance.hour0 = hourTime(value: 0, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour0 = hourPrecipProb(value: 0, hour: hourly)
                HourlyAccumulation.sharedInstance.hour0 = hourAccumProb(value: 0, hour: hourly)
                HourlyTemperature.sharedInstance.hour0 = hourTemp(value: 0, hour: hourly)
                HourlyHumidity.sharedInstance.hour0 = hourHumidity(value: 0, hour: hourly)
                HourlyUVIndex.sharedInstance.hour0 = hourUVIndex(value: 0, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour0 = hourWindSpeed(value: 0, hour: hourly)
                HourlyCloudCover.sharedInstance.hour0 = hourCloudCover(value: 0, hour: hourly)
                
                Hour.sharedInstance.hour1 = hourTime(value: 1, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour1 = hourPrecipProb(value: 1, hour: hourly)
                HourlyAccumulation.sharedInstance.hour1 = hourAccumProb(value: 1, hour: hourly)
                HourlyTemperature.sharedInstance.hour1 = hourTemp(value: 1, hour: hourly)
                HourlyHumidity.sharedInstance.hour1 = hourHumidity(value: 1, hour: hourly)
                HourlyUVIndex.sharedInstance.hour1 = hourUVIndex(value: 1, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour1 = hourWindSpeed(value: 1, hour: hourly)
                HourlyCloudCover.sharedInstance.hour1 = hourCloudCover(value: 1, hour: hourly)
                
                Hour.sharedInstance.hour2 = hourTime(value: 2, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour2 = hourPrecipProb(value: 2, hour: hourly)
                HourlyAccumulation.sharedInstance.hour2 = hourAccumProb(value: 2, hour: hourly)
                HourlyTemperature.sharedInstance.hour2 = hourTemp(value: 2, hour: hourly)
                HourlyHumidity.sharedInstance.hour2 = hourHumidity(value: 2, hour: hourly)
                HourlyUVIndex.sharedInstance.hour2 = hourUVIndex(value: 2, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour2 = hourWindSpeed(value: 2, hour: hourly)
                HourlyCloudCover.sharedInstance.hour2 = hourCloudCover(value: 2, hour: hourly)
                
                Hour.sharedInstance.hour3 = hourTime(value: 3, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour3 = hourPrecipProb(value: 3, hour: hourly)
                HourlyAccumulation.sharedInstance.hour3 = hourAccumProb(value: 3, hour: hourly)
                HourlyTemperature.sharedInstance.hour3 = hourTemp(value: 3, hour: hourly)
                HourlyHumidity.sharedInstance.hour3 = hourHumidity(value: 3, hour: hourly)
                HourlyUVIndex.sharedInstance.hour3 = hourUVIndex(value: 3, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour3 = hourWindSpeed(value: 3, hour: hourly)
                HourlyCloudCover.sharedInstance.hour3 = hourCloudCover(value: 3, hour: hourly)
                
                Hour.sharedInstance.hour4 = hourTime(value: 4, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour4 = hourPrecipProb(value: 4, hour: hourly)
                HourlyAccumulation.sharedInstance.hour4 = hourAccumProb(value: 4, hour: hourly)
                HourlyTemperature.sharedInstance.hour4 = hourTemp(value: 4, hour: hourly)
                HourlyHumidity.sharedInstance.hour4 = hourHumidity(value: 4, hour: hourly)
                HourlyUVIndex.sharedInstance.hour4 = hourUVIndex(value: 4, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour4 = hourWindSpeed(value: 4, hour: hourly)
                HourlyCloudCover.sharedInstance.hour4 = hourCloudCover(value: 4, hour: hourly)
                
                Hour.sharedInstance.hour5 = hourTime(value: 5, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour5 = hourPrecipProb(value: 5, hour: hourly)
                HourlyAccumulation.sharedInstance.hour5 = hourAccumProb(value: 5, hour: hourly)
                HourlyTemperature.sharedInstance.hour5 = hourTemp(value: 5, hour: hourly)
                HourlyHumidity.sharedInstance.hour5 = hourHumidity(value: 5, hour: hourly)
                HourlyUVIndex.sharedInstance.hour5 = hourUVIndex(value: 5, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour5 = hourWindSpeed(value: 5, hour: hourly)
                HourlyCloudCover.sharedInstance.hour5 = hourCloudCover(value: 5, hour: hourly)
                
                Hour.sharedInstance.hour6 = hourTime(value: 6, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour6 = hourPrecipProb(value: 6, hour: hourly)
                HourlyAccumulation.sharedInstance.hour6 = hourAccumProb(value: 6, hour: hourly)
                HourlyTemperature.sharedInstance.hour6 = hourTemp(value: 6, hour: hourly)
                HourlyHumidity.sharedInstance.hour6 = hourHumidity(value: 6, hour: hourly)
                HourlyUVIndex.sharedInstance.hour6 = hourUVIndex(value: 6, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour6 = hourWindSpeed(value: 6, hour: hourly)
                HourlyCloudCover.sharedInstance.hour6 = hourCloudCover(value: 6, hour: hourly)
                
                Hour.sharedInstance.hour7 = hourTime(value: 7, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour7 = hourPrecipProb(value: 7, hour: hourly)
                HourlyAccumulation.sharedInstance.hour7 = hourAccumProb(value: 7, hour: hourly)
                HourlyTemperature.sharedInstance.hour7 = hourTemp(value: 7, hour: hourly)
                HourlyHumidity.sharedInstance.hour7 = hourHumidity(value: 7, hour: hourly)
                HourlyUVIndex.sharedInstance.hour7 = hourUVIndex(value: 7, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour7 = hourWindSpeed(value: 7, hour: hourly)
                HourlyCloudCover.sharedInstance.hour7 = hourCloudCover(value: 7, hour: hourly)
                
                Hour.sharedInstance.hour8 = hourTime(value: 8, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour8 = hourPrecipProb(value: 8, hour: hourly)
                HourlyAccumulation.sharedInstance.hour8 = hourAccumProb(value: 8, hour: hourly)
                HourlyTemperature.sharedInstance.hour8 = hourTemp(value: 8, hour: hourly)
                HourlyHumidity.sharedInstance.hour8 = hourHumidity(value: 8, hour: hourly)
                HourlyUVIndex.sharedInstance.hour8 = hourUVIndex(value: 8, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour8 = hourWindSpeed(value: 8, hour: hourly)
                HourlyCloudCover.sharedInstance.hour8 = hourCloudCover(value: 8, hour: hourly)
                
                Hour.sharedInstance.hour9 = hourTime(value: 9, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour9 = hourPrecipProb(value: 9, hour: hourly)
                HourlyAccumulation.sharedInstance.hour9 = hourAccumProb(value: 9, hour: hourly)
                HourlyTemperature.sharedInstance.hour9 = hourTemp(value: 9, hour: hourly)
                HourlyHumidity.sharedInstance.hour9 = hourHumidity(value: 9, hour: hourly)
                HourlyUVIndex.sharedInstance.hour9 = hourUVIndex(value: 9, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour9 = hourWindSpeed(value: 9, hour: hourly)
                HourlyCloudCover.sharedInstance.hour9 = hourCloudCover(value: 9, hour: hourly)
                
                Hour.sharedInstance.hour10 = hourTime(value: 10, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour10 = hourPrecipProb(value: 10, hour: hourly)
                HourlyAccumulation.sharedInstance.hour10 = hourAccumProb(value: 10, hour: hourly)
                HourlyTemperature.sharedInstance.hour10 = hourTemp(value: 10, hour: hourly)
                HourlyHumidity.sharedInstance.hour10 = hourHumidity(value: 10, hour: hourly)
                HourlyUVIndex.sharedInstance.hour10 = hourUVIndex(value: 10, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour10 = hourWindSpeed(value: 10, hour: hourly)
                HourlyCloudCover.sharedInstance.hour10 = hourCloudCover(value: 10, hour: hourly)
                
                Hour.sharedInstance.hour11 = hourTime(value: 11, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour11 = hourPrecipProb(value: 11, hour: hourly)
                HourlyAccumulation.sharedInstance.hour11 = hourAccumProb(value: 11, hour: hourly)
                HourlyTemperature.sharedInstance.hour11 = hourTemp(value: 11, hour: hourly)
                HourlyHumidity.sharedInstance.hour11 = hourHumidity(value: 11, hour: hourly)
                HourlyUVIndex.sharedInstance.hour11 = hourUVIndex(value: 11, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour11 = hourWindSpeed(value: 11, hour: hourly)
                HourlyCloudCover.sharedInstance.hour11 = hourCloudCover(value: 11, hour: hourly)
                
                Hour.sharedInstance.hour12 = hourTime(value: 12, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour12 = hourPrecipProb(value: 12, hour: hourly)
                HourlyAccumulation.sharedInstance.hour12 = hourAccumProb(value: 12, hour: hourly)
                HourlyTemperature.sharedInstance.hour12 = hourTemp(value: 12, hour: hourly)
                HourlyHumidity.sharedInstance.hour12 = hourHumidity(value: 12, hour: hourly)
                HourlyUVIndex.sharedInstance.hour12 = hourUVIndex(value: 12, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour12 = hourWindSpeed(value: 12, hour: hourly)
                HourlyCloudCover.sharedInstance.hour12 = hourCloudCover(value: 12, hour: hourly)
                
                Hour.sharedInstance.hour13 = hourTime(value: 13, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour13 = hourPrecipProb(value: 13, hour: hourly)
                HourlyAccumulation.sharedInstance.hour13 = hourAccumProb(value: 13, hour: hourly)
                HourlyTemperature.sharedInstance.hour13 = hourTemp(value: 13, hour: hourly)
                HourlyHumidity.sharedInstance.hour13 = hourHumidity(value: 13, hour: hourly)
                HourlyUVIndex.sharedInstance.hour13 = hourUVIndex(value: 13, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour13 = hourWindSpeed(value: 13, hour: hourly)
                HourlyCloudCover.sharedInstance.hour13 = hourCloudCover(value: 13, hour: hourly)
                
                Hour.sharedInstance.hour14 = hourTime(value: 14, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour14 = hourPrecipProb(value: 14, hour: hourly)
                HourlyAccumulation.sharedInstance.hour14 = hourAccumProb(value: 14, hour: hourly)
                HourlyTemperature.sharedInstance.hour14 = hourTemp(value: 14, hour: hourly)
                HourlyHumidity.sharedInstance.hour14 = hourHumidity(value: 14, hour: hourly)
                HourlyUVIndex.sharedInstance.hour14 = hourUVIndex(value: 14, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour14 = hourWindSpeed(value: 14, hour: hourly)
                HourlyCloudCover.sharedInstance.hour14 = hourCloudCover(value: 14, hour: hourly)
                
                Hour.sharedInstance.hour15 = hourTime(value: 15, hour: hourly)
                HourlyPrecipitation.sharedInstance.hour15 = hourPrecipProb(value: 15, hour: hourly)
                HourlyAccumulation.sharedInstance.hour15 = hourAccumProb(value: 15, hour: hourly)
                HourlyTemperature.sharedInstance.hour15 = hourTemp(value: 15, hour: hourly)
                HourlyHumidity.sharedInstance.hour15 = hourHumidity(value: 15, hour: hourly)
                HourlyUVIndex.sharedInstance.hour15 = hourUVIndex(value: 15, hour: hourly)
                HourlyWindSpeed.sharedInstance.hour15 = hourWindSpeed(value: 15, hour: hourly)
                HourlyCloudCover.sharedInstance.hour15 = hourCloudCover(value: 15, hour: hourly)
            }
            
            if let alerts = currentForecast.alerts {
                let alertArray = alerts[0]
                let fetchAlertArray = alertArray
                
                alertCount = alerts.count
                alertTitle = "\(fetchAlertArray.title)"
                alertDescription = "\(fetchAlertArray.description)"
                alertURI = "\(fetchAlertArray.uri)"
            }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: Day 1
    client.getForecast(location: userLocation, time: dayOneDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day1.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day1.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day1.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day1.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day1.sharedInstance.summary = fetchDayArray.summary
            
            Day1.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day1.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day1.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day1.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day1.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day1.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day1.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day1.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day1.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day1.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day1.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day1.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day1.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day1.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: Day 2
    client.getForecast(location: userLocation, time: dayTwoDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day2.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day2.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day2.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day2.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day2.sharedInstance.summary = fetchDayArray.summary
            
            Day2.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day2.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day2.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day2.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day2.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day2.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day2.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day2.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day2.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day2.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day2.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day2.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day2.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day2.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Day 3
    client.getForecast(location: userLocation, time: dayThreeDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day3.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day3.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day3.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day3.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day3.sharedInstance.summary = fetchDayArray.summary
            
            Day3.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day3.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day3.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day3.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day3.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day3.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day3.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day3.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day3.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day3.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day3.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day3.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day3.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day3.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Day 4
    client.getForecast(location: userLocation, time: dayFourDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day4.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day4.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day4.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day4.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day4.sharedInstance.summary = fetchDayArray.summary
            
            Day4.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day4.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day4.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day4.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day4.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day4.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day4.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day4.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day4.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day4.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day4.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day4.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day4.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day4.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Day 5
    client.getForecast(location: userLocation, time: dayFiveDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day5.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day5.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day5.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day5.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day5.sharedInstance.summary = fetchDayArray.summary
            
            Day5.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day5.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day5.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day5.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day5.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day5.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day5.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day5.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day5.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day5.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day5.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day5.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day5.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day5.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Day 6
    client.getForecast(location: userLocation, time: daySixDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day6.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day6.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day6.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day6.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day6.sharedInstance.summary = fetchDayArray.summary
            
            Day6.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day6.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day6.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day6.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day6.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day6.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day6.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day6.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day6.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day6.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day6.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day6.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day6.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day6.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Day 7
    client.getForecast(location: userLocation, time: daySevenDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day7.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day7.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day7.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day7.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day7.sharedInstance.summary = fetchDayArray.summary
            
            Day7.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day7.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day7.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day7.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day7.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day7.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day7.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day7.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day7.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day7.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day7.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day7.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day7.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day7.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Day 8
    client.getForecast(location: userLocation, time: dayEightDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!

        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day8.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day8.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day8.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day8.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day8.sharedInstance.summary = fetchDayArray.summary
            
            Day8.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day8.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day8.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day8.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day8.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day8.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day8.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day8.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day8.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day8.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day8.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day8.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day8.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day8.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }        case .failure(let error):
            print(error)
        }
    }
            
    // MARK: - Day 9
    client.getForecast(location: userLocation, time: dayNineDate) { result in
    switch result {
    case .success(let tuple):
        let (forecast, _) = tuple
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!

        if let daily = forecast.daily {
            let fetchDayArray = daily.data[0]
            
            Day9.sharedInstance.dateString = dateFormat(date: fetchDayArray.time)
            Day9.sharedInstance.dayString = dayFormat(date: fetchDayArray.time, fullLength: false)
            Day9.sharedInstance.dayStringFull = dayFormat(date: fetchDayArray.time, fullLength: true)
            
            Day9.sharedInstance.condition = fetchDayArray.icon!.rawValue
            Day9.sharedInstance.summary = fetchDayArray.summary
            
            Day9.sharedInstance.high = Int(fetchDayArray.temperatureHigh ?? 0)
            Day9.sharedInstance.low = Int(fetchDayArray.temperatureLow ?? 0)
            Day9.sharedInstance.precip = dailyPrecipProb(day: fetchDayArray)
            Day9.sharedInstance.precipAccum = dailyPrecipAccum(day: fetchDayArray)
            Day9.sharedInstance.humidity = dailyHumidityProb(day: fetchDayArray)
            
            Day9.sharedInstance.wind = fetchDayArray.windSpeed ?? 0
            Day9.sharedInstance.windGust = fetchDayArray.windGust ?? 0
            Day9.sharedInstance.windBearing = windDirection(degree: fetchDayArray.windBearing!)
            Day9.sharedInstance.dewPoint = Int(fetchDayArray.dewPoint ?? 0)
            Day9.sharedInstance.pressure = fetchDayArray.pressure ?? 0
            Day9.sharedInstance.visibility = Int(fetchDayArray.visibility ?? 0)
            Day9.sharedInstance.uvIndex = Int(fetchDayArray.uvIndex ?? 0)
            
            Day9.sharedInstance.sunrise = sunFormat(date: fetchDayArray.sunsetTime!)
            Day9.sharedInstance.sunset = sunFormat(date: fetchDayArray.sunsetTime!)
        }
        case .failure(let error):
            print(error)
        }
    }
}

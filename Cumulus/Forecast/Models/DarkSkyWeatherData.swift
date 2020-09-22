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

// MARK: - Fetches weather data
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
    
    // Current Forecast
    client.getForecast(location: userLocation) { result in
        switch result {
        case .success(let tuple):
            let (currentForecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!
            
            if let current = currentForecast.currently {
                currentCondition = "\(current.icon!.rawValue)"
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
                windDirectionString = windDirection(degree: current.windBearing!)
                
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
            }
            
            if let daily = currentForecast.daily {
                let day0Array = daily.data[0]
                let fetchDay0Array = day0Array
                
                highTemperature = Int(fetchDay0Array.temperatureHigh ?? defaultInteger)
                lowTemperature = Int(fetchDay0Array.temperatureLow ?? defaultInteger)
                sunrise = sunFormat(date: fetchDay0Array.sunriseTime!)
                sunset = sunFormat(date: fetchDay0Array.sunsetTime!)
                
                day0Condition = "\(fetchDay0Array.icon!.rawValue)"
                day0DayString = dayFormat(date: fetchDay0Array.time, fullLength: false)
                day0DayStringFull = dayFormat(date: fetchDay0Array.time, fullLength: true)
                day0DateString = dateFormat(date: fetchDay0Array.time)
                day0Summary = fetchDay0Array.summary ?? "Summary error."
                day0Sunrise = sunFormat(date: fetchDay0Array.sunriseTime!)
                day0Sunset = sunFormat(date: fetchDay0Array.sunsetTime!)
                day0High = Int(fetchDay0Array.temperatureHigh ?? defaultInteger)
                day0Low = Int(fetchDay0Array.temperatureLow ?? defaultInteger)
                day0Precip = dailyPrecipProb(day: fetchDay0Array)
                day0PrecipAccum = dailyPrecipAccum(day: fetchDay0Array)
                day0Humidity = dailyHumidityProb(day: fetchDay0Array)
                day0Wind = fetchDay0Array.windSpeed ?? 0
                day0DewPoint = Int(fetchDay0Array.dewPoint ?? 0)
                day0Pressure = fetchDay0Array.pressure ?? 0
                day0Visibility = Int(fetchDay0Array.visibility ?? 0)
                day0UVIndex = Int(fetchDay0Array.uvIndex ?? 0)
            }
            
            // Get minutely data through 60 minutes
            if let minutely = currentForecast.minutely {
                minutelyChance1 = minutePrecipProb(value: 1, minute: minutely)
                minutelyChance2 = minutePrecipProb(value: 2, minute: minutely)
                minutelyChance3 = minutePrecipProb(value: 3, minute: minutely)
                minutelyChance4 = minutePrecipProb(value: 4, minute: minutely)
                minutelyChance5 = minutePrecipProb(value: 5, minute: minutely)
                minutelyChance6 = minutePrecipProb(value: 6, minute: minutely)
                minutelyChance7 = minutePrecipProb(value: 7, minute: minutely)
                minutelyChance8 = minutePrecipProb(value: 8, minute: minutely)
                minutelyChance9 = minutePrecipProb(value: 9, minute: minutely)
                minutelyChance10 = minutePrecipProb(value: 10, minute: minutely)
                minutelyChance11 = minutePrecipProb(value: 11, minute: minutely)
                minutelyChance12 = minutePrecipProb(value: 12, minute: minutely)
                minutelyChance13 = minutePrecipProb(value: 13, minute: minutely)
                minutelyChance14 = minutePrecipProb(value: 14, minute: minutely)
                minutelyChance15 = minutePrecipProb(value: 15, minute: minutely)
                minutelyChance16 = minutePrecipProb(value: 16, minute: minutely)
                minutelyChance17 = minutePrecipProb(value: 17, minute: minutely)
                minutelyChance18 = minutePrecipProb(value: 18, minute: minutely)
                minutelyChance19 = minutePrecipProb(value: 19, minute: minutely)
                minutelyChance20 = minutePrecipProb(value: 20, minute: minutely)
                minutelyChance21 = minutePrecipProb(value: 21, minute: minutely)
                minutelyChance22 = minutePrecipProb(value: 22, minute: minutely)
                minutelyChance23 = minutePrecipProb(value: 23, minute: minutely)
                minutelyChance24 = minutePrecipProb(value: 24, minute: minutely)
                minutelyChance25 = minutePrecipProb(value: 25, minute: minutely)
                minutelyChance26 = minutePrecipProb(value: 26, minute: minutely)
                minutelyChance27 = minutePrecipProb(value: 27, minute: minutely)
                minutelyChance28 = minutePrecipProb(value: 28, minute: minutely)
                minutelyChance29 = minutePrecipProb(value: 29, minute: minutely)
                minutelyChance30 = minutePrecipProb(value: 30, minute: minutely)
                minutelyChance31 = minutePrecipProb(value: 31, minute: minutely)
                minutelyChance32 = minutePrecipProb(value: 32, minute: minutely)
                minutelyChance33 = minutePrecipProb(value: 33, minute: minutely)
                minutelyChance34 = minutePrecipProb(value: 34, minute: minutely)
                minutelyChance35 = minutePrecipProb(value: 35, minute: minutely)
                minutelyChance36 = minutePrecipProb(value: 36, minute: minutely)
                minutelyChance37 = minutePrecipProb(value: 37, minute: minutely)
                minutelyChance38 = minutePrecipProb(value: 38, minute: minutely)
                minutelyChance39 = minutePrecipProb(value: 39, minute: minutely)
                minutelyChance40 = minutePrecipProb(value: 40, minute: minutely)
                minutelyChance41 = minutePrecipProb(value: 41, minute: minutely)
                minutelyChance42 = minutePrecipProb(value: 42, minute: minutely)
                minutelyChance43 = minutePrecipProb(value: 43, minute: minutely)
                minutelyChance44 = minutePrecipProb(value: 44, minute: minutely)
                minutelyChance45 = minutePrecipProb(value: 45, minute: minutely)
                minutelyChance46 = minutePrecipProb(value: 46, minute: minutely)
                minutelyChance47 = minutePrecipProb(value: 47, minute: minutely)
                minutelyChance48 = minutePrecipProb(value: 48, minute: minutely)
                minutelyChance49 = minutePrecipProb(value: 49, minute: minutely)
                minutelyChance50 = minutePrecipProb(value: 50, minute: minutely)
                minutelyChance51 = minutePrecipProb(value: 51, minute: minutely)
                minutelyChance52 = minutePrecipProb(value: 52, minute: minutely)
                minutelyChance53 = minutePrecipProb(value: 53, minute: minutely)
                minutelyChance54 = minutePrecipProb(value: 54, minute: minutely)
                minutelyChance55 = minutePrecipProb(value: 55, minute: minutely)
                minutelyChance56 = minutePrecipProb(value: 56, minute: minutely)
                minutelyChance57 = minutePrecipProb(value: 57, minute: minutely)
                minutelyChance58 = minutePrecipProb(value: 58, minute: minutely)
                minutelyChance59 = minutePrecipProb(value: 59, minute: minutely)
                minutelyChance60 = minutePrecipProb(value: 60, minute: minutely)
                
                minutelyIntensity1 = minutePrecipIntensity(value: 1, minute: minutely)
                minutelyIntensity2 = minutePrecipIntensity(value: 2, minute: minutely)
                minutelyIntensity3 = minutePrecipIntensity(value: 3, minute: minutely)
                minutelyIntensity4 = minutePrecipIntensity(value: 4, minute: minutely)
                minutelyIntensity5 = minutePrecipIntensity(value: 5, minute: minutely)
                minutelyIntensity6 = minutePrecipIntensity(value: 6, minute: minutely)
                minutelyIntensity7 = minutePrecipIntensity(value: 7, minute: minutely)
                minutelyIntensity8 = minutePrecipIntensity(value: 8, minute: minutely)
                minutelyIntensity9 = minutePrecipIntensity(value: 9, minute: minutely)
                minutelyIntensity10 = minutePrecipIntensity(value: 10, minute: minutely)
                minutelyIntensity11 = minutePrecipIntensity(value: 11, minute: minutely)
                minutelyIntensity12 = minutePrecipIntensity(value: 12, minute: minutely)
                minutelyIntensity13 = minutePrecipIntensity(value: 13, minute: minutely)
                minutelyIntensity14 = minutePrecipIntensity(value: 14, minute: minutely)
                minutelyIntensity15 = minutePrecipIntensity(value: 15, minute: minutely)
                minutelyIntensity16 = minutePrecipIntensity(value: 16, minute: minutely)
                minutelyIntensity17 = minutePrecipIntensity(value: 17, minute: minutely)
                minutelyIntensity18 = minutePrecipIntensity(value: 18, minute: minutely)
                minutelyIntensity19 = minutePrecipIntensity(value: 19, minute: minutely)
                minutelyIntensity20 = minutePrecipIntensity(value: 20, minute: minutely)
                minutelyIntensity21 = minutePrecipIntensity(value: 21, minute: minutely)
                minutelyIntensity22 = minutePrecipIntensity(value: 22, minute: minutely)
                minutelyIntensity23 = minutePrecipIntensity(value: 23, minute: minutely)
                minutelyIntensity24 = minutePrecipIntensity(value: 24, minute: minutely)
                minutelyIntensity25 = minutePrecipIntensity(value: 25, minute: minutely)
                minutelyIntensity26 = minutePrecipIntensity(value: 26, minute: minutely)
                minutelyIntensity27 = minutePrecipIntensity(value: 27, minute: minutely)
                minutelyIntensity28 = minutePrecipIntensity(value: 28, minute: minutely)
                minutelyIntensity29 = minutePrecipIntensity(value: 29, minute: minutely)
                minutelyIntensity30 = minutePrecipIntensity(value: 30, minute: minutely)
                minutelyIntensity31 = minutePrecipIntensity(value: 31, minute: minutely)
                minutelyIntensity32 = minutePrecipIntensity(value: 32, minute: minutely)
                minutelyIntensity33 = minutePrecipIntensity(value: 33, minute: minutely)
                minutelyIntensity34 = minutePrecipIntensity(value: 34, minute: minutely)
                minutelyIntensity35 = minutePrecipIntensity(value: 35, minute: minutely)
                minutelyIntensity36 = minutePrecipIntensity(value: 36, minute: minutely)
                minutelyIntensity37 = minutePrecipIntensity(value: 37, minute: minutely)
                minutelyIntensity38 = minutePrecipIntensity(value: 38, minute: minutely)
                minutelyIntensity39 = minutePrecipIntensity(value: 39, minute: minutely)
                minutelyIntensity40 = minutePrecipIntensity(value: 40, minute: minutely)
                minutelyIntensity41 = minutePrecipIntensity(value: 41, minute: minutely)
                minutelyIntensity42 = minutePrecipIntensity(value: 42, minute: minutely)
                minutelyIntensity43 = minutePrecipIntensity(value: 43, minute: minutely)
                minutelyIntensity44 = minutePrecipIntensity(value: 44, minute: minutely)
                minutelyIntensity45 = minutePrecipIntensity(value: 45, minute: minutely)
                minutelyIntensity46 = minutePrecipIntensity(value: 46, minute: minutely)
                minutelyIntensity47 = minutePrecipIntensity(value: 47, minute: minutely)
                minutelyIntensity48 = minutePrecipIntensity(value: 48, minute: minutely)
                minutelyIntensity49 = minutePrecipIntensity(value: 49, minute: minutely)
                minutelyIntensity50 = minutePrecipIntensity(value: 50, minute: minutely)
                minutelyIntensity51 = minutePrecipIntensity(value: 51, minute: minutely)
                minutelyIntensity52 = minutePrecipIntensity(value: 52, minute: minutely)
                minutelyIntensity53 = minutePrecipIntensity(value: 53, minute: minutely)
                minutelyIntensity54 = minutePrecipIntensity(value: 54, minute: minutely)
                minutelyIntensity55 = minutePrecipIntensity(value: 55, minute: minutely)
                minutelyIntensity56 = minutePrecipIntensity(value: 56, minute: minutely)
                minutelyIntensity57 = minutePrecipIntensity(value: 57, minute: minutely)
                minutelyIntensity58 = minutePrecipIntensity(value: 58, minute: minutely)
                minutelyIntensity59 = minutePrecipIntensity(value: 59, minute: minutely)
                minutelyIntensity60 = minutePrecipIntensity(value: 60, minute: minutely)
                
                minutelyType1 = minutePrecipType(value: 1, minute: minutely)
                minutelyType2 = minutePrecipType(value: 2, minute: minutely)
                minutelyType3 = minutePrecipType(value: 3, minute: minutely)
                minutelyType4 = minutePrecipType(value: 4, minute: minutely)
                minutelyType5 = minutePrecipType(value: 5, minute: minutely)
                minutelyType6 = minutePrecipType(value: 6, minute: minutely)
                minutelyType7 = minutePrecipType(value: 7, minute: minutely)
                minutelyType8 = minutePrecipType(value: 8, minute: minutely)
                minutelyType9 = minutePrecipType(value: 9, minute: minutely)
                minutelyType10 = minutePrecipType(value: 10, minute: minutely)
                minutelyType11 = minutePrecipType(value: 11, minute: minutely)
                minutelyType12 = minutePrecipType(value: 12, minute: minutely)
                minutelyType13 = minutePrecipType(value: 13, minute: minutely)
                minutelyType14 = minutePrecipType(value: 14, minute: minutely)
                minutelyType15 = minutePrecipType(value: 15, minute: minutely)
                minutelyType16 = minutePrecipType(value: 16, minute: minutely)
                minutelyType17 = minutePrecipType(value: 17, minute: minutely)
                minutelyType18 = minutePrecipType(value: 18, minute: minutely)
                minutelyType19 = minutePrecipType(value: 19, minute: minutely)
                minutelyType20 = minutePrecipType(value: 20, minute: minutely)
                minutelyType21 = minutePrecipType(value: 21, minute: minutely)
                minutelyType22 = minutePrecipType(value: 22, minute: minutely)
                minutelyType23 = minutePrecipType(value: 23, minute: minutely)
                minutelyType24 = minutePrecipType(value: 24, minute: minutely)
                minutelyType25 = minutePrecipType(value: 25, minute: minutely)
                minutelyType26 = minutePrecipType(value: 26, minute: minutely)
                minutelyType27 = minutePrecipType(value: 27, minute: minutely)
                minutelyType28 = minutePrecipType(value: 28, minute: minutely)
                minutelyType29 = minutePrecipType(value: 29, minute: minutely)
                minutelyType30 = minutePrecipType(value: 30, minute: minutely)
                minutelyType31 = minutePrecipType(value: 31, minute: minutely)
                minutelyType32 = minutePrecipType(value: 32, minute: minutely)
                minutelyType33 = minutePrecipType(value: 33, minute: minutely)
                minutelyType34 = minutePrecipType(value: 34, minute: minutely)
                minutelyType35 = minutePrecipType(value: 35, minute: minutely)
                minutelyType36 = minutePrecipType(value: 36, minute: minutely)
                minutelyType37 = minutePrecipType(value: 37, minute: minutely)
                minutelyType38 = minutePrecipType(value: 38, minute: minutely)
                minutelyType39 = minutePrecipType(value: 39, minute: minutely)
                minutelyType40 = minutePrecipType(value: 40, minute: minutely)
                minutelyType41 = minutePrecipType(value: 41, minute: minutely)
                minutelyType42 = minutePrecipType(value: 42, minute: minutely)
                minutelyType43 = minutePrecipType(value: 43, minute: minutely)
                minutelyType44 = minutePrecipType(value: 44, minute: minutely)
                minutelyType45 = minutePrecipType(value: 45, minute: minutely)
                minutelyType46 = minutePrecipType(value: 46, minute: minutely)
                minutelyType47 = minutePrecipType(value: 47, minute: minutely)
                minutelyType48 = minutePrecipType(value: 48, minute: minutely)
                minutelyType49 = minutePrecipType(value: 49, minute: minutely)
                minutelyType50 = minutePrecipType(value: 50, minute: minutely)
                minutelyType51 = minutePrecipType(value: 51, minute: minutely)
                minutelyType52 = minutePrecipType(value: 52, minute: minutely)
                minutelyType53 = minutePrecipType(value: 53, minute: minutely)
                minutelyType54 = minutePrecipType(value: 54, minute: minutely)
                minutelyType55 = minutePrecipType(value: 55, minute: minutely)
                minutelyType56 = minutePrecipType(value: 56, minute: minutely)
                minutelyType57 = minutePrecipType(value: 57, minute: minutely)
                minutelyType58 = minutePrecipType(value: 58, minute: minutely)
                minutelyType59 = minutePrecipType(value: 59, minute: minutely)
                minutelyType60 = minutePrecipType(value: 60, minute: minutely)
            }
            
            // Get minute statements
            getMinutelyStatements()
            
            // Get hourly data and hourly precipitation through 12 hours
            if let hourly = currentForecast.hourly {
                cloudCoverHour1 = hourCloudCover(value: 1, hour: hourly)
                cloudCoverHour2 = hourCloudCover(value: 2, hour: hourly)
                cloudCoverHour3 = hourCloudCover(value: 3, hour: hourly)
                cloudCoverHour4 = hourCloudCover(value: 4, hour: hourly)

                let fetchHourly0 = hourly.data[0]
                let precipArray0 = fetchHourly0
                
                hourSummary = "\(precipArray0.summary!)"
                
                if precipArray0.precipitationIntensity != nil {
                    precipIntensity = Double(precipArray0.precipitationIntensity!).rounded(toPlaces: 2)
                } else {
                    precipIntensity = 0
                }
                
                conditionHour0 = "\(precipArray0.icon!.rawValue)"
                
                let fetchHourly1 = hourly.data[1]
                let precipArray1 = fetchHourly1
                nextHourCondition = "\(precipArray1.icon!.rawValue)"

                hour0 = hourTime(value: 0, hour: hourly)
                precipHour0 = hourPrecipProb(value: 0, hour: hourly)
                accumHour0 = hourAccumProb(value: 0, hour: hourly)
                tempHour0 = hourTemp(value: 0, hour: hourly)
                humidityHour0 = hourHumidity(value: 0, hour: hourly)
                conditionHour0 = hourIcon(value: 0, hour: hourly)
                uvindexHour0 = hourUVIndex(value: 0, hour: hourly)
                windSpeedHour0 = hourWindSpeed(value: 0, hour: hourly)
                cloudCoverHour0 = hourCloudCover(value: 0, hour: hourly)

                hour1 = hourTime(value: 1, hour: hourly)
                precipHour1 = hourPrecipProb(value: 1, hour: hourly)
                accumHour1 = hourAccumProb(value: 1, hour: hourly)
                tempHour1 = hourTemp(value: 1, hour: hourly)
                humidityHour1 = hourHumidity(value: 1, hour: hourly)
                conditionHour1 = hourIcon(value: 1, hour: hourly)
                uvindexHour1 = hourUVIndex(value: 1, hour: hourly)
                windSpeedHour1 = hourWindSpeed(value: 1, hour: hourly)
                cloudCoverHour1 = hourCloudCover(value: 1, hour: hourly)

                hour2 = hourTime(value: 2, hour: hourly)
                precipHour2 = hourPrecipProb(value: 2, hour: hourly)
                accumHour2 = hourAccumProb(value: 2, hour: hourly)
                tempHour2 = hourTemp(value: 2, hour: hourly)
                humidityHour2 = hourHumidity(value: 2, hour: hourly)
                conditionHour2 = hourIcon(value: 2, hour: hourly)
                uvindexHour2 = hourUVIndex(value: 2, hour: hourly)
                windSpeedHour2 = hourWindSpeed(value: 2, hour: hourly)
                cloudCoverHour2 = hourCloudCover(value: 2, hour: hourly)

                hour3 = hourTime(value: 3, hour: hourly)
                precipHour3 = hourPrecipProb(value: 3, hour: hourly)
                accumHour3 = hourAccumProb(value: 3, hour: hourly)
                tempHour3 = hourTemp(value: 3, hour: hourly)
                humidityHour3 = hourHumidity(value: 3, hour: hourly)
                conditionHour3 = hourIcon(value: 3, hour: hourly)
                uvindexHour3 = hourUVIndex(value: 3, hour: hourly)
                windSpeedHour3 = hourWindSpeed(value: 3, hour: hourly)
                cloudCoverHour3 = hourCloudCover(value: 3, hour: hourly)

                hour4 = hourTime(value: 4, hour: hourly)
                precipHour4 = hourPrecipProb(value: 4, hour: hourly)
                accumHour4 = hourAccumProb(value: 4, hour: hourly)
                tempHour4 = hourTemp(value: 4, hour: hourly)
                humidityHour4 = hourHumidity(value: 4, hour: hourly)
                conditionHour4 = hourIcon(value: 4, hour: hourly)
                uvindexHour4 = hourUVIndex(value: 4, hour: hourly)
                windSpeedHour4 = hourWindSpeed(value: 4, hour: hourly)
                cloudCoverHour4 = hourCloudCover(value: 4, hour: hourly)

                hour5 = hourTime(value: 5, hour: hourly)
                precipHour5 = hourPrecipProb(value: 5, hour: hourly)
                accumHour5 = hourAccumProb(value: 5, hour: hourly)
                tempHour5 = hourTemp(value: 5, hour: hourly)
                humidityHour5 = hourHumidity(value: 5, hour: hourly)
                conditionHour5 = hourIcon(value: 5, hour: hourly)
                uvindexHour5 = hourUVIndex(value: 5, hour: hourly)
                windSpeedHour5 = hourWindSpeed(value: 5, hour: hourly)
                cloudCoverHour5 = hourCloudCover(value: 5, hour: hourly)

                hour6 = hourTime(value: 6, hour: hourly)
                precipHour6 = hourPrecipProb(value: 6, hour: hourly)
                accumHour6 = hourAccumProb(value: 6, hour: hourly)
                tempHour6 = hourTemp(value: 6, hour: hourly)
                humidityHour6 = hourHumidity(value: 6, hour: hourly)
                conditionHour6 = hourIcon(value: 6, hour: hourly)
                uvindexHour6 = hourUVIndex(value: 6, hour: hourly)
                windSpeedHour6 = hourWindSpeed(value: 6, hour: hourly)
                cloudCoverHour6 = hourCloudCover(value: 6, hour: hourly)

                hour7 = hourTime(value: 7, hour: hourly)
                precipHour7 = hourPrecipProb(value: 7, hour: hourly)
                accumHour7 = hourAccumProb(value: 7, hour: hourly)
                tempHour7 = hourTemp(value: 7, hour: hourly)
                humidityHour7 = hourHumidity(value: 7, hour: hourly)
                conditionHour7 = hourIcon(value: 7, hour: hourly)
                uvindexHour7 = hourUVIndex(value: 7, hour: hourly)
                windSpeedHour7 = hourWindSpeed(value: 7, hour: hourly)
                cloudCoverHour7 = hourCloudCover(value: 7, hour: hourly)

                hour8 = hourTime(value: 8, hour: hourly)
                precipHour8 = hourPrecipProb(value: 8, hour: hourly)
                accumHour8 = hourAccumProb(value: 8, hour: hourly)
                tempHour8 = hourTemp(value: 8, hour: hourly)
                humidityHour8 = hourHumidity(value: 8, hour: hourly)
                conditionHour8 = hourIcon(value: 8, hour: hourly)
                uvindexHour8 = hourUVIndex(value: 8, hour: hourly)
                windSpeedHour8 = hourWindSpeed(value: 8, hour: hourly)
                cloudCoverHour8 = hourCloudCover(value: 8, hour: hourly)

                hour9 = hourTime(value: 9, hour: hourly)
                precipHour9 = hourPrecipProb(value: 9, hour: hourly)
                accumHour9 = hourAccumProb(value: 9, hour: hourly)
                tempHour9 = hourTemp(value: 9, hour: hourly)
                humidityHour9 = hourHumidity(value: 9, hour: hourly)
                conditionHour9 = hourIcon(value: 9, hour: hourly)
                uvindexHour9 = hourUVIndex(value: 9, hour: hourly)
                windSpeedHour9 = hourWindSpeed(value: 9, hour: hourly)
                cloudCoverHour9 = hourCloudCover(value: 9, hour: hourly)

                hour10 = hourTime(value: 10, hour: hourly)
                precipHour10 = hourPrecipProb(value: 10, hour: hourly)
                accumHour10 = hourAccumProb(value: 10, hour: hourly)
                tempHour10 = hourTemp(value: 10, hour: hourly)
                humidityHour10 = hourHumidity(value: 10, hour: hourly)
                conditionHour10 = hourIcon(value: 10, hour: hourly)
                uvindexHour10 = hourUVIndex(value: 10, hour: hourly)
                windSpeedHour10 = hourWindSpeed(value: 10, hour: hourly)
                cloudCoverHour10 = hourCloudCover(value: 10, hour: hourly)

                hour11 = hourTime(value: 11, hour: hourly)
                precipHour11 = hourPrecipProb(value: 11, hour: hourly)
                accumHour11 = hourAccumProb(value: 11, hour: hourly)
                tempHour11 = hourTemp(value: 11, hour: hourly)
                humidityHour11 = hourHumidity(value: 11, hour: hourly)
                conditionHour11 = hourIcon(value: 11, hour: hourly)
                uvindexHour11 = hourUVIndex(value: 11, hour: hourly)
                windSpeedHour11 = hourWindSpeed(value: 11, hour: hourly)
                cloudCoverHour11 = hourCloudCover(value: 11, hour: hourly)

                hour12 = hourTime(value: 12, hour: hourly)
                precipHour12 = hourPrecipProb(value: 12, hour: hourly)
                accumHour12 = hourAccumProb(value: 12, hour: hourly)
                tempHour12 = hourTemp(value: 12, hour: hourly)
                humidityHour12 = hourHumidity(value: 12, hour: hourly)
                conditionHour12 = hourIcon(value: 12, hour: hourly)
                uvindexHour12 = hourUVIndex(value: 12, hour: hourly)
                windSpeedHour12 = hourWindSpeed(value: 12, hour: hourly)
                cloudCoverHour12 = hourCloudCover(value: 12, hour: hourly)

                hour13 = hourTime(value: 13, hour: hourly)
                precipHour13 = hourPrecipProb(value: 13, hour: hourly)
                accumHour13 = hourAccumProb(value: 13, hour: hourly)
                tempHour13 = hourTemp(value: 13, hour: hourly)
                humidityHour13 = hourHumidity(value: 13, hour: hourly)
                conditionHour13 = hourIcon(value: 13, hour: hourly)
                uvindexHour13 = hourUVIndex(value: 13, hour: hourly)
                windSpeedHour13 = hourWindSpeed(value: 13, hour: hourly)
                cloudCoverHour13 = hourCloudCover(value: 13, hour: hourly)

                hour14 = hourTime(value: 14, hour: hourly)
                precipHour14 = hourPrecipProb(value: 14, hour: hourly)
                accumHour14 = hourAccumProb(value: 14, hour: hourly)
                tempHour14 = hourTemp(value: 14, hour: hourly)
                humidityHour14 = hourHumidity(value: 14, hour: hourly)
                conditionHour14 = hourIcon(value: 14, hour: hourly)
                uvindexHour14 = hourUVIndex(value: 14, hour: hourly)
                windSpeedHour14 = hourWindSpeed(value: 14, hour: hourly)
                cloudCoverHour14 = hourCloudCover(value: 14, hour: hourly)

                hour15 = hourTime(value: 15, hour: hourly)
                precipHour15 = hourPrecipProb(value: 15, hour: hourly)
                accumHour15 = hourAccumProb(value: 15, hour: hourly)
                tempHour15 = hourTemp(value: 15, hour: hourly)
                humidityHour15 = hourHumidity(value: 15, hour: hourly)
                conditionHour15 = hourIcon(value: 15, hour: hourly)
                uvindexHour15 = hourUVIndex(value: 15, hour: hourly)
                windSpeedHour15 = hourWindSpeed(value: 15, hour: hourly)
                cloudCoverHour15 = hourCloudCover(value: 15, hour: hourly)
            }
            
            // Get alerts
            if let alerts = currentForecast.alerts {
                let alertArray = alerts[0]
                let fetchAlertArray = alertArray
                
                alertCount = alerts.count
                alertTitle = "\(fetchAlertArray.title)"
                alertBody = "\(fetchAlertArray.description)"
                alertURI = "\(fetchAlertArray.uri)"
            }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day One
    client.getForecast(location: userLocation, time: dayOneDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let day1Array = daily.data[0]
            let fetchDay1Array = day1Array
            
            day1Condition = "\(fetchDay1Array.icon!.rawValue)"
            day1DayString = dayFormat(date: fetchDay1Array.time, fullLength: false)
            day1DayStringFull = dayFormat(date: fetchDay1Array.time, fullLength: true)
            day1DateString = dateFormat(date: fetchDay1Array.time)
            day1Summary = fetchDay1Array.summary ?? "Summary error."
            day1Sunrise = sunFormat(date: fetchDay1Array.sunriseTime!)
            day1Sunset = sunFormat(date: fetchDay1Array.sunsetTime!)
            day1High = Int(fetchDay1Array.temperatureHigh ?? defaultInteger)
            day1Low = Int(fetchDay1Array.temperatureLow ?? defaultInteger)
            day1Precip = dailyPrecipProb(day: fetchDay1Array)
            day1PrecipAccum = dailyPrecipAccum(day: fetchDay1Array)
            day1Humidity = dailyHumidityProb(day: fetchDay1Array)
            day1Wind = fetchDay1Array.windSpeed ?? 0
            day1DewPoint = Int(fetchDay1Array.dewPoint ?? 0)
            day1Pressure = fetchDay1Array.pressure ?? 0
            day1Visibility = Int(fetchDay1Array.visibility ?? 0)
            day1UVIndex = Int(fetchDay1Array.uvIndex ?? 0)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Two
    client.getForecast(location: userLocation, time: dayTwoDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let day2Array = daily.data[0]
            let fetchDay2Array = day2Array
            
            day2Condition = "\(fetchDay2Array.icon!.rawValue)"
            day2DayString = dayFormat(date: fetchDay2Array.time, fullLength: false)
            day2DayStringFull = dayFormat(date: fetchDay2Array.time, fullLength: true)
            day2DateString = dateFormat(date: fetchDay2Array.time)
            day2Summary = fetchDay2Array.summary ?? "Summary error."
            day2Sunrise = sunFormat(date: fetchDay2Array.sunriseTime!)
            day2Sunset = sunFormat(date: fetchDay2Array.sunsetTime!)
            day2High = Int(fetchDay2Array.temperatureHigh ?? defaultInteger)
            day2Low = Int(fetchDay2Array.temperatureLow ?? defaultInteger)
            day2Precip = dailyPrecipProb(day: fetchDay2Array)
            day2PrecipAccum = dailyPrecipAccum(day: fetchDay2Array)
            day2Humidity = dailyHumidityProb(day: fetchDay2Array)
            day2Wind = fetchDay2Array.windSpeed ?? 0
            day2DewPoint = Int(fetchDay2Array.dewPoint ?? 0)
            day2Pressure = fetchDay2Array.pressure ?? 0
            day2Visibility = Int(fetchDay2Array.visibility ?? 0)
            day2UVIndex = Int(fetchDay2Array.uvIndex ?? 0)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Three
    client.getForecast(location: userLocation, time: dayThreeDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let day3Array = daily.data[0]
            let fetchDay3Array = day3Array
            
            day3Condition = "\(fetchDay3Array.icon!.rawValue)"
            day3DayString = dayFormat(date: fetchDay3Array.time, fullLength: false)
            day3DayStringFull = dayFormat(date: fetchDay3Array.time, fullLength: true)
            day3DateString = dateFormat(date: fetchDay3Array.time)
            day3Summary = fetchDay3Array.summary!
            day3Sunrise = sunFormat(date: fetchDay3Array.sunriseTime!)
            day3Sunset = sunFormat(date: fetchDay3Array.sunsetTime!)
            day3High = Int(fetchDay3Array.temperatureHigh ?? defaultInteger)
            day3Low = Int(fetchDay3Array.temperatureLow ?? defaultInteger)
            day3Precip = dailyPrecipProb(day: fetchDay3Array)
            day3PrecipAccum = dailyPrecipAccum(day: fetchDay3Array)
            day3Humidity = dailyHumidityProb(day: fetchDay3Array)
            day3Wind = fetchDay3Array.windSpeed ?? 0
            day3DewPoint = Int(fetchDay3Array.dewPoint ?? 0)
            day3Pressure = fetchDay3Array.pressure ?? 0
            day3Visibility = Int(fetchDay3Array.visibility ?? 0)
            day3UVIndex = Int(fetchDay3Array.uvIndex ?? 0)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Four
    client.getForecast(location: userLocation, time: dayFourDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let day4Array = daily.data[0]
            let fetchDay4Array = day4Array
            
            day4Condition = "\(fetchDay4Array.icon!.rawValue)"
            day4DayString = dayFormat(date: fetchDay4Array.time, fullLength: false)
            day4DayStringFull = dayFormat(date: fetchDay4Array.time, fullLength: true)
            day4DateString = dateFormat(date: fetchDay4Array.time)
            day4Summary = fetchDay4Array.summary ?? "Summary error."
            day4Sunrise = sunFormat(date: fetchDay4Array.sunriseTime!)
            day4Sunset = sunFormat(date: fetchDay4Array.sunsetTime!)
            day4High = Int(fetchDay4Array.temperatureHigh ?? defaultInteger)
            day4Low = Int(fetchDay4Array.temperatureLow ?? defaultInteger)
            day4Precip = dailyPrecipProb(day: fetchDay4Array)
            day4PrecipAccum = dailyPrecipAccum(day: fetchDay4Array)
            day4Humidity = dailyHumidityProb(day: fetchDay4Array)
            day4Wind = fetchDay4Array.windSpeed ?? 0
            day4DewPoint = Int(fetchDay4Array.dewPoint ?? 0)
            day4Pressure = fetchDay4Array.pressure ?? 0
            day4Visibility = Int(fetchDay4Array.visibility ?? 0)
            day4UVIndex = Int(fetchDay4Array.uvIndex ?? 0)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Five
    client.getForecast(location: userLocation, time: dayFiveDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let day5Array = daily.data[0]
            let fetchDay5Array = day5Array
            
            day5Condition = "\(fetchDay5Array.icon!.rawValue)"
            day5DayString = dayFormat(date: fetchDay5Array.time, fullLength: false)
            day5DayStringFull = dayFormat(date: fetchDay5Array.time, fullLength: true)
            day5DateString = dateFormat(date: fetchDay5Array.time)
            day5Summary = fetchDay5Array.summary ?? "Summary error."
            day5Sunrise = sunFormat(date: fetchDay5Array.sunriseTime!)
            day5Sunset = sunFormat(date: fetchDay5Array.sunsetTime!)
            day5High = Int(fetchDay5Array.temperatureHigh ?? defaultInteger)
            day5Low = Int(fetchDay5Array.temperatureLow ?? defaultInteger)
            day5Precip = dailyPrecipProb(day: fetchDay5Array)
            day5PrecipAccum = dailyPrecipAccum(day: fetchDay5Array)
            day5Humidity = dailyHumidityProb(day: fetchDay5Array)
            day5Wind = fetchDay5Array.windSpeed ?? 0
            day5DewPoint = Int(fetchDay5Array.dewPoint ?? 0)
            day5Pressure = fetchDay5Array.pressure ?? 0
            day5Visibility = Int(fetchDay5Array.visibility ?? 0)
            day5UVIndex = Int(fetchDay5Array.uvIndex ?? 0)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Six
    client.getForecast(location: userLocation, time: daySixDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let day6Array = daily.data[0]
            let fetchDay6Array = day6Array
            
            day6Condition = "\(fetchDay6Array.icon!.rawValue)"
            day6DayString = dayFormat(date: fetchDay6Array.time, fullLength: false)
            day6DayStringFull = dayFormat(date: fetchDay6Array.time, fullLength: true)
            day6DateString = dateFormat(date: fetchDay6Array.time)
            day6Summary = fetchDay6Array.summary ?? "Summary error."
            day6Sunrise = sunFormat(date: fetchDay6Array.sunriseTime!)
            day6Sunset = sunFormat(date: fetchDay6Array.sunsetTime!)
            day6High = Int(fetchDay6Array.temperatureHigh ?? defaultInteger)
            day6Low = Int(fetchDay6Array.temperatureLow ?? defaultInteger)
            day6Precip = dailyPrecipProb(day: fetchDay6Array)
            day6PrecipAccum = dailyPrecipAccum(day: fetchDay6Array)
            day6Humidity = dailyHumidityProb(day: fetchDay6Array)
            day6Wind = fetchDay6Array.windSpeed ?? 0
            day6DewPoint = Int(fetchDay6Array.dewPoint ?? 0)
            day6Pressure = fetchDay6Array.pressure ?? 0
            day6Visibility = Int(fetchDay6Array.visibility ?? 0)
            day6UVIndex = Int(fetchDay6Array.uvIndex ?? 0)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Seven
    client.getForecast(location: userLocation, time: daySevenDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let day7Array = daily.data[0]
            let fetchDay7Array = day7Array
            
            day7Condition = "\(fetchDay7Array.icon!.rawValue)"
            day7DayString = dayFormat(date: fetchDay7Array.time, fullLength: false)
            day7DayStringFull = dayFormat(date: fetchDay7Array.time, fullLength: true)
            day7DateString = dateFormat(date: fetchDay7Array.time)
            day7Summary = fetchDay7Array.summary ?? "Summary error."
            day7Sunrise = sunFormat(date: fetchDay7Array.sunriseTime!)
            day7Sunset = sunFormat(date: fetchDay7Array.sunsetTime!)
            day7High = Int(fetchDay7Array.temperatureHigh ?? defaultInteger)
            day7Low = Int(fetchDay7Array.temperatureLow ?? defaultInteger)
            day7Precip = dailyPrecipProb(day: fetchDay7Array)
            day7PrecipAccum = dailyPrecipAccum(day: fetchDay7Array)
            day7Humidity = dailyHumidityProb(day: fetchDay7Array)
            day7Wind = fetchDay7Array.windSpeed ?? 0
            day7DewPoint = Int(fetchDay7Array.dewPoint ?? 0)
            day7Pressure = fetchDay7Array.pressure ?? 0
            day7Visibility = Int(fetchDay7Array.visibility ?? 0)
            day7UVIndex = Int(fetchDay7Array.uvIndex ?? 0)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Eight
    client.getForecast(location: userLocation, time: dayEightDate) { result in
        switch result {
        case .success(let tuple):
            let (forecast, _) = tuple
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!

        if let daily = forecast.daily {
            let day8Array = daily.data[0]
            let fetchDay8Array = day8Array
            
            day8Condition = "\(fetchDay8Array.icon!.rawValue)"
            day8DayString = dayFormat(date: fetchDay8Array.time, fullLength: false)
            day8DayStringFull = dayFormat(date: fetchDay8Array.time, fullLength: true)
            day8DateString = dateFormat(date: fetchDay8Array.time)
            day8Summary = fetchDay8Array.summary ?? "Summary error."
            day8Sunrise = sunFormat(date: fetchDay8Array.sunriseTime!)
            day8Sunset = sunFormat(date: fetchDay8Array.sunsetTime!)
            day8High = Int(fetchDay8Array.temperatureHigh ?? defaultInteger)
            day8Low = Int(fetchDay8Array.temperatureLow ?? defaultInteger)
            day8Precip = dailyPrecipProb(day: fetchDay8Array)
            day8PrecipAccum = dailyPrecipAccum(day: fetchDay8Array)
            day8Humidity = dailyHumidityProb(day: fetchDay8Array)
            day8Wind = fetchDay8Array.windSpeed ?? 0
            day8DewPoint = Int(fetchDay8Array.dewPoint ?? 0)
            day8Pressure = fetchDay8Array.pressure ?? 0
            day8Visibility = Int(fetchDay8Array.visibility ?? 0)
            day8UVIndex = Int(fetchDay8Array.uvIndex ?? 0)
        }        case .failure(let error):
            print(error)
        }
    }
            
    // MARK: - Time Machine Day Nine
    client.getForecast(location: userLocation, time: dayNineDate) { result in
    switch result {
    case .success(let tuple):
        let (forecast, _) = tuple
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!

        if let daily = forecast.daily {
            let day9Array = daily.data[0]
            let fetchDay9Array = day9Array
            
            day9Condition = "\(fetchDay9Array.icon!.rawValue)"
            day9DayString = dayFormat(date: fetchDay9Array.time, fullLength: false)
            day9DayStringFull = dayFormat(date: fetchDay9Array.time, fullLength: true)
            day9DateString = dateFormat(date: fetchDay9Array.time)
            day9Summary = fetchDay9Array.summary ?? "Summary error."
            day9Sunrise = sunFormat(date: fetchDay9Array.sunriseTime!)
            day9Sunset = sunFormat(date: fetchDay9Array.sunsetTime!)
            day9High = Int(fetchDay9Array.temperatureHigh ?? defaultInteger)
            day9Low = Int(fetchDay9Array.temperatureLow ?? defaultInteger)
            day9Precip = dailyPrecipProb(day: fetchDay9Array)
            day9PrecipAccum = dailyPrecipAccum(day: fetchDay9Array)
            day9Humidity = dailyHumidityProb(day: fetchDay9Array)
            day9Wind = fetchDay9Array.windSpeed ?? 0
            day9DewPoint = Int(fetchDay9Array.dewPoint ?? 0)
            day9Pressure = fetchDay9Array.pressure ?? 0
            day9Visibility = Int(fetchDay9Array.visibility ?? 0)
            day9UVIndex = Int(fetchDay9Array.uvIndex ?? 0)
        }
        case .failure(let error):
            print(error)
        }
    }
}

// MARK: - Get minute statements
func getMinutelyStatements() {
    // Get minute statements
    var minuteString: String = ""
    var intensityString: String = ""
    var intensityString2: String = ""
    var minuteSum: String = ""
    
    var precipMinuteCounter: Int = 0
    var noneMinuteCounter: Int = 0
    var precipEndCounter: Int = 0
    
    // Takes a minute and returns intensity value
    func getMinutelyIntensity(minute: Int, intensity: Double) -> String {
        if intensity >= 0.01 && intensity <= 2.5 {
            intensityString2 = "Light"
        } else if intensity >= 2.6 && intensity <= 7.5 {
            intensityString2 = "Moderate"
        } else if intensity >= 7.6 && intensity <= 15 {
            intensityString2 = "Heavy"
        }
        
        return intensityString2
    }
    
    // Takes a minute and returns summary string
    func getMinutelySummary(minute: Int, chance: Int, intensity: Double, type: String) -> String {
        
        if type != "none" && intensity > 0 {
            if minute == 1 {
                minuteString = "minute"
            } else {
                minuteString = "minutes"
            }
            
            if intensity >= 0.01 && intensity <= 2.5 {
                intensityString = "Light"
            } else if intensity >= 2.6 && intensity <= 7.5 {
                intensityString = "Moderate"
            } else if intensity >= 7.6 && intensity <= 15 {
                intensityString = "Heavy"
            }
            
            if chance >= 50 && chance < 80 {
                if minute < 60 {
                    minuteSum = "Possible \(intensityString.lowercased()) \(type.lowercased()) starting in \(minute) \(minuteString)."
                } else if minute == 60 {
                    minuteSum = "Possible \(intensityString.lowercased()) \(type.lowercased()) starting in 1 hour."
                }
            } else if chance >= 80 {
                if minute < 60 {
                    minuteSum = "\(intensityString.capitalizingFirstLetter()) \(type.lowercased()) starting in \(minute) \(minuteString)."
                } else if minute == 60 {
                    minuteSum = "\(intensityString.capitalizingFirstLetter()) \(type.lowercased()) starting in 1 hour."
                }
            }
        } else {
            minuteSum = "none"
        }
        
        return minuteSum
    }
    
    let statement1 = getMinutelySummary(minute: 1, chance: minutelyChance1, intensity: minutelyIntensity1, type: minutelyType1)
    let statement2 = getMinutelySummary(minute: 2, chance: minutelyChance2, intensity: minutelyIntensity2, type: minutelyType2)
    let statement3 = getMinutelySummary(minute: 3, chance: minutelyChance3, intensity: minutelyIntensity3, type: minutelyType3)
    let statement4 = getMinutelySummary(minute: 4, chance: minutelyChance4, intensity: minutelyIntensity4, type: minutelyType4)
    let statement5 = getMinutelySummary(minute: 5, chance: minutelyChance5, intensity: minutelyIntensity5, type: minutelyType5)
    let statement6 = getMinutelySummary(minute: 6, chance: minutelyChance6, intensity: minutelyIntensity6, type: minutelyType6)
    let statement7 = getMinutelySummary(minute: 7, chance: minutelyChance7, intensity: minutelyIntensity7, type: minutelyType7)
    let statement8 = getMinutelySummary(minute: 8, chance: minutelyChance8, intensity: minutelyIntensity8, type: minutelyType8)
    let statement9 = getMinutelySummary(minute: 9, chance: minutelyChance9, intensity: minutelyIntensity9, type: minutelyType9)
    let statement10 = getMinutelySummary(minute: 10, chance: minutelyChance10, intensity: minutelyIntensity10, type: minutelyType10)
    let statement11 = getMinutelySummary(minute: 11, chance: minutelyChance11, intensity: minutelyIntensity11, type: minutelyType11)
    let statement12 = getMinutelySummary(minute: 12, chance: minutelyChance12, intensity: minutelyIntensity12, type: minutelyType12)
    let statement13 = getMinutelySummary(minute: 13, chance: minutelyChance13, intensity: minutelyIntensity13, type: minutelyType13)
    let statement14 = getMinutelySummary(minute: 14, chance: minutelyChance14, intensity: minutelyIntensity14, type: minutelyType14)
    let statement15 = getMinutelySummary(minute: 15, chance: minutelyChance15, intensity: minutelyIntensity15, type: minutelyType15)
    let statement16 = getMinutelySummary(minute: 16, chance: minutelyChance16, intensity: minutelyIntensity16, type: minutelyType16)
    let statement17 = getMinutelySummary(minute: 17, chance: minutelyChance17, intensity: minutelyIntensity17, type: minutelyType17)
    let statement18 = getMinutelySummary(minute: 18, chance: minutelyChance18, intensity: minutelyIntensity18, type: minutelyType18)
    let statement19 = getMinutelySummary(minute: 19, chance: minutelyChance19, intensity: minutelyIntensity19, type: minutelyType19)
    let statement20 = getMinutelySummary(minute: 20, chance: minutelyChance20, intensity: minutelyIntensity20, type: minutelyType20)
    let statement21 = getMinutelySummary(minute: 21, chance: minutelyChance21, intensity: minutelyIntensity21, type: minutelyType21)
    let statement22 = getMinutelySummary(minute: 22, chance: minutelyChance22, intensity: minutelyIntensity22, type: minutelyType22)
    let statement23 = getMinutelySummary(minute: 23, chance: minutelyChance23, intensity: minutelyIntensity23, type: minutelyType23)
    let statement24 = getMinutelySummary(minute: 24, chance: minutelyChance24, intensity: minutelyIntensity24, type: minutelyType24)
    let statement25 = getMinutelySummary(minute: 25, chance: minutelyChance25, intensity: minutelyIntensity25, type: minutelyType25)
    let statement26 = getMinutelySummary(minute: 26, chance: minutelyChance26, intensity: minutelyIntensity26, type: minutelyType26)
    let statement27 = getMinutelySummary(minute: 27, chance: minutelyChance27, intensity: minutelyIntensity27, type: minutelyType27)
    let statement28 = getMinutelySummary(minute: 28, chance: minutelyChance28, intensity: minutelyIntensity28, type: minutelyType28)
    let statement29 = getMinutelySummary(minute: 29, chance: minutelyChance29, intensity: minutelyIntensity29, type: minutelyType29)
    let statement30 = getMinutelySummary(minute: 30, chance: minutelyChance30, intensity: minutelyIntensity30, type: minutelyType30)
    let statement31 = getMinutelySummary(minute: 31, chance: minutelyChance31, intensity: minutelyIntensity31, type: minutelyType31)
    let statement32 = getMinutelySummary(minute: 32, chance: minutelyChance32, intensity: minutelyIntensity32, type: minutelyType32)
    let statement33 = getMinutelySummary(minute: 33, chance: minutelyChance33, intensity: minutelyIntensity33, type: minutelyType33)
    let statement34 = getMinutelySummary(minute: 34, chance: minutelyChance34, intensity: minutelyIntensity34, type: minutelyType34)
    let statement35 = getMinutelySummary(minute: 35, chance: minutelyChance35, intensity: minutelyIntensity35, type: minutelyType35)
    let statement36 = getMinutelySummary(minute: 36, chance: minutelyChance36, intensity: minutelyIntensity36, type: minutelyType36)
    let statement37 = getMinutelySummary(minute: 37, chance: minutelyChance37, intensity: minutelyIntensity37, type: minutelyType37)
    let statement38 = getMinutelySummary(minute: 38, chance: minutelyChance38, intensity: minutelyIntensity38, type: minutelyType38)
    let statement39 = getMinutelySummary(minute: 39, chance: minutelyChance39, intensity: minutelyIntensity39, type: minutelyType39)
    let statement40 = getMinutelySummary(minute: 40, chance: minutelyChance40, intensity: minutelyIntensity40, type: minutelyType40)
    let statement41 = getMinutelySummary(minute: 41, chance: minutelyChance41, intensity: minutelyIntensity41, type: minutelyType41)
    let statement42 = getMinutelySummary(minute: 42, chance: minutelyChance42, intensity: minutelyIntensity42, type: minutelyType42)
    let statement43 = getMinutelySummary(minute: 43, chance: minutelyChance43, intensity: minutelyIntensity43, type: minutelyType43)
    let statement44 = getMinutelySummary(minute: 44, chance: minutelyChance44, intensity: minutelyIntensity44, type: minutelyType44)
    let statement45 = getMinutelySummary(minute: 45, chance: minutelyChance45, intensity: minutelyIntensity45, type: minutelyType45)
    let statement46 = getMinutelySummary(minute: 46, chance: minutelyChance46, intensity: minutelyIntensity46, type: minutelyType46)
    let statement47 = getMinutelySummary(minute: 47, chance: minutelyChance47, intensity: minutelyIntensity47, type: minutelyType47)
    let statement48 = getMinutelySummary(minute: 48, chance: minutelyChance48, intensity: minutelyIntensity48, type: minutelyType48)
    let statement49 = getMinutelySummary(minute: 49, chance: minutelyChance49, intensity: minutelyIntensity49, type: minutelyType49)
    let statement50 = getMinutelySummary(minute: 50, chance: minutelyChance50, intensity: minutelyIntensity50, type: minutelyType50)
    let statement51 = getMinutelySummary(minute: 51, chance: minutelyChance51, intensity: minutelyIntensity51, type: minutelyType51)
    let statement52 = getMinutelySummary(minute: 52, chance: minutelyChance52, intensity: minutelyIntensity52, type: minutelyType52)
    let statement53 = getMinutelySummary(minute: 53, chance: minutelyChance53, intensity: minutelyIntensity53, type: minutelyType53)
    let statement54 = getMinutelySummary(minute: 54, chance: minutelyChance54, intensity: minutelyIntensity54, type: minutelyType54)
    let statement55 = getMinutelySummary(minute: 55, chance: minutelyChance55, intensity: minutelyIntensity55, type: minutelyType55)
    let statement56 = getMinutelySummary(minute: 56, chance: minutelyChance56, intensity: minutelyIntensity56, type: minutelyType56)
    let statement57 = getMinutelySummary(minute: 57, chance: minutelyChance57, intensity: minutelyIntensity57, type: minutelyType57)
    let statement58 = getMinutelySummary(minute: 58, chance: minutelyChance58, intensity: minutelyIntensity58, type: minutelyType58)
    let statement59 = getMinutelySummary(minute: 59, chance: minutelyChance59, intensity: minutelyIntensity59, type: minutelyType59)
    let statement60 = getMinutelySummary(minute: 60, chance: minutelyChance60, intensity: minutelyIntensity60, type: minutelyType60)
    
    // Check for trigger minute for the hour
    func checkTriggerMinute(statement: String, minute: Int) {
        // Check for precipitation start
        if statement != "none" {
            precipMinuteCounter += 1
            triggerMinute = minute
            minuteSummary = "\(statement)"
        } else {
            noneMinuteCounter += 1
        }
        
        // Check for precipitation end
        if statement == "none" {
            precipEndCounter += 1
        }
        
        // Get precip type summary for the hour
        if precipMinuteCounter == 60 && noneMinuteCounter == 0 {
            minuteSummary = "\(getMinutelyIntensity(minute: 60, intensity: minutelyIntensity60)) \(minutelyType60.lowercased()) for the hour."
        }
        
        // Get ending summary for the hour
        if precipEndCounter >= 2 && precipEndCounter < 60 {
            endingMinuteSummary = "\(60 - precipEndCounter) minutes"
        } else if precipEndCounter == 1 {
            endingMinuteSummary = "\(60 - precipEndCounter) minute"
        } else if precipEndCounter == 60 {
            endingMinuteSummary = "1 hour"
        } else {
            endingMinuteSummary = "none"
        }
    }
    
    checkTriggerMinute(statement: statement1, minute: 1)
    checkTriggerMinute(statement: statement2, minute: 2)
    checkTriggerMinute(statement: statement3, minute: 3)
    checkTriggerMinute(statement: statement4, minute: 4)
    checkTriggerMinute(statement: statement5, minute: 5)
    checkTriggerMinute(statement: statement6, minute: 6)
    checkTriggerMinute(statement: statement7, minute: 7)
    checkTriggerMinute(statement: statement8, minute: 8)
    checkTriggerMinute(statement: statement9, minute: 9)
    checkTriggerMinute(statement: statement10, minute: 10)
    checkTriggerMinute(statement: statement11, minute: 11)
    checkTriggerMinute(statement: statement12, minute: 12)
    checkTriggerMinute(statement: statement13, minute: 13)
    checkTriggerMinute(statement: statement14, minute: 14)
    checkTriggerMinute(statement: statement15, minute: 15)
    checkTriggerMinute(statement: statement16, minute: 16)
    checkTriggerMinute(statement: statement17, minute: 17)
    checkTriggerMinute(statement: statement18, minute: 18)
    checkTriggerMinute(statement: statement19, minute: 19)
    checkTriggerMinute(statement: statement20, minute: 20)
    checkTriggerMinute(statement: statement21, minute: 21)
    checkTriggerMinute(statement: statement22, minute: 22)
    checkTriggerMinute(statement: statement23, minute: 23)
    checkTriggerMinute(statement: statement24, minute: 24)
    checkTriggerMinute(statement: statement25, minute: 25)
    checkTriggerMinute(statement: statement26, minute: 26)
    checkTriggerMinute(statement: statement27, minute: 27)
    checkTriggerMinute(statement: statement28, minute: 28)
    checkTriggerMinute(statement: statement29, minute: 29)
    checkTriggerMinute(statement: statement30, minute: 30)
    checkTriggerMinute(statement: statement31, minute: 31)
    checkTriggerMinute(statement: statement32, minute: 32)
    checkTriggerMinute(statement: statement33, minute: 33)
    checkTriggerMinute(statement: statement34, minute: 34)
    checkTriggerMinute(statement: statement35, minute: 35)
    checkTriggerMinute(statement: statement36, minute: 36)
    checkTriggerMinute(statement: statement37, minute: 37)
    checkTriggerMinute(statement: statement38, minute: 38)
    checkTriggerMinute(statement: statement39, minute: 39)
    checkTriggerMinute(statement: statement40, minute: 40)
    checkTriggerMinute(statement: statement41, minute: 41)
    checkTriggerMinute(statement: statement42, minute: 42)
    checkTriggerMinute(statement: statement43, minute: 43)
    checkTriggerMinute(statement: statement44, minute: 44)
    checkTriggerMinute(statement: statement45, minute: 45)
    checkTriggerMinute(statement: statement46, minute: 46)
    checkTriggerMinute(statement: statement47, minute: 47)
    checkTriggerMinute(statement: statement48, minute: 48)
    checkTriggerMinute(statement: statement49, minute: 49)
    checkTriggerMinute(statement: statement50, minute: 50)
    checkTriggerMinute(statement: statement51, minute: 51)
    checkTriggerMinute(statement: statement52, minute: 52)
    checkTriggerMinute(statement: statement53, minute: 53)
    checkTriggerMinute(statement: statement54, minute: 54)
    checkTriggerMinute(statement: statement55, minute: 55)
    checkTriggerMinute(statement: statement56, minute: 56)
    checkTriggerMinute(statement: statement57, minute: 57)
    checkTriggerMinute(statement: statement58, minute: 58)
    checkTriggerMinute(statement: statement59, minute: 59)
    checkTriggerMinute(statement: statement60, minute: 60)
}

extension Date {
    func localString(dateStyle: DateFormatter.Style = .medium,
                     timeStyle: DateFormatter.Style = .medium) -> String {
        return DateFormatter.localizedString(
            from: self,
            dateStyle: dateStyle,
            timeStyle: timeStyle)
    }
    
    var midnight: Date {
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
}

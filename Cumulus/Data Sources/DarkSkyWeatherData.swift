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
    
    let dayZeroDate = Date()
    let dayOneDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    let dayTwoDate = Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date()
    let dayThreeDate = Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date()
    let dayFourDate = Calendar.current.date(byAdding: .day, value: 4, to: Date()) ?? Date()
    let dayFiveDate = Calendar.current.date(byAdding: .day, value: 5, to: Date()) ?? Date()
    let daySixDate = Calendar.current.date(byAdding: .day, value: 6, to: Date()) ?? Date()
    let daySevenDate = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
    let dayEightDate = Calendar.current.date(byAdding: .day, value: 8, to: Date()) ?? Date()
    let dayNineDate = Calendar.current.date(byAdding: .day, value: 9, to: Date()) ?? Date()
    let dayTenDate = Calendar.current.date(byAdding: .day, value: 10, to: Date()) ?? Date()
    let dayElevenDate = Calendar.current.date(byAdding: .day, value: 11, to: Date()) ?? Date()
    let dayTwelveDate = Calendar.current.date(byAdding: .day, value: 12, to: Date()) ?? Date()
    let dayThirteenDate = Calendar.current.date(byAdding: .day, value: 13, to: Date()) ?? Date()
    
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
        case .success(let currentForecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!
            
            if universalDataSource == "Dark Sky" {
                fetchDarkSkyCurrentForecastData()
            }
            
            if let daily = currentForecast.daily {
                let dayZeroArray = daily.data[0]
                let fetchDayZeroArray = dayZeroArray
                
                weatherCondition0 = "\(fetchDayZeroArray.icon!.rawValue)"
                highTemperature = Int(fetchDayZeroArray.temperatureHigh ?? defaultInteger)
                lowTemperature = Int(fetchDayZeroArray.temperatureLow ?? defaultInteger)
                dewPoint = Int(fetchDayZeroArray.dewPoint ?? defaultInteger)
                sunrise = sunFormat(date: fetchDayZeroArray.sunriseTime!)
                sunset = sunFormat(date: fetchDayZeroArray.sunsetTime!)
                sunriseDate = fetchDayZeroArray.sunriseTime!
                sunsetDate = fetchDayZeroArray.sunsetTime!
                dayZeroDayString = dayFormat(date: fetchDayZeroArray.time)
                dayZeroDateString = dateFormat(date: fetchDayZeroArray.time)
                dayZeroHigh = Int(fetchDayZeroArray.temperatureHigh ?? defaultInteger)
                dayZeroLow = Int(fetchDayZeroArray.temperatureLow ?? defaultInteger)
                dayZeroSummaryString = "\(fetchDayZeroArray.summary ?? "\(defaultString)")"
                dayZeroConditionValue = getDefaultDailyCondition(condition: fetchDayZeroArray)
                dayZeroPrecip = dailyPrecipProb(day: fetchDayZeroArray)
                dayZeroPrecipAccum = dailyPrecipAccum(day: fetchDayZeroArray)
                dayZeroSunrise = sunFormat(date: fetchDayZeroArray.sunriseTime!)
                dayZeroSunset = sunFormat(date: fetchDayZeroArray.sunsetTime!)
                dayZeroMoonPhaseString = moonPhase(percentage: fetchDayZeroArray.moonPhase ?? defaultInteger + 0.5)
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
                pressureHour1 = hourPressure(value: 1, hour: hourly)
                pressureHour2 = hourPressure(value: 2, hour: hourly)
                pressureHour3 = hourPressure(value: 3, hour: hourly)
                pressureHour4 = hourPressure(value: 4, hour: hourly)
                
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
                tempHour0 = hourTemp(value: 0, hour: hourly)
                humidityHour0 = hourHumidity(value: 0, hour: hourly)
                conditionHour0 = hourIcon(value: 0, hour: hourly)
                uvindexHour0 = hourUVIndex(value: 0, hour: hourly)
                windSpeedHour0 = hourWindSpeed(value: 0, hour: hourly)
                cloudCoverHour0 = hourCloudCover(value: 0, hour: hourly)

                hour1 = hourTime(value: 1, hour: hourly)
                precipHour1 = hourPrecipProb(value: 1, hour: hourly)
                tempHour1 = hourTemp(value: 1, hour: hourly)
                humidityHour1 = hourHumidity(value: 1, hour: hourly)
                conditionHour1 = hourIcon(value: 1, hour: hourly)
                uvindexHour1 = hourUVIndex(value: 1, hour: hourly)
                windSpeedHour1 = hourWindSpeed(value: 1, hour: hourly)
                cloudCoverHour1 = hourCloudCover(value: 1, hour: hourly)

                hour2 = hourTime(value: 2, hour: hourly)
                precipHour2 = hourPrecipProb(value: 2, hour: hourly)
                tempHour2 = hourTemp(value: 2, hour: hourly)
                humidityHour2 = hourHumidity(value: 2, hour: hourly)
                conditionHour2 = hourIcon(value: 2, hour: hourly)
                uvindexHour2 = hourUVIndex(value: 2, hour: hourly)
                windSpeedHour2 = hourWindSpeed(value: 2, hour: hourly)
                cloudCoverHour2 = hourCloudCover(value: 2, hour: hourly)

                hour3 = hourTime(value: 3, hour: hourly)
                precipHour3 = hourPrecipProb(value: 3, hour: hourly)
                tempHour3 = hourTemp(value: 3, hour: hourly)
                humidityHour3 = hourHumidity(value: 3, hour: hourly)
                conditionHour3 = hourIcon(value: 3, hour: hourly)
                uvindexHour3 = hourUVIndex(value: 3, hour: hourly)
                windSpeedHour3 = hourWindSpeed(value: 3, hour: hourly)
                cloudCoverHour3 = hourCloudCover(value: 3, hour: hourly)

                hour4 = hourTime(value: 4, hour: hourly)
                precipHour4 = hourPrecipProb(value: 4, hour: hourly)
                tempHour4 = hourTemp(value: 4, hour: hourly)
                humidityHour4 = hourHumidity(value: 4, hour: hourly)
                conditionHour4 = hourIcon(value: 4, hour: hourly)
                uvindexHour4 = hourUVIndex(value: 4, hour: hourly)
                windSpeedHour4 = hourWindSpeed(value: 4, hour: hourly)
                cloudCoverHour4 = hourCloudCover(value: 4, hour: hourly)

                hour5 = hourTime(value: 5, hour: hourly)
                precipHour5 = hourPrecipProb(value: 5, hour: hourly)
                tempHour5 = hourTemp(value: 5, hour: hourly)
                humidityHour5 = hourHumidity(value: 5, hour: hourly)
                conditionHour5 = hourIcon(value: 5, hour: hourly)
                uvindexHour5 = hourUVIndex(value: 5, hour: hourly)
                windSpeedHour5 = hourWindSpeed(value: 5, hour: hourly)
                cloudCoverHour5 = hourCloudCover(value: 5, hour: hourly)

                hour6 = hourTime(value: 6, hour: hourly)
                precipHour6 = hourPrecipProb(value: 6, hour: hourly)
                tempHour6 = hourTemp(value: 6, hour: hourly)
                humidityHour6 = hourHumidity(value: 6, hour: hourly)
                conditionHour6 = hourIcon(value: 6, hour: hourly)
                uvindexHour6 = hourUVIndex(value: 6, hour: hourly)
                windSpeedHour6 = hourWindSpeed(value: 6, hour: hourly)
                cloudCoverHour6 = hourCloudCover(value: 6, hour: hourly)

                hour7 = hourTime(value: 7, hour: hourly)
                precipHour7 = hourPrecipProb(value: 7, hour: hourly)
                tempHour7 = hourTemp(value: 7, hour: hourly)
                humidityHour7 = hourHumidity(value: 7, hour: hourly)
                conditionHour7 = hourIcon(value: 7, hour: hourly)
                uvindexHour7 = hourUVIndex(value: 7, hour: hourly)
                windSpeedHour7 = hourWindSpeed(value: 7, hour: hourly)
                cloudCoverHour7 = hourCloudCover(value: 7, hour: hourly)

                hour8 = hourTime(value: 8, hour: hourly)
                precipHour8 = hourPrecipProb(value: 8, hour: hourly)
                tempHour8 = hourTemp(value: 8, hour: hourly)
                humidityHour8 = hourHumidity(value: 8, hour: hourly)
                conditionHour8 = hourIcon(value: 8, hour: hourly)
                uvindexHour8 = hourUVIndex(value: 8, hour: hourly)
                windSpeedHour8 = hourWindSpeed(value: 8, hour: hourly)
                cloudCoverHour8 = hourCloudCover(value: 8, hour: hourly)

                hour9 = hourTime(value: 9, hour: hourly)
                precipHour9 = hourPrecipProb(value: 9, hour: hourly)
                tempHour9 = hourTemp(value: 9, hour: hourly)
                humidityHour9 = hourHumidity(value: 9, hour: hourly)
                conditionHour9 = hourIcon(value: 9, hour: hourly)
                uvindexHour9 = hourUVIndex(value: 9, hour: hourly)
                windSpeedHour9 = hourWindSpeed(value: 9, hour: hourly)
                cloudCoverHour9 = hourCloudCover(value: 9, hour: hourly)

                hour10 = hourTime(value: 10, hour: hourly)
                precipHour10 = hourPrecipProb(value: 10, hour: hourly)
                tempHour10 = hourTemp(value: 10, hour: hourly)
                humidityHour10 = hourHumidity(value: 10, hour: hourly)
                conditionHour10 = hourIcon(value: 10, hour: hourly)
                uvindexHour10 = hourUVIndex(value: 10, hour: hourly)
                windSpeedHour10 = hourWindSpeed(value: 10, hour: hourly)
                cloudCoverHour10 = hourCloudCover(value: 10, hour: hourly)

                hour11 = hourTime(value: 11, hour: hourly)
                precipHour11 = hourPrecipProb(value: 11, hour: hourly)
                tempHour11 = hourTemp(value: 11, hour: hourly)
                humidityHour11 = hourHumidity(value: 11, hour: hourly)
                conditionHour11 = hourIcon(value: 11, hour: hourly)
                uvindexHour11 = hourUVIndex(value: 11, hour: hourly)
                windSpeedHour11 = hourWindSpeed(value: 11, hour: hourly)
                cloudCoverHour11 = hourCloudCover(value: 11, hour: hourly)

                hour12 = hourTime(value: 12, hour: hourly)
                precipHour12 = hourPrecipProb(value: 12, hour: hourly)
                tempHour12 = hourTemp(value: 12, hour: hourly)
                humidityHour12 = hourHumidity(value: 12, hour: hourly)
                conditionHour12 = hourIcon(value: 12, hour: hourly)
                uvindexHour12 = hourUVIndex(value: 12, hour: hourly)
                windSpeedHour12 = hourWindSpeed(value: 12, hour: hourly)
                cloudCoverHour12 = hourCloudCover(value: 12, hour: hourly)

                hour13 = hourTime(value: 13, hour: hourly)
                precipHour13 = hourPrecipProb(value: 13, hour: hourly)
                tempHour13 = hourTemp(value: 13, hour: hourly)
                humidityHour13 = hourHumidity(value: 13, hour: hourly)
                conditionHour13 = hourIcon(value: 13, hour: hourly)
                uvindexHour13 = hourUVIndex(value: 13, hour: hourly)
                windSpeedHour13 = hourWindSpeed(value: 13, hour: hourly)
                cloudCoverHour13 = hourCloudCover(value: 13, hour: hourly)

                hour14 = hourTime(value: 14, hour: hourly)
                precipHour14 = hourPrecipProb(value: 14, hour: hourly)
                tempHour14 = hourTemp(value: 14, hour: hourly)
                humidityHour14 = hourHumidity(value: 14, hour: hourly)
                conditionHour14 = hourIcon(value: 14, hour: hourly)
                uvindexHour14 = hourUVIndex(value: 14, hour: hourly)
                windSpeedHour14 = hourWindSpeed(value: 14, hour: hourly)
                cloudCoverHour14 = hourCloudCover(value: 14, hour: hourly)

                hour15 = hourTime(value: 15, hour: hourly)
                precipHour15 = hourPrecipProb(value: 15, hour: hourly)
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
    
    // MARK: - Time Machine Day Zero
    client.getForecast(location: userLocation, time: dayZeroDate) { result in
        switch result {
        case .success(let forecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let hourly = forecast.hourly {
            dayTime0 = hourTime(value: 0, hour: hourly)
            dayZeroPrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayZeroTemp0 = hourTemp(value: 0, hour: hourly)
            dayZeroHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayZeroCondition0 = hourIcon(value: 0, hour: hourly)
            dayZeroIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayZeroWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayZeroCloudCover0 = hourCloudCover(value: 0, hour: hourly)
            
            dayTime1 = hourTime(value: 1, hour: hourly)
            dayZeroPrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayZeroTemp1 = hourTemp(value: 1, hour: hourly)
            dayZeroHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayZeroCondition1 = hourIcon(value: 1, hour: hourly)
            dayZeroIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayZeroWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayZeroCloudCover1 = hourCloudCover(value: 1, hour: hourly)
            
            dayTime2 = hourTime(value: 2, hour: hourly)
            dayZeroPrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayZeroTemp2 = hourTemp(value: 2, hour: hourly)
            dayZeroHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayZeroCondition2 = hourIcon(value: 2, hour: hourly)
            dayZeroIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayZeroWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayZeroCloudCover2 = hourCloudCover(value: 2, hour: hourly)
            
            dayTime3 = hourTime(value: 3, hour: hourly)
            dayZeroPrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayZeroTemp3 = hourTemp(value: 3, hour: hourly)
            dayZeroHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayZeroCondition3 = hourIcon(value: 3, hour: hourly)
            dayZeroIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayZeroWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayZeroCloudCover3 = hourCloudCover(value: 3, hour: hourly)
            
            dayTime4 = hourTime(value: 4, hour: hourly)
            dayZeroPrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayZeroTemp4 = hourTemp(value: 4, hour: hourly)
            dayZeroHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayZeroCondition4 = hourIcon(value: 4, hour: hourly)
            dayZeroIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayZeroWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayZeroCloudCover4 = hourCloudCover(value: 4, hour: hourly)
            
            dayTime5 = hourTime(value: 5, hour: hourly)
            dayZeroPrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayZeroTemp5 = hourTemp(value: 5, hour: hourly)
            dayZeroHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayZeroCondition5 = hourIcon(value: 5, hour: hourly)
            dayZeroIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayZeroWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayZeroCloudCover5 = hourCloudCover(value: 5, hour: hourly)
            
            dayTime6 = hourTime(value: 6, hour: hourly)
            dayZeroPrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayZeroTemp6 = hourTemp(value: 6, hour: hourly)
            dayZeroHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayZeroCondition6 = hourIcon(value: 6, hour: hourly)
            dayZeroIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayZeroWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayZeroCloudCover6 = hourCloudCover(value: 6, hour: hourly)
            
            dayTime7 = hourTime(value: 7, hour: hourly)
            dayZeroPrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayZeroTemp7 = hourTemp(value: 7, hour: hourly)
            dayZeroHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayZeroCondition7 = hourIcon(value: 7, hour: hourly)
            dayZeroIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayZeroWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayZeroCloudCover7 = hourCloudCover(value: 7, hour: hourly)
            
            dayTime8 = hourTime(value: 8, hour: hourly)
            dayZeroPrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayZeroTemp8 = hourTemp(value: 8, hour: hourly)
            dayZeroHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayZeroCondition8 = hourIcon(value: 8, hour: hourly)
            dayZeroIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayZeroWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayZeroCloudCover8 = hourCloudCover(value: 8, hour: hourly)
            
            dayTime9 = hourTime(value: 9, hour: hourly)
            dayZeroPrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayZeroTemp9 = hourTemp(value: 9, hour: hourly)
            dayZeroHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayZeroCondition9 = hourIcon(value: 9, hour: hourly)
            dayZeroIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayZeroWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayZeroCloudCover9 = hourCloudCover(value: 9, hour: hourly)
            
            dayTime10 = hourTime(value: 10, hour: hourly)
            dayZeroPrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayZeroTemp10 = hourTemp(value: 10, hour: hourly)
            dayZeroHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayZeroCondition10 = hourIcon(value: 10, hour: hourly)
            dayZeroIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayZeroWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayZeroCloudCover10 = hourCloudCover(value: 10, hour: hourly)
            
            dayTime11 = hourTime(value: 11, hour: hourly)
            dayZeroPrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayZeroTemp11 = hourTemp(value: 11, hour: hourly)
            dayZeroHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayZeroCondition11 = hourIcon(value: 11, hour: hourly)
            dayZeroIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayZeroWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayZeroCloudCover11 = hourCloudCover(value: 11, hour: hourly)
            
            dayTime12 = hourTime(value: 12, hour: hourly)
            dayZeroPrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayZeroTemp12 = hourTemp(value: 12, hour: hourly)
            dayZeroHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayZeroCondition12 = hourIcon(value: 12, hour: hourly)
            dayZeroIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayZeroWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayZeroCloudCover12 = hourCloudCover(value: 12, hour: hourly)
            
            dayTime13 = hourTime(value: 13, hour: hourly)
            dayZeroPrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayZeroTemp13 = hourTemp(value: 13, hour: hourly)
            dayZeroHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayZeroCondition13 = hourIcon(value: 13, hour: hourly)
            dayZeroIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayZeroWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayZeroCloudCover13 = hourCloudCover(value: 13, hour: hourly)
            
            dayTime14 = hourTime(value: 14, hour: hourly)
            dayZeroPrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayZeroTemp14 = hourTemp(value: 14, hour: hourly)
            dayZeroHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayZeroCondition14 = hourIcon(value: 14, hour: hourly)
            dayZeroIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayZeroWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayZeroCloudCover14 = hourCloudCover(value: 14, hour: hourly)
            
            dayTime15 = hourTime(value: 15, hour: hourly)
            dayZeroPrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayZeroTemp15 = hourTemp(value: 15, hour: hourly)
            dayZeroHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayZeroCondition15 = hourIcon(value: 15, hour: hourly)
            dayZeroIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayZeroWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayZeroCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day One
    client.getForecast(location: userLocation, time: dayOneDate) { result in
        switch result {
        case .success(let forecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let dayOneArray = daily.data[0]
            let fetchDayOneArray = dayOneArray
            
            weatherCondition1 = "\(fetchDayOneArray.icon!.rawValue)"
            dayOneDayString = dayFormat(date: fetchDayOneArray.time)
            dayOneDateString = dateFormat(date: fetchDayOneArray.time)
            dayOneHigh = Int(fetchDayOneArray.temperatureHigh ?? defaultInteger)
            dayOneLow = Int(fetchDayOneArray.temperatureLow ?? defaultInteger)
            dayOneSummaryString = "\(fetchDayOneArray.summary ?? "\(defaultString)")"
            dayOneConditionValue = getDefaultDailyCondition(condition: fetchDayOneArray)
            dayOnePrecip = dailyPrecipProb(day: fetchDayOneArray)
            dayOnePrecipAccum = dailyPrecipAccum(day: fetchDayOneArray)
            dayOneSunrise = sunFormat(date: fetchDayOneArray.sunriseTime!)
            dayOneSunset = sunFormat(date: fetchDayOneArray.sunsetTime!)
        }
            
        if let hourly = forecast.hourly {
            dayOnePrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayOneTemp0 = hourTemp(value: 0, hour: hourly)
            dayOneHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayOneCondition0 = hourIcon(value: 0, hour: hourly)
            dayOneIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayOneWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayOneCloudCover0 = hourCloudCover(value: 0, hour: hourly)
            
            dayOnePrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayOneTemp1 = hourTemp(value: 1, hour: hourly)
            dayOneHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayOneCondition1 = hourIcon(value: 1, hour: hourly)
            dayOneIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayOneWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayOneCloudCover1 = hourCloudCover(value: 1, hour: hourly)
            
            dayOnePrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayOneTemp2 = hourTemp(value: 2, hour: hourly)
            dayOneHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayOneCondition2 = hourIcon(value: 2, hour: hourly)
            dayOneIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayOneWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayOneCloudCover2 = hourCloudCover(value: 2, hour: hourly)
            
            dayOnePrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayOneTemp3 = hourTemp(value: 3, hour: hourly)
            dayOneHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayOneCondition3 = hourIcon(value: 3, hour: hourly)
            dayOneIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayOneWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayOneCloudCover3 = hourCloudCover(value: 3, hour: hourly)
            
            dayOnePrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayOneTemp4 = hourTemp(value: 4, hour: hourly)
            dayOneHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayOneCondition4 = hourIcon(value: 4, hour: hourly)
            dayOneIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayOneWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayOneCloudCover4 = hourCloudCover(value: 4, hour: hourly)
            
            dayOnePrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayOneTemp5 = hourTemp(value: 5, hour: hourly)
            dayOneHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayOneCondition5 = hourIcon(value: 5, hour: hourly)
            dayOneIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayOneWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayOneCloudCover5 = hourCloudCover(value: 5, hour: hourly)
            
            dayOnePrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayOneTemp6 = hourTemp(value: 6, hour: hourly)
            dayOneHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayOneCondition6 = hourIcon(value: 6, hour: hourly)
            dayOneIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayOneWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayOneCloudCover6 = hourCloudCover(value: 6, hour: hourly)
            
            dayOnePrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayOneTemp7 = hourTemp(value: 7, hour: hourly)
            dayOneHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayOneCondition7 = hourIcon(value: 7, hour: hourly)
            dayOneIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayOneWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayOneCloudCover7 = hourCloudCover(value: 7, hour: hourly)
            
            dayOnePrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayOneTemp8 = hourTemp(value: 8, hour: hourly)
            dayOneHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayOneCondition8 = hourIcon(value: 8, hour: hourly)
            dayOneIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayOneWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayOneCloudCover8 = hourCloudCover(value: 8, hour: hourly)
            
            dayOnePrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayOneTemp9 = hourTemp(value: 9, hour: hourly)
            dayOneHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayOneCondition9 = hourIcon(value: 9, hour: hourly)
            dayOneIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayOneWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayOneCloudCover9 = hourCloudCover(value: 9, hour: hourly)
            
            dayOnePrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayOneTemp10 = hourTemp(value: 10, hour: hourly)
            dayOneHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayOneCondition10 = hourIcon(value: 10, hour: hourly)
            dayOneIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayOneWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayOneCloudCover10 = hourCloudCover(value: 10, hour: hourly)
            
            dayOnePrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayOneTemp11 = hourTemp(value: 11, hour: hourly)
            dayOneHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayOneCondition11 = hourIcon(value: 11, hour: hourly)
            dayOneIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayOneWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayOneCloudCover11 = hourCloudCover(value: 11, hour: hourly)
            
            dayOnePrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayOneTemp12 = hourTemp(value: 12, hour: hourly)
            dayOneHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayOneCondition12 = hourIcon(value: 12, hour: hourly)
            dayOneIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayOneWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayOneCloudCover12 = hourCloudCover(value: 12, hour: hourly)
            
            dayOnePrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayOneTemp13 = hourTemp(value: 13, hour: hourly)
            dayOneHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayOneCondition13 = hourIcon(value: 13, hour: hourly)
            dayOneIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayOneWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayOneCloudCover13 = hourCloudCover(value: 13, hour: hourly)
            
            dayOnePrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayOneTemp14 = hourTemp(value: 14, hour: hourly)
            dayOneHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayOneCondition14 = hourIcon(value: 14, hour: hourly)
            dayOneIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayOneWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayOneCloudCover14 = hourCloudCover(value: 14, hour: hourly)
            
            dayOnePrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayOneTemp15 = hourTemp(value: 15, hour: hourly)
            dayOneHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayOneCondition15 = hourIcon(value: 15, hour: hourly)
            dayOneIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayOneWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayOneCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Two
    client.getForecast(location: userLocation, time: dayTwoDate) { result in
        switch result {
        case .success(let forecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let dayTwoArray = daily.data[0]
            let fetchDayTwoArray = dayTwoArray
            
            weatherCondition2 = "\(fetchDayTwoArray.icon!.rawValue)"
            dayTwoDayString = dayFormat(date: fetchDayTwoArray.time)
            dayTwoDateString = dateFormat(date: fetchDayTwoArray.time)
            dayTwoHigh = Int(fetchDayTwoArray.temperatureHigh ?? defaultInteger)
            dayTwoLow = Int(fetchDayTwoArray.temperatureLow ?? defaultInteger)
            dayTwoSummaryString = "\(fetchDayTwoArray.summary ?? "\(defaultString)")"
            dayTwoConditionValue = getDefaultDailyCondition(condition: fetchDayTwoArray)
            dayTwoPrecip = dailyPrecipProb(day: fetchDayTwoArray)
            dayTwoPrecipAccum = dailyPrecipAccum(day: fetchDayTwoArray)
            dayTwoSunrise = sunFormat(date: fetchDayTwoArray.sunriseTime!)
            dayTwoSunset = sunFormat(date: fetchDayTwoArray.sunsetTime!)
        }
            
        if let hourly = forecast.hourly {
            dayTwoPrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayTwoTemp0 = hourTemp(value: 0, hour: hourly)
            dayTwoHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayTwoCondition0 = hourIcon(value: 0, hour: hourly)
            dayTwoIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayTwoWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayTwoCloudCover0 = hourCloudCover(value: 0, hour: hourly)
            
            dayTwoPrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayTwoTemp1 = hourTemp(value: 1, hour: hourly)
            dayTwoHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayTwoCondition1 = hourIcon(value: 1, hour: hourly)
            dayTwoIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayTwoWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayTwoCloudCover1 = hourCloudCover(value: 1, hour: hourly)
            
            dayTwoPrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayTwoTemp2 = hourTemp(value: 2, hour: hourly)
            dayTwoHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayTwoCondition2 = hourIcon(value: 2, hour: hourly)
            dayTwoIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayTwoWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayTwoCloudCover2 = hourCloudCover(value: 2, hour: hourly)
            
            dayTwoPrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayTwoTemp3 = hourTemp(value: 3, hour: hourly)
            dayTwoHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayTwoCondition3 = hourIcon(value: 3, hour: hourly)
            dayTwoIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayTwoWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayTwoCloudCover3 = hourCloudCover(value: 3, hour: hourly)
            
            dayTwoPrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayTwoTemp4 = hourTemp(value: 4, hour: hourly)
            dayTwoHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayTwoCondition4 = hourIcon(value: 4, hour: hourly)
            dayTwoIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayTwoWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayTwoCloudCover4 = hourCloudCover(value: 4, hour: hourly)
            
            dayTwoPrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayTwoTemp5 = hourTemp(value: 5, hour: hourly)
            dayTwoHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayTwoCondition5 = hourIcon(value: 5, hour: hourly)
            dayTwoIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayTwoWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayTwoCloudCover5 = hourCloudCover(value: 5, hour: hourly)
            
            dayTwoPrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayTwoTemp6 = hourTemp(value: 6, hour: hourly)
            dayTwoHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayTwoCondition6 = hourIcon(value: 6, hour: hourly)
            dayTwoIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayTwoWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayTwoCloudCover6 = hourCloudCover(value: 6, hour: hourly)
            
            dayTwoPrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayTwoTemp7 = hourTemp(value: 7, hour: hourly)
            dayTwoHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayTwoCondition7 = hourIcon(value: 7, hour: hourly)
            dayTwoIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayTwoWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayTwoCloudCover7 = hourCloudCover(value: 7, hour: hourly)
            
            dayTwoPrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayTwoTemp8 = hourTemp(value: 8, hour: hourly)
            dayTwoHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayTwoCondition8 = hourIcon(value: 8, hour: hourly)
            dayTwoIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayTwoWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayTwoCloudCover8 = hourCloudCover(value: 8, hour: hourly)
            
            dayTwoPrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayTwoTemp9 = hourTemp(value: 9, hour: hourly)
            dayTwoHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayTwoCondition9 = hourIcon(value: 9, hour: hourly)
            dayTwoIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayTwoWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayTwoCloudCover9 = hourCloudCover(value: 9, hour: hourly)
            
            dayTwoPrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayTwoTemp10 = hourTemp(value: 10, hour: hourly)
            dayTwoHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayTwoCondition10 = hourIcon(value: 10, hour: hourly)
            dayTwoIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayTwoWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayTwoCloudCover10 = hourCloudCover(value: 10, hour: hourly)
            
            dayTwoPrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayTwoTemp11 = hourTemp(value: 11, hour: hourly)
            dayTwoHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayTwoCondition11 = hourIcon(value: 11, hour: hourly)
            dayTwoIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayTwoWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayTwoCloudCover11 = hourCloudCover(value: 11, hour: hourly)
            
            dayTwoPrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayTwoTemp12 = hourTemp(value: 12, hour: hourly)
            dayTwoHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayTwoCondition12 = hourIcon(value: 12, hour: hourly)
            dayTwoIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayTwoWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayTwoCloudCover12 = hourCloudCover(value: 12, hour: hourly)
            
            dayTwoPrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayTwoTemp13 = hourTemp(value: 13, hour: hourly)
            dayTwoHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayTwoCondition13 = hourIcon(value: 13, hour: hourly)
            dayTwoIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayTwoWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayTwoCloudCover13 = hourCloudCover(value: 13, hour: hourly)
            
            dayTwoPrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayTwoTemp14 = hourTemp(value: 14, hour: hourly)
            dayTwoHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayTwoCondition14 = hourIcon(value: 14, hour: hourly)
            dayTwoIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayTwoWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayTwoCloudCover14 = hourCloudCover(value: 14, hour: hourly)
            
            dayTwoPrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayTwoTemp15 = hourTemp(value: 15, hour: hourly)
            dayTwoHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayTwoCondition15 = hourIcon(value: 15, hour: hourly)
            dayTwoIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayTwoWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayTwoCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Three
    client.getForecast(location: userLocation, time: dayThreeDate) { result in
        switch result {
        case .success(let forecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let dayThreeArray = daily.data[0]
            let fetchDayThreeArray = dayThreeArray
            
            weatherCondition3 = "\(fetchDayThreeArray.icon!.rawValue)"
            dayThreeDayString = dayFormat(date: fetchDayThreeArray.time)
            dayThreeDateString = dateFormat(date: fetchDayThreeArray.time)
            dayThreeHigh = Int(fetchDayThreeArray.temperatureHigh ?? defaultInteger)
            dayThreeLow = Int(fetchDayThreeArray.temperatureLow ?? defaultInteger)
            dayThreeSummaryString = "\(fetchDayThreeArray.summary ?? "\(defaultString)")"
            dayThreeConditionValue = getDefaultDailyCondition(condition: fetchDayThreeArray)
            dayThreePrecip = dailyPrecipProb(day: fetchDayThreeArray)
            dayThreePrecipAccum = dailyPrecipAccum(day: fetchDayThreeArray)
            dayThreeSunrise = sunFormat(date: fetchDayThreeArray.sunriseTime!)
            dayThreeSunset = sunFormat(date: fetchDayThreeArray.sunsetTime!)
        }
            
        if let hourly = forecast.hourly {
            dayThreePrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayThreeTemp0 = hourTemp(value: 0, hour: hourly)
            dayThreeHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayThreeCondition0 = hourIcon(value: 0, hour: hourly)
            dayThreeIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayThreeWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayThreeCloudCover0 = hourCloudCover(value: 0, hour: hourly)

            dayThreePrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayThreeTemp1 = hourTemp(value: 1, hour: hourly)
            dayThreeHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayThreeCondition1 = hourIcon(value: 1, hour: hourly)
            dayThreeIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayThreeWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayThreeCloudCover1 = hourCloudCover(value: 1, hour: hourly)

            dayThreePrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayThreeTemp2 = hourTemp(value: 2, hour: hourly)
            dayThreeHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayThreeCondition2 = hourIcon(value: 2, hour: hourly)
            dayThreeIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayThreeWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayThreeCloudCover2 = hourCloudCover(value: 2, hour: hourly)

            dayThreePrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayThreeTemp3 = hourTemp(value: 3, hour: hourly)
            dayThreeHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayThreeCondition3 = hourIcon(value: 3, hour: hourly)
            dayThreeIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayThreeWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayThreeCloudCover3 = hourCloudCover(value: 3, hour: hourly)

            dayThreePrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayThreeTemp4 = hourTemp(value: 4, hour: hourly)
            dayThreeHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayThreeCondition4 = hourIcon(value: 4, hour: hourly)
            dayThreeIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayThreeWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayThreeCloudCover4 = hourCloudCover(value: 4, hour: hourly)

            dayThreePrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayThreeTemp5 = hourTemp(value: 5, hour: hourly)
            dayThreeHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayThreeCondition5 = hourIcon(value: 5, hour: hourly)
            dayThreeIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayThreeWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayThreeCloudCover5 = hourCloudCover(value: 5, hour: hourly)

            dayThreePrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayThreeTemp6 = hourTemp(value: 6, hour: hourly)
            dayThreeHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayThreeCondition6 = hourIcon(value: 6, hour: hourly)
            dayThreeIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayThreeWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayThreeCloudCover6 = hourCloudCover(value: 6, hour: hourly)

            dayThreePrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayThreeTemp7 = hourTemp(value: 7, hour: hourly)
            dayThreeHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayThreeCondition7 = hourIcon(value: 7, hour: hourly)
            dayThreeIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayThreeWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayThreeCloudCover7 = hourCloudCover(value: 7, hour: hourly)

            dayThreePrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayThreeTemp8 = hourTemp(value: 8, hour: hourly)
            dayThreeHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayThreeCondition8 = hourIcon(value: 8, hour: hourly)
            dayThreeIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayThreeWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayThreeCloudCover8 = hourCloudCover(value: 8, hour: hourly)

            dayThreePrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayThreeTemp9 = hourTemp(value: 9, hour: hourly)
            dayThreeHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayThreeCondition9 = hourIcon(value: 9, hour: hourly)
            dayThreeIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayThreeWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayThreeCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            dayThreePrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayThreeTemp10 = hourTemp(value: 10, hour: hourly)
            dayThreeHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayThreeCondition10 = hourIcon(value: 10, hour: hourly)
            dayThreeIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayThreeWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayThreeCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            dayThreePrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayThreeTemp11 = hourTemp(value: 11, hour: hourly)
            dayThreeHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayThreeCondition11 = hourIcon(value: 11, hour: hourly)
            dayThreeIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayThreeWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayThreeCloudCover11 = hourCloudCover(value: 11, hour: hourly)

            dayThreePrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayThreeTemp12 = hourTemp(value: 12, hour: hourly)
            dayThreeHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayThreeCondition12 = hourIcon(value: 12, hour: hourly)
            dayThreeIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayThreeWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayThreeCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            dayThreePrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayThreeTemp13 = hourTemp(value: 13, hour: hourly)
            dayThreeHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayThreeCondition13 = hourIcon(value: 13, hour: hourly)
            dayThreeIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayThreeWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayThreeCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            dayThreePrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayThreeTemp14 = hourTemp(value: 14, hour: hourly)
            dayThreeHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayThreeCondition14 = hourIcon(value: 14, hour: hourly)
            dayThreeIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayThreeWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayThreeCloudCover14 = hourCloudCover(value: 14, hour: hourly)

            dayThreePrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayThreeTemp15 = hourTemp(value: 15, hour: hourly)
            dayThreeHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayThreeCondition15 = hourIcon(value: 15, hour: hourly)
            dayThreeIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayThreeWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayThreeCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Four
    client.getForecast(location: userLocation, time: dayFourDate) { result in
        switch result {
        case .success(let forecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let dayFourArray = daily.data[0]
            let fetchDayFourArray = dayFourArray
            
            weatherCondition4 = "\(fetchDayFourArray.icon!.rawValue)"
            dayFourDayString = dayFormat(date: fetchDayFourArray.time)
            dayFourDateString = dateFormat(date: fetchDayFourArray.time)
            dayFourHigh = Int(fetchDayFourArray.temperatureHigh ?? defaultInteger)
            dayFourLow = Int(fetchDayFourArray.temperatureLow ?? defaultInteger)
            dayFourSummaryString = "\(fetchDayFourArray.summary ?? "\(defaultString)")"
            dayFourConditionValue = getDefaultDailyCondition(condition: fetchDayFourArray)
            dayFourPrecip = dailyPrecipProb(day: fetchDayFourArray)
            dayFourPrecipAccum = dailyPrecipAccum(day: fetchDayFourArray)
            dayFourSunrise = sunFormat(date: fetchDayFourArray.sunriseTime!)
            dayFourSunset = sunFormat(date: fetchDayFourArray.sunsetTime!)
        }
            
        if let hourly = forecast.hourly {
            dayFourPrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayFourTemp0 = hourTemp(value: 0, hour: hourly)
            dayFourHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayFourCondition0 = hourIcon(value: 0, hour: hourly)
            dayFourIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayFourWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayFourCloudCover0 = hourCloudCover(value: 0, hour: hourly)

            dayFourPrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayFourTemp1 = hourTemp(value: 1, hour: hourly)
            dayFourHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayFourCondition1 = hourIcon(value: 1, hour: hourly)
            dayFourIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayFourWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayFourCloudCover1 = hourCloudCover(value: 1, hour: hourly)

            dayFourPrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayFourTemp2 = hourTemp(value: 2, hour: hourly)
            dayFourHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayFourCondition2 = hourIcon(value: 2, hour: hourly)
            dayFourIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayFourWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayFourCloudCover2 = hourCloudCover(value: 2, hour: hourly)

            dayFourPrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayFourTemp3 = hourTemp(value: 3, hour: hourly)
            dayFourHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayFourCondition3 = hourIcon(value: 3, hour: hourly)
            dayFourIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayFourWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayFourCloudCover3 = hourCloudCover(value: 3, hour: hourly)

            dayFourPrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayFourTemp4 = hourTemp(value: 4, hour: hourly)
            dayFourHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayFourCondition4 = hourIcon(value: 4, hour: hourly)
            dayFourIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayFourWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayFourCloudCover4 = hourCloudCover(value: 4, hour: hourly)

            dayFourPrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayFourTemp5 = hourTemp(value: 5, hour: hourly)
            dayFourHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayFourCondition5 = hourIcon(value: 5, hour: hourly)
            dayFourIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayFourWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayFourCloudCover5 = hourCloudCover(value: 5, hour: hourly)

            dayFourPrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayFourTemp6 = hourTemp(value: 6, hour: hourly)
            dayFourHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayFourCondition6 = hourIcon(value: 6, hour: hourly)
            dayFourIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayFourWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayFourCloudCover6 = hourCloudCover(value: 6, hour: hourly)

            dayFourPrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayFourTemp7 = hourTemp(value: 7, hour: hourly)
            dayFourHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayFourCondition7 = hourIcon(value: 7, hour: hourly)
            dayFourIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayFourWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayFourCloudCover7 = hourCloudCover(value: 7, hour: hourly)
            
            dayFourPrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayFourTemp8 = hourTemp(value: 8, hour: hourly)
            dayFourHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayFourCondition8 = hourIcon(value: 8, hour: hourly)
            dayFourIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayFourWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayFourCloudCover8 = hourCloudCover(value: 8, hour: hourly)
            
            dayFourPrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayFourTemp9 = hourTemp(value: 9, hour: hourly)
            dayFourHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayFourCondition9 = hourIcon(value: 9, hour: hourly)
            dayFourIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayFourWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayFourCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            dayFourPrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayFourTemp10 = hourTemp(value: 10, hour: hourly)
            dayFourHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayFourCondition10 = hourIcon(value: 10, hour: hourly)
            dayFourIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayFourWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayFourCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            dayFourPrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayFourTemp11 = hourTemp(value: 11, hour: hourly)
            dayFourHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayFourCondition11 = hourIcon(value: 11, hour: hourly)
            dayFourIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayFourWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayFourCloudCover11 = hourCloudCover(value: 11, hour: hourly)

            dayFourPrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayFourTemp12 = hourTemp(value: 12, hour: hourly)
            dayFourHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayFourCondition12 = hourIcon(value: 12, hour: hourly)
            dayFourIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayFourWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayFourCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            dayFourPrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayFourTemp13 = hourTemp(value: 13, hour: hourly)
            dayFourHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayFourCondition13 = hourIcon(value: 13, hour: hourly)
            dayFourIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayFourWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayFourCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            dayFourPrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayFourTemp14 = hourTemp(value: 14, hour: hourly)
            dayFourHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayFourCondition14 = hourIcon(value: 14, hour: hourly)
            dayFourIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayFourWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayFourCloudCover14 = hourCloudCover(value: 14, hour: hourly)

            dayFourPrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayFourTemp15 = hourTemp(value: 15, hour: hourly)
            dayFourHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayFourCondition15 = hourIcon(value: 15, hour: hourly)
            dayFourIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayFourWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayFourCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Five
    client.getForecast(location: userLocation, time: dayFiveDate) { result in
        switch result {
        case .success(let forecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let dayFiveArray = daily.data[0]
            let fetchDayFiveArray = dayFiveArray
            
            weatherCondition5 = "\(fetchDayFiveArray.icon!.rawValue)"
            dayFiveDayString = dayFormat(date: fetchDayFiveArray.time)
            dayFiveDateString = dateFormat(date: fetchDayFiveArray.time)
            dayFiveHigh = Int(fetchDayFiveArray.temperatureHigh ?? defaultInteger)
            dayFiveLow = Int(fetchDayFiveArray.temperatureLow ?? defaultInteger)
            dayFiveSummaryString = "\(fetchDayFiveArray.summary ?? "\(defaultString)")"
            dayFiveConditionValue = getDefaultDailyCondition(condition: fetchDayFiveArray)
            dayFivePrecip = dailyPrecipProb(day: fetchDayFiveArray)
            dayFivePrecipAccum = dailyPrecipAccum(day: fetchDayFiveArray)
            dayFiveSunrise = sunFormat(date: fetchDayFiveArray.sunriseTime!)
            dayFiveSunset = sunFormat(date: fetchDayFiveArray.sunsetTime!)
        }
            
        if let hourly = forecast.hourly {
            dayFivePrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayFiveTemp0 = hourTemp(value: 0, hour: hourly)
            dayFiveHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayFiveCondition0 = hourIcon(value: 0, hour: hourly)
            dayFiveIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayFiveWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayFiveCloudCover0 = hourCloudCover(value: 0, hour: hourly)

            dayFivePrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayFiveTemp1 = hourTemp(value: 1, hour: hourly)
            dayFiveHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayFiveCondition1 = hourIcon(value: 1, hour: hourly)
            dayFiveIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayFiveWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayFiveCloudCover1 = hourCloudCover(value: 1, hour: hourly)

            dayFivePrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayFiveTemp2 = hourTemp(value: 2, hour: hourly)
            dayFiveHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayFiveCondition2 = hourIcon(value: 2, hour: hourly)
            dayFiveIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayFiveWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayFiveCloudCover2 = hourCloudCover(value: 2, hour: hourly)

            dayFivePrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayFiveTemp3 = hourTemp(value: 3, hour: hourly)
            dayFiveHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayFiveCondition3 = hourIcon(value: 3, hour: hourly)
            dayFiveIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayFiveWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayFiveCloudCover3 = hourCloudCover(value: 3, hour: hourly)

            dayFivePrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayFiveTemp4 = hourTemp(value: 4, hour: hourly)
            dayFiveHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayFiveCondition4 = hourIcon(value: 4, hour: hourly)
            dayFiveIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayFiveWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayFiveCloudCover4 = hourCloudCover(value: 4, hour: hourly)

            dayFivePrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayFiveTemp5 = hourTemp(value: 5, hour: hourly)
            dayFiveHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayFiveCondition5 = hourIcon(value: 5, hour: hourly)
            dayFiveIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayFiveWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayFiveCloudCover5 = hourCloudCover(value: 5, hour: hourly)

            dayFivePrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayFiveTemp6 = hourTemp(value: 6, hour: hourly)
            dayFiveHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayFiveCondition6 = hourIcon(value: 6, hour: hourly)
            dayFiveIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayFiveWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayFiveCloudCover6 = hourCloudCover(value: 6, hour: hourly)

            dayFivePrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayFiveTemp7 = hourTemp(value: 7, hour: hourly)
            dayFiveHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayFiveCondition7 = hourIcon(value: 7, hour: hourly)
            dayFiveIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayFiveWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayFiveCloudCover7 = hourCloudCover(value: 7, hour: hourly)

            dayFivePrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayFiveTemp8 = hourTemp(value: 8, hour: hourly)
            dayFiveHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayFiveCondition8 = hourIcon(value: 8, hour: hourly)
            dayFiveIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayFiveWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayFiveCloudCover8 = hourCloudCover(value: 8, hour: hourly)

            dayFivePrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayFiveTemp9 = hourTemp(value: 9, hour: hourly)
            dayFiveHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayFiveCondition9 = hourIcon(value: 9, hour: hourly)
            dayFiveIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayFiveWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayFiveCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            dayFivePrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayFiveTemp10 = hourTemp(value: 10, hour: hourly)
            dayFiveHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayFiveCondition10 = hourIcon(value: 10, hour: hourly)
            dayFiveIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayFiveWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayFiveCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            dayFivePrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayFiveTemp11 = hourTemp(value: 11, hour: hourly)
            dayFiveHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayFiveCondition11 = hourIcon(value: 11, hour: hourly)
            dayFiveIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayFiveWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayFiveCloudCover11 = hourCloudCover(value: 11, hour: hourly)

            dayFivePrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayFiveTemp12 = hourTemp(value: 12, hour: hourly)
            dayFiveHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayFiveCondition12 = hourIcon(value: 12, hour: hourly)
            dayFiveIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayFiveWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayFiveCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            dayFivePrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayFiveTemp13 = hourTemp(value: 13, hour: hourly)
            dayFiveHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayFiveCondition13 = hourIcon(value: 13, hour: hourly)
            dayFiveIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayFiveWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayFiveCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            dayFivePrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayFiveTemp14 = hourTemp(value: 14, hour: hourly)
            dayFiveHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayFiveCondition14 = hourIcon(value: 14, hour: hourly)
            dayFiveIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayFiveWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayFiveCloudCover14 = hourCloudCover(value: 14, hour: hourly)
 
            dayFivePrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayFiveTemp15 = hourTemp(value: 15, hour: hourly)
            dayFiveHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayFiveCondition15 = hourIcon(value: 15, hour: hourly)
            dayFiveIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayFiveWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayFiveCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Six
    client.getForecast(location: userLocation, time: daySixDate) { result in
        switch result {
        case .success(let forecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let daySixArray = daily.data[0]
            let fetchDaySixArray = daySixArray
            
            weatherCondition6 = "\(fetchDaySixArray.icon!.rawValue)"
            daySixDayString = dayFormat(date: fetchDaySixArray.time)
            daySixDateString = dateFormat(date: fetchDaySixArray.time)
            daySixHigh = Int(fetchDaySixArray.temperatureHigh ?? defaultInteger)
            daySixLow = Int(fetchDaySixArray.temperatureLow ?? defaultInteger)
            daySixSummaryString = "\(fetchDaySixArray.summary ?? "\(defaultString)")"
            daySixConditionValue = getDefaultDailyCondition(condition: fetchDaySixArray)
            daySixPrecip = dailyPrecipProb(day: fetchDaySixArray)
            daySixPrecipAccum = dailyPrecipAccum(day: fetchDaySixArray)
            daySixSunrise = sunFormat(date: fetchDaySixArray.sunriseTime!)
            daySixSunset = sunFormat(date: fetchDaySixArray.sunsetTime!)
        }
            
        if let hourly = forecast.hourly {
            daySixPrecip0 = hourPrecipProb(value: 0, hour: hourly)
            daySixTemp0 = hourTemp(value: 0, hour: hourly)
            daySixHumidity0 = hourHumidity(value: 0, hour: hourly)
            daySixCondition0 = hourIcon(value: 0, hour: hourly)
            daySixIndex0 = hourUVIndex(value: 0, hour: hourly)
            daySixWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            daySixCloudCover0 = hourCloudCover(value: 0, hour: hourly)

            daySixPrecip1 = hourPrecipProb(value: 1, hour: hourly)
            daySixTemp1 = hourTemp(value: 1, hour: hourly)
            daySixHumidity1 = hourHumidity(value: 1, hour: hourly)
            daySixCondition1 = hourIcon(value: 1, hour: hourly)
            daySixIndex1 = hourUVIndex(value: 1, hour: hourly)
            daySixWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            daySixCloudCover1 = hourCloudCover(value: 1, hour: hourly)

            daySixPrecip2 = hourPrecipProb(value: 2, hour: hourly)
            daySixTemp2 = hourTemp(value: 2, hour: hourly)
            daySixHumidity2 = hourHumidity(value: 2, hour: hourly)
            daySixCondition2 = hourIcon(value: 2, hour: hourly)
            daySixIndex2 = hourUVIndex(value: 2, hour: hourly)
            daySixWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            daySixCloudCover2 = hourCloudCover(value: 2, hour: hourly)

            daySixPrecip3 = hourPrecipProb(value: 3, hour: hourly)
            daySixTemp3 = hourTemp(value: 3, hour: hourly)
            daySixHumidity3 = hourHumidity(value: 3, hour: hourly)
            daySixCondition3 = hourIcon(value: 3, hour: hourly)
            daySixIndex3 = hourUVIndex(value: 3, hour: hourly)
            daySixWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            daySixCloudCover3 = hourCloudCover(value: 3, hour: hourly)

            daySixPrecip4 = hourPrecipProb(value: 4, hour: hourly)
            daySixTemp4 = hourTemp(value: 4, hour: hourly)
            daySixHumidity4 = hourHumidity(value: 4, hour: hourly)
            daySixCondition4 = hourIcon(value: 4, hour: hourly)
            daySixIndex4 = hourUVIndex(value: 4, hour: hourly)
            daySixWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            daySixCloudCover4 = hourCloudCover(value: 4, hour: hourly)

            daySixPrecip5 = hourPrecipProb(value: 5, hour: hourly)
            daySixTemp5 = hourTemp(value: 5, hour: hourly)
            daySixHumidity5 = hourHumidity(value: 5, hour: hourly)
            daySixCondition5 = hourIcon(value: 5, hour: hourly)
            daySixIndex5 = hourUVIndex(value: 5, hour: hourly)
            daySixWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            daySixCloudCover5 = hourCloudCover(value: 5, hour: hourly)

            daySixPrecip6 = hourPrecipProb(value: 6, hour: hourly)
            daySixTemp6 = hourTemp(value: 6, hour: hourly)
            daySixHumidity6 = hourHumidity(value: 6, hour: hourly)
            daySixCondition6 = hourIcon(value: 6, hour: hourly)
            daySixIndex6 = hourUVIndex(value: 6, hour: hourly)
            daySixWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            daySixCloudCover6 = hourCloudCover(value: 6, hour: hourly)

            daySixPrecip7 = hourPrecipProb(value: 7, hour: hourly)
            daySixTemp7 = hourTemp(value: 7, hour: hourly)
            daySixHumidity7 = hourHumidity(value: 7, hour: hourly)
            daySixCondition7 = hourIcon(value: 7, hour: hourly)
            daySixIndex7 = hourUVIndex(value: 7, hour: hourly)
            daySixWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            daySixCloudCover7 = hourCloudCover(value: 7, hour: hourly)

            daySixPrecip8 = hourPrecipProb(value: 8, hour: hourly)
            daySixTemp8 = hourTemp(value: 8, hour: hourly)
            daySixHumidity8 = hourHumidity(value: 8, hour: hourly)
            daySixCondition8 = hourIcon(value: 8, hour: hourly)
            daySixIndex8 = hourUVIndex(value: 8, hour: hourly)
            daySixWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            daySixCloudCover8 = hourCloudCover(value: 8, hour: hourly)

            daySixPrecip9 = hourPrecipProb(value: 9, hour: hourly)
            daySixTemp9 = hourTemp(value: 9, hour: hourly)
            daySixHumidity9 = hourHumidity(value: 9, hour: hourly)
            daySixCondition9 = hourIcon(value: 9, hour: hourly)
            daySixIndex9 = hourUVIndex(value: 9, hour: hourly)
            daySixWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            daySixCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            daySixPrecip10 = hourPrecipProb(value: 10, hour: hourly)
            daySixTemp10 = hourTemp(value: 10, hour: hourly)
            daySixHumidity10 = hourHumidity(value: 10, hour: hourly)
            daySixCondition10 = hourIcon(value: 10, hour: hourly)
            daySixIndex10 = hourUVIndex(value: 10, hour: hourly)
            daySixWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            daySixCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            daySixPrecip11 = hourPrecipProb(value: 11, hour: hourly)
            daySixTemp11 = hourTemp(value: 11, hour: hourly)
            daySixHumidity11 = hourHumidity(value: 11, hour: hourly)
            daySixCondition11 = hourIcon(value: 11, hour: hourly)
            daySixIndex11 = hourUVIndex(value: 11, hour: hourly)
            daySixWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            daySixCloudCover11 = hourCloudCover(value: 11, hour: hourly)

            daySixPrecip12 = hourPrecipProb(value: 12, hour: hourly)
            daySixTemp12 = hourTemp(value: 12, hour: hourly)
            daySixHumidity12 = hourHumidity(value: 12, hour: hourly)
            daySixCondition12 = hourIcon(value: 12, hour: hourly)
            daySixIndex12 = hourUVIndex(value: 12, hour: hourly)
            daySixWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            daySixCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            daySixPrecip13 = hourPrecipProb(value: 13, hour: hourly)
            daySixTemp13 = hourTemp(value: 13, hour: hourly)
            daySixHumidity13 = hourHumidity(value: 13, hour: hourly)
            daySixCondition13 = hourIcon(value: 13, hour: hourly)
            daySixIndex13 = hourUVIndex(value: 13, hour: hourly)
            daySixWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            daySixCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            daySixPrecip14 = hourPrecipProb(value: 14, hour: hourly)
            daySixTemp14 = hourTemp(value: 14, hour: hourly)
            daySixHumidity14 = hourHumidity(value: 14, hour: hourly)
            daySixCondition14 = hourIcon(value: 14, hour: hourly)
            daySixIndex14 = hourUVIndex(value: 14, hour: hourly)
            daySixWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            daySixCloudCover14 = hourCloudCover(value: 14, hour: hourly)
            
            daySixPrecip15 = hourPrecipProb(value: 15, hour: hourly)
            daySixTemp15 = hourTemp(value: 15, hour: hourly)
            daySixHumidity15 = hourHumidity(value: 15, hour: hourly)
            daySixCondition15 = hourIcon(value: 15, hour: hourly)
            daySixIndex15 = hourUVIndex(value: 15, hour: hourly)
            daySixWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            daySixCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Seven
    client.getForecast(location: userLocation, time: daySevenDate) { result in
        switch result {
        case .success(let forecast, _):
            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
            
        if let daily = forecast.daily {
            let daySevenArray = daily.data[0]
            let fetchDaySevenArray = daySevenArray
            
            weatherCondition7 = "\(fetchDaySevenArray.icon!.rawValue)"
            daySevenDayString = dayFormat(date: fetchDaySevenArray.time)
            daySevenDateString = dateFormat(date: fetchDaySevenArray.time)
            daySevenHigh = Int(fetchDaySevenArray.temperatureHigh ?? defaultInteger)
            daySevenLow = Int(fetchDaySevenArray.temperatureLow ?? defaultInteger)
            daySevenSummaryString = "\(fetchDaySevenArray.summary ?? "\(defaultString)")"
            daySevenConditionValue = getDefaultDailyCondition(condition: fetchDaySevenArray)
            daySevenPrecip = dailyPrecipProb(day: fetchDaySevenArray)
            daySevenPrecipAccum = dailyPrecipAccum(day: fetchDaySevenArray)
            daySevenSunrise = sunFormat(date: fetchDaySevenArray.sunriseTime!)
            daySevenSunset = sunFormat(date: fetchDaySevenArray.sunsetTime!)
        }
            
        if let hourly = forecast.hourly {
            daySevenPrecip0 = hourPrecipProb(value: 0, hour: hourly)
            daySevenTemp0 = hourTemp(value: 0, hour: hourly)
            daySevenHumidity0 = hourHumidity(value: 0, hour: hourly)
            daySevenCondition0 = hourIcon(value: 0, hour: hourly)
            daySevenIndex0 = hourUVIndex(value: 0, hour: hourly)
            daySevenWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            daySevenCloudCover0 = hourCloudCover(value: 0, hour: hourly)

            daySevenPrecip1 = hourPrecipProb(value: 1, hour: hourly)
            daySevenTemp1 = hourTemp(value: 1, hour: hourly)
            daySevenHumidity1 = hourHumidity(value: 1, hour: hourly)
            daySevenCondition1 = hourIcon(value: 1, hour: hourly)
            daySevenIndex1 = hourUVIndex(value: 1, hour: hourly)
            daySevenWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            daySevenCloudCover1 = hourCloudCover(value: 1, hour: hourly)

            daySevenPrecip2 = hourPrecipProb(value: 2, hour: hourly)
            daySevenTemp2 = hourTemp(value: 2, hour: hourly)
            daySevenHumidity2 = hourHumidity(value: 2, hour: hourly)
            daySevenCondition2 = hourIcon(value: 2, hour: hourly)
            daySevenIndex2 = hourUVIndex(value: 2, hour: hourly)
            daySevenWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            daySevenCloudCover2 = hourCloudCover(value: 2, hour: hourly)

            daySevenPrecip3 = hourPrecipProb(value: 3, hour: hourly)
            daySevenTemp3 = hourTemp(value: 3, hour: hourly)
            daySevenHumidity3 = hourHumidity(value: 3, hour: hourly)
            daySevenCondition3 = hourIcon(value: 3, hour: hourly)
            daySevenIndex3 = hourUVIndex(value: 3, hour: hourly)
            daySevenWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            daySevenCloudCover3 = hourCloudCover(value: 3, hour: hourly)

            daySevenPrecip4 = hourPrecipProb(value: 4, hour: hourly)
            daySevenTemp4 = hourTemp(value: 4, hour: hourly)
            daySevenHumidity4 = hourHumidity(value: 4, hour: hourly)
            daySevenCondition4 = hourIcon(value: 4, hour: hourly)
            daySevenIndex4 = hourUVIndex(value: 4, hour: hourly)
            daySevenWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            daySevenCloudCover4 = hourCloudCover(value: 4, hour: hourly)

            daySevenPrecip5 = hourPrecipProb(value: 5, hour: hourly)
            daySevenTemp5 = hourTemp(value: 5, hour: hourly)
            daySevenHumidity5 = hourHumidity(value: 5, hour: hourly)
            daySevenCondition5 = hourIcon(value: 5, hour: hourly)
            daySevenIndex5 = hourUVIndex(value: 5, hour: hourly)
            daySevenWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            daySevenCloudCover5 = hourCloudCover(value: 5, hour: hourly)

            daySevenPrecip6 = hourPrecipProb(value: 6, hour: hourly)
            daySevenTemp6 = hourTemp(value: 6, hour: hourly)
            daySevenHumidity6 = hourHumidity(value: 6, hour: hourly)
            daySevenCondition6 = hourIcon(value: 6, hour: hourly)
            daySevenIndex6 = hourUVIndex(value: 6, hour: hourly)
            daySevenWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            daySevenCloudCover6 = hourCloudCover(value: 6, hour: hourly)

            daySevenPrecip7 = hourPrecipProb(value: 7, hour: hourly)
            daySevenTemp7 = hourTemp(value: 7, hour: hourly)
            daySevenHumidity7 = hourHumidity(value: 7, hour: hourly)
            daySevenCondition7 = hourIcon(value: 7, hour: hourly)
            daySevenIndex7 = hourUVIndex(value: 7, hour: hourly)
            daySevenWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            daySevenCloudCover7 = hourCloudCover(value: 7, hour: hourly)

            daySevenPrecip8 = hourPrecipProb(value: 8, hour: hourly)
            daySevenTemp8 = hourTemp(value: 8, hour: hourly)
            daySevenHumidity8 = hourHumidity(value: 8, hour: hourly)
            daySevenCondition8 = hourIcon(value: 8, hour: hourly)
            daySevenIndex8 = hourUVIndex(value: 8, hour: hourly)
            daySevenWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            daySevenCloudCover8 = hourCloudCover(value: 8, hour: hourly)

            daySevenPrecip9 = hourPrecipProb(value: 9, hour: hourly)
            daySevenTemp9 = hourTemp(value: 9, hour: hourly)
            daySevenHumidity9 = hourHumidity(value: 9, hour: hourly)
            daySevenCondition9 = hourIcon(value: 9, hour: hourly)
            daySevenIndex9 = hourUVIndex(value: 9, hour: hourly)
            daySevenWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            daySevenCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            daySevenPrecip10 = hourPrecipProb(value: 10, hour: hourly)
            daySevenTemp10 = hourTemp(value: 10, hour: hourly)
            daySevenHumidity10 = hourHumidity(value: 10, hour: hourly)
            daySevenCondition10 = hourIcon(value: 10, hour: hourly)
            daySevenIndex10 = hourUVIndex(value: 10, hour: hourly)
            daySevenWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            daySevenCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            daySevenPrecip11 = hourPrecipProb(value: 11, hour: hourly)
            daySevenTemp11 = hourTemp(value: 11, hour: hourly)
            daySevenHumidity11 = hourHumidity(value: 11, hour: hourly)
            daySevenCondition11 = hourIcon(value: 11, hour: hourly)
            daySevenIndex11 = hourUVIndex(value: 11, hour: hourly)
            daySevenWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            daySevenCloudCover11 = hourCloudCover(value: 11, hour: hourly)

            daySevenPrecip12 = hourPrecipProb(value: 12, hour: hourly)
            daySevenTemp12 = hourTemp(value: 12, hour: hourly)
            daySevenHumidity12 = hourHumidity(value: 12, hour: hourly)
            daySevenCondition12 = hourIcon(value: 12, hour: hourly)
            daySevenIndex12 = hourUVIndex(value: 12, hour: hourly)
            daySevenWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            daySevenCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            daySevenPrecip13 = hourPrecipProb(value: 13, hour: hourly)
            daySevenTemp13 = hourTemp(value: 13, hour: hourly)
            daySevenHumidity13 = hourHumidity(value: 13, hour: hourly)
            daySevenCondition13 = hourIcon(value: 13, hour: hourly)
            daySevenIndex13 = hourUVIndex(value: 13, hour: hourly)
            daySevenWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            daySevenCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            daySevenPrecip14 = hourPrecipProb(value: 14, hour: hourly)
            daySevenTemp14 = hourTemp(value: 14, hour: hourly)
            daySevenHumidity14 = hourHumidity(value: 14, hour: hourly)
            daySevenCondition14 = hourIcon(value: 14, hour: hourly)
            daySevenIndex14 = hourUVIndex(value: 14, hour: hourly)
            daySevenWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            daySevenCloudCover14 = hourCloudCover(value: 14, hour: hourly)

            daySevenPrecip15 = hourPrecipProb(value: 15, hour: hourly)
            daySevenTemp15 = hourTemp(value: 15, hour: hourly)
            daySevenHumidity15 = hourHumidity(value: 15, hour: hourly)
            daySevenCondition15 = hourIcon(value: 15, hour: hourly)
            daySevenIndex15 = hourUVIndex(value: 15, hour: hourly)
            daySevenWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            daySevenCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Eight
    client.getForecast(location: userLocation, time: dayEightDate) { result in
        switch result {
        case .success(let forecast, _):
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!

        if let daily = forecast.daily {
            let dayEightArray = daily.data[0]
            let fetchDayEightArray = dayEightArray

            weatherCondition8 = "\(fetchDayEightArray.icon!.rawValue)"
            dayEightDayString = dayFormat(date: fetchDayEightArray.time)
            dayEightDateString = dateFormat(date: fetchDayEightArray.time)
            dayEightHigh = Int(fetchDayEightArray.temperatureHigh ?? defaultInteger)
            dayEightLow = Int(fetchDayEightArray.temperatureLow ?? defaultInteger)
            dayEightSummaryString = "\(fetchDayEightArray.summary ?? "\(defaultString)")"
            dayEightConditionValue = getDefaultDailyCondition(condition: fetchDayEightArray)
            dayEightPrecip = dailyPrecipProb(day: fetchDayEightArray)
            dayEightPrecipAccum = dailyPrecipAccum(day: fetchDayEightArray)
            dayEightSunrise = sunFormat(date: fetchDayEightArray.sunriseTime!)
            dayEightSunset = sunFormat(date: fetchDayEightArray.sunsetTime!)
        }
        
        if let hourly = forecast.hourly {
            dayEightPrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayEightTemp0 = hourTemp(value: 0, hour: hourly)
            dayEightHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayEightCondition0 = hourIcon(value: 0, hour: hourly)
            dayEightIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayEightWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayEightCloudCover0 = hourCloudCover(value: 0, hour: hourly)

            dayEightPrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayEightTemp1 = hourTemp(value: 1, hour: hourly)
            dayEightHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayEightCondition1 = hourIcon(value: 1, hour: hourly)
            dayEightIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayEightWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayEightCloudCover1 = hourCloudCover(value: 1, hour: hourly)

            dayEightPrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayEightTemp2 = hourTemp(value: 2, hour: hourly)
            dayEightHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayEightCondition2 = hourIcon(value: 2, hour: hourly)
            dayEightIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayEightWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayEightCloudCover2 = hourCloudCover(value: 2, hour: hourly)

            dayEightPrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayEightTemp3 = hourTemp(value: 3, hour: hourly)
            dayEightHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayEightCondition3 = hourIcon(value: 3, hour: hourly)
            dayEightIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayEightWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayEightCloudCover3 = hourCloudCover(value: 3, hour: hourly)

            dayEightPrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayEightTemp4 = hourTemp(value: 4, hour: hourly)
            dayEightHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayEightCondition4 = hourIcon(value: 4, hour: hourly)
            dayEightIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayEightWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayEightCloudCover4 = hourCloudCover(value: 4, hour: hourly)

            dayEightPrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayEightTemp5 = hourTemp(value: 5, hour: hourly)
            dayEightHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayEightCondition5 = hourIcon(value: 5, hour: hourly)
            dayEightIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayEightWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayEightCloudCover5 = hourCloudCover(value: 5, hour: hourly)

            dayEightPrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayEightTemp6 = hourTemp(value: 6, hour: hourly)
            dayEightHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayEightCondition6 = hourIcon(value: 6, hour: hourly)
            dayEightIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayEightWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayEightCloudCover6 = hourCloudCover(value: 6, hour: hourly)

            dayEightPrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayEightTemp7 = hourTemp(value: 7, hour: hourly)
            dayEightHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayEightCondition7 = hourIcon(value: 7, hour: hourly)
            dayEightIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayEightWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayEightCloudCover7 = hourCloudCover(value: 7, hour: hourly)

            dayEightPrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayEightTemp8 = hourTemp(value: 8, hour: hourly)
            dayEightHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayEightCondition8 = hourIcon(value: 8, hour: hourly)
            dayEightIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayEightWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayEightCloudCover8 = hourCloudCover(value: 8, hour: hourly)

            dayEightPrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayEightTemp9 = hourTemp(value: 9, hour: hourly)
            dayEightHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayEightCondition9 = hourIcon(value: 9, hour: hourly)
            dayEightIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayEightWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayEightCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            dayEightPrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayEightTemp10 = hourTemp(value: 10, hour: hourly)
            dayEightHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayEightCondition10 = hourIcon(value: 10, hour: hourly)
            dayEightIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayEightWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayEightCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            dayEightPrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayEightTemp11 = hourTemp(value: 11, hour: hourly)
            dayEightHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayEightCondition11 = hourIcon(value: 11, hour: hourly)
            dayEightIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayEightWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayEightCloudCover11 = hourCloudCover(value: 11, hour: hourly)
            
            dayEightPrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayEightTemp12 = hourTemp(value: 12, hour: hourly)
            dayEightHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayEightCondition12 = hourIcon(value: 12, hour: hourly)
            dayEightIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayEightWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayEightCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            dayEightPrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayEightTemp13 = hourTemp(value: 13, hour: hourly)
            dayEightHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayEightCondition13 = hourIcon(value: 13, hour: hourly)
            dayEightIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayEightWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayEightCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            dayEightPrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayEightTemp14 = hourTemp(value: 14, hour: hourly)
            dayEightHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayEightCondition14 = hourIcon(value: 14, hour: hourly)
            dayEightIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayEightWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayEightCloudCover14 = hourCloudCover(value: 14, hour: hourly)

            dayEightPrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayEightTemp15 = hourTemp(value: 15, hour: hourly)
            dayEightHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayEightCondition15 = hourIcon(value: 15, hour: hourly)
            dayEightIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayEightWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayEightCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
            
    // MARK: - Time Machine Day Nine
    client.getForecast(location: userLocation, time: dayNineDate) { result in
    switch result {
    case .success(let forecast, _):
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!

        if let daily = forecast.daily {
            let dayNineArray = daily.data[0]
            let fetchDayNineArray = dayNineArray

            weatherCondition9 = "\(fetchDayNineArray.icon!.rawValue)"
            dayNineDayString = dayFormat(date: fetchDayNineArray.time)
            dayNineDateString = dateFormat(date: fetchDayNineArray.time)
            dayNineHigh = Int(fetchDayNineArray.temperatureHigh ?? defaultInteger)
            dayNineLow = Int(fetchDayNineArray.temperatureLow ?? defaultInteger)
            dayNineSummaryString = "\(fetchDayNineArray.summary ?? "\(defaultString)")"
            dayNineConditionValue = getDefaultDailyCondition(condition: fetchDayNineArray)
            dayNinePrecip = dailyPrecipProb(day: fetchDayNineArray)
            dayNinePrecipAccum = dailyPrecipAccum(day: fetchDayNineArray)
            dayNineSunrise = sunFormat(date: fetchDayNineArray.sunriseTime!)
            dayNineSunset = sunFormat(date: fetchDayNineArray.sunsetTime!)
        }
        
        if let hourly = forecast.hourly {
            dayNinePrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayNineTemp0 = hourTemp(value: 0, hour: hourly)
            dayNineHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayNineCondition0 = hourIcon(value: 0, hour: hourly)
            dayNineIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayNineWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayNineCloudCover0 = hourCloudCover(value: 0, hour: hourly)

            dayNinePrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayNineTemp1 = hourTemp(value: 1, hour: hourly)
            dayNineHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayNineCondition1 = hourIcon(value: 1, hour: hourly)
            dayNineIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayNineWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayNineCloudCover1 = hourCloudCover(value: 1, hour: hourly)

            dayNinePrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayNineTemp2 = hourTemp(value: 2, hour: hourly)
            dayNineHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayNineCondition2 = hourIcon(value: 2, hour: hourly)
            dayNineIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayNineWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayNineCloudCover2 = hourCloudCover(value: 2, hour: hourly)

            dayNinePrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayNineTemp3 = hourTemp(value: 3, hour: hourly)
            dayNineHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayNineCondition3 = hourIcon(value: 3, hour: hourly)
            dayNineIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayNineWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayNineCloudCover3 = hourCloudCover(value: 3, hour: hourly)

            dayNinePrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayNineTemp4 = hourTemp(value: 4, hour: hourly)
            dayNineHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayNineCondition4 = hourIcon(value: 4, hour: hourly)
            dayNineIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayNineWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayNineCloudCover4 = hourCloudCover(value: 4, hour: hourly)

            dayNinePrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayNineTemp5 = hourTemp(value: 5, hour: hourly)
            dayNineHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayNineCondition5 = hourIcon(value: 5, hour: hourly)
            dayNineIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayNineWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayNineCloudCover5 = hourCloudCover(value: 5, hour: hourly)

            dayNinePrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayNineTemp6 = hourTemp(value: 6, hour: hourly)
            dayNineHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayNineCondition6 = hourIcon(value: 6, hour: hourly)
            dayNineIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayNineWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayNineCloudCover6 = hourCloudCover(value: 6, hour: hourly)

            dayNinePrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayNineTemp7 = hourTemp(value: 7, hour: hourly)
            dayNineHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayNineCondition7 = hourIcon(value: 7, hour: hourly)
            dayNineIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayNineWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayNineCloudCover7 = hourCloudCover(value: 7, hour: hourly)

            dayNinePrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayNineTemp8 = hourTemp(value: 8, hour: hourly)
            dayNineHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayNineCondition8 = hourIcon(value: 8, hour: hourly)
            dayNineIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayNineWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayNineCloudCover8 = hourCloudCover(value: 8, hour: hourly)

            dayNinePrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayNineTemp9 = hourTemp(value: 9, hour: hourly)
            dayNineHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayNineCondition9 = hourIcon(value: 9, hour: hourly)
            dayNineIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayNineWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayNineCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            dayNinePrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayNineTemp10 = hourTemp(value: 10, hour: hourly)
            dayNineHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayNineCondition10 = hourIcon(value: 10, hour: hourly)
            dayNineIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayNineWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayNineCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            dayNinePrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayNineTemp11 = hourTemp(value: 11, hour: hourly)
            dayNineHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayNineCondition11 = hourIcon(value: 11, hour: hourly)
            dayNineIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayNineWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayNineCloudCover11 = hourCloudCover(value: 11, hour: hourly)

            dayNinePrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayNineTemp12 = hourTemp(value: 12, hour: hourly)
            dayNineHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayNineCondition12 = hourIcon(value: 12, hour: hourly)
            dayNineIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayNineWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayNineCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            dayNinePrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayNineTemp13 = hourTemp(value: 13, hour: hourly)
            dayNineHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayNineCondition13 = hourIcon(value: 13, hour: hourly)
            dayNineIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayNineWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayNineCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            dayNinePrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayNineTemp14 = hourTemp(value: 14, hour: hourly)
            dayNineHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayNineCondition14 = hourIcon(value: 14, hour: hourly)
            dayNineIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayNineWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayNineCloudCover14 = hourCloudCover(value: 14, hour: hourly)

            dayNinePrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayNineTemp15 = hourTemp(value: 15, hour: hourly)
            dayNineHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayNineCondition15 = hourIcon(value: 15, hour: hourly)
            dayNineIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayNineWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayNineCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }

    // MARK: - Time Machine Day Ten
    client.getForecast(location: userLocation, time: dayTenDate) { result in
    switch result {
    case .success(let forecast, _):
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
        
        if let daily = forecast.daily {
            let dayTenArray = daily.data[0]
            let fetchDayTenArray = dayTenArray

            weatherCondition10 = "\(fetchDayTenArray.icon!.rawValue)"
            dayTenDayString = dayFormat(date: fetchDayTenArray.time)
            dayTenDateString = dateFormat(date: fetchDayTenArray.time)
            dayTenHigh = Int(fetchDayTenArray.temperatureHigh ?? defaultInteger)
            dayTenLow = Int(fetchDayTenArray.temperatureLow ?? defaultInteger)
            dayTenSummaryString = "\(fetchDayTenArray.summary ?? "\(defaultString)")"
            dayTenConditionValue = getDefaultDailyCondition(condition: fetchDayTenArray)
            dayTenPrecip = dailyPrecipProb(day: fetchDayTenArray)
            dayTenPrecipAccum = dailyPrecipAccum(day: fetchDayTenArray)
            dayTenSunrise = sunFormat(date: fetchDayTenArray.sunriseTime!)
            dayTenSunset = sunFormat(date: fetchDayTenArray.sunsetTime!)
        }
        if let hourly = forecast.hourly {
            if hourly.data.count < 24 {
                dayTenPrecip0 = hourPrecipProb(value: 0, hour: hourly)
                dayTenTemp0 = hourTemp(value: 0, hour: hourly)
                dayTenHumidity0 = hourHumidity(value: 0, hour: hourly)
                dayTenCondition0 = hourIcon(value: 0, hour: hourly)
                dayTenIndex0 = hourUVIndex(value: 0, hour: hourly)
                dayTenWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
                dayTenCloudCover0 = hourCloudCover(value: 0, hour: hourly)

                dayTenPrecip1 = hourPrecipProb(value: 1, hour: hourly)
                dayTenTemp1 = hourTemp(value: 1, hour: hourly)
                dayTenHumidity1 = hourHumidity(value: 1, hour: hourly)
                dayTenCondition1 = hourIcon(value: 1, hour: hourly)
                dayTenIndex1 = hourUVIndex(value: 1, hour: hourly)
                dayTenWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
                dayTenCloudCover1 = hourCloudCover(value: 1, hour: hourly)

                dayTenPrecip2 = hourPrecipProb(value: 2, hour: hourly)
                dayTenTemp2 = hourTemp(value: 2, hour: hourly)
                dayTenHumidity2 = hourHumidity(value: 2, hour: hourly)
                dayTenCondition2 = hourIcon(value: 2, hour: hourly)
                dayTenIndex2 = hourUVIndex(value: 2, hour: hourly)
                dayTenWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
                dayTenCloudCover2 = hourCloudCover(value: 2, hour: hourly)

                dayTenPrecip3 = hourPrecipProb(value: 3, hour: hourly)
                dayTenTemp3 = hourTemp(value: 3, hour: hourly)
                dayTenHumidity3 = hourHumidity(value: 3, hour: hourly)
                dayTenCondition3 = hourIcon(value: 3, hour: hourly)
                dayTenIndex3 = hourUVIndex(value: 3, hour: hourly)
                dayTenWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
                dayTenCloudCover3 = hourCloudCover(value: 3, hour: hourly)

                dayTenPrecip4 = hourPrecipProb(value: 0, hour: hourly)
                dayTenTemp4 = hourTemp(value: 0, hour: hourly)
                dayTenHumidity4 = hourHumidity(value: 0, hour: hourly)
                dayTenCondition4 = hourIcon(value: 0, hour: hourly)
                dayTenIndex4 = hourUVIndex(value: 0, hour: hourly)
                dayTenWindSpeed4 = hourWindSpeed(value: 0, hour: hourly)
                dayTenCloudCover4 = hourCloudCover(value: 0, hour: hourly)

                dayTenPrecip5 = hourPrecipProb(value: 1, hour: hourly)
                dayTenTemp5 = hourTemp(value: 1, hour: hourly)
                dayTenHumidity5 = hourHumidity(value: 1, hour: hourly)
                dayTenCondition5 = hourIcon(value: 1, hour: hourly)
                dayTenIndex5 = hourUVIndex(value: 1, hour: hourly)
                dayTenWindSpeed5 = hourWindSpeed(value: 1, hour: hourly)
                dayTenCloudCover5 = hourCloudCover(value: 1, hour: hourly)

                dayTenPrecip6 = hourPrecipProb(value: 2, hour: hourly)
                dayTenTemp6 = hourTemp(value: 2, hour: hourly)
                dayTenHumidity6 = hourHumidity(value: 2, hour: hourly)
                dayTenCondition6 = hourIcon(value: 2, hour: hourly)
                dayTenIndex6 = hourUVIndex(value: 2, hour: hourly)
                dayTenWindSpeed6 = hourWindSpeed(value: 2, hour: hourly)
                dayTenCloudCover6 = hourCloudCover(value: 2, hour: hourly)

                dayTenPrecip7 = hourPrecipProb(value: 3, hour: hourly)
                dayTenTemp7 = hourTemp(value: 3, hour: hourly)
                dayTenHumidity7 = hourHumidity(value: 3, hour: hourly)
                dayTenCondition7 = hourIcon(value: 3, hour: hourly)
                dayTenIndex7 = hourUVIndex(value: 3, hour: hourly)
                dayTenWindSpeed7 = hourWindSpeed(value: 3, hour: hourly)
                dayTenCloudCover7 = hourCloudCover(value: 3, hour: hourly)

                dayTenPrecip8 = hourPrecipProb(value: 0, hour: hourly)
                dayTenTemp8 = hourTemp(value: 0, hour: hourly)
                dayTenHumidity8 = hourHumidity(value: 0, hour: hourly)
                dayTenCondition8 = hourIcon(value: 0, hour: hourly)
                dayTenIndex8 = hourUVIndex(value: 0, hour: hourly)
                dayTenWindSpeed8 = hourWindSpeed(value: 0, hour: hourly)
                dayTenCloudCover8 = hourCloudCover(value: 0, hour: hourly)

                dayTenPrecip9 = hourPrecipProb(value: 1, hour: hourly)
                dayTenTemp9 = hourTemp(value: 1, hour: hourly)
                dayTenHumidity9 = hourHumidity(value: 1, hour: hourly)
                dayTenCondition9 = hourIcon(value: 1, hour: hourly)
                dayTenIndex9 = hourUVIndex(value: 1, hour: hourly)
                dayTenWindSpeed9 = hourWindSpeed(value: 1, hour: hourly)
                dayTenCloudCover9 = hourCloudCover(value: 1, hour: hourly)

                dayTenPrecip10 = hourPrecipProb(value: 2, hour: hourly)
                dayTenTemp10 = hourTemp(value: 2, hour: hourly)
                dayTenHumidity10 = hourHumidity(value: 2, hour: hourly)
                dayTenCondition10 = hourIcon(value: 2, hour: hourly)
                dayTenIndex10 = hourUVIndex(value: 2, hour: hourly)
                dayTenWindSpeed10 = hourWindSpeed(value: 2, hour: hourly)
                dayTenCloudCover10 = hourCloudCover(value: 2, hour: hourly)

                dayTenPrecip11 = hourPrecipProb(value: 3, hour: hourly)
                dayTenTemp11 = hourTemp(value: 3, hour: hourly)
                dayTenHumidity11 = hourHumidity(value: 3, hour: hourly)
                dayTenCondition11 = hourIcon(value: 3, hour: hourly)
                dayTenIndex11 = hourUVIndex(value: 3, hour: hourly)
                dayTenWindSpeed11 = hourWindSpeed(value: 3, hour: hourly)
                dayTenCloudCover11 = hourCloudCover(value: 3, hour: hourly)

                dayTenPrecip12 = hourPrecipProb(value: 0, hour: hourly)
                dayTenTemp12 = hourTemp(value: 0, hour: hourly)
                dayTenHumidity12 = hourHumidity(value: 0, hour: hourly)
                dayTenCondition12 = hourIcon(value: 0, hour: hourly)
                dayTenIndex12 = hourUVIndex(value: 0, hour: hourly)
                dayTenWindSpeed12 = hourWindSpeed(value: 0, hour: hourly)
                dayTenCloudCover12 = hourCloudCover(value: 0, hour: hourly)

                dayTenPrecip13 = hourPrecipProb(value: 1, hour: hourly)
                dayTenTemp13 = hourTemp(value: 1, hour: hourly)
                dayTenHumidity13 = hourHumidity(value: 1, hour: hourly)
                dayTenCondition13 = hourIcon(value: 1, hour: hourly)
                dayTenIndex13 = hourUVIndex(value: 1, hour: hourly)
                dayTenWindSpeed13 = hourWindSpeed(value: 1, hour: hourly)
                dayTenCloudCover13 = hourCloudCover(value: 1, hour: hourly)

                dayTenPrecip14 = hourPrecipProb(value: 2, hour: hourly)
                dayTenTemp14 = hourTemp(value: 2, hour: hourly)
                dayTenHumidity14 = hourHumidity(value: 2, hour: hourly)
                dayTenCondition14 = hourIcon(value: 2, hour: hourly)
                dayTenIndex14 = hourUVIndex(value: 2, hour: hourly)
                dayTenWindSpeed14 = hourWindSpeed(value: 2, hour: hourly)
                dayTenCloudCover14 = hourCloudCover(value: 2, hour: hourly)

                dayTenPrecip15 = hourPrecipProb(value: 3, hour: hourly)
                dayTenTemp15 = hourTemp(value: 3, hour: hourly)
                dayTenHumidity15 = hourHumidity(value: 3, hour: hourly)
                dayTenCondition15 = hourIcon(value: 3, hour: hourly)
                dayTenIndex15 = hourUVIndex(value: 3, hour: hourly)
                dayTenWindSpeed15 = hourWindSpeed(value: 3, hour: hourly)
                dayTenCloudCover15 = hourCloudCover(value: 3, hour: hourly)
            } else {
                dayTenPrecip0 = hourPrecipProb(value: 0, hour: hourly)
                dayTenTemp0 = hourTemp(value: 0, hour: hourly)
                dayTenHumidity0 = hourHumidity(value: 0, hour: hourly)
                dayTenCondition0 = hourIcon(value: 0, hour: hourly)
                dayTenIndex0 = hourUVIndex(value: 0, hour: hourly)
                dayTenWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
                dayTenCloudCover0 = hourCloudCover(value: 0, hour: hourly)

                dayTenPrecip1 = hourPrecipProb(value: 1, hour: hourly)
                dayTenTemp1 = hourTemp(value: 1, hour: hourly)
                dayTenHumidity1 = hourHumidity(value: 1, hour: hourly)
                dayTenCondition1 = hourIcon(value: 1, hour: hourly)
                dayTenIndex1 = hourUVIndex(value: 1, hour: hourly)
                dayTenWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
                dayTenCloudCover1 = hourCloudCover(value: 1, hour: hourly)

                dayTenPrecip2 = hourPrecipProb(value: 2, hour: hourly)
                dayTenTemp2 = hourTemp(value: 2, hour: hourly)
                dayTenHumidity2 = hourHumidity(value: 2, hour: hourly)
                dayTenCondition2 = hourIcon(value: 2, hour: hourly)
                dayTenIndex2 = hourUVIndex(value: 2, hour: hourly)
                dayTenWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
                dayTenCloudCover2 = hourCloudCover(value: 2, hour: hourly)

                dayTenPrecip3 = hourPrecipProb(value: 3, hour: hourly)
                dayTenTemp3 = hourTemp(value: 3, hour: hourly)
                dayTenHumidity3 = hourHumidity(value: 3, hour: hourly)
                dayTenCondition3 = hourIcon(value: 3, hour: hourly)
                dayTenIndex3 = hourUVIndex(value: 3, hour: hourly)
                dayTenWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
                dayTenCloudCover3 = hourCloudCover(value: 3, hour: hourly)
                    
                dayTenPrecip4 = hourPrecipProb(value: 4, hour: hourly)
                dayTenTemp4 = hourTemp(value: 4, hour: hourly)
                dayTenHumidity4 = hourHumidity(value: 4, hour: hourly)
                dayTenCondition4 = hourIcon(value: 4, hour: hourly)
                dayTenIndex4 = hourUVIndex(value: 4, hour: hourly)
                dayTenWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
                dayTenCloudCover4 = hourCloudCover(value: 4, hour: hourly)

                dayTenPrecip5 = hourPrecipProb(value: 5, hour: hourly)
                dayTenTemp5 = hourTemp(value: 5, hour: hourly)
                dayTenHumidity5 = hourHumidity(value: 5, hour: hourly)
                dayTenCondition5 = hourIcon(value: 5, hour: hourly)
                dayTenIndex5 = hourUVIndex(value: 5, hour: hourly)
                dayTenWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
                dayTenCloudCover5 = hourCloudCover(value: 5, hour: hourly)

                dayTenPrecip6 = hourPrecipProb(value: 6, hour: hourly)
                dayTenTemp6 = hourTemp(value: 6, hour: hourly)
                dayTenHumidity6 = hourHumidity(value: 6, hour: hourly)
                dayTenCondition6 = hourIcon(value: 6, hour: hourly)
                dayTenIndex6 = hourUVIndex(value: 6, hour: hourly)
                dayTenWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
                dayTenCloudCover6 = hourCloudCover(value: 6, hour: hourly)

                dayTenPrecip7 = hourPrecipProb(value: 7, hour: hourly)
                dayTenTemp7 = hourTemp(value: 7, hour: hourly)
                dayTenHumidity7 = hourHumidity(value: 7, hour: hourly)
                dayTenCondition7 = hourIcon(value: 7, hour: hourly)
                dayTenIndex7 = hourUVIndex(value: 7, hour: hourly)
                dayTenWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
                dayTenCloudCover7 = hourCloudCover(value: 7, hour: hourly)

                dayTenPrecip8 = hourPrecipProb(value: 8, hour: hourly)
                dayTenTemp8 = hourTemp(value: 8, hour: hourly)
                dayTenHumidity8 = hourHumidity(value: 8, hour: hourly)
                dayTenCondition8 = hourIcon(value: 8, hour: hourly)
                dayTenIndex8 = hourUVIndex(value: 8, hour: hourly)
                dayTenWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
                dayTenCloudCover8 = hourCloudCover(value: 8, hour: hourly)

                dayTenPrecip9 = hourPrecipProb(value: 9, hour: hourly)
                dayTenTemp9 = hourTemp(value: 9, hour: hourly)
                dayTenHumidity9 = hourHumidity(value: 9, hour: hourly)
                dayTenCondition9 = hourIcon(value: 9, hour: hourly)
                dayTenIndex9 = hourUVIndex(value: 9, hour: hourly)
                dayTenWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
                dayTenCloudCover9 = hourCloudCover(value: 9, hour: hourly)

                dayTenPrecip10 = hourPrecipProb(value: 10, hour: hourly)
                dayTenTemp10 = hourTemp(value: 10, hour: hourly)
                dayTenHumidity10 = hourHumidity(value: 10, hour: hourly)
                dayTenCondition10 = hourIcon(value: 10, hour: hourly)
                dayTenIndex10 = hourUVIndex(value: 10, hour: hourly)
                dayTenWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
                dayTenCloudCover10 = hourCloudCover(value: 10, hour: hourly)

                dayTenPrecip11 = hourPrecipProb(value: 11, hour: hourly)
                dayTenTemp11 = hourTemp(value: 11, hour: hourly)
                dayTenHumidity11 = hourHumidity(value: 11, hour: hourly)
                dayTenCondition11 = hourIcon(value: 11, hour: hourly)
                dayTenIndex11 = hourUVIndex(value: 11, hour: hourly)
                dayTenWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
                dayTenCloudCover11 = hourCloudCover(value: 11, hour: hourly)

                dayTenPrecip12 = hourPrecipProb(value: 12, hour: hourly)
                dayTenTemp12 = hourTemp(value: 12, hour: hourly)
                dayTenHumidity12 = hourHumidity(value: 12, hour: hourly)
                dayTenCondition12 = hourIcon(value: 12, hour: hourly)
                dayTenIndex12 = hourUVIndex(value: 12, hour: hourly)
                dayTenWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
                dayTenCloudCover12 = hourCloudCover(value: 12, hour: hourly)

                dayTenPrecip13 = hourPrecipProb(value: 13, hour: hourly)
                dayTenTemp13 = hourTemp(value: 13, hour: hourly)
                dayTenHumidity13 = hourHumidity(value: 13, hour: hourly)
                dayTenCondition13 = hourIcon(value: 13, hour: hourly)
                dayTenIndex13 = hourUVIndex(value: 13, hour: hourly)
                dayTenWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
                dayTenCloudCover13 = hourCloudCover(value: 13, hour: hourly)

                dayTenPrecip14 = hourPrecipProb(value: 14, hour: hourly)
                dayTenTemp14 = hourTemp(value: 14, hour: hourly)
                dayTenHumidity14 = hourHumidity(value: 14, hour: hourly)
                dayTenCondition14 = hourIcon(value: 14, hour: hourly)
                dayTenIndex14 = hourUVIndex(value: 14, hour: hourly)
                dayTenWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
                dayTenCloudCover14 = hourCloudCover(value: 14, hour: hourly)

                dayTenPrecip15 = hourPrecipProb(value: 15, hour: hourly)
                dayTenTemp15 = hourTemp(value: 15, hour: hourly)
                dayTenHumidity15 = hourHumidity(value: 15, hour: hourly)
                dayTenCondition15 = hourIcon(value: 15, hour: hourly)
                dayTenIndex15 = hourUVIndex(value: 15, hour: hourly)
                dayTenWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
                dayTenCloudCover15 = hourCloudCover(value: 15, hour: hourly)
            }
        }
        case .failure(let error):
            print(error)
        }
    }
                    
    // MARK: - Time Machine Day Eleven
    client.getForecast(location: userLocation, time: dayElevenDate) { result in
    switch result {
    case .success(let forecast, _):
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
        
        if let daily = forecast.daily {
            let dayElevenArray = daily.data[0]
            let fetchDayElevenArray = dayElevenArray

            weatherCondition11 = "\(fetchDayElevenArray.icon!.rawValue)"
            dayElevenDayString = dayFormat(date: fetchDayElevenArray.time)
            dayElevenDateString = dateFormat(date: fetchDayElevenArray.time)
            dayElevenHigh = Int(fetchDayElevenArray.temperatureHigh ?? defaultInteger)
            dayElevenLow = Int(fetchDayElevenArray.temperatureLow ?? defaultInteger)
            dayElevenSummaryString = "\(fetchDayElevenArray.summary ?? "\(defaultString)")"
            dayElevenConditionValue = getDefaultDailyCondition(condition: fetchDayElevenArray)
            dayElevenPrecip = dailyPrecipProb(day: fetchDayElevenArray)
            dayElevenPrecipAccum = dailyPrecipAccum(day: fetchDayElevenArray)
            dayElevenSunrise = sunFormat(date: fetchDayElevenArray.sunriseTime!)
            dayElevenSunset = sunFormat(date: fetchDayElevenArray.sunsetTime!)
        }
        
        if let hourly = forecast.hourly {
            dayElevenPrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayElevenTemp0 = hourTemp(value: 0, hour: hourly)
            dayElevenHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayElevenCondition0 = hourIcon(value: 0, hour: hourly)
            dayElevenIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayElevenWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayElevenCloudCover0 = hourCloudCover(value: 0, hour: hourly)

            dayElevenPrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayElevenTemp1 = hourTemp(value: 1, hour: hourly)
            dayElevenHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayElevenCondition1 = hourIcon(value: 1, hour: hourly)
            dayElevenIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayElevenWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayElevenCloudCover1 = hourCloudCover(value: 1, hour: hourly)

            dayElevenPrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayElevenTemp2 = hourTemp(value: 2, hour: hourly)
            dayElevenHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayElevenCondition2 = hourIcon(value: 2, hour: hourly)
            dayElevenIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayElevenWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayElevenCloudCover2 = hourCloudCover(value: 2, hour: hourly)

            dayElevenPrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayElevenTemp3 = hourTemp(value: 3, hour: hourly)
            dayElevenHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayElevenCondition3 = hourIcon(value: 3, hour: hourly)
            dayElevenIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayElevenWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayElevenCloudCover3 = hourCloudCover(value: 3, hour: hourly)

            dayElevenPrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayElevenTemp4 = hourTemp(value: 4, hour: hourly)
            dayElevenHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayElevenCondition4 = hourIcon(value: 4, hour: hourly)
            dayElevenIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayElevenWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayElevenCloudCover4 = hourCloudCover(value: 4, hour: hourly)

            dayElevenPrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayElevenTemp5 = hourTemp(value: 5, hour: hourly)
            dayElevenHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayElevenCondition5 = hourIcon(value: 5, hour: hourly)
            dayElevenIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayElevenWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayElevenCloudCover5 = hourCloudCover(value: 5, hour: hourly)

            dayElevenPrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayElevenTemp6 = hourTemp(value: 6, hour: hourly)
            dayElevenHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayElevenCondition6 = hourIcon(value: 6, hour: hourly)
            dayElevenIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayElevenWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayElevenCloudCover6 = hourCloudCover(value: 6, hour: hourly)

            dayElevenPrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayElevenTemp7 = hourTemp(value: 7, hour: hourly)
            dayElevenHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayElevenCondition7 = hourIcon(value: 7, hour: hourly)
            dayElevenIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayElevenWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayElevenCloudCover7 = hourCloudCover(value: 7, hour: hourly)

            dayElevenPrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayElevenTemp8 = hourTemp(value: 8, hour: hourly)
            dayElevenHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayElevenCondition8 = hourIcon(value: 8, hour: hourly)
            dayElevenIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayElevenWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayElevenCloudCover8 = hourCloudCover(value: 8, hour: hourly)

            dayElevenPrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayElevenTemp9 = hourTemp(value: 9, hour: hourly)
            dayElevenHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayElevenCondition9 = hourIcon(value: 9, hour: hourly)
            dayElevenIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayElevenWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayElevenCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            dayElevenPrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayElevenTemp10 = hourTemp(value: 10, hour: hourly)
            dayElevenHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayElevenCondition10 = hourIcon(value: 10, hour: hourly)
            dayElevenIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayElevenWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayElevenCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            dayElevenPrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayElevenTemp11 = hourTemp(value: 11, hour: hourly)
            dayElevenHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayElevenCondition11 = hourIcon(value: 11, hour: hourly)
            dayElevenIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayElevenWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayElevenCloudCover11 = hourCloudCover(value: 11, hour: hourly)

            dayElevenPrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayElevenTemp12 = hourTemp(value: 12, hour: hourly)
            dayElevenHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayElevenCondition12 = hourIcon(value: 12, hour: hourly)
            dayElevenIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayElevenWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayElevenCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            dayElevenPrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayElevenTemp13 = hourTemp(value: 13, hour: hourly)
            dayElevenHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayElevenCondition13 = hourIcon(value: 13, hour: hourly)
            dayElevenIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayElevenWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayElevenCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            dayElevenPrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayElevenTemp14 = hourTemp(value: 14, hour: hourly)
            dayElevenHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayElevenCondition14 = hourIcon(value: 14, hour: hourly)
            dayElevenIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayElevenWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayElevenCloudCover14 = hourCloudCover(value: 14, hour: hourly)

            dayElevenPrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayElevenTemp15 = hourTemp(value: 15, hour: hourly)
            dayElevenHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayElevenCondition15 = hourIcon(value: 15, hour: hourly)
            dayElevenIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayElevenWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayElevenCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
    
    // MARK: - Time Machine Day Twelve
    client.getForecast(location: userLocation, time: dayTwelveDate) { result in
        switch result {
        case .success(let forecast, _):
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
        
        if let daily = forecast.daily {
            let dayTwelveArray = daily.data[0]
            let fetchDayTwelveArray = dayTwelveArray

            weatherCondition12 = "\(fetchDayTwelveArray.icon!.rawValue)"
            dayTwelveDayString = dayFormat(date: fetchDayTwelveArray.time)
            dayTwelveDateString = dateFormat(date: fetchDayTwelveArray.time)
            dayTwelveHigh = Int(fetchDayTwelveArray.temperatureHigh ?? defaultInteger)
            dayTwelveLow = Int(fetchDayTwelveArray.temperatureLow ?? defaultInteger)
            dayTwelveSummaryString = "\(fetchDayTwelveArray.summary ?? "\(defaultString)")"
            dayTwelveConditionValue = getDefaultDailyCondition(condition: fetchDayTwelveArray)
            dayTwelvePrecip = dailyPrecipProb(day: fetchDayTwelveArray)
            dayTwelvePrecipAccum = dailyPrecipAccum(day: fetchDayTwelveArray)
            dayTwelveSunrise = sunFormat(date: fetchDayTwelveArray.sunriseTime!)
            dayTwelveSunset = sunFormat(date: fetchDayTwelveArray.sunsetTime!)
        }
        
        if let hourly = forecast.hourly {
            dayTwelveTemp0 = hourTemp(value: 0, hour: hourly)
            dayTwelveHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayTwelveCondition0 = hourIcon(value: 0, hour: hourly)
            dayTwelveIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayTwelveWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayTwelveCloudCover0 = hourCloudCover(value: 0, hour: hourly)
            
            dayTwelvePrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayTwelveTemp1 = hourTemp(value: 1, hour: hourly)
            dayTwelveHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayTwelveCondition1 = hourIcon(value: 1, hour: hourly)
            dayTwelveIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayTwelveWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayTwelveCloudCover1 = hourCloudCover(value: 1, hour: hourly)
            
            dayTwelvePrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayTwelveTemp2 = hourTemp(value: 2, hour: hourly)
            dayTwelveHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayTwelveCondition2 = hourIcon(value: 2, hour: hourly)
            dayTwelveIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayTwelveWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayTwelveCloudCover2 = hourCloudCover(value: 2, hour: hourly)
            
            dayTwelvePrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayTwelveTemp3 = hourTemp(value: 3, hour: hourly)
            dayTwelveHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayTwelveCondition3 = hourIcon(value: 3, hour: hourly)
            dayTwelveIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayTwelveWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayTwelveCloudCover3 = hourCloudCover(value: 3, hour: hourly)
            
            dayTwelvePrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayTwelveTemp4 = hourTemp(value: 4, hour: hourly)
            dayTwelveHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayTwelveCondition4 = hourIcon(value: 4, hour: hourly)
            dayTwelveIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayTwelveWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayTwelveCloudCover4 = hourCloudCover(value: 4, hour: hourly)
            
            dayTwelvePrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayTwelveTemp5 = hourTemp(value: 5, hour: hourly)
            dayTwelveHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayTwelveCondition5 = hourIcon(value: 5, hour: hourly)
            dayTwelveIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayTwelveWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayTwelveCloudCover5 = hourCloudCover(value: 5, hour: hourly)
            
            dayTwelvePrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayTwelveTemp6 = hourTemp(value: 6, hour: hourly)
            dayTwelveHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayTwelveCondition6 = hourIcon(value: 6, hour: hourly)
            dayTwelveIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayTwelveWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayTwelveCloudCover6 = hourCloudCover(value: 6, hour: hourly)
            
            dayTwelvePrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayTwelveTemp7 = hourTemp(value: 7, hour: hourly)
            dayTwelveHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayTwelveCondition7 = hourIcon(value: 7, hour: hourly)
            dayTwelveIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayTwelveWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayTwelveCloudCover7 = hourCloudCover(value: 7, hour: hourly)
            
            dayTwelvePrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayTwelveTemp8 = hourTemp(value: 8, hour: hourly)
            dayTwelveHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayTwelveCondition8 = hourIcon(value: 8, hour: hourly)
            dayTwelveIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayTwelveWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayTwelveCloudCover8 = hourCloudCover(value: 8, hour: hourly)
            
            dayTwelvePrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayTwelveTemp9 = hourTemp(value: 9, hour: hourly)
            dayTwelveHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayTwelveCondition9 = hourIcon(value: 9, hour: hourly)
            dayTwelveIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayTwelveWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayTwelveCloudCover9 = hourCloudCover(value: 9, hour: hourly)
            
            dayTwelvePrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayTwelveTemp10 = hourTemp(value: 10, hour: hourly)
            dayTwelveHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayTwelveCondition10 = hourIcon(value: 10, hour: hourly)
            dayTwelveIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayTwelveWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayTwelveCloudCover10 = hourCloudCover(value: 10, hour: hourly)
            
            dayTwelvePrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayTwelveTemp11 = hourTemp(value: 11, hour: hourly)
            dayTwelveHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayTwelveCondition11 = hourIcon(value: 11, hour: hourly)
            dayTwelveIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayTwelveWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayTwelveCloudCover11 = hourCloudCover(value: 11, hour: hourly)
            
            dayTwelvePrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayTwelveTemp12 = hourTemp(value: 12, hour: hourly)
            dayTwelveHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayTwelveCondition12 = hourIcon(value: 12, hour: hourly)
            dayTwelveIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayTwelveWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayTwelveCloudCover12 = hourCloudCover(value: 12, hour: hourly)
            
            dayTwelvePrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayTwelveTemp13 = hourTemp(value: 13, hour: hourly)
            dayTwelveHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayTwelveCondition13 = hourIcon(value: 13, hour: hourly)
            dayTwelveIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayTwelveWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayTwelveCloudCover13 = hourCloudCover(value: 13, hour: hourly)
            
            dayTwelvePrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayTwelveTemp14 = hourTemp(value: 14, hour: hourly)
            dayTwelveHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayTwelveCondition14 = hourIcon(value: 14, hour: hourly)
            dayTwelveIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayTwelveWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayTwelveCloudCover14 = hourCloudCover(value: 14, hour: hourly)
            
            dayTwelvePrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayTwelveTemp15 = hourTemp(value: 15, hour: hourly)
            dayTwelveHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayTwelveCondition15 = hourIcon(value: 15, hour: hourly)
            dayTwelveIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayTwelveWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayTwelveCloudCover15 = hourCloudCover(value: 15, hour: hourly)
        }
        case .failure(let error):
            print(error)
        }
    }
                    
    // MARK: - Time Machine Day Thirteen
    client.getForecast(location: userLocation, time: dayThirteenDate) { result in
    switch result {
    case .success(let forecast, _):
        TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
        
        if let daily = forecast.daily {
            let dayThirteenArray = daily.data[0]
            let fetchDayThirteenArray = dayThirteenArray

            weatherCondition13 = "\(fetchDayThirteenArray.icon!.rawValue)"
            dayThirteenDayString = dayFormat(date: fetchDayThirteenArray.time)
            dayThirteenDateString = dateFormat(date: fetchDayThirteenArray.time)
            dayThirteenHigh = Int(fetchDayThirteenArray.temperatureHigh ?? defaultInteger)
            dayThirteenLow = Int(fetchDayThirteenArray.temperatureLow ?? defaultInteger)
            dayThirteenSummaryString = "\(fetchDayThirteenArray.summary ?? "\(defaultString)")"
            dayThirteenConditionValue = getDefaultDailyCondition(condition: fetchDayThirteenArray)
            dayThirteenPrecip = dailyPrecipProb(day: fetchDayThirteenArray)
            dayThirteenPrecipAccum = dailyPrecipAccum(day: fetchDayThirteenArray)
            dayThirteenSunrise = sunFormat(date: fetchDayThirteenArray.sunriseTime!)
            dayThirteenSunset = sunFormat(date: fetchDayThirteenArray.sunsetTime!)
        }
        
        if let hourly = forecast.hourly {
            dayThirteenPrecip0 = hourPrecipProb(value: 0, hour: hourly)
            dayThirteenTemp0 = hourTemp(value: 0, hour: hourly)
            dayThirteenHumidity0 = hourHumidity(value: 0, hour: hourly)
            dayThirteenCondition0 = hourIcon(value: 0, hour: hourly)
            dayThirteenIndex0 = hourUVIndex(value: 0, hour: hourly)
            dayThirteenWindSpeed0 = hourWindSpeed(value: 0, hour: hourly)
            dayThirteenCloudCover0 = hourCloudCover(value: 0, hour: hourly)
            
            dayThirteenPrecip1 = hourPrecipProb(value: 1, hour: hourly)
            dayThirteenTemp1 = hourTemp(value: 1, hour: hourly)
            dayThirteenHumidity1 = hourHumidity(value: 1, hour: hourly)
            dayThirteenCondition1 = hourIcon(value: 1, hour: hourly)
            dayThirteenIndex1 = hourUVIndex(value: 1, hour: hourly)
            dayThirteenWindSpeed1 = hourWindSpeed(value: 1, hour: hourly)
            dayThirteenCloudCover1 = hourCloudCover(value: 1, hour: hourly)
            
            dayThirteenPrecip2 = hourPrecipProb(value: 2, hour: hourly)
            dayThirteenTemp2 = hourTemp(value: 2, hour: hourly)
            dayThirteenHumidity2 = hourHumidity(value: 2, hour: hourly)
            dayThirteenCondition2 = hourIcon(value: 2, hour: hourly)
            dayThirteenIndex2 = hourUVIndex(value: 2, hour: hourly)
            dayThirteenWindSpeed2 = hourWindSpeed(value: 2, hour: hourly)
            dayThirteenCloudCover2 = hourCloudCover(value: 2, hour: hourly)
            
            dayThirteenPrecip3 = hourPrecipProb(value: 3, hour: hourly)
            dayThirteenTemp3 = hourTemp(value: 3, hour: hourly)
            dayThirteenHumidity3 = hourHumidity(value: 3, hour: hourly)
            dayThirteenCondition3 = hourIcon(value: 3, hour: hourly)
            dayThirteenIndex3 = hourUVIndex(value: 3, hour: hourly)
            dayThirteenWindSpeed3 = hourWindSpeed(value: 3, hour: hourly)
            dayThirteenCloudCover3 = hourCloudCover(value: 3, hour: hourly)
            
            dayThirteenPrecip4 = hourPrecipProb(value: 4, hour: hourly)
            dayThirteenTemp4 = hourTemp(value: 4, hour: hourly)
            dayThirteenHumidity4 = hourHumidity(value: 4, hour: hourly)
            dayThirteenCondition4 = hourIcon(value: 4, hour: hourly)
            dayThirteenIndex4 = hourUVIndex(value: 4, hour: hourly)
            dayThirteenWindSpeed4 = hourWindSpeed(value: 4, hour: hourly)
            dayThirteenCloudCover4 = hourCloudCover(value: 4, hour: hourly)
            
            dayThirteenPrecip5 = hourPrecipProb(value: 5, hour: hourly)
            dayThirteenTemp5 = hourTemp(value: 5, hour: hourly)
            dayThirteenHumidity5 = hourHumidity(value: 5, hour: hourly)
            dayThirteenCondition5 = hourIcon(value: 5, hour: hourly)
            dayThirteenIndex5 = hourUVIndex(value: 5, hour: hourly)
            dayThirteenWindSpeed5 = hourWindSpeed(value: 5, hour: hourly)
            dayThirteenCloudCover5 = hourCloudCover(value: 5, hour: hourly)
            
            dayThirteenPrecip6 = hourPrecipProb(value: 6, hour: hourly)
            dayThirteenTemp6 = hourTemp(value: 6, hour: hourly)
            dayThirteenHumidity6 = hourHumidity(value: 6, hour: hourly)
            dayThirteenCondition6 = hourIcon(value: 6, hour: hourly)
            dayThirteenIndex6 = hourUVIndex(value: 6, hour: hourly)
            dayThirteenWindSpeed6 = hourWindSpeed(value: 6, hour: hourly)
            dayThirteenCloudCover6 = hourCloudCover(value: 6, hour: hourly)
            
            dayThirteenPrecip7 = hourPrecipProb(value: 7, hour: hourly)
            dayThirteenTemp7 = hourTemp(value: 7, hour: hourly)
            dayThirteenHumidity7 = hourHumidity(value: 7, hour: hourly)
            dayThirteenCondition7 = hourIcon(value: 7, hour: hourly)
            dayThirteenIndex7 = hourUVIndex(value: 7, hour: hourly)
            dayThirteenWindSpeed7 = hourWindSpeed(value: 7, hour: hourly)
            dayThirteenCloudCover7 = hourCloudCover(value: 7, hour: hourly)
            
            dayThirteenPrecip8 = hourPrecipProb(value: 8, hour: hourly)
            dayThirteenTemp8 = hourTemp(value: 8, hour: hourly)
            dayThirteenHumidity8 = hourHumidity(value: 8, hour: hourly)
            dayThirteenCondition8 = hourIcon(value: 8, hour: hourly)
            dayThirteenIndex8 = hourUVIndex(value: 8, hour: hourly)
            dayThirteenWindSpeed8 = hourWindSpeed(value: 8, hour: hourly)
            dayThirteenCloudCover8 = hourCloudCover(value: 8, hour: hourly)

            dayThirteenPrecip9 = hourPrecipProb(value: 9, hour: hourly)
            dayThirteenTemp9 = hourTemp(value: 9, hour: hourly)
            dayThirteenHumidity9 = hourHumidity(value: 9, hour: hourly)
            dayThirteenCondition9 = hourIcon(value: 9, hour: hourly)
            dayThirteenIndex9 = hourUVIndex(value: 9, hour: hourly)
            dayThirteenWindSpeed9 = hourWindSpeed(value: 9, hour: hourly)
            dayThirteenCloudCover9 = hourCloudCover(value: 9, hour: hourly)

            dayThirteenPrecip10 = hourPrecipProb(value: 10, hour: hourly)
            dayThirteenTemp10 = hourTemp(value: 10, hour: hourly)
            dayThirteenHumidity10 = hourHumidity(value: 10, hour: hourly)
            dayThirteenCondition10 = hourIcon(value: 10, hour: hourly)
            dayThirteenIndex10 = hourUVIndex(value: 10, hour: hourly)
            dayThirteenWindSpeed10 = hourWindSpeed(value: 10, hour: hourly)
            dayThirteenCloudCover10 = hourCloudCover(value: 10, hour: hourly)

            dayThirteenPrecip11 = hourPrecipProb(value: 11, hour: hourly)
            dayThirteenTemp11 = hourTemp(value: 11, hour: hourly)
            dayThirteenHumidity11 = hourHumidity(value: 11, hour: hourly)
            dayThirteenCondition11 = hourIcon(value: 11, hour: hourly)
            dayThirteenIndex11 = hourUVIndex(value: 11, hour: hourly)
            dayThirteenWindSpeed11 = hourWindSpeed(value: 11, hour: hourly)
            dayThirteenCloudCover11 = hourCloudCover(value: 11, hour: hourly)

            dayThirteenPrecip12 = hourPrecipProb(value: 12, hour: hourly)
            dayThirteenTemp12 = hourTemp(value: 12, hour: hourly)
            dayThirteenHumidity12 = hourHumidity(value: 12, hour: hourly)
            dayThirteenCondition12 = hourIcon(value: 12, hour: hourly)
            dayThirteenIndex12 = hourUVIndex(value: 12, hour: hourly)
            dayThirteenWindSpeed12 = hourWindSpeed(value: 12, hour: hourly)
            dayThirteenCloudCover12 = hourCloudCover(value: 12, hour: hourly)

            dayThirteenPrecip13 = hourPrecipProb(value: 13, hour: hourly)
            dayThirteenTemp13 = hourTemp(value: 13, hour: hourly)
            dayThirteenHumidity13 = hourHumidity(value: 13, hour: hourly)
            dayThirteenCondition13 = hourIcon(value: 13, hour: hourly)
            dayThirteenIndex13 = hourUVIndex(value: 13, hour: hourly)
            dayThirteenWindSpeed13 = hourWindSpeed(value: 13, hour: hourly)
            dayThirteenCloudCover13 = hourCloudCover(value: 13, hour: hourly)

            dayThirteenPrecip14 = hourPrecipProb(value: 14, hour: hourly)
            dayThirteenTemp14 = hourTemp(value: 14, hour: hourly)
            dayThirteenHumidity14 = hourHumidity(value: 14, hour: hourly)
            dayThirteenCondition14 = hourIcon(value: 14, hour: hourly)
            dayThirteenIndex14 = hourUVIndex(value: 14, hour: hourly)
            dayThirteenWindSpeed14 = hourWindSpeed(value: 14, hour: hourly)
            dayThirteenCloudCover14 = hourCloudCover(value: 14, hour: hourly)

            dayThirteenPrecip15 = hourPrecipProb(value: 15, hour: hourly)
            dayThirteenTemp15 = hourTemp(value: 15, hour: hourly)
            dayThirteenHumidity15 = hourHumidity(value: 15, hour: hourly)
            dayThirteenCondition15 = hourIcon(value: 15, hour: hourly)
            dayThirteenIndex15 = hourUVIndex(value: 15, hour: hourly)
            dayThirteenWindSpeed15 = hourWindSpeed(value: 15, hour: hourly)
            dayThirteenCloudCover15 = hourCloudCover(value: 15, hour: hourly)
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

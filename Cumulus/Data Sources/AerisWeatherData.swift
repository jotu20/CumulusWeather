//
//  AerisWeatherData.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 5/15/19.
//  Copyright © 2019 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import AerisWeatherKit

public func fetchAerisWeatherData() {
    universalSettings()
    fetchDarkSkyWeatherData()
    
    let place = AWFPlace(latitude: CGFloat(latitudeValue), longitude: CGFloat(longitudeValue))
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
            apparentTemperature = Int(obs.feelslikeF)
            visibility = Int(obs.visibilityMI)
            pressure = Int(obs.pressureMB)
            wind = Int(obs.windSpeedMPH)
            aerisWindGust(float: obs.windGustMPH)
            aerisWindDirection(float: obs.windDirectionDEG)
        }

        if universalUnits == "UK" {
            unitsTemperature = "C"
            unitsDistance = "miles"
            unitsWindSpeed = "mph"
            unitsPressure = "hPa"
            unitsPrecipitation = "mm"

            currentTemperature = Int(obs.tempC)
            apparentTemperature = Int(obs.feelslikeC)
            visibility = Int(obs.visibilityMI)
            pressure = Int(obs.pressureMB)
            wind = Int(obs.windSpeedMPH)
            aerisWindGust(float: obs.windGustMPH)
            aerisWindDirection(float: obs.windDirectionDEG)
        }

        if universalUnits == "Canada" {
            unitsTemperature = "C"
            unitsDistance = "kilometers"
            unitsWindSpeed = "km/h"
            unitsPressure = "hPa"
            unitsPrecipitation = "mm"

            currentTemperature = Int(obs.tempC)
            apparentTemperature = Int(obs.feelslikeC)
            visibility = Int(obs.visibilityKM)
            pressure = Int(obs.pressureMB)
            wind = Int(obs.windSpeedKMH)
            aerisWindGust(float: obs.windGustKMH)
            aerisWindDirection(float: obs.windDirectionDEG)
        }

        if universalUnits == "International" {
            unitsTemperature = "C"
            unitsDistance = "kilometers"
            unitsWindSpeed = "m/s"
            unitsPressure = "hPa"
            unitsPrecipitation = "mm"

            currentTemperature = Int(obs.tempC)
            apparentTemperature = Int(obs.feelslikeC)
            visibility = Int(obs.visibilityKM)
            pressure = Int(obs.pressureMB)
            wind = kmhToMS(speed: obs.windSpeedKMH)
            aerisWindGust(float: CGFloat(kmhToMS(speed: obs.windGustKMH)))
            aerisWindDirection(float: obs.windDirectionDEG)
        }

        currentCondition = "\(obs.icon!)"
        currentSummary = "\(obs.weather!)"
        fullSummary = "\(obs.weatherFull!)"
        humidity = Int(obs.humidity)
        cloudCover = Int(obs.skyCoverPercentage)
    }

    // MARK : Get 7-day forecast
        let options = AWFWeatherRequestOptions()
        options.limit = 7

        AWFForecasts.sharedService().get(forPlace: place, options: options) { (result) in
            guard let results = result?.results else { print("Data failed to load - \(String(describing: result?.error))"); return }
            guard let forecast = results.first as? AWFForecast else { return }
            
            let dayZero = forecast.periods?.first
            uvIndex = dayZero!.uvIndex
            highTemperature = Int(dayZero!.maxTempF)
            lowTemperature = Int(dayZero!.minTempF)
            dewPoint = Int(dayZero!.dewpointF)
            precipitation = Int(dayZero!.pop)

            let dayZeroArray = forecast.periods?[0]
            let fetchDayZeroArray = dayZeroArray
            weatherCondition0 = "\(fetchDayZeroArray!.icon!)"
            dayZeroHigh = Int(fetchDayZeroArray!.maxTempF)
            dayZeroLow = Int(fetchDayZeroArray!.minTempF)
            dayZeroPrecip = Int(fetchDayZeroArray!.pop)
            dayZeroSummaryString = "\(fetchDayZeroArray!.weatherFull!.capitalizingFirstLetter())."

            let dayOneArray = forecast.periods?[1]
            let fetchDayOneArray = dayOneArray
            weatherCondition1 = "\(fetchDayOneArray!.icon!)"
            dayOneHigh = Int(fetchDayOneArray!.maxTempF)
            dayOneLow = Int(fetchDayOneArray!.minTempF)
            dayOnePrecip = Int(fetchDayOneArray!.pop)
            dayOneSummaryString = "\(fetchDayOneArray!.weatherFull!.capitalizingFirstLetter())."

            let dayTwoArray = forecast.periods?[2]
            let fetchDayTwoArray = dayTwoArray
            weatherCondition2 = "\(fetchDayTwoArray!.icon!)"
            dayTwoHigh = Int(fetchDayTwoArray!.maxTempF)
            dayTwoLow = Int(fetchDayTwoArray!.minTempF)
            dayTwoPrecip = Int(fetchDayTwoArray!.pop)
            dayTwoSummaryString = "\(fetchDayTwoArray!.weatherFull!.capitalizingFirstLetter())."

            let dayThreeArray = forecast.periods?[3]
            let fetchDayThreeArray = dayThreeArray
            weatherCondition3 = "\(fetchDayThreeArray!.icon!)"
            dayThreeHigh = Int(fetchDayThreeArray!.maxTempF)
            dayThreeLow = Int(fetchDayThreeArray!.minTempF)
            dayThreePrecip = Int(fetchDayThreeArray!.pop)
            dayThreeSummaryString = "\(fetchDayThreeArray!.weatherFull!.capitalizingFirstLetter())."

            let dayFourArray = forecast.periods?[4]
            let fetchDayFourArray = dayFourArray
            weatherCondition4 = "\(fetchDayFourArray!.icon!)"
            dayFourHigh = Int(fetchDayFourArray!.maxTempF)
            dayFourLow = Int(fetchDayFourArray!.minTempF)
            dayFourPrecip = Int(fetchDayFourArray!.pop)
            dayFourSummaryString = "\(fetchDayFourArray!.weatherFull!.capitalizingFirstLetter())."

            let dayFiveArray = forecast.periods?[5]
            let fetchDayFiveArray = dayFiveArray
            weatherCondition5 = "\(fetchDayFiveArray!.icon!)"
            dayFiveHigh = Int(fetchDayFiveArray!.maxTempF)
            dayFiveLow = Int(fetchDayFiveArray!.minTempF)
            dayFivePrecip = Int(fetchDayFiveArray!.pop)
            dayFiveSummaryString = "\(fetchDayFiveArray!.weatherFull!.capitalizingFirstLetter())."

            let daySixArray = forecast.periods?[6]
            let fetchDaySixArray = daySixArray
            weatherCondition6 = "\(fetchDaySixArray!.icon!)"
            daySixHigh = Int(fetchDaySixArray!.maxTempF)
            daySixLow = Int(fetchDaySixArray!.minTempF)
            daySixPrecip = Int(fetchDaySixArray!.pop)
            daySixSummaryString = "\(fetchDaySixArray!.weatherFull!.capitalizingFirstLetter())."
        }
}

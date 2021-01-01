//
//  WeatherDataValues.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 5/15/19.
//  Copyright © 2019 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import ForecastIO

var weatherLoaded: Bool = false
var distanceChange: Bool = false

// MARK: - Default values
var defaultInteger: Double = 0
var defaultString = "Oops! No summary found."

// MARK: - Location values
var selectedLocation: String = ""
var userDeniedLocation: Bool = false
var latitudeValue: Double = 0
var longitudeValue: Double = 0
var userSelectedSavedLocation: Bool = false
var currentLocation: String = ""   

// MARK: - Alert value
var alertCount: Int = 0
var alertTitle: String = ""
var alertBody: String = ""
var alertURI: String = ""

// MARK: - Units values
var unitsPrecipitation: String = ""
var unitsTemperature: String = ""
var unitsWindSpeed: String = ""
var unitsDistance: String = ""
var unitsPressure: String = ""
var weatherUnits: String = ""

// All weather values
// MARK: - Current weather values
var currentTemperature: Int = 0
var currentCondition: String = ""
var feelsLikeTemperature: Int = 0
var currentSummary: String = ""
var hourSummary: String = ""
var nextHourCondition: String = ""
var minuteSummary: String = ""
var endingMinuteSummary: String = ""
var triggerMinute: Int = 0
var precipAccumulation: Double = 0

// MARK: - Minutely precip probability values
// 1-20
var minutelyChance1: Int = 0
var minutelyChance2: Int = 0
var minutelyChance3: Int = 0
var minutelyChance4: Int = 0
var minutelyChance5: Int = 0
var minutelyChance6: Int = 0
var minutelyChance7: Int = 0
var minutelyChance8: Int = 0
var minutelyChance9: Int = 0
var minutelyChance10: Int = 0
var minutelyChance11: Int = 0
var minutelyChance12: Int = 0
var minutelyChance13: Int = 0
var minutelyChance14: Int = 0
var minutelyChance15: Int = 0
var minutelyChance16: Int = 0
var minutelyChance17: Int = 0
var minutelyChance18: Int = 0
var minutelyChance19: Int = 0
var minutelyChance20: Int = 0
// 21-40
var minutelyChance21: Int = 0
var minutelyChance22: Int = 0
var minutelyChance23: Int = 0
var minutelyChance24: Int = 0
var minutelyChance25: Int = 0
var minutelyChance26: Int = 0
var minutelyChance27: Int = 0
var minutelyChance28: Int = 0
var minutelyChance29: Int = 0
var minutelyChance30: Int = 0
var minutelyChance31: Int = 0
var minutelyChance32: Int = 0
var minutelyChance33: Int = 0
var minutelyChance34: Int = 0
var minutelyChance35: Int = 0
var minutelyChance36: Int = 0
var minutelyChance37: Int = 0
var minutelyChance38: Int = 0
var minutelyChance39: Int = 0
var minutelyChance40: Int = 0
// 41-60
var minutelyChance41: Int = 0
var minutelyChance42: Int = 0
var minutelyChance43: Int = 0
var minutelyChance44: Int = 0
var minutelyChance45: Int = 0
var minutelyChance46: Int = 0
var minutelyChance47: Int = 0
var minutelyChance48: Int = 0
var minutelyChance49: Int = 0
var minutelyChance50: Int = 0
var minutelyChance51: Int = 0
var minutelyChance52: Int = 0
var minutelyChance53: Int = 0
var minutelyChance54: Int = 0
var minutelyChance55: Int = 0
var minutelyChance56: Int = 0
var minutelyChance57: Int = 0
var minutelyChance58: Int = 0
var minutelyChance59: Int = 0
var minutelyChance60: Int = 0

// MARK: - Minutely precip type values
// 1-20
var minutelyType1: String = ""
var minutelyType2: String = ""
var minutelyType3: String = ""
var minutelyType4: String = ""
var minutelyType5: String = ""
var minutelyType6: String = ""
var minutelyType7: String = ""
var minutelyType8: String = ""
var minutelyType9: String = ""
var minutelyType10: String = ""
var minutelyType11: String = ""
var minutelyType12: String = ""
var minutelyType13: String = ""
var minutelyType14: String = ""
var minutelyType15: String = ""
var minutelyType16: String = ""
var minutelyType17: String = ""
var minutelyType18: String = ""
var minutelyType19: String = ""
var minutelyType20: String = ""
// 21-40
var minutelyType21: String = ""
var minutelyType22: String = ""
var minutelyType23: String = ""
var minutelyType24: String = ""
var minutelyType25: String = ""
var minutelyType26: String = ""
var minutelyType27: String = ""
var minutelyType28: String = ""
var minutelyType29: String = ""
var minutelyType30: String = ""
var minutelyType31: String = ""
var minutelyType32: String = ""
var minutelyType33: String = ""
var minutelyType34: String = ""
var minutelyType35: String = ""
var minutelyType36: String = ""
var minutelyType37: String = ""
var minutelyType38: String = ""
var minutelyType39: String = ""
var minutelyType40: String = ""
// 41-60
var minutelyType41: String = ""
var minutelyType42: String = ""
var minutelyType43: String = ""
var minutelyType44: String = ""
var minutelyType45: String = ""
var minutelyType46: String = ""
var minutelyType47: String = ""
var minutelyType48: String = ""
var minutelyType49: String = ""
var minutelyType50: String = ""
var minutelyType51: String = ""
var minutelyType52: String = ""
var minutelyType53: String = ""
var minutelyType54: String = ""
var minutelyType55: String = ""
var minutelyType56: String = ""
var minutelyType57: String = ""
var minutelyType58: String = ""
var minutelyType59: String = ""
var minutelyType60: String = ""

// MARK: - Minutely precip intensity values
// 1-20
var minutelyIntensity1: Double = 0
var minutelyIntensity2: Double = 0
var minutelyIntensity3: Double = 0
var minutelyIntensity4: Double = 0
var minutelyIntensity5: Double = 0
var minutelyIntensity6: Double = 0
var minutelyIntensity7: Double = 0
var minutelyIntensity8: Double = 0
var minutelyIntensity9: Double = 0
var minutelyIntensity10: Double = 0
var minutelyIntensity11: Double = 0
var minutelyIntensity12: Double = 0
var minutelyIntensity13: Double = 0
var minutelyIntensity14: Double = 0
var minutelyIntensity15: Double = 0
var minutelyIntensity16: Double = 0
var minutelyIntensity17: Double = 0
var minutelyIntensity18: Double = 0
var minutelyIntensity19: Double = 0
var minutelyIntensity20: Double = 0
// 21-40
var minutelyIntensity21: Double = 0
var minutelyIntensity22: Double = 0
var minutelyIntensity23: Double = 0
var minutelyIntensity24: Double = 0
var minutelyIntensity25: Double = 0
var minutelyIntensity26: Double = 0
var minutelyIntensity27: Double = 0
var minutelyIntensity28: Double = 0
var minutelyIntensity29: Double = 0
var minutelyIntensity30: Double = 0
var minutelyIntensity31: Double = 0
var minutelyIntensity32: Double = 0
var minutelyIntensity33: Double = 0
var minutelyIntensity34: Double = 0
var minutelyIntensity35: Double = 0
var minutelyIntensity36: Double = 0
var minutelyIntensity37: Double = 0
var minutelyIntensity38: Double = 0
var minutelyIntensity39: Double = 0
var minutelyIntensity40: Double = 0
// 41-60
var minutelyIntensity41: Double = 0
var minutelyIntensity42: Double = 0
var minutelyIntensity43: Double = 0
var minutelyIntensity44: Double = 0
var minutelyIntensity45: Double = 0
var minutelyIntensity46: Double = 0
var minutelyIntensity47: Double = 0
var minutelyIntensity48: Double = 0
var minutelyIntensity49: Double = 0
var minutelyIntensity50: Double = 0
var minutelyIntensity51: Double = 0
var minutelyIntensity52: Double = 0
var minutelyIntensity53: Double = 0
var minutelyIntensity54: Double = 0
var minutelyIntensity55: Double = 0
var minutelyIntensity56: Double = 0
var minutelyIntensity57: Double = 0
var minutelyIntensity58: Double = 0
var minutelyIntensity59: Double = 0
var minutelyIntensity60: Double = 0

// MARK: - Hourly precip values
var precipHour0: Int = 0
var precipHour1: Int = 0
var precipHour2: Int = 0
var precipHour3: Int = 0
var precipHour4: Int = 0
var precipHour5: Int = 0
var precipHour6: Int = 0
var precipHour7: Int = 0
var precipHour8: Int = 0
var precipHour9: Int = 0
var precipHour10: Int = 0
var precipHour11: Int = 0
var precipHour12: Int = 0
var precipHour13: Int = 0
var precipHour14: Int = 0
var precipHour15: Int = 0

// MARK: - Hourly accumulation values
var accumHour0: Double = 0
var accumHour1: Double = 0
var accumHour2: Double = 0
var accumHour3: Double = 0
var accumHour4: Double = 0
var accumHour5: Double = 0
var accumHour6: Double = 0
var accumHour7: Double = 0
var accumHour8: Double = 0
var accumHour9: Double = 0
var accumHour10: Double = 0
var accumHour11: Double = 0
var accumHour12: Double = 0
var accumHour13: Double = 0
var accumHour14: Double = 0
var accumHour15: Double = 0

// MARK: - Hourly temp values
var tempHour0: Int = 0
var tempHour1: Int = 0
var tempHour2: Int = 0
var tempHour3: Int = 0
var tempHour4: Int = 0
var tempHour5: Int = 0
var tempHour6: Int = 0
var tempHour7: Int = 0
var tempHour8: Int = 0
var tempHour9: Int = 0
var tempHour10: Int = 0
var tempHour11: Int = 0
var tempHour12: Int = 0
var tempHour13: Int = 0
var tempHour14: Int = 0
var tempHour15: Int = 0

// MARK: - Hourly humidity values
var humidityHour0: Int = 0
var humidityHour1: Int = 0
var humidityHour2: Int = 0
var humidityHour3: Int = 0
var humidityHour4: Int = 0
var humidityHour5: Int = 0
var humidityHour6: Int = 0
var humidityHour7: Int = 0
var humidityHour8: Int = 0
var humidityHour9: Int = 0
var humidityHour10: Int = 0
var humidityHour11: Int = 0
var humidityHour12: Int = 0
var humidityHour13: Int = 0
var humidityHour14: Int = 0
var humidityHour15: Int = 0

// MARK: - Hourly uv index values
var uvindexHour0: Int = 0
var uvindexHour1: Int = 0
var uvindexHour2: Int = 0
var uvindexHour3: Int = 0
var uvindexHour4: Int = 0
var uvindexHour5: Int = 0
var uvindexHour6: Int = 0
var uvindexHour7: Int = 0
var uvindexHour8: Int = 0
var uvindexHour9: Int = 0
var uvindexHour10: Int = 0
var uvindexHour11: Int = 0
var uvindexHour12: Int = 0
var uvindexHour13: Int = 0
var uvindexHour14: Int = 0
var uvindexHour15: Int = 0

// MARK: - Hourly wind speed values
var windSpeedHour0: Int = 0
var windSpeedHour1: Int = 0
var windSpeedHour2: Int = 0
var windSpeedHour3: Int = 0
var windSpeedHour4: Int = 0
var windSpeedHour5: Int = 0
var windSpeedHour6: Int = 0
var windSpeedHour7: Int = 0
var windSpeedHour8: Int = 0
var windSpeedHour9: Int = 0
var windSpeedHour10: Int = 0
var windSpeedHour11: Int = 0
var windSpeedHour12: Int = 0
var windSpeedHour13: Int = 0
var windSpeedHour14: Int = 0
var windSpeedHour15: Int = 0

// MARK: - Hourly wind direction values
var windDirectionHour0: String = ""
var windDirectionHour1: String = ""
var windDirectionHour2: String = ""
var windDirectionHour3: String = ""
var windDirectionHour4: String = ""
var windDirectionHour5: String = ""
var windDirectionHour6: String = ""
var windDirectionHour7: String = ""
var windDirectionHour8: String = ""
var windDirectionHour9: String = ""
var windDirectionHour10: String = ""
var windDirectionHour11: String = ""
var windDirectionHour12: String = ""
var windDirectionHour13: String = ""
var windDirectionHour14: String = ""
var windDirectionHour15: String = ""

// MARK: - Hourly cloud cover values
var cloudCoverHour0: Int = 0
var cloudCoverHour1: Int = 0
var cloudCoverHour2: Int = 0
var cloudCoverHour3: Int = 0
var cloudCoverHour4: Int = 0
var cloudCoverHour5: Int = 0
var cloudCoverHour6: Int = 0
var cloudCoverHour7: Int = 0
var cloudCoverHour8: Int = 0
var cloudCoverHour9: Int = 0
var cloudCoverHour10: Int = 0
var cloudCoverHour11: Int = 0
var cloudCoverHour12: Int = 0
var cloudCoverHour13: Int = 0
var cloudCoverHour14: Int = 0
var cloudCoverHour15: Int = 0

// MARK: - Hourly condition values
var conditionHour0: String = ""
var conditionHour1: String = ""
var conditionHour2: String = ""
var conditionHour3: String = ""
var conditionHour4: String = ""
var conditionHour5: String = ""
var conditionHour6: String = ""
var conditionHour7: String = ""
var conditionHour8: String = ""
var conditionHour9: String = ""
var conditionHour10: String = ""
var conditionHour11: String = ""
var conditionHour12: String = ""
var conditionHour13: String = ""
var conditionHour14: String = ""
var conditionHour15: String = ""

// MARK: - Hourly strings
var hour0: String = ""
var hour1: String = ""
var hour2: String = ""
var hour3: String = ""
var hour4: String = ""
var hour5: String = ""
var hour6: String = ""
var hour7: String = ""
var hour8: String = ""
var hour9: String = ""
var hour10: String = ""
var hour11: String = ""
var hour12: String = ""
var hour13: String = ""
var hour14: String = ""
var hour15: String = ""

// MARK: - Other weather values
var airQualityConcern: String = ""
var uvIndex: Int = 0
var visibility: Int = 0
var pressure: Int = 0
var dewPoint: Int = 0
var cloudCover: Int = 0
var precipIntensity: Double = 0

// MARK: - Daily weather values
var highTemperature: Int = 0
var lowTemperature: Int = 0
var precipitation: Int = 0
var precipitationType: String = ""
var humidity: Int = 0
var wind: Int = 0
var windGust: Int = 0
var windBearing: String = ""
var sunrise: String = ""
var sunset: String = ""
var moonPhaseString: String = ""

var sunriseDate = Date()
var sunsetDate = Date()

// MARK: - Seven day forecast day values
// Day Zero
var day0Condition: String = ""
var day0DayString: String = ""
var day0DayStringFull: String = ""
var day0DateString: String = ""
var day0Summary: String = ""
var day0Sunrise: String = ""
var day0Sunset: String = ""
var day0High: Int = 0
var day0Low: Int = 0
var day0Precip: Int = 0
var day0PrecipAccum: Double = 0
var day0Humidity: Int = 0
var day0Wind: Double = 0
var day0WindGust: Double = 0
var day0WindBearing: String = ""
var day0DewPoint: Int = 0
var day0Pressure: Double = 0
var day0Visibility: Int = 0
var day0UVIndex: Int = 0

// Day One
var day1Condition: String = ""
var day1DayString: String = ""
var day1DayStringFull: String = ""
var day1DateString: String = ""
var day1Summary: String = ""
var day1Sunrise: String = ""
var day1Sunset: String = ""
var day1High: Int = 0
var day1Low: Int = 0
var day1Precip: Int = 0
var day1PrecipAccum: Double = 0
var day1Humidity: Int = 0
var day1Wind: Double = 0
var day1WindGust: Double = 0
var day1WindBearing: String = ""
var day1DewPoint: Int = 0
var day1Pressure: Double = 0
var day1Visibility: Int = 0
var day1UVIndex: Int = 0

// Day Two
var day2Condition: String = ""
var day2DayString: String = ""
var day2DayStringFull: String = ""
var day2DateString: String = ""
var day2Summary: String = ""
var day2Sunrise: String = ""
var day2Sunset: String = ""
var day2High: Int = 0
var day2Low: Int = 0
var day2Precip: Int = 0
var day2PrecipAccum: Double = 0
var day2Humidity: Int = 0
var day2Wind: Double = 0
var day2WindGust: Double = 0
var day2WindBearing: String = ""
var day2DewPoint: Int = 0
var day2Pressure: Double = 0
var day2Visibility: Int = 0
var day2UVIndex: Int = 0

// Day Three
var day3Condition: String = ""
var day3DayString: String = ""
var day3DayStringFull: String = ""
var day3DateString: String = ""
var day3Summary: String = ""
var day3Sunrise: String = ""
var day3Sunset: String = ""
var day3High: Int = 0
var day3Low: Int = 0
var day3Precip: Int = 0
var day3PrecipAccum: Double = 0
var day3Humidity: Int = 0
var day3Wind: Double = 0
var day3WindGust: Double = 0
var day3WindBearing: String = ""
var day3DewPoint: Int = 0
var day3Pressure: Double = 0
var day3Visibility: Int = 0
var day3UVIndex: Int = 0

// Day Four
var day4Condition: String = ""
var day4DayString: String = ""
var day4DayStringFull: String = ""
var day4DateString: String = ""
var day4Summary: String = ""
var day4Sunrise: String = ""
var day4Sunset: String = ""
var day4High: Int = 0
var day4Low: Int = 0
var day4Precip: Int = 0
var day4PrecipAccum: Double = 0
var day4Humidity: Int = 0
var day4Wind: Double = 0
var day4WindGust: Double = 0
var day4WindBearing: String = ""
var day4DewPoint: Int = 0
var day4Pressure: Double = 0
var day4Visibility: Int = 0
var day4UVIndex: Int = 0

// Day Five
var day5Condition: String = ""
var day5DayString: String = ""
var day5DayStringFull: String = ""
var day5DateString: String = ""
var day5Summary: String = ""
var day5Sunrise: String = ""
var day5Sunset: String = ""
var day5High: Int = 0
var day5Low: Int = 0
var day5Precip: Int = 0
var day5PrecipAccum: Double = 0
var day5Humidity: Int = 0
var day5Wind: Double = 0
var day5WindGust: Double = 0
var day5WindBearing: String = ""
var day5DewPoint: Int = 0
var day5Pressure: Double = 0
var day5Visibility: Int = 0
var day5UVIndex: Int = 0

// Day Six
var day6Condition: String = ""
var day6DayString: String = ""
var day6DayStringFull: String = ""
var day6DateString: String = ""
var day6Summary: String = ""
var day6Sunrise: String = ""
var day6Sunset: String = ""
var day6High: Int = 0
var day6Low: Int = 0
var day6Precip: Int = 0
var day6PrecipAccum: Double = 0
var day6Humidity: Int = 0
var day6Wind: Double = 0
var day6WindGust: Double = 0
var day6WindBearing: String = ""
var day6DewPoint: Int = 0
var day6Pressure: Double = 0
var day6Visibility: Int = 0
var day6UVIndex: Int = 0

// Day Seven
var day7Condition: String = ""
var day7DayString: String = ""
var day7DayStringFull: String = ""
var day7DateString: String = ""
var day7Summary: String = ""
var day7Sunrise: String = ""
var day7Sunset: String = ""
var day7High: Int = 0
var day7Low: Int = 0
var day7Precip: Int = 0
var day7PrecipAccum: Double = 0
var day7Humidity: Int = 0
var day7Wind: Double = 0
var day7WindGust: Double = 0
var day7WindBearing: String = ""
var day7DewPoint: Int = 0
var day7Pressure: Double = 0
var day7Visibility: Int = 0
var day7UVIndex: Int = 0

// Day Eight
var day8Condition: String = ""
var day8DayString: String = ""
var day8DayStringFull: String = ""
var day8DateString: String = ""
var day8Summary: String = ""
var day8Sunrise: String = ""
var day8Sunset: String = ""
var day8High: Int = 0
var day8Low: Int = 0
var day8Precip: Int = 0
var day8PrecipAccum: Double = 0
var day8Humidity: Int = 0
var day8Wind: Double = 0
var day8WindGust: Double = 0
var day8WindBearing: String = ""
var day8DewPoint: Int = 0
var day8Pressure: Double = 0
var day8Visibility: Int = 0
var day8UVIndex: Int = 0

// Day Nine
var day9Condition: String = ""
var day9DayString: String = ""
var day9DayStringFull: String = ""
var day9DateString: String = ""
var day9Summary: String = ""
var day9Sunrise: String = ""
var day9Sunset: String = ""
var day9High: Int = 0
var day9Low: Int = 0
var day9Precip: Int = 0
var day9PrecipAccum: Double = 0
var day9Humidity: Int = 0
var day9Wind: Double = 0
var day9WindGust: Double = 0
var day9WindBearing: String = ""
var day9DewPoint: Int = 0
var day9Pressure: Double = 0
var day9Visibility: Int = 0
var day9UVIndex: Int = 0

// MARK: - Get day name
func dayFormat(date: Date, fullLength: Bool) -> String {
    var dayString: String = ""
    
    if fullLength == true {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dayString = dateFormatter.string(from: date).uppercased()
    } else {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        dayString = dateFormatter.string(from: date).uppercased()
    }
    
    return dayString
}

// MARK: - Get date of day
func dateFormat(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d"
    
    return dateFormatter.string(from: date).uppercased()
}

// MARK: - Get hour times from date
func hourFormat(date: Date) -> String {
    var timeString: String = ""
    if (defaults.bool(forKey: "twentyFourHourClockEnabled") == true) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm"
        timeString = dateFormatter.string(from: date)
    } else {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        timeString = dateFormatter.string(from: date)
    }
    
    return timeString
}

// MARK: - Get 24-Hour Format
func twentyFourHour(hour: Int, meridiem: String) -> Int {
    var hourTime: Int = 0
    
    if hour == 12 && meridiem == "am" {
        hourTime = 0
    } else if hour == 1 && meridiem == "am" {
        hourTime = 1
    } else if hour == 2 && meridiem == "am" {
        hourTime = 2
    } else if hour == 3 && meridiem == "am" {
        hourTime = 3
    } else if hour == 4 && meridiem == "am" {
        hourTime = 4
    } else if hour == 5 && meridiem == "am" {
        hourTime = 5
    } else if hour == 6 && meridiem == "am" {
        hourTime = 6
    } else if hour == 7 && meridiem == "am" {
        hourTime = 7
    } else if hour == 8 && meridiem == "am" {
        hourTime = 8
    } else if hour == 9 && meridiem == "am" {
        hourTime = 9
    } else if hour == 10 && meridiem == "am" {
        hourTime = 10
    } else if hour == 11 && meridiem == "am" {
        hourTime = 11
    } else if hour == 12 && meridiem == "pm" {
        hourTime = 12
    } else if hour == 1 && meridiem == "pm" {
        hourTime = 13
    } else if hour == 2 && meridiem == "pm" {
        hourTime = 14
    } else if hour == 3 && meridiem == "pm" {
        hourTime = 15
    } else if hour == 4 && meridiem == "pm" {
        hourTime = 16
    } else if hour == 5 && meridiem == "pm" {
        hourTime = 17
    } else if hour == 6 && meridiem == "pm" {
        hourTime = 18
    } else if hour == 7 && meridiem == "pm" {
        hourTime = 19
    } else if hour == 8 && meridiem == "pm" {
        hourTime = 20
    } else if hour == 9 && meridiem == "pm" {
        hourTime = 21
    } else if hour == 10 && meridiem == "pm" {
        hourTime = 22
    } else if hour == 11 && meridiem == "pm" {
        hourTime = 23
    }
    
    return hourTime
}

// MARK: - Get sunrise and sunset times
func sunFormat(date: Date) -> String {
    var timeString: String = ""
    if (defaults.bool(forKey: "twentyFourHourClockEnabled") == true) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm"
        timeString = dateFormatter.string(from: date)
    } else {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        timeString = dateFormatter.string(from: date)
    }
    
    return timeString
}

// MARK: - Get wind direction
func windDirection(degree: Double) -> String {
    var directionString: String = ""
    
    if degree == 0 && degree <= 22.4 {
        directionString = "N"
    } else if degree >= 22.5 && degree <= 44 {
        directionString = "NE"
    } else if degree >= 45 && degree <= 67.4 {
        directionString = "NE"
    } else if degree >= 67.5 && degree <= 89 {
        directionString = "NE"
    } else if degree >= 90 && degree <= 112.4 {
        directionString = "E"
    } else if degree >= 112.5 && degree <= 134 {
        directionString = "SE"
    } else if degree >= 135 && degree <= 157.4 {
        directionString = "SE"
    } else if degree >= 157.5 && degree <= 179 {
        directionString = "SE"
    } else if degree >= 180 && degree <= 202.4 {
        directionString = "S"
    } else if degree >= 202.5 && degree <= 224 {
        directionString = "SW"
    } else if degree >= 225 && degree <= 147.4 {
        directionString = "SW"
    } else if degree >= 147.5 && degree <= 269 {
        directionString = "SW"
    } else if degree >= 270 && degree <= 292.4 {
        directionString = "W"
    } else if degree >= 292.5 && degree <= 314 {
        directionString = "NW"
    } else if degree >= 315 && degree <= 337.4 {
        directionString = "NW"
    } else if degree >= 337.5 && degree <= 360 {
        directionString = "NW"
    }
    
    return directionString
}

// MARK: - Get moon phase
func moonPhase(percentage: Double) -> String {
    let value = percentage * 100
    
    if value == 0 {
        moonPhaseString = "New moon"
    } else if value >= 1 && value <= 24 {
        moonPhaseString = "Waxing crescent"
    } else if value == 25 {
        moonPhaseString = "First quarter"
    } else if value >= 26 && value <= 49  {
        moonPhaseString = "Waxing gibbous"
    } else if value == 50 {
        moonPhaseString = "Full moon"
    } else if value >= 51 && value <= 74  {
        moonPhaseString = "Waning gibbous"
    } else if value == 75 {
        moonPhaseString = "Last quarter"
    } else if value >= 76 && value <= 100  {
        moonPhaseString = "Waning crescent"
    }
    
    return moonPhaseString
}

// Convert KMH to MS
func kmhToMS(speed: CGFloat) -> Int {
    return Int(speed / 3.6)
}

// Convert Inches to Millimeters
func inToMM(amount: Double) -> Double {
    return Double(amount * 25.4)
}

func dailyPrecipAccum(day: DataPoint) -> Double {
    var dailyValue: Double = 0
    
    if day.precipitationAccumulation != nil {
        if unitsPrecipitation == "mm" {
            dailyValue = inToMM(amount: Double(day.precipitationAccumulation!))
        } else {
            dailyValue = Double(day.precipitationAccumulation!)
        }
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

// Get daily precip probability
func dailyPrecipProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.precipitationProbability != nil {
        dailyValue = Int(day.precipitationProbability! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

// Get float precip probability
func cgFloatPrecipProb(day: CGFloat) -> Int {
    var dailyValue: Int = 0
    
    if day.isNaN == true {
        dailyValue = 0
    } else {
        dailyValue = Int(day * 100)
    }
    
    return dailyValue
}

// Get daily humidity
func dailyHumidityProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.humidity != nil {
        dailyValue = Int(day.humidity! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

// Get daily cloud cover
func dailyCloudCoverProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.cloudCover != nil {
        dailyValue = Int(day.cloudCover! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

// Get minute precip probability
func minutePrecipProb(value: Int, minute: DataBlock?) -> Int {
    var minuteValue: Int = 0
    
    let fetchMinute = minute!.data[value]
    let minuteArray = fetchMinute
    
    if minuteArray.precipitationProbability != nil {
        minuteValue = Int(minuteArray.precipitationProbability! * 100)
    } else {
        minuteValue = 0
    }
    
    return minuteValue
}

// Get minute precip intensity
func minutePrecipIntensity(value: Int, minute: DataBlock?) -> Double {
    var minuteValue: Double = 0
    
    let fetchMinute = minute!.data[value]
    let minuteArray = fetchMinute
    
    if minuteArray.precipitationIntensity != nil {
        minuteValue = Double(minuteArray.precipitationIntensity!).rounded(toPlaces: 2)
    } else {
        minuteValue = 0
    }
    
    return minuteValue
}

// Get minute precip type
func minutePrecipType(value: Int, minute: DataBlock?) -> String {
    var minuteValue: String = ""
    
    let fetchMinute = minute!.data[value]
    let minuteArray = fetchMinute
    
    if minuteArray.precipitationType != nil {
        minuteValue = "\(minuteArray.precipitationType!)"
    } else {
        minuteValue = "none"
    }
    
    return minuteValue
}

// Get hour precipitation
func hourPrecipProb(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.precipitationProbability != nil {
        hourValue = Int(hourArray.precipitationProbability! * 100)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

func hourAccumProb(value: Int, hour: DataBlock?) -> Double {
    var hourValue: Double = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.precipitationAccumulation != nil {
        if unitsPrecipitation == "mm" {
            hourValue = inToMM(amount: Double(hourArray.precipitationAccumulation!))
        } else {
            hourValue = Double(hourArray.precipitationAccumulation!)
        }
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour temperature
func hourTemp(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.temperature != nil {
        hourValue = Int(hourArray.temperature!)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour humidity
func hourHumidity(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.humidity != nil {
        hourValue = Int(hourArray.humidity! * 100)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour uv index
func hourUVIndex(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.uvIndex != nil {
        hourValue = Int(hourArray.uvIndex!)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour pressure
func hourPressure(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.pressure != nil {
        hourValue = Int(hourArray.pressure!)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour wind speed
func hourWindSpeed(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.windSpeed != nil {
        hourValue = Int(hourArray.windSpeed!)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour wind direction
func hourWindDirection(value: Int, hour: DataBlock?) -> String {
    var hourValue: Double = 0
    var hourDirectionString: String = ""
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.windBearing != nil {
        hourValue = hourArray.windBearing!
        hourDirectionString = windDirection(degree: hourValue)
    } else {
        hourValue = 0
    }
    
    return hourDirectionString
}

// Get hour cloud cover
func hourCloudCover(value: Int, hour: DataBlock?) -> Int {
    var hourValue: Int = 0
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.cloudCover != nil {
        hourValue = Int(hourArray.cloudCover! * 100)
    } else {
        hourValue = 0
    }
    
    return hourValue
}

// Get hour icon
func hourIcon(value: Int, hour: DataBlock?) -> String {
    var hourValue: String = ""
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    if hourArray.icon != nil {
        hourValue = hourArray.icon!.rawValue
    } else {
        hourValue = ""
    }
    
    return hourValue
}

// Get hour time
func hourTime(value: Int, hour: DataBlock?) -> String {
    var hourValue: String = ""
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    hourValue = hourFormat(date: hourArray.time)
    
    return hourValue
}

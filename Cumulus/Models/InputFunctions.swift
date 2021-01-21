//
//  Input Functions.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 2/26/19.
//  Copyright © 2019 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import ForecastIO

func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ())  {
    CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemarks, error in
        guard let placemark = placemarks?.first, error == nil else {
            completion(nil, error)
            return
        }
        completion(placemark, nil)
    }
}

func setButtonTextColor(button: UIButton!) {
    button.setTitleColor(UIColor.label, for: .normal)
}

func setupHourlyConditionText(label: UILabel!, condition: String, windDirection: String) {
    label.text = "\(weatherCondition(condition: condition, type: "text", circle: defaults.string(forKey: "defaultConditionIcons")!))"
    
    // If condition is wind setup text with wind direction
    if label.text == "Wind" {
        label.text = "\(weatherCondition(condition: condition, type: "text", circle: defaults.string(forKey: "defaultConditionIcons")!)) \(windDirection)"
    }
}

// MARK: - Get image for forecast condition
func weatherCondition(condition: String, type: String, circle: String) -> String {
    var conditionString: String = ""
    
    if condition == "clear-night" {
        if type == "image" {
            conditionString = "Clear_night\(circle).pdf"
        } else if type == "text" {
            conditionString = "Clear"
        } else if type == "daily" {
            conditionString = "Clear\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Clear_night_widget\(circle)"
        }
    }
    
    if condition == "clear-day" || condition == "clear" {
        if type == "image" {
            conditionString = "Clear\(circle).pdf"
        } else if type == "text" {
            conditionString = "Clear"
        } else if type == "daily" {
            conditionString = "Clear\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Clear_widget\(circle)"
        }
    }
    
    if condition == "cloudy" || condition == "clouds" {
        if type == "image" {
            conditionString = "Cloudy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Cloudy"
        } else if type == "daily" {
            conditionString = "Cloudy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Cloudy_widget\(circle)"
        }
    }
    
    if condition == "drizzle" {
        if type == "image" {
            conditionString = "Drizzle\(circle).pdf"
        } else if type == "text" {
            conditionString = "Drizzle"
        } else if type == "daily" {
            conditionString = "Drizzle\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Drizzle_widget\(circle)"
        }
    }
    
    if condition == "dust" || condition == "ash" || condition == "sand" {
        if type == "image" {
            conditionString = "Dust\(circle).pdf"
        } else if type == "text" {
            conditionString = "Dust"
        } else if type == "daily" {
            conditionString = "Dust\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Dust_widget\(circle)"
        }
    }
    
    if condition == "flurries" {
        if type == "image" {
            conditionString = "Flurries\(circle).pdf"
        } else if type == "text" {
            conditionString = "Flurries"
        } else if type == "daily" {
            conditionString = "Flurries\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Flurries_widget\(circle)"
        }
    }
    
    if condition == "light-fog" {
        if type == "image" {
            conditionString = "Light_fog\(circle).pdf"
        } else if type == "text" {
            conditionString = "Light fog"
        } else if type == "daily" {
            conditionString = "Light_fog\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Light_fog_widget\(circle)"
        }
    }
    
    if condition == "fog" {
        if type == "image" {
            conditionString = "Fog\(circle).pdf"
        } else if type == "text" {
            conditionString = "Fog"
        } else if type == "daily" {
            conditionString = "Fog\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Fog_widget\(circle)"
        }
    }
    
    if condition == "freezing-rain" {
        if type == "image" {
            conditionString = "Freezing_rain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Freezing rain"
        } else if type == "daily" {
            conditionString = "Freezing_rain\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Freezing_rain_widget\(circle)"
        }
    }
    
    if condition == "freezing-rain-heavy" {
        if type == "image" {
            conditionString = "Freezing_rain_heavy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Heavy freezing rain"
        } else if type == "daily" {
            conditionString = "Freezing_rain_heavy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Freezing_rain_heavy_widget\(circle)"
        }
    }
    
    if condition == "light-ice-pellets" {
        if type == "image" {
            conditionString = "Light_ice_pellets\(circle).pdf"
        } else if type == "text" {
            conditionString = "Light ice pellets"
        } else if type == "daily" {
            conditionString = "Light_ice_pellets\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Light_ice_pellets_widget\(circle)"
        }
    }
    
    if condition == "ice-pellets" {
        if type == "image" {
            conditionString = "Ice_pellets\(circle).pdf"
        } else if type == "text" {
            conditionString = "Ice pellets"
        } else if type == "daily" {
            conditionString = "Ice_pellets\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Ice_pellets_widget\(circle)"
        }
    }
    
    if condition == "mist" || condition == "smoke" || condition == "haze" {
        if type == "image" {
            conditionString = "Mist\(circle).pdf"
        } else if type == "text" {
            conditionString = "Mist"
        } else if type == "daily" {
            conditionString = "Mist\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Mist_widget\(circle)"
        }
    }
    
    if condition == "mostly-clear" {
        if type == "image" {
            conditionString = "Mostly_clear\(circle).pdf"
        } else if type == "text" {
            conditionString = "Mostly clear"
        } else if type == "daily" {
            conditionString = "Mostly_clear\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Mostly_clear_widget\(circle)"
        }
    }
    
    if condition == "mostly-clear-night" {
        if type == "image" {
            conditionString = "Mostly_clear_night\(circle).pdf"
        } else if type == "text" {
            conditionString = "Mostly clear"
        } else if type == "daily" {
            conditionString = "Mostly_clear_night\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Mostly_clear_night_widget\(circle)"
        }
    }
    
    if condition == "mostly-cloudy" {
        if type == "image" {
            conditionString = "Mostly_cloudy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Mostly cloudy"
        } else if type == "daily" {
            conditionString = "Mostly_cloudy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Mostly_cloudy_widget\(circle)"
        }
    }
    
    if condition == "partly-cloudy-day" {
        if type == "image" {
            conditionString = "Partly_cloudy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy"
        } else if type == "daily" {
            conditionString = "Partly_cloudy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Partly_cloudy_widget\(circle)"
        }
    }
    
    if condition == "partly-cloudy-night" {
        if type == "image" {
            conditionString = "Partly_cloudy_night\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy"
        } else if type == "daily" {
            conditionString = "Partly_cloudy_night\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Partly_cloudy_night_widget\(circle)"
        }
    }
    
    if condition == "light-rain" {
        if type == "image" {
            conditionString = "Light_rain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Light rain"
        } else if type == "daily" {
            conditionString = "Light_rain\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Light_rain_widget\(circle)"
        }
    }
    
    if condition == "rain" {
        if type == "image" {
            conditionString = "Rain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Rain"
        } else if type == "daily" {
            conditionString = "Rain\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Rain_widget\(circle)"
        }
    }
    
    if condition == "heavy-rain" {
        if type == "image" {
            conditionString = "Heavy_rain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Heavy rain"
        } else if type == "daily" {
            conditionString = "Heavy_rain\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Heavy_rain_widget\(circle)"
        }
    }

    if condition == "light-snow" {
        if type == "image" {
            conditionString = "Light_snow\(circle).pdf"
        } else if type == "text" {
            conditionString = "Light snow"
        } else if type == "daily" {
            conditionString = "Light_snow\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Light_snow_widget\(circle)"
        }
    }
    
    if condition == "snow" {
        if type == "image" {
            conditionString = "Snow\(circle).pdf"
        } else if type == "text" {
            conditionString = "Snow"
        } else if type == "daily" {
            conditionString = "Snow\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Snow_widget\(circle)"
        }
    }
    
    
    if condition == "heavy-snow" {
        if type == "image" {
            conditionString = "Heavy_snow\(circle).pdf"
        } else if type == "text" {
            conditionString = "Heavy snow"
        } else if type == "daily" {
            conditionString = "Heavy_snow\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Heavy_snow_widget\(circle)"
        }
    }
    
    if condition == "thunderstorm" {
        if type == "image" {
            conditionString = "Thunderstorm\(circle).pdf"
        } else if type == "text" {
            conditionString = "Thunderstorm"
        } else if type == "daily" {
            conditionString = "Thunderstorm\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Thunderstorm_widget\(circle)"
        }
    }
    
    if condition == "tornado" {
        if type == "image" {
            conditionString = "Tornado\(circle).pdf"
        } else if type == "text" {
            conditionString = "Tornado"
        } else if type == "daily" {
            conditionString = "Tornado\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Tornado_widget\(circle)"
        }
    }
    
    if condition == "wind" || condition == "squall" {
        if type == "image" {
            conditionString = "Windy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Windy"
        } else if type == "daily" {
            conditionString = "Windy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Windy_widget\(circle)"
        }
    }
    
    if condition.isEmpty == true {
        if type == "image" {
            conditionString = "Partly Cloudy.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy"
        } else if type == "daily" {
            conditionString = "Partly Cloudy.pdf"
        } else if type == "widget" {
            conditionString = "Partly Cloudy widget"
        }
    }
    
    return conditionString
}

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

func kmhToMS(speed: CGFloat) -> Int {
    return Int(speed / 3.6)
}

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

func dailyPrecipProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.precipitationProbability != nil {
        dailyValue = Int(day.precipitationProbability! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

func cgFloatPrecipProb(day: CGFloat) -> Int {
    var dailyValue: Int = 0
    
    if day.isNaN == true {
        dailyValue = 0
    } else {
        dailyValue = Int(day * 100)
    }
    
    return dailyValue
}

func dailyHumidityProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.humidity != nil {
        dailyValue = Int(day.humidity! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

func dailyCloudCoverProb(day: DataPoint) -> Int {
    var dailyValue: Int = 0
    
    if day.cloudCover != nil {
        dailyValue = Int(day.cloudCover! * 100)
    } else {
        dailyValue = 0
    }
    
    return dailyValue
}

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

func hourTime(value: Int, hour: DataBlock?) -> String {
    var hourValue: String = ""
    
    let fetchHour = hour!.data[value]
    let hourArray = fetchHour
    
    hourValue = hourFormat(date: hourArray.time)
    
    return hourValue
}

func hourlyValue(value: Int) -> Int {
    var valueInteger: Int = 0
    
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    if screenWidth == 320 {
        valueInteger = value + 3
    } else {
        valueInteger = value + 6
    }
    
    return valueInteger
}

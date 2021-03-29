//
//  Functions.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 2/1/21.
//  Copyright © 2021 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import CoreLocation
import ForecastIO

func setWeatherConditionImage(condition: String, type: String, circle: String) -> String {
    switch condition {
    case "clear-night":
        if type == "text" {
            return "Clear"
        } else if type == "daily" {
            return "Clear\(circle).pdf"
        } else if type == "widget" {
            return "ClearNightWidget\(circle)"
        } else {
            return "ClearNight\(circle).pdf"
        }
    case "clear-day":
        if type == "text" {
            return "Clear"
        } else if type == "daily" {
            return "Clear\(circle).pdf"
        } else if type == "widget" {
            return "ClearWidget\(circle)"
        } else {
            return "Clear\(circle).pdf"
        }
    case "clear":
        if type == "text" {
            return "Clear"
        } else if type == "daily" {
            return "Clear\(circle).pdf"
        } else if type == "widget" {
            return "ClearWidget\(circle)"
        } else {
            return "Clear\(circle).pdf"
        }
    case "cloudy":
        if type == "text" {
            return "Cloudy"
        } else if type == "daily" {
            return "Cloudy\(circle).pdf"
        } else if type == "widget" {
            return "CloudyWidget\(circle)"
        } else {
            return "Cloudy\(circle).pdf"
        }
    case "clouds":
        if type == "text" {
            return "Cloudy"
        } else if type == "daily" {
            return "Cloudy\(circle).pdf"
        } else if type == "widget" {
            return "CloudyWidget\(circle)"
        } else {
            return "Cloudy\(circle).pdf"
        }
    case "drizzle":
        if type == "text" {
            return "Drizzle"
        } else if type == "daily" {
            return "Drizzle\(circle).pdf"
        } else if type == "widget" {
            return "DrizzleWidget\(circle)"
        } else {
            return "Drizzle\(circle).pdf"
        }
    case "dust":
        if type == "text" {
            return "Dust"
        } else if type == "daily" {
            return "Dust\(circle).pdf"
        } else if type == "widget" {
            return "DustWidget\(circle)"
        } else {
            return "Dust\(circle).pdf"
        }
    case "ash":
        if type == "text" {
            return "Ash"
        } else if type == "daily" {
            return "Dust\(circle).pdf"
        } else if type == "widget" {
            return "DustWidget\(circle)"
        } else {
            return "Dust\(circle).pdf"
        }
    case "sand":
        if type == "text" {
            return "Sand"
        } else if type == "daily" {
            return "Dust\(circle).pdf"
        } else if type == "widget" {
            return "DustWidget\(circle)"
        } else {
            return "Dust\(circle).pdf"
        }
    case "flurries":
        if type == "text" {
            return "Flurries"
        } else if type == "daily" {
            return "Flurries\(circle).pdf"
        } else if type == "widget" {
            return "FlurriesWidget\(circle)"
        } else {
            return "Flurries\(circle).pdf"
        }
    case "light-fog":
        if type == "text" {
            return "LightFog"
        } else if type == "daily" {
            return "LightFog\(circle).pdf"
        } else if type == "widget" {
            return "LightFogWidget\(circle)"
        } else {
            return "LightFog\(circle).pdf"
        }
    case "fog":
        if type == "text" {
            return "Fog"
        } else if type == "daily" {
            return "Fog\(circle).pdf"
        } else if type == "widget" {
            return "FogWidget\(circle)"
        } else {
            return "Fog\(circle).pdf"
        }
    case "freezing-rain":
        if type == "text" {
            return "Freezing rain"
        } else if type == "daily" {
            return "FreezingRain\(circle).pdf"
        } else if type == "widget" {
            return "FreezingRainWidget\(circle)"
        } else {
            return "FreezingRain\(circle).pdf"
        }
    case "freezing-rain-heavy":
        if type == "text" {
            return "Heavy freezing rain"
        } else if type == "daily" {
            return "FreezingRainHeavy\(circle).pdf"
        } else if type == "widget" {
            return "FreezingRainHeavyWidget\(circle)"
        } else {
            return "FreezingRainHeavy\(circle).pdf"
        }
    case "light-ice-pellets":
        if type == "text" {
            return "Light ice pellets"
        } else if type == "daily" {
            return "LightIcePellets\(circle).pdf"
        } else if type == "widget" {
            return "LightIcePelletsWidget\(circle)"
        } else {
            return "LightIcePellets\(circle).pdf"
        }
    case "ice-pellets":
        if type == "text" {
            return "Ice pellets"
        } else if type == "daily" {
            return "IcePellets\(circle).pdf"
        } else if type == "widget" {
            return "IcePelletsWidget\(circle)"
        } else {
            return "IcePellets\(circle).pdf"
        }
    case "mist":
        if type == "text" {
            return "Mist"
        } else if type == "daily" {
            return "Mist\(circle).pdf"
        } else if type == "widget" {
            return "MistWidget\(circle)"
        } else {
            return "Mist\(circle).pdf"
        }
    case "smoke":
        if type == "text" {
            return "Smoke"
        } else if type == "daily" {
            return "Mist\(circle).pdf"
        } else if type == "widget" {
            return "MistWidget\(circle)"
        } else {
            return "Mist\(circle).pdf"
        }
    case "haze":
        if type == "text" {
            return "Haze"
        } else if type == "daily" {
            return "Mist\(circle).pdf"
        } else if type == "widget" {
            return "MistWidget\(circle)"
        } else {
            return "Mist\(circle).pdf"
        }
    case "mostly-clear":
        if type == "text" {
            return "Mostly clear"
        } else if type == "daily" {
            return "MostlyClear\(circle).pdf"
        } else if type == "widget" {
            return "MostlyClearWidget\(circle)"
        } else {
            return "MostlyClear\(circle).pdf"
        }
    case "mostly-clear-night":
        if type == "text" {
            return "Mostly clear"
        } else if type == "daily" {
            return "MostlyClearNight\(circle).pdf"
        } else if type == "widget" {
            return "MostlyClearNightWidget\(circle)"
        } else {
            return "MostlyClearNight\(circle).pdf"
        }
    case "mostly-cloudy":
        if type == "text" {
            return "Mostly cloudy"
        } else if type == "daily" {
            return "MostlyCloudy\(circle).pdf"
        } else if type == "widget" {
            return "MostlyCloudyWidget\(circle)"
        } else {
            return "MostlyCloudy\(circle).pdf"
        }
    case "partly-cloudy":
        if type == "text" {
            return "Partly cloudy"
        } else if type == "daily" {
            return "PartlyCloudy\(circle).pdf"
        } else if type == "widget" {
            return "PartlyCloudyWidget\(circle)"
        } else {
            return "PartlyCloudy\(circle).pdf"
        }
    case "partly-cloudy-night":
        if type == "text" {
            return "Partly cloudy"
        } else if type == "daily" {
            return "PartlyCloudyNight\(circle).pdf"
        } else if type == "widget" {
            return "PartlyCloudyNightWidget\(circle)"
        } else {
            return "PartlyCloudyNight\(circle).pdf"
        }
    case "light-rain":
        if type == "text" {
            return "Light rain"
        } else if type == "daily" {
            return "LightRain\(circle).pdf"
        } else if type == "widget" {
            return "LightRainWidget\(circle)"
        } else {
            return "LightRain\(circle).pdf"
        }
    case "rain":
        if type == "text" {
            return "Rain"
        } else if type == "daily" {
            return "Rain\(circle).pdf"
        } else if type == "widget" {
            return "RainWidget\(circle)"
        } else {
            return "Rain\(circle).pdf"
        }
    case "heavy-rain":
        if type == "text" {
            return "Heavy rain"
        } else if type == "daily" {
            return "HeavyRain\(circle).pdf"
        } else if type == "widget" {
            return "HeavyRainWidget\(circle)"
        } else {
            return "HeavyRain\(circle).pdf"
        }
    case "light-snow":
        if type == "text" {
            return "Light snow"
        } else if type == "daily" {
            return "LightSnow\(circle).pdf"
        } else if type == "widget" {
            return "LightSnowWidget\(circle)"
        } else {
            return "LightSnow\(circle).pdf"
        }
    case "snow":
        if type == "text" {
            return "Snow"
        } else if type == "daily" {
            return "Snow\(circle).pdf"
        } else if type == "widget" {
            return "SnowWidget\(circle)"
        } else {
            return "Snow\(circle).pdf"
        }
    case "heavy-snow":
        if type == "text" {
            return "Heavy snow"
        } else if type == "daily" {
            return "HeavySnow\(circle).pdf"
        } else if type == "widget" {
            return "HeavySnowWidget\(circle)"
        } else {
            return "HeavySnow\(circle).pdf"
        }
    case "thunderstorm":
        if type == "text" {
            return "Thunderstorm"
        } else if type == "daily" {
            return "Thunderstorm\(circle).pdf"
        } else if type == "widget" {
            return "ThunderstormWidget\(circle)"
        } else {
            return "Thunderstorm\(circle).pdf"
        }
    case "tornado":
        if type == "text" {
            return "Tornado"
        } else if type == "daily" {
            return "Tornado\(circle).pdf"
        } else if type == "widget" {
            return "TornadoWidget\(circle)"
        } else {
            return "Tornado\(circle).pdf"
        }
    case "wind":
        if type == "text" {
            return "Windy"
        } else if type == "daily" {
            return "Windy\(circle).pdf"
        } else if type == "widget" {
            return "WindyWidget\(circle)"
        } else {
            return "Windy\(circle).pdf"
        }
    case "squall":
        if type == "text" {
            return "Windy"
        } else if type == "daily" {
            return "Windy\(circle).pdf"
        } else if type == "widget" {
            return "WindyWidget\(circle)"
        } else {
            return "Windy\(circle).pdf"
        }
    default:
        if type == "text" {
            return "Clear"
        } else if type == "daily" {
            return "Clear\(circle).pdf"
        } else if type == "widget" {
            return "ClearWidget\(circle)"
        } else {
            return "Clear\(circle).pdf"
        }
    }
}

func setButtonTextColor(button: UIButton!) {
    button.setTitleColor(UIColor.label, for: .normal)
}

func setupHourlyConditionText(label: UILabel!, condition: String, windDirection: String) {
    label.text = "\(setWeatherConditionImage(condition: condition, type: "text", circle: defaults.string(forKey: "defaultConditionIcons")!))"
    
    // If condition is windy show wind direction
    if label.text == "Wind" {
        label.text = "\(setWeatherConditionImage(condition: condition, type: "text", circle: defaults.string(forKey: "defaultConditionIcons")!)) \(windDirection)"
    }
}

func setTableViewCellColor(tableCell: UITableViewCell) {
    if (defaults.string(forKey: "userSavedColorString") == "Mango") {
        tableCell.tintColor = mango
    } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
        tableCell.tintColor = maximumRed
    } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
        tableCell.tintColor = dodgerBlue
    } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
        tableCell.tintColor = plumpPurple
    } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
        tableCell.tintColor = orchid
    } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
        tableCell.tintColor = springGreen
    } else {
        tableCell.tintColor = dodgerBlue
    }
}

func setTabBarColor(tabBar: UITabBarController) {
    if (defaults.string(forKey: "userSavedColorString") == "Mango") {
        tabBar.tabBar.tintColor = mango
    } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
        tabBar.tabBar.tintColor = maximumRed
    } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
        tabBar.tabBar.tintColor = dodgerBlue
    } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
        tabBar.tabBar.tintColor = plumpPurple
    } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
        tabBar.tabBar.tintColor = orchid
    } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
        tabBar.tabBar.tintColor = springGreen
    } else {
        tabBar.tabBar.tintColor = dodgerBlue
    }
}

func setupLabelColor(label: UILabel!) {
    if (defaults.string(forKey: "userSavedColorString") == "Mango") {
         label.textColor = mango
    } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
         label.textColor = maximumRed
    } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
         label.textColor = dodgerBlue
    } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
         label.textColor = plumpPurple
    } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
         label.textColor = orchid
    } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
        label.textColor = springGreen
    }else {
         label.textColor = dodgerBlue
    }
}

func setupButtonColor(button: UIButton!) {
    if (defaults.string(forKey: "userSavedColorString") == "Mango") {
         button.setTitleColor(mango, for: .normal)
    } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
         button.setTitleColor(maximumRed, for: .normal)
    } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
         button.setTitleColor(dodgerBlue, for: .normal)
    } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
         button.setTitleColor(plumpPurple, for: .normal)
    } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
         button.setTitleColor(orchid, for: .normal)
    } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
         button.setTitleColor(springGreen, for: .normal)
    } else {
         button.setTitleColor(dodgerBlue, for: .normal)
    }
}

func setupBarButtonColor(button: UIBarButtonItem!) {
    if (defaults.string(forKey: "userSavedColorString") == "Mango") {
        button.tintColor = mango
    } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
        button.tintColor = maximumRed
    } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
        button.tintColor = dodgerBlue
    } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
        button.tintColor = plumpPurple
    } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
        button.tintColor = orchid
    } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
        button.tintColor = springGreen
    } else {
        button.tintColor = dodgerBlue
    }
}

func setupSwitchColor(switchOne: UISwitch!) {
    if (defaults.string(forKey: "userSavedColorString") == "Mango") {
         switchOne.onTintColor = mango
    } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
         switchOne.onTintColor = maximumRed
    } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
         switchOne.onTintColor = dodgerBlue
    } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
         switchOne.onTintColor = plumpPurple
    } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
         switchOne.onTintColor = orchid
    } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
         switchOne.onTintColor = springGreen
    } else {
         switchOne.onTintColor = dodgerBlue
    }
}

func setupTextFieldColor(textField: UITextField!) {
    if (defaults.string(forKey: "userSavedColorString") == "Mango") {
         textField.textColor = mango
    } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
         textField.textColor = maximumRed
    } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
         textField.textColor = dodgerBlue
    } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
         textField.textColor = plumpPurple
    } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
         textField.textColor = orchid
    } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
         textField.textColor = springGreen
    } else {
         textField.textColor = dodgerBlue
    }
}

func universalSettings() {
    if let widgetSetDataSource = UserDefaults.init(suiteName: "group.com.josephszafarowicz.weather")?.string(forKey: "setDataSource") {
        universalDataSource = widgetSetDataSource
    }
    
    if let widgetSet = UserDefaults.init(suiteName: "group.com.josephszafarowicz.weather")?.string(forKey: "setUnits") {
        universalUnits = widgetSet
    }
    
    if let widgetSetCumulusPlus = UserDefaults.init(suiteName: "group.com.josephszafarowicz.weather")?.string(forKey: "setCumulusPlus") {
        universalCumulusPlus = widgetSetCumulusPlus
    }
    
    if let widgetSetIcons = UserDefaults.init(suiteName: "group.com.josephszafarowicz.weather")?.string(forKey: "setIcons") {
        universalIcons = widgetSetIcons
    }
    
    if let widgetSetColor = UserDefaults.init(suiteName: "group.com.josephszafarowicz.weather")?.string(forKey: "setColor") {
        universalColor = widgetSetColor
    }
}

func checkSavedColor() {
    if (defaults.string(forKey: "userSavedColorString") == "Mango") || (defaults.string(forKey: "userSavedColorString") == "Maximum Red") || (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") || (defaults.string(forKey: "userSavedColorString") == "Plump Purple") || (defaults.string(forKey: "userSavedColorString") == "Orchid") || (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
        // Nothing
    } else {
        defaults.set("Dodger Blue", forKey: "userSavedColorString")
    }
}

func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ())  {
    CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemarks, error in
        guard let placemark = placemarks?.first, error == nil else {
            completion(nil, error)
            return
        }
        completion(placemark, nil)
    }
}

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

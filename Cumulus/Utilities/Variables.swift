//
//  Variables.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 2/1/21.
//  Copyright © 2021 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import GooglePlaces

var newLoad: Bool = false
var loadFrame: CGRect = CGRect(x: 0, y: 0, width: 815, height: 815)

var cumulusPlus: Bool = false
var placesClient: GMSPlacesClient!
var sharedSecret: String = "28d11783d1a94fb1895f62c10c4db49b"

var clockChanged: Bool = false
var unitsChanged: Bool = false
var setupCounter: Int = 0
var userViewedCounter: Int = 0
var userInvocationPhrase: String = ""
var twentyFourHourClockEnabled: Bool = false
var hapticFeedbackEnabled: Bool = false

var userSavedAppIconString: String = ""
var autoThemeEnabled: Bool = false
var userChangedTheme: Bool = false
var userSavedColorString: String = ""
var buttonColor: String = ""

var defaultHourlyCondition: String = ""
var defaultConditionIcons: String = ""

var dataSource: String = ""
var universalDataSource: String = ""
var setDataSource: String = ""
var universalUnits: String = ""
var setUnits: String = ""
var universalCumulusPlus: String = ""
var setCumulusPlus: String = ""
var universalIcons: String = ""
var setIcons: String = ""
var universalColor: String = ""
var setColor: String = ""

var weatherLoaded: Bool = false
var distanceChange: Bool = false

var selectedLocation: String = ""
var userDeniedLocation: Bool = false
var latitudeValue: Double = 0
var longitudeValue: Double = 0
var userSelectedSavedLocation: Bool = false
var currentLocation: String = ""

var alertCount: Int = 0
var alertTitle: String = ""
var alertDescription: String = ""
var alertURI: String = ""

var unitsPrecipitation: String = ""
var unitsTemperature: String = ""
var unitsWindSpeed: String = ""
var unitsDistance: String = ""
var unitsPressure: String = ""
var weatherUnits: String = ""

var currentTemperature: Int = 0
var currentCondition: String = ""
var feelsLikeTemperature: Int = 0
var currentSummary: String = ""
var hourSummary: String = ""
var nextHourCondition: String = ""
var precipAccumulation: Double = 0

var aqi: String = ""
var uvIndex: Int = 0
var visibility: Int = 0
var pressure: Int = 0
var dewPoint: Int = 0
var cloudCover: Int = 0
var precipIntensity: Double = 0

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

class Hour {
    
    static let sharedInstance = Hour()
    private init() {}
    
    var hour0: String?
    var hour1: String?
    var hour2: String?
    var hour3: String?
    var hour4: String?
    var hour5: String?
    var hour6: String?
    var hour7: String?
    var hour8: String?
    var hour9: String?
    var hour10: String?
    var hour11: String?
    var hour12: String?
    var hour13: String?
    var hour14: String?
    var hour15: String?
}

class HourlyCondition {
    
    static let sharedInstance = HourlyCondition()
    private init() {}
    
    var hour0: String?
    var hour1: String?
    var hour2: String?
    var hour3: String?
    var hour4: String?
    var hour5: String?
    var hour6: String?
    var hour7: String?
    var hour8: String?
    var hour9: String?
    var hour10: String?
    var hour11: String?
    var hour12: String?
    var hour13: String?
    var hour14: String?
    var hour15: String?
}

class HourlyCloudCover {
    
    static let sharedInstance = HourlyCloudCover()
    private init() {}
    
    var hour0: Int?
    var hour1: Int?
    var hour2: Int?
    var hour3: Int?
    var hour4: Int?
    var hour5: Int?
    var hour6: Int?
    var hour7: Int?
    var hour8: Int?
    var hour9: Int?
    var hour10: Int?
    var hour11: Int?
    var hour12: Int?
    var hour13: Int?
    var hour14: Int?
    var hour15: Int?
}

class HourlyWindSpeed {
    
    static let sharedInstance = HourlyWindSpeed()
    private init() {}
    
    var hour0: Int?
    var hour1: Int?
    var hour2: Int?
    var hour3: Int?
    var hour4: Int?
    var hour5: Int?
    var hour6: Int?
    var hour7: Int?
    var hour8: Int?
    var hour9: Int?
    var hour10: Int?
    var hour11: Int?
    var hour12: Int?
    var hour13: Int?
    var hour14: Int?
    var hour15: Int?
}

class HourlyUVIndex {
    
    static let sharedInstance = HourlyUVIndex()
    private init() {}
    
    var hour0: Int?
    var hour1: Int?
    var hour2: Int?
    var hour3: Int?
    var hour4: Int?
    var hour5: Int?
    var hour6: Int?
    var hour7: Int?
    var hour8: Int?
    var hour9: Int?
    var hour10: Int?
    var hour11: Int?
    var hour12: Int?
    var hour13: Int?
    var hour14: Int?
    var hour15: Int?
}

class HourlyHumidity {
    
    static let sharedInstance = HourlyHumidity()
    private init() {}
    
    var hour0: Int?
    var hour1: Int?
    var hour2: Int?
    var hour3: Int?
    var hour4: Int?
    var hour5: Int?
    var hour6: Int?
    var hour7: Int?
    var hour8: Int?
    var hour9: Int?
    var hour10: Int?
    var hour11: Int?
    var hour12: Int?
    var hour13: Int?
    var hour14: Int?
    var hour15: Int?
}

class HourlyTemperature {
    
    static let sharedInstance = HourlyTemperature()
    private init() {}
    
    var hour0: Int?
    var hour1: Int?
    var hour2: Int?
    var hour3: Int?
    var hour4: Int?
    var hour5: Int?
    var hour6: Int?
    var hour7: Int?
    var hour8: Int?
    var hour9: Int?
    var hour10: Int?
    var hour11: Int?
    var hour12: Int?
    var hour13: Int?
    var hour14: Int?
    var hour15: Int?
}

class HourlyPrecipitation {
    
    static let sharedInstance = HourlyPrecipitation()
    private init() {}
    
    var hour0: Int?
    var hour1: Int?
    var hour2: Int?
    var hour3: Int?
    var hour4: Int?
    var hour5: Int?
    var hour6: Int?
    var hour7: Int?
    var hour8: Int?
    var hour9: Int?
    var hour10: Int?
    var hour11: Int?
    var hour12: Int?
    var hour13: Int?
    var hour14: Int?
    var hour15: Int?
}

class HourlyAccumulation {
    
    static let sharedInstance = HourlyAccumulation()
    private init() {}
    
    var hour0: Double?
    var hour1: Double?
    var hour2: Double?
    var hour3: Double?
    var hour4: Double?
    var hour5: Double?
    var hour6: Double?
    var hour7: Double?
    var hour8: Double?
    var hour9: Double?
    var hour10: Double?
    var hour11: Double?
    var hour12: Double?
    var hour13: Double?
    var hour14: Double?
    var hour15: Double?
}

class Day0 {
    
    static let sharedInstance = Day0()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day1 {
    
    static let sharedInstance = Day1()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day2 {
    
    static let sharedInstance = Day2()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day3 {
    
    static let sharedInstance = Day3()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day4 {
    
    static let sharedInstance = Day4()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day5 {
    
    static let sharedInstance = Day5()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day6 {
    
    static let sharedInstance = Day6()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day7 {
    
    static let sharedInstance = Day7()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day8 {
    
    static let sharedInstance = Day8()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

class Day9 {
    
    static let sharedInstance = Day9()
    private init() {}
    
    var dateString: String?
    var dayString: String?
    var dayStringFull: String?
    
    var condition: String?
    var summary: String?
    
    var high: Int?
    var low: Int?
    var precip: Int?
    var precipAccum: Double?
    var humidity: Int?
    var wind: Double?
    var windGust: Double = 0
    var windBearing: String = ""
    var dewPoint: Int = 0
    var pressure: Double = 0
    var visibility: Int = 0
    var uvIndex: Int = 0
    
    var sunrise: String?
    var sunset: String?
}

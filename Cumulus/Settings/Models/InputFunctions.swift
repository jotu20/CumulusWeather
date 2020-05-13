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

// MARK: - Geo code function
func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ())  {
    CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemarks, error in
        guard let placemark = placemarks?.first, error == nil else {
            completion(nil, error)
            return
        }
        completion(placemark, nil)
    }
}

// MARK: - Set button title color
func setButtonTextColor(button: UIButton!) {
    button.setTitleColor(UIColor.label, for: .normal)
}

// MARK: - Set hourly condition values
func setupHourlyConditionText(label: UILabel!, condition: String, windDirection: String) {
    label.text = "\(weatherCondition(condition: condition, type: "text"))"
    
    // If condition is wind setup text with wind direction
    if label.text == "Wind" {
        label.text = "\(weatherCondition(condition: condition, type: "text")) \(windDirection)"
    }
}

// MARK: - Get image for forecast condition
func weatherCondition(condition: String, type: String) -> String {
    var conditionString: String = ""
    
    if condition == "blizzard" || condition == "blizzard.png" || condition == "blizzardn.png" {
        if type == "image" {
            conditionString = "Heavy_snow.pdf"
        } else if type == "text" {
            conditionString = "Blizzard"
        } else if type == "daily" {
            conditionString = "Heavy_snow.pdf"
        } else if type == "widget" {
            conditionString = "Heavy_snow_widget.pdf"
        }
    }
    
    if condition == "clear-night" || condition == "clearn.png" || condition == "sunnyn.png" || condition == "sunnywn.png" {
        if type == "image" {
            conditionString = "Clear_night.pdf"
        } else if type == "text" {
            conditionString = "Clear"
        } else if type == "daily" {
            conditionString = "Clear.pdf"
        } else if type == "widget" {
            conditionString = "Clear_night_widget.pdf"
        }
    }
    
    if condition == "clear-day" || condition == "clear.png" || condition == "sunny.png" || condition == "sunnyw.png" {
        if type == "image" {
            conditionString = "Clear.pdf"
        } else if type == "text" {
            conditionString = "Clear"
        } else if type == "daily" {
            conditionString = "Clear.pdf"
        } else if type == "widget" {
            conditionString = "Clear_widget.pdf"
        }
    }
    
    if condition == "cloudy-windy" || condition == "cloudyw.png" || condition == "cloudywn.png" {
        if type == "image" {
            conditionString = "Windy.pdf"
        } else if type == "text" {
            conditionString = "Cloudy & Windy"
        } else if type == "daily" {
            conditionString = "Windy.pdf"
        } else if type == "widget" {
            conditionString = "Windy widget.pdf"
        }
    }
    
    if condition == "cloudy" || condition == "cloudy.png" || condition == "cloudyn.png" {
        if type == "image" {
            conditionString = "Cloudy.pdf"
        } else if type == "text" {
            conditionString = "Cloudy"
        } else if type == "daily" {
            conditionString = "Cloudy.pdf"
        } else if type == "widget" {
            conditionString = "Cloudy_widget.pdf"
        }
    }
    
    if condition == "flurries" || condition == "flurries.png" || condition == "flurriesn.png" || condition == "flurriesw.png" || condition == "flurrieswn.png" {
        if type == "image" {
            conditionString = "Flurries.pdf"
        } else if type == "text" {
            conditionString = "Flurries"
        } else if type == "daily" {
            conditionString = "Flurries.pdf"
        } else if type == "widget" {
            conditionString = "Flurries_widget.pdf"
        }
    }
    
    if condition == "fog" || condition == "fog.png" || condition == "fogn.png" {
        if type == "image" {
            conditionString = "Fog.pdf"
        } else if type == "text" {
            conditionString = "Fog"
        } else if type == "daily" {
            conditionString = "Fog.pdf"
        } else if type == "widget" {
            conditionString = "Fog_widget.pdf"
        }
    }
    
    if condition == "freezing-rain" || condition == "freezingrain.png" || condition == "freezingrainn.png" || condition == "sleet.png" || condition == "sleetn.png" {
        if type == "image" {
            conditionString = "Freezing_rain.pdf"
        } else if type == "text" {
            conditionString = "Freezing Rain"
        } else if type == "daily" {
            conditionString = "Freezing_rain.pdf"
        } else if type == "widget" {
            conditionString = "Freezing_rain widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-night" || condition == "pcloudyn.png" || condition == "pcloudysfn.png" || condition == "pcloudysfwn.png" || condition == "pcloudyswn.png" || condition == "pcloudywn.png" {
        if type == "image" {
            conditionString = "Partly_cloudy_night.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy"
        } else if type == "daily" {
            conditionString = "Partly_cloudy.pdf"
        } else if type == "widget" {
            conditionString = "Partly_cloudy_night_widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-rain" || condition == "mcloudyr.png" || condition == "mcloudyrn.png" || condition == "mcloudyrw.png" || condition == "mcloudyrwn.png" || condition == "pcloudyr.png" || condition == "pcloudyrn.png" || condition == "pcloudyrw.png" || condition == "pcloudyrwn.png" {
        if type == "image" {
            conditionString = "Rain.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy & Rain"
        } else if type == "daily" {
            conditionString = "Rain.pdf"
        } else if type == "widget" {
            conditionString = "Rain_widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-snow" || condition == "mcloudys.png" || condition == "mcloudysn.png" || condition == "pcloudys.png" || condition == "pcloudysn.png" {
        if type == "image" {
            conditionString = "Snow.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy & Snow"
        } else if type == "daily" {
            conditionString = "Snow.pdf"
        } else if type == "widget" {
            conditionString = "Snow_widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-day" || condition == "pcloudy.png" || condition == "pcloudysf.png" || condition == "pcloudysfw.png" || condition == "pcloudysw.png" || condition == "pcloudyw.png" {
        if type == "image" {
            conditionString = "Partly_cloudy.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy"
        } else if type == "daily" {
            conditionString = "Partly_cloudy.pdf"
        } else if type == "widget" {
            conditionString = "Partly_cloudy_widget.pdf"
        }
    }
    
    if condition == "rain" || condition == "drizzle.png" || condition == "drizzlen.png" || condition == "drizzlef.png" || condition == "fdrizzlen.png" || condition == "rain.png" || condition == "rainn.png" || condition == "rainw.png" {
        if type == "image" {
            conditionString = "Rain.pdf"
        } else if type == "text" {
            conditionString = "Rain"
        } else if type == "daily" {
            conditionString = "Rain.pdf"
        } else if type == "widget" {
            conditionString = "Rain_widget.pdf"
        }
    }
    
    if condition == "snow" || condition == "blowingsnow.png" || condition == "blowingsnown.png" || condition == "snow.png" || condition == "snown.png" || condition == "snoww.png" || condition == "snowwn.png" || condition == "snowshowers.png" || condition == "snowshowersn.png" || condition == "snowshowersw.png" || condition == "snowshowerswn.png" {
        if type == "image" {
            conditionString = "Snow.pdf"
        } else if type == "text" {
            conditionString = "Snow"
        } else if type == "daily" {
            conditionString = "Snow.pdf"
        } else if type == "widget" {
            conditionString = "Snow_widget.pdf"
        }
    }
    
    if condition == "thunderstorm" || condition == "tstorm.png" || condition == "tstormn.png" || condition == "tstorms.png" || condition == "tstormsn.png" || condition == "tstormsw.png" || condition == "tstormswn.png" {
        if type == "image" {
            conditionString = "Thunderstorm.pdf"
        } else if type == "text" {
            conditionString = "Thunderstorm"
        } else if type == "daily" {
            conditionString = "Thunderstorm.pdf"
        } else if type == "widget" {
            conditionString = "Thunderstorm_widget.pdf"
        }
    }
    
    if condition == "wind" || condition == "mcloudysfw.png" || condition == "mcloudysfwn.png" || condition == "mcloudysw.png" || condition == "mcloudyswn.png" || condition == "mcloudyw.png" || condition == "mcloudywn.png" || condition == "wind.png" || condition == "windn.png" {
        if type == "image" {
            conditionString = "Windy.pdf"
        } else if type == "text" {
            conditionString = "Wind"
        } else if type == "daily" {
            conditionString = "Windy.pdf"
        } else if type == "widget" {
            conditionString = "Windy_widget.pdf"
        }
    }
    
//    if condition == "clear" {
//        if type == "image" {
//            conditionString = "Clear.pdf"
//        } else if type == "text" {
//            conditionString = "Clear"
//        } else if type == "daily" {
//            conditionString = "Clear.pdf"
//        } else if type == "widget" {
//            conditionString = "Clear widget.pdf"
//        }
//    }
//
//    if condition == "mostly_clear" {
//        if type == "image" {
//            conditionString = "Mostly clear.pdf"
//        } else if type == "text" {
//            conditionString = "Mostly clear"
//        } else if type == "daily" {
//            conditionString = "Mostly clear.pdf"
//        } else if type == "widget" {
//            conditionString = "Mostly clear widget.pdf"
//        }
//    }
//
//    if condition == "partly_cloudy" {
//        if type == "image" {
//            conditionString = "Partly cloudy.pdf"
//        } else if type == "text" {
//            conditionString = "Partly cloudy"
//        } else if type == "daily" {
//            conditionString = "Partly cloudy.pdf"
//        } else if type == "widget" {
//            conditionString = "Partly cloudy widget.pdf"
//        }
//    }
//
//    if condition == "mostly_cloudy" {
//        if type == "image" {
//            conditionString = "Mostly cloudy.pdf"
//        } else if type == "text" {
//            conditionString = "Mostly cloudy"
//        } else if type == "daily" {
//            conditionString = "Mostly cloudy.pdf"
//        } else if type == "widget" {
//            conditionString = "Mostly cloudy widget.pdf"
//        }
//    }
//
//    if condition == "cloudy" {
//        if type == "image" {
//            conditionString = "Cloudy.pdf"
//        } else if type == "text" {
//            conditionString = "Cloudy"
//        } else if type == "daily" {
//            conditionString = "Cloudy.pdf"
//        } else if type == "widget" {
//            conditionString = "Cloudy widget.pdf"
//        }
//    }
//
//    if condition == "fog" {
//        if type == "image" {
//            conditionString = "Fog.pdf"
//        } else if type == "text" {
//            conditionString = "Fog"
//        } else if type == "daily" {
//            conditionString = "Fog.pdf"
//        } else if type == "widget" {
//            conditionString = "Fog widget.pdf"
//        }
//    }
//
//    if condition == "fog_light" {
//        if type == "image" {
//            conditionString = "Fog light.pdf"
//        } else if type == "text" {
//            conditionString = "Fog light"
//        } else if type == "daily" {
//            conditionString = "Fog light.pdf"
//        } else if type == "widget" {
//            conditionString = "Fog light widget.pdf"
//        }
//    }
//
//    if condition == "tstorm" {
//        if type == "image" {
//            conditionString = "Thunderstorm.pdf"
//        } else if type == "text" {
//            conditionString = "Thunderstorm"
//        } else if type == "daily" {
//            conditionString = "Thunderstorm.pdf"
//        } else if type == "widget" {
//            conditionString = "Thunderstorm widget.pdf"
//        }
//    }
//
//    if condition == "flurries" {
//        if type == "image" {
//            conditionString = "Flurries.pdf"
//        } else if type == "text" {
//            conditionString = "Flurries"
//        } else if type == "daily" {
//            conditionString = "Flurries.pdf"
//        } else if type == "widget" {
//            conditionString = "Flurries widget.pdf"
//        }
//    }
//
//    if condition == "snow_light" {
//        if type == "image" {
//            conditionString = "Snow light.pdf"
//        } else if type == "text" {
//            conditionString = "Snow light"
//        } else if type == "daily" {
//            conditionString = "Snow light.pdf"
//        } else if type == "widget" {
//            conditionString = "Snow light widget.pdf"
//        }
//    }
//
//    if condition == "snow" {
//        if type == "image" {
//            conditionString = "Snow.pdf"
//        } else if type == "text" {
//            conditionString = "Snow"
//        } else if type == "daily" {
//            conditionString = "Snow.pdf"
//        } else if type == "widget" {
//            conditionString = "Snow widget.pdf"
//        }
//    }
//
//    if condition == "snow_heavy" {
//        if type == "image" {
//            conditionString = "Snow heavy.pdf"
//        } else if type == "text" {
//            conditionString = "Snow heavy"
//        } else if type == "daily" {
//            conditionString = "Snow heavy.pdf"
//        } else if type == "widget" {
//            conditionString = "Snow heavy widget.pdf"
//        }
//    }
//
//    if condition == "ice_pellets_light" {
//        if type == "image" {
//            conditionString = "Ice pellets light.pdf"
//        } else if type == "text" {
//            conditionString = "Ice pellets light"
//        } else if type == "daily" {
//            conditionString = "Ice pellets light.pdf"
//        } else if type == "widget" {
//            conditionString = "Ice pellets light widget.pdf"
//        }
//    }
//
//    if condition == "ice_pellets" {
//        if type == "image" {
//            conditionString = "Ice pellets.pdf"
//        } else if type == "text" {
//            conditionString = "Ice pellets"
//        } else if type == "daily" {
//            conditionString = "Ice pellets.pdf"
//        } else if type == "widget" {
//            conditionString = "Ice pellets widget.pdf"
//        }
//    }
//
//    if condition == "ice_pellets_heavy" {
//        if type == "image" {
//            conditionString = "Ice pellets heavy.pdf"
//        } else if type == "text" {
//            conditionString = "Ice pellets heavy"
//        } else if type == "daily" {
//            conditionString = "Ice pellets heavy.pdf"
//        } else if type == "widget" {
//            conditionString = "Ice pellets heavy widget.pdf"
//        }
//    }
//
//    if condition == "drizzle" {
//        if type == "image" {
//            conditionString = "Drizzle.pdf"
//        } else if type == "text" {
//            conditionString = "Drizzle"
//        } else if type == "daily" {
//            conditionString = "Drizzle.pdf"
//        } else if type == "widget" {
//            conditionString = "Drizzle widget.pdf"
//        }
//    }
//
//    if condition == "freezing_drizzle" {
//        if type == "image" {
//            conditionString = "Freezing drizzle.pdf"
//        } else if type == "text" {
//            conditionString = "Freezing drizzle"
//        } else if type == "daily" {
//            conditionString = "Freezing drizzle.pdf"
//        } else if type == "widget" {
//            conditionString = "Freezing drizzle widget.pdf"
//        }
//    }
//
//    if condition == "freezing_rain_light" {
//        if type == "image" {
//            conditionString = "Freezing rain light.pdf"
//        } else if type == "text" {
//            conditionString = "Clear"
//        } else if type == "daily" {
//            conditionString = "Clear.pdf"
//        } else if type == "widget" {
//            conditionString = "Clear widget.pdf"
//        }
//    }
//
//    if condition == "freezing_rain" {
//        if type == "image" {
//            conditionString = "Freezing rain.pdf"
//        } else if type == "text" {
//            conditionString = "Freezing rain"
//        } else if type == "daily" {
//            conditionString = "Freezing rain.pdf"
//        } else if type == "widget" {
//            conditionString = "Freezing rain widget.pdf"
//        }
//    }
//
//    if condition == "freezing_rain_heavy" {
//        if type == "image" {
//            conditionString = "Freezing rain heavy.pdf"
//        } else if type == "text" {
//            conditionString = "Freezing rain heavy"
//        } else if type == "daily" {
//            conditionString = "Freezing rain heavy.pdf"
//        } else if type == "widget" {
//            conditionString = "Freezing rain heavy widget.pdf"
//        }
//    }
//
//    if condition == "rain_light" {
//        if type == "image" {
//            conditionString = "Rain light.pdf"
//        } else if type == "text" {
//            conditionString = "Rain light"
//        } else if type == "daily" {
//            conditionString = "Rain light.pdf"
//        } else if type == "widget" {
//            conditionString = "Rain light widget.pdf"
//        }
//    }
//
//    if condition == "rain" {
//        if type == "image" {
//            conditionString = "Rain.pdf"
//        } else if type == "text" {
//            conditionString = "Rain"
//        } else if type == "daily" {
//            conditionString = "Rain.pdf"
//        } else if type == "widget" {
//            conditionString = "Rain widget.pdf"
//        }
//    }
//
//    if condition == "rain_heavy" {
//        if type == "image" {
//            conditionString = "Rain heavy.pdf"
//        } else if type == "text" {
//            conditionString = "Rain heavy"
//        } else if type == "daily" {
//            conditionString = "Rain heavy.pdf"
//        } else if type == "widget" {
//            conditionString = "Rain heavy widget.pdf"
//        }
//    }
    
    if condition.isEmpty == true || condition == "na.png" {
        if type == "image" {
            conditionString = "Partly Cloudy.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy"
        } else if type == "daily" {
            conditionString = "Partly Cloudy.pdf"
        } else if type == "widget" {
            conditionString = "Partly Cloudy widget.pdf"
        }
    }
    
    return conditionString
}

// MARK: - Gets hourly condition values
func hourlyValue(value: Int) -> Int {
    var valueInteger: Int = 0
    
    let screenSize = UIScreen.main.bounds
    let screenHeight = screenSize.height
    if screenHeight == 568 {
        valueInteger = value + 3
    } else {
        valueInteger = value + 6
    }
    
    return valueInteger
}

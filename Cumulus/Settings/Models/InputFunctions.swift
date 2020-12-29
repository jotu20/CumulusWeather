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
    label.text = "\(weatherCondition(condition: condition, type: "text", circle: defaults.string(forKey: "defaultConditionIcons")!))"
    
    // If condition is wind setup text with wind direction
    if label.text == "Wind" {
        label.text = "\(weatherCondition(condition: condition, type: "text", circle: defaults.string(forKey: "defaultConditionIcons")!)) \(windDirection)"
    }
}

// MARK: - Get image for forecast condition
func weatherCondition(condition: String, type: String, circle: String) -> String {
    var conditionString: String = ""
    
    if condition == "blizzard" || condition == "blizzard.png" || condition == "blizzardn.png" {
        if type == "image" {
            conditionString = "Heavy_snow\(circle).pdf"
        } else if type == "text" {
            conditionString = "Blizzard"
        } else if type == "daily" {
            conditionString = "Heavy_snow\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Heavy_snow_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Heavy_snow_widget\(circle)"
        }
    }
    
    if condition == "clear-night" || condition == "clearn.png" || condition == "sunnyn.png" || condition == "sunnywn.png" {
        if type == "image" {
            conditionString = "Clear_night\(circle).pdf"
        } else if type == "text" {
            conditionString = "Clear"
        } else if type == "daily" {
            conditionString = "Clear\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Clear_night_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Clear_night_widget\(circle)"
        }
    }
    
    if condition == "clear" || condition == "clear-day" || condition == "clear.png" || condition == "sunny.png" || condition == "sunnyw.png" {
        if type == "image" {
            conditionString = "Clear\(circle).pdf"
        } else if type == "text" {
            conditionString = "Clear"
        } else if type == "daily" {
            conditionString = "Clear\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Clear_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Clear_widget\(circle)"
        }
    }
    
    if condition == "cloudy-windy" || condition == "cloudyw.png" || condition == "cloudywn.png" {
        if type == "image" {
            conditionString = "Windy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Cloudy & windy"
        } else if type == "daily" {
            conditionString = "Windy\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Windy_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Windy_widget\(circle)"
        }
    }
    
    if condition == "cloudy" || condition == "clouds" || condition == "cloudy.png" || condition == "cloudyn.png" {
        if type == "image" {
            conditionString = "Cloudy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Cloudy"
        } else if type == "daily" {
            conditionString = "Cloudy\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Cloudy_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Cloudy_widget\(circle)"
        }
    }
    
    if condition == "flurries" || condition == "flurries.png" || condition == "flurriesn.png" || condition == "flurriesw.png" || condition == "flurrieswn.png" {
        if type == "image" {
            conditionString = "Flurries\(circle).pdf"
        } else if type == "text" {
            conditionString = "Flurries"
        } else if type == "daily" {
            conditionString = "Flurries\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Flurries_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Flurries_widget\(circle)"
        }
    }
    
    if condition == "fog" || condition == "fog.png" || condition == "fogn.png" {
        if type == "image" {
            conditionString = "Fog\(circle).pdf"
        } else if type == "text" {
            conditionString = "Fog"
        } else if type == "daily" {
            conditionString = "Fog\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Fog_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Fog_widget\(circle)"
        }
    }
    
    if condition == "freezing-rain" || condition == "freezingrain.png" || condition == "freezingrainn.png" || condition == "sleet.png" || condition == "sleetn.png" {
        if type == "image" {
            conditionString = "Freezing_rain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Freezing rain"
        } else if type == "daily" {
            conditionString = "Freezing_rain\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Freezing_rain widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Freezing_rain widget\(circle)"
        }
    }
    
    if condition == "partly-cloudy-night" || condition == "pcloudyn.png" || condition == "pcloudysfn.png" || condition == "pcloudysfwn.png" || condition == "pcloudyswn.png" || condition == "pcloudywn.png" {
        if type == "image" {
            conditionString = "Partly_cloudy_night\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy"
        } else if type == "daily" {
            conditionString = "Partly_cloudy\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Partly_cloudy_night_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Partly_cloudy_night_widget\(circle)"
        }
    }
    
    if condition == "partly-cloudy-rain" || condition == "mcloudyr.png" || condition == "mcloudyrn.png" || condition == "mcloudyrw.png" || condition == "mcloudyrwn.png" || condition == "pcloudyr.png" || condition == "pcloudyrn.png" || condition == "pcloudyrw.png" || condition == "pcloudyrwn.png" {
        if type == "image" {
            conditionString = "Rain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy & rain"
        } else if type == "daily" {
            conditionString = "Rain\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Rain_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Rain_widget\(circle)"
        }
    }
    
    if condition == "partly-cloudy-snow" || condition == "mcloudys.png" || condition == "mcloudysn.png" || condition == "pcloudys.png" || condition == "pcloudysn.png" {
        if type == "image" {
            conditionString = "Snow\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy & snow"
        } else if type == "daily" {
            conditionString = "Snow\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Snow_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Snow_widget\(circle)"
        }
    }
    
    if condition == "partly-cloudy-day" || condition == "pcloudy.png" || condition == "pcloudysf.png" || condition == "pcloudysfw.png" || condition == "pcloudysw.png" || condition == "pcloudyw.png" {
        if type == "image" {
            conditionString = "Partly_cloudy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy"
        } else if type == "daily" {
            conditionString = "Partly_cloudy\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Partly_cloudy_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Partly_cloudy_widget\(circle)"
        }
    }
    
    if condition == "rain" || condition == "drizzle.png" || condition == "drizzlen.png" || condition == "drizzlef.png" || condition == "fdrizzlen.png" || condition == "rain.png" || condition == "rainn.png" || condition == "rainw.png" {
        if type == "image" {
            conditionString = "Rain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Rain"
        } else if type == "daily" {
            conditionString = "Rain\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Rain_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Rain_widget\(circle)"
        }
    }
    
    if condition == "snow" || condition == "blowingsnow.png" || condition == "blowingsnown.png" || condition == "snow.png" || condition == "snown.png" || condition == "snoww.png" || condition == "snowwn.png" || condition == "snowshowers.png" || condition == "snowshowersn.png" || condition == "snowshowersw.png" || condition == "snowshowerswn.png" {
        if type == "image" {
            conditionString = "Snow\(circle).pdf"
        } else if type == "text" {
            conditionString = "Snow"
        } else if type == "daily" {
            conditionString = "Snow\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Snow_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Snow_widget\(circle)"
        }
    }
    
    if condition == "thunderstorm" || condition == "tstorm.png" || condition == "tstormn.png" || condition == "tstorms.png" || condition == "tstormsn.png" || condition == "tstormsw.png" || condition == "tstormswn.png" {
        if type == "image" {
            conditionString = "Thunderstorm\(circle).pdf"
        } else if type == "text" {
            conditionString = "Thunderstorm"
        } else if type == "daily" {
            conditionString = "Thunderstorm\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Thunderstorm_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Thunderstorm_widget\(circle)"
        }
    }
    
    if condition == "wind" || condition == "mcloudysfw.png" || condition == "mcloudysfwn.png" || condition == "mcloudysw.png" || condition == "mcloudyswn.png" || condition == "mcloudyw.png" || condition == "mcloudywn.png" || condition == "wind.png" || condition == "windn.png" {
        if type == "image" {
            conditionString = "Windy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Windy"
        } else if type == "daily" {
            conditionString = "Windy\(circle).pdf"
        } else if type == "today_ext" {
            conditionString = "Windy_widget\(circle).pdf"
        } else if type == "widget" {
            conditionString = "Windy_widget\(circle)"
        }
    }
    
    if condition.isEmpty == true || condition == "na.png" {
        if type == "image" {
            conditionString = "Partly Cloudy.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy"
        } else if type == "daily" {
            conditionString = "Partly Cloudy.pdf"
        } else if type == "today_ext" {
            conditionString = "Partly Cloudy widget.pdf"
        } else if type == "widget" {
            conditionString = "Partly Cloudy widget"
        }
    }
    
    return conditionString
}

// MARK: - Gets hourly condition values
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

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

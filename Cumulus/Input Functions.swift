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
            conditionString = "Blizzard.pdf"
        } else if type == "text" {
            conditionString = "Blizzard"
        } else if type == "daily" {
            conditionString = "Blizzard.pdf"
        } else if type == "widget" {
            conditionString = "Blizzard widget.pdf"
        }
    }
    
    if condition == "clear-night" || condition == "clearn.png" || condition == "sunnyn.png" || condition == "sunnywn.png" {
        if type == "image" {
            conditionString = "Clear Night.pdf"
        } else if type == "text" {
            conditionString = "Clear"
        } else if type == "daily" {
            conditionString = "Clear.pdf"
        } else if type == "widget" {
            conditionString = "Clear Night widget.pdf"
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
            conditionString = "Clear widget.pdf"
        }
    }
    
    if condition == "cloudy-windy" || condition == "cloudyw.png" || condition == "cloudywn.png" {
        if type == "image" {
            conditionString = "Cloudy Windy.pdf"
        } else if type == "text" {
            conditionString = "Cloudy & Windy"
        } else if type == "daily" {
            conditionString = "Cloudy Windy.pdf"
        } else if type == "widget" {
            conditionString = "Cloudy Windy widget.pdf"
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
            conditionString = "Cloudy widget.pdf"
        }
    }
    
    if condition == "cold" || condition == "cold.png" || condition == "coldn.png" {
        if type == "image" {
            conditionString = "Cold.pdf"
        } else if type == "text" {
            conditionString = "Cold"
        } else if type == "daily" {
            conditionString = "Cold.pdf"
        } else if type == "widget" {
            conditionString = "Cold widget.pdf"
        }
    }
    
    if condition == "dust" || condition == "dust.png" || condition == "dustn.png" || condition == "smoke.png" || condition == "smoken.png" || condition == "hazy.png" || condition == "hazyn.png" {
        if type == "image" {
            conditionString = "Dust.pdf"
        } else if type == "text" {
            conditionString = "Dust"
        } else if type == "daily" {
            conditionString = "Dust.pdf"
        } else if type == "widget" {
            conditionString = "Dust widget.pdf"
        }
    }
    
    if condition == "fair-night" || condition == "fairn.png" || condition == "mcloudyn.png" {
        if type == "image" {
            conditionString = "Fair Night.pdf"
        } else if type == "text" {
            conditionString = "Fair"
        } else if type == "daily" {
            conditionString = "Fair.pdf"
        } else if type == "widget" {
            conditionString = "Fair Night widget.pdf"
        }
    }
    
    if condition == "fair" || condition == "fair.png" || condition == "mcloudy.png" || condition == "mcloudysf.png" || condition == "mcloudysfn.png" {
        if type == "image" {
            conditionString = "Fair.pdf"
        } else if type == "text" {
            conditionString = "Fair"
        } else if type == "daily" {
            conditionString = "Fair.pdf"
        } else if type == "widget" {
            conditionString = "Fair widget.pdf"
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
            conditionString = "Flurries widget.pdf"
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
            conditionString = "Fog widget.pdf"
        }
    }
    
    if condition == "freezing-rain" || condition == "freezingrain.png" || condition == "freezingrainn.png" || condition == "sleet.png" || condition == "sleetn.png" {
        if type == "image" {
            conditionString = "Freezing Rain.pdf"
        } else if type == "text" {
            conditionString = "Freezing Rain"
        } else if type == "daily" {
            conditionString = "Freezing Rain.pdf"
        } else if type == "widget" {
            conditionString = "Freezing Rain widget.pdf"
        }
    }
    
    if condition == "hot" || condition == "hot.png" {
        if type == "image" {
            conditionString = "Hot.pdf"
        } else if type == "text" {
            conditionString = "Hot"
        } else if type == "daily" {
            conditionString = "Hot.pdf"
        } else if type == "widget" {
            conditionString = "Hot widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-night" || condition == "pcloudyn.png" || condition == "pcloudysfn.png" || condition == "pcloudysfwn.png" || condition == "pcloudyswn.png" || condition == "pcloudywn.png" {
        if type == "image" {
            conditionString = "Partly Cloudy Night.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy"
        } else if type == "daily" {
            conditionString = "Partly Cloudy.pdf"
        } else if type == "widget" {
            conditionString = "Partly Cloudy Night widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-rain" || condition == "mcloudyr.png" || condition == "mcloudyrn.png" || condition == "mcloudyrw.png" || condition == "mcloudyrwn.png" || condition == "pcloudyr.png" || condition == "pcloudyrn.png" || condition == "pcloudyrw.png" || condition == "pcloudyrwn.png" {
        if type == "image" {
            conditionString = "Partly Cloudy Rain.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy & Rain"
        } else if type == "daily" {
            conditionString = "Partly Cloudy Rain.pdf"
        } else if type == "widget" {
            conditionString = "Partly Cloudy Rain widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-snow" || condition == "mcloudys.png" || condition == "mcloudysn.png" || condition == "pcloudys.png" || condition == "pcloudysn.png" {
        if type == "image" {
            conditionString = "Partly Cloudy Snow.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy & Snow"
        } else if type == "daily" {
            conditionString = "Partly Cloudy Snow.pdf"
        } else if type == "widget" {
            conditionString = "Partly Cloudy Snow widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-thunderstorm" || condition == "mcloudyt.png" || condition == "mcloudytn.png" || condition == "mcloudytw.png" || condition == "mcloudytwn.png" || condition == "pcloudyt.png" || condition == "pcloudytn.png" || condition == "pcloudytw.png" || condition == "pcloudytwn.png" {
        if type == "image" {
            conditionString = "Partly Cloudy Thunderstorm.pdf"
        } else if type == "text" {
            conditionString = "Partly Cloudy & Thunderstorms"
        } else if type == "daily" {
            conditionString = "Partly Cloudy Thunderstorm.pdf"
        } else if type == "widget" {
            conditionString = "Partly Cloudy Thunderstorm widget.pdf"
        }
    }
    
    if condition == "partly-cloudy-day" || condition == "pcloudy.png" || condition == "pcloudysf.png" || condition == "pcloudysfw.png" || condition == "pcloudysw.png" || condition == "pcloudyw.png" {
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
    
    if condition == "rain-and-snow" || condition == "rainandsnow.png" || condition == "rainandsnown.png" || condition == "raintosnow.png" || condition == "raintosnown.png" || condition == "sleetsnow.png" || condition == "sleetsnown.png" || condition == "snowtorain.png" || condition == "snowtorainn.png" || condition == "wintrymix.png" || condition == "wintrymixn.png" {
        if type == "image" {
            conditionString = "Rain and Snow.pdf"
        } else if type == "text" {
            conditionString = "Rain & Snow"
        } else if type == "daily" {
            conditionString = "Rain and Snow.pdf"
        } else if type == "widget" {
            conditionString = "Rain and Snow widget.pdf"
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
            conditionString = "Rain widget.pdf"
        }
    }
    
    if condition == "showers" || condition == "showers.png" || condition == "showersn.png" || condition == "showersw.png" {
        if type == "image" {
            conditionString = "Showers.pdf"
        } else if type == "text" {
            conditionString = "Showers"
        } else if type == "daily" {
            conditionString = "Showers.pdf"
        } else if type == "widget" {
            conditionString = "Showers widget.pdf"
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
            conditionString = "Snow widget.pdf"
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
            conditionString = "Thunderstorm widget.pdf"
        }
    }
    
    if condition == "wind" || condition == "mcloudysfw.png" || condition == "mcloudysfwn.png" || condition == "mcloudysw.png" || condition == "mcloudyswn.png" || condition == "mcloudyw.png" || condition == "mcloudywn.png" || condition == "wind.png" || condition == "windn.png" {
        if type == "image" {
            conditionString = "Wind.pdf"
        } else if type == "text" {
            conditionString = "Wind"
        } else if type == "daily" {
            conditionString = "Wind.pdf"
        } else if type == "widget" {
            conditionString = "Wind widget.pdf"
        }
    }
    
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

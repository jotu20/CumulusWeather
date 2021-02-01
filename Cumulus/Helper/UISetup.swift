//
//  UISetup.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 2/1/21.
//  Copyright © 2021 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Get image for forecast condition
func weatherCondition(condition: String, type: String, circle: String) -> String {
    var conditionString: String = ""
    
    if condition == "clear-night" {
        if type == "image" {
            conditionString = "ClearNight\(circle).pdf"
        } else if type == "text" {
            conditionString = "Clear"
        } else if type == "daily" {
            conditionString = "Clear\(circle).pdf"
        } else if type == "widget" {
            conditionString = "ClearNightWidget\(circle)"
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
            conditionString = "ClearWidget\(circle)"
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
            conditionString = "CloudyWidget\(circle)"
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
            conditionString = "DrizzleWidget\(circle)"
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
            conditionString = "DustWidget\(circle)"
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
            conditionString = "FlurriesWidget\(circle)"
        }
    }
    
    if condition == "light-fog" {
        if type == "image" {
            conditionString = "LightFog\(circle).pdf"
        } else if type == "text" {
            conditionString = "Light fog"
        } else if type == "daily" {
            conditionString = "LightFog\(circle).pdf"
        } else if type == "widget" {
            conditionString = "LightFogWidget\(circle)"
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
            conditionString = "FogWidget\(circle)"
        }
    }
    
    if condition == "freezing-rain" {
        if type == "image" {
            conditionString = "FreezingRain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Freezing rain"
        } else if type == "daily" {
            conditionString = "FreezingRain\(circle).pdf"
        } else if type == "widget" {
            conditionString = "FreezingRainWidget\(circle)"
        }
    }
    
    if condition == "freezing-rain-heavy" {
        if type == "image" {
            conditionString = "FreezingRainHeavy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Heavy freezing rain"
        } else if type == "daily" {
            conditionString = "FreezingRainHeavy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "FreezinggRainHeavyWidget\(circle)"
        }
    }
    
    if condition == "light-ice-pellets" {
        if type == "image" {
            conditionString = "LightIcePellets\(circle).pdf"
        } else if type == "text" {
            conditionString = "Light ice pellets"
        } else if type == "daily" {
            conditionString = "LightIcePellets\(circle).pdf"
        } else if type == "widget" {
            conditionString = "LightIcePelletsWidget\(circle)"
        }
    }
    
    if condition == "ice-pellets" {
        if type == "image" {
            conditionString = "IcePellets\(circle).pdf"
        } else if type == "text" {
            conditionString = "Ice pellets"
        } else if type == "daily" {
            conditionString = "IcePellets\(circle).pdf"
        } else if type == "widget" {
            conditionString = "IcePelletsWidget\(circle)"
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
            conditionString = "MistWidget\(circle)"
        }
    }
    
    if condition == "mostly-clear" {
        if type == "image" {
            conditionString = "MostlyClear\(circle).pdf"
        } else if type == "text" {
            conditionString = "Mostly clear"
        } else if type == "daily" {
            conditionString = "MostlyClear\(circle).pdf"
        } else if type == "widget" {
            conditionString = "MostlyClearWidget\(circle)"
        }
    }
    
    if condition == "mostly-clear-night" {
        if type == "image" {
            conditionString = "MostlyClearNight\(circle).pdf"
        } else if type == "text" {
            conditionString = "Mostly clear"
        } else if type == "daily" {
            conditionString = "MostlyClearNight\(circle).pdf"
        } else if type == "widget" {
            conditionString = "MostlyClearNightWidget\(circle)"
        }
    }
    
    if condition == "mostly-cloudy" {
        if type == "image" {
            conditionString = "MostlyCloudy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Mostly cloudy"
        } else if type == "daily" {
            conditionString = "MostlyCloudy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "MostlyCloudyWidget\(circle)"
        }
    }
    
    if condition == "partly-cloudy-day" {
        if type == "image" {
            conditionString = "PartlyCloudy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy"
        } else if type == "daily" {
            conditionString = "PartlyCloudy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "PartlyCloudyWidget\(circle)"
        }
    }
    
    if condition == "partly-cloudy-night" {
        if type == "image" {
            conditionString = "PartlyCloudyNight\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy"
        } else if type == "daily" {
            conditionString = "PartlyCloudyNight\(circle).pdf"
        } else if type == "widget" {
            conditionString = "PartlyCloudyNightWidget\(circle)"
        }
    }
    
    if condition == "light-rain" {
        if type == "image" {
            conditionString = "LightRain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Light rain"
        } else if type == "daily" {
            conditionString = "LightRain\(circle).pdf"
        } else if type == "widget" {
            conditionString = "LightRainWidget\(circle)"
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
            conditionString = "RainWidget\(circle)"
        }
    }
    
    if condition == "heavy-rain" {
        if type == "image" {
            conditionString = "HeavyRain\(circle).pdf"
        } else if type == "text" {
            conditionString = "Heavy rain"
        } else if type == "daily" {
            conditionString = "HeavyRain\(circle).pdf"
        } else if type == "widget" {
            conditionString = "HeavyRainWidget\(circle)"
        }
    }

    if condition == "light-snow" {
        if type == "image" {
            conditionString = "LightSnow\(circle).pdf"
        } else if type == "text" {
            conditionString = "Light snow"
        } else if type == "daily" {
            conditionString = "LightSnow\(circle).pdf"
        } else if type == "widget" {
            conditionString = "LightSnowWidget\(circle)"
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
            conditionString = "SnowWidget\(circle)"
        }
    }
    
    
    if condition == "heavy-snow" {
        if type == "image" {
            conditionString = "HeavySnow\(circle).pdf"
        } else if type == "text" {
            conditionString = "Heavy snow"
        } else if type == "daily" {
            conditionString = "HeavySnow\(circle).pdf"
        } else if type == "widget" {
            conditionString = "HeavySnowWidget\(circle)"
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
            conditionString = "ThunderstormWidget\(circle)"
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
            conditionString = "TornadoWidget\(circle)"
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
            conditionString = "WindyWidget\(circle)"
        }
    }
    
    if condition.isEmpty == true {
        if type == "image" {
            conditionString = "PartlyCloudy\(circle).pdf"
        } else if type == "text" {
            conditionString = "Partly cloudy"
        } else if type == "daily" {
            conditionString = "PartlyCloudy\(circle).pdf"
        } else if type == "widget" {
            conditionString = "PartlyCloudyWidget\(circle)"
        }
    }
    
    return conditionString
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

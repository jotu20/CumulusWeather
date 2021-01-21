//
//  SettingOptions.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 11/29/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import GooglePlaces

let defaults = UserDefaults.standard
var cumulusPlus: Bool = false
var placesClient: GMSPlacesClient!

// Shared Secret for IAPs, API, and Ad keys
var sharedSecret: String = "28d11783d1a94fb1895f62c10c4db49b"

var clockChanged: Bool = false
var unitsChanged: Bool = false
var setupCounter: Int = 0
var userViewedCounter: Int = 0
var userInvocationPhrase: String = ""
var twentyFourHourClockEnabled: Bool = false
var hapticFeedbackEnabled: Bool = false

// Colors
var userSavedAppIconString: String = ""
var autoThemeEnabled: Bool = false
var userChangedTheme: Bool = false
var userSavedColorString: String = ""
var buttonColor: String = ""
let alertColor = UIColor(rgb: 0xEA2027)
let orchid = UIColor(rgb: 0xFFA9E7)
let dodgerBlue = UIColor(rgb: 0x4361EE)
let mango = UIColor(rgb: 0xFFA500)
let maximumRed = UIColor(rgb: 0xD81F15)
let plumpPurple = UIColor(rgb: 0x9572FF)
let springGreen = UIColor(rgb: 0x137547)

var defaultHourlyCondition: String = ""
var defaultConditionIcons: String = ""

// Weather Units
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

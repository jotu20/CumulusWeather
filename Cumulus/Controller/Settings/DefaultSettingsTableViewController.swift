//
//  PreferencesTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 8/11/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class DefaultSettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var precipitationCell: UITableViewCell!
    @IBOutlet weak var accumulationCell: UITableViewCell!
    @IBOutlet weak var temperatureCell: UITableViewCell!
    @IBOutlet weak var humidityCell: UITableViewCell!
    @IBOutlet weak var uvIndexCell: UITableViewCell!
    @IBOutlet weak var windCell: UITableViewCell!
    @IBOutlet weak var cloudCoverCell: UITableViewCell!
    @IBOutlet weak var defaultIconsCell: UITableViewCell!
    @IBOutlet weak var circleIconsCell: UITableViewCell!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Default Settings"
        self.tableView.tableFooterView = UIView(frame: .zero)
        weatherLoaded = true
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(DefaultSettingsTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
        setSelectedCheckMark()

        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            accumulationCell.isHidden = true
        }
        
        if (defaults.string(forKey: "defaultConditionIcons")?.isEmpty == true) {
            defaultConditionIcons = "Default"
            defaults.set(defaultConditionIcons, forKey: "defaultConditionIcons")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(defaultConditionIcons, forKey: "setIcons")
            setSelectedCheckMark()
        }
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        if weatherLoaded == true {
            dismiss(animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Home")
            self.present(controller, animated: true, completion: nil)
        }
    }

    @IBAction func precipitationTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultHourlyCondition = "Precipitation"
        defaults.set(defaultHourlyCondition, forKey: "defaultHourlyCondition")
        setSelectedCheckMark()
    }
    
    @IBAction func accumulationTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultHourlyCondition = "Accumulation"
        defaults.set(defaultHourlyCondition, forKey: "defaultHourlyCondition")
        setSelectedCheckMark()
    }
    
    @IBAction func temperatureTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultHourlyCondition = "Temperature"
        defaults.set(defaultHourlyCondition, forKey: "defaultHourlyCondition")
        setSelectedCheckMark()
    }
    
    @IBAction func humidityTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultHourlyCondition = "Humidity"
        defaults.set(defaultHourlyCondition, forKey: "defaultHourlyCondition")
        setSelectedCheckMark()
    }
    
    @IBAction func uvIndexTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultHourlyCondition = "UV index"
        defaults.set(defaultHourlyCondition, forKey: "defaultHourlyCondition")
        setSelectedCheckMark()
    }
    
    @IBAction func windTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultHourlyCondition = "Wind speed"
        defaults.set(defaultHourlyCondition, forKey: "defaultHourlyCondition")
        setSelectedCheckMark()
    }
    
    @IBAction func cloudCoverTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultHourlyCondition = "Cloud cover"
        defaults.set(defaultHourlyCondition, forKey: "defaultHourlyCondition")
        setSelectedCheckMark()
    }
    
    @IBAction func defaultIconsTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultConditionIcons = ""
        defaults.set(defaultConditionIcons, forKey: "defaultConditionIcons")
        UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(defaultConditionIcons, forKey: "setIcons")
        setSelectedCheckMark()
    }
    
    @IBAction func circleIconsTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = false
        defaultConditionIcons = "Circle"
        defaults.set(defaultConditionIcons, forKey: "defaultConditionIcons")
        UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(defaultConditionIcons, forKey: "setIcons")
        setSelectedCheckMark()
    }
    
    func setSelectedCheckMark() {
        if (defaults.string(forKey: "defaultHourlyCondition") == "Precipitation") {
            setTableViewCellColor(tableCell: precipitationCell)
            precipitationCell.accessoryType = .checkmark
            accumulationCell.accessoryType = .none
            temperatureCell.accessoryType = .none
            humidityCell.accessoryType = .none
            uvIndexCell.accessoryType = .none
            windCell.accessoryType = .none
            cloudCoverCell.accessoryType = .none
        } else if (defaults.string(forKey: "dataSource") == "Accumulation") {
            setTableViewCellColor(tableCell: accumulationCell)
            precipitationCell.accessoryType = .none
            accumulationCell.accessoryType = .checkmark
            temperatureCell.accessoryType = .none
            humidityCell.accessoryType = .none
            uvIndexCell.accessoryType = .none
            windCell.accessoryType = .none
            cloudCoverCell.accessoryType = .none
        } else if (defaults.string(forKey: "dataSource") == "Temperature") {
            setTableViewCellColor(tableCell: temperatureCell)
            precipitationCell.accessoryType = .none
            accumulationCell.accessoryType = .none
            temperatureCell.accessoryType = .checkmark
            humidityCell.accessoryType = .none
            uvIndexCell.accessoryType = .none
            windCell.accessoryType = .none
            cloudCoverCell.accessoryType = .none
        } else if (defaults.string(forKey: "dataSource") == "Humidity") {
            setTableViewCellColor(tableCell: humidityCell)
            precipitationCell.accessoryType = .none
            accumulationCell.accessoryType = .none
            temperatureCell.accessoryType = .none
            humidityCell.accessoryType = .checkmark
            uvIndexCell.accessoryType = .none
            windCell.accessoryType = .none
            cloudCoverCell.accessoryType = .none
        } else if (defaults.string(forKey: "dataSource") == "UV index") {
            setTableViewCellColor(tableCell: uvIndexCell)
            precipitationCell.accessoryType = .none
            accumulationCell.accessoryType = .none
            temperatureCell.accessoryType = .none
            humidityCell.accessoryType = .none
            uvIndexCell.accessoryType = .checkmark
            windCell.accessoryType = .none
            cloudCoverCell.accessoryType = .none
        } else if (defaults.string(forKey: "dataSource") == "Wind speed") {
            setTableViewCellColor(tableCell: windCell)
            precipitationCell.accessoryType = .none
            accumulationCell.accessoryType = .none
            temperatureCell.accessoryType = .none
            humidityCell.accessoryType = .none
            uvIndexCell.accessoryType = .none
            windCell.accessoryType = .checkmark
            cloudCoverCell.accessoryType = .none
        } else if (defaults.string(forKey: "dataSource") == "Cloud cover") {
            setTableViewCellColor(tableCell: cloudCoverCell)
            precipitationCell.accessoryType = .none
            accumulationCell.accessoryType = .none
            temperatureCell.accessoryType = .none
            humidityCell.accessoryType = .none
            uvIndexCell.accessoryType = .none
            windCell.accessoryType = .none
            cloudCoverCell.accessoryType = .checkmark
        }
        
        if (defaults.string(forKey: "defaultConditionIcons") == "") {
            setTableViewCellColor(tableCell: defaultIconsCell)
            defaultIconsCell.accessoryType = .checkmark
            circleIconsCell.accessoryType = .none
        } else if (defaults.string(forKey: "defaultConditionIcons") == "Circle") {
            setTableViewCellColor(tableCell: circleIconsCell)
            defaultIconsCell.accessoryType = .none
            circleIconsCell.accessoryType = .checkmark
        }
    }
}

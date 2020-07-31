//
//  WeatherUnitsViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/31/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class WeatherUnitsTableViewController: UITableViewController, UITabBarControllerDelegate {

    @IBOutlet weak var UKTableViewCell: UITableViewCell!
    @IBOutlet weak var USATableViewCell: UITableViewCell!
    @IBOutlet weak var canadaTableViewCell: UITableViewCell!
    @IBOutlet weak var interantionalTableViewCell: UITableViewCell!
    
    @IBOutlet weak var twentyFourHourClockSwitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Weather Units"
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        weatherLoaded = true
        distanceChange = false
        setupObjectColors()

        if defaults.string(forKey: "weatherUnits") == "USA" {
            self.setSelectedCheckMark(unitsString: "USA")
        }
        if defaults.string(forKey: "weatherUnits") == "UK" {
            self.setSelectedCheckMark(unitsString: "UK")
        }
        if defaults.string(forKey: "weatherUnits") == "Canada" {
            self.setSelectedCheckMark(unitsString: "Canada")
        }
        if defaults.string(forKey: "weatherUnits") == "International" {
            self.setSelectedCheckMark(unitsString: "International")
        }
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(WeatherUnitsTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
    }
    
    @IBAction func weatherUnitsUSATapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(unitsString: "USA")
        weatherLoaded = false
        unitsChanged = true
    }
    @IBAction func weatherUnitsUKTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(unitsString: "UK")
        weatherLoaded = false
        unitsChanged = true
    }
    @IBAction func weatherUnitsCanadaTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(unitsString: "Canada")
        weatherLoaded = false
        unitsChanged = true
    }
    @IBAction func weatherUnitsInternationalTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(unitsString: "International")
        weatherLoaded = false
        unitsChanged = true
    }
    
    @IBAction func twentyFourHourClockSwitchTapped(_ sender: UISwitch) {
        weatherLoaded = false
        clockChanged = true
        if defaults.bool(forKey: "twentyFourHourClockEnabled") == false {
            twentyFourHourClockSwitch.isOn = true
            defaults.set(true, forKey: "twentyFourHourClockEnabled")
        } else {
            twentyFourHourClockSwitch.isOn = false
            defaults.set(false, forKey: "twentyFourHourClockEnabled")
        }
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupObjectColors() {
        var color: UIColor?
        if defaults.string(forKey: "userSavedColorString") == "Mango" {
            color = mango
        } else if defaults.string(forKey: "userSavedColorString") == "Maximum Red" {
            color = maximumRed
        } else if defaults.string(forKey: "userSavedColorString") == "Dodger Blue" {
            color = dodgerBlue
        } else if defaults.string(forKey: "userSavedColorString") == "Plump Purple" {
            color = plumpPurple
        } else if defaults.string(forKey: "userSavedColorString") == "Carmine Pink" {
            color = carminePink
        } else if defaults.string(forKey: "userSavedColorString") == "Spring Green" {
            color = springGreen
        } else {
            color = dodgerBlue
        }
        
        twentyFourHourClockSwitch.onTintColor = color
    }
    
    func setSelectedCheckMark(unitsString: String) {
        if unitsString == "USA" {
            setTableViewCellColor(tableCell: USATableViewCell)

            defaults.set("USA", forKey: "weatherUnits")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("USA", forKey: "setUnits")
            if defaults.string(forKey: "weatherUnits") == "USA" {
                USATableViewCell.accessoryType = .checkmark
                UKTableViewCell.accessoryType = .none
                canadaTableViewCell.accessoryType = .none
                interantionalTableViewCell.accessoryType = .none
            }
        }

        if unitsString == "UK" {
            setTableViewCellColor(tableCell: UKTableViewCell)

            defaults.set("UK", forKey: "weatherUnits")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("UK", forKey: "setUnits")
            if defaults.string(forKey: "weatherUnits") == "UK" {
                USATableViewCell.accessoryType = .none
                UKTableViewCell.accessoryType = .checkmark
                canadaTableViewCell.accessoryType = .none
                interantionalTableViewCell.accessoryType = .none
            }
        }

        if unitsString == "Canada" {
            setTableViewCellColor(tableCell: canadaTableViewCell)

            defaults.set("Canada", forKey: "weatherUnits")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("Canada", forKey: "setUnits")
            if defaults.string(forKey: "weatherUnits") == "Canada" {
                USATableViewCell.accessoryType = .none
                UKTableViewCell.accessoryType = .none
                canadaTableViewCell.accessoryType = .checkmark
                interantionalTableViewCell.accessoryType = .none
            }
        }

        if unitsString == "International" {
            setTableViewCellColor(tableCell: interantionalTableViewCell)

            defaults.set("International", forKey: "weatherUnits")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("International", forKey: "setUnits")
            if defaults.string(forKey: "weatherUnits") == "International" {
                USATableViewCell.accessoryType = .none
                UKTableViewCell.accessoryType = .none
                canadaTableViewCell.accessoryType = .none
                interantionalTableViewCell.accessoryType = .checkmark
            }
        }
    }
}

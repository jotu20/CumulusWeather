//
//  MapLayersTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 10/18/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class MapLayersTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
    
    let mapStyleTypes = ["Standard", "Satellite", "Hybrid"]
    let zoomLevelTypes = ["City", "State", "Country"]

    // Radar + Satellite
    @IBOutlet weak var radarTableCell: UITableViewCell!
    @IBOutlet weak var visibleSatelliteTableCell: UITableViewCell!
    @IBOutlet weak var infraredSatelliteTableCell: UITableViewCell!
    @IBOutlet weak var waterVaporSatelliteTableCell: UITableViewCell!
    
    // Severe Weather
    @IBOutlet weak var alertsTableCell: UITableViewCell!
    
    // Observations
    @IBOutlet weak var temperaturesTableCell: UITableViewCell!
    @IBOutlet weak var dewPointsTableCell: UITableViewCell!
    @IBOutlet weak var humidityTableCell: UITableViewCell!
    @IBOutlet weak var windSpeedTableCell: UITableViewCell!
    @IBOutlet weak var windGustTableCell: UITableViewCell!
    @IBOutlet weak var windDirectionTableCell: UITableViewCell!
    @IBOutlet weak var windChillTableCell: UITableViewCell!
    @IBOutlet weak var heatIndexTableCell: UITableViewCell!
    @IBOutlet weak var feelsLikeTableCell: UITableViewCell!
    @IBOutlet weak var airQualityTableCell: UITableViewCell!
    @IBOutlet weak var precipitationTableCell: UITableViewCell!
    @IBOutlet weak var visibilityTableCell: UITableViewCell!
    
    // Map Settings
    @IBOutlet weak var mapStyleTextField: UITextField!
    @IBOutlet weak var zoomLevelTextField: UITextField!
    @IBOutlet weak var locationMarkerButton: UIButton!
    
    // Constraints
    @IBOutlet weak var radarLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var visibleSatelliteLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var infraredSatelliteLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var waterVaporLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var alertsLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var temperaturesLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var dewPointsLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var humidityLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var windSpeedLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var windGustLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var windDirectionLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var windChillLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var heatIndexLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var feelsLikeLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var airQualityLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var precipitationLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var visibilityLabelLeading: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        
        title = "Map Layers"
        tableView.tableFooterView = UIView(frame: .zero)
        
        mapStyleTextField.text = defaults.string(forKey: "mapStyle")
        zoomLevelTextField.text = defaults.string(forKey: "zoomLevel")
        locationMarkerButton.setTitle(defaults.string(forKey: "locationMarker"), for: .normal)
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            radarLabelLeading.constant = 8
            visibleSatelliteLabelLeading.constant = 8
            infraredSatelliteLabelLeading.constant = 8
            waterVaporLabelLeading.constant = 8
            alertsLabelLeading.constant = 8
            temperaturesLabelLeading.constant = 8
            dewPointsLabelLeading.constant = 8
            humidityLabelLeading.constant = 8
            windSpeedLabelLeading.constant = 8
            windGustLabelLeading.constant = 8
            windDirectionLabelLeading.constant = 8
            windChillLabelLeading.constant = 8
            heatIndexLabelLeading.constant = 8
            feelsLikeLabelLeading.constant = 8
            airQualityLabelLeading.constant = 8
            precipitationLabelLeading.constant = 8
            visibilityLabelLeading.constant = 8
        }
    
        let doneBarButton = UIButton.init(type: .custom)
        doneBarButton.setTitle("Done", for: .normal)
        doneBarButton.setTitleColor(UIColor.link, for: .normal)
        doneBarButton.addTarget(self, action: #selector(MapLayersTableViewController.returnRadarTapped), for: UIControl.Event.touchUpInside)
        let barButton = UIBarButtonItem(customView: doneBarButton)
        self.navigationItem.rightBarButtonItem = barButton
        
        if (defaults.bool(forKey: "radarLayer") == true) {
            setSelectedCheckMark(layerString: "Radar")
        }
        if (defaults.bool(forKey: "visibleSatelliteLayer") == true) {
            setSelectedCheckMark(layerString: "Visible Satellite")
        }
        if (defaults.bool(forKey: "infraredSatelliteLayer") == true) {
            setSelectedCheckMark(layerString: "Infrared Satellite")
        }
        if (defaults.bool(forKey: "waterVaporLayer") == true) {
            setSelectedCheckMark(layerString: "Water Vapor")
        }
        if (defaults.bool(forKey: "alertsLayer") == true) {
            setSelectedCheckMark(layerString: "Alerts")
        }
        if (defaults.bool(forKey: "temperaturesLayer") == true) {
            setSelectedCheckMark(layerString: "Temperatures")
        }
        if (defaults.bool(forKey: "dewPointsLayer") == true) {
            setSelectedCheckMark(layerString: "Dew Points")
        }
        if (defaults.bool(forKey: "humidityLayer") == true) {
            setSelectedCheckMark(layerString: "Humidity")
        }
        if (defaults.bool(forKey: "windSpeedLayer") == true) {
            setSelectedCheckMark(layerString: "Wind Speed")
        }
        if (defaults.bool(forKey: "windGustsLayer") == true) {
            setSelectedCheckMark(layerString: "Wind Gusts")
        }
        if (defaults.bool(forKey: "windDirectionLayer") == true) {
            setSelectedCheckMark(layerString: "Wind Direction")
        }
        if (defaults.bool(forKey: "windChillLayer") == true) {
            setSelectedCheckMark(layerString: "Wind Chill")
        }
        if (defaults.bool(forKey: "heatIndexLayer") == true) {
            setSelectedCheckMark(layerString: "Heat Index")
        }
        if (defaults.bool(forKey: "feelsLikeLayer") == true) {
            setSelectedCheckMark(layerString: "Feels Like")
        }
        if (defaults.bool(forKey: "airQualityLayer") == true) {
            setSelectedCheckMark(layerString: "Air Quality")
        }
        if (defaults.bool(forKey: "precipitationLayer") == true) {
            setSelectedCheckMark(layerString: "Precipitation")
        }
        if (defaults.bool(forKey: "visibilityLayer") == true) {
            setSelectedCheckMark(layerString: "Visiblity")
        }
        
        if (defaults.bool(forKey: "cumulusPro") == false) {
            potentialCustomer = true
        }
    }

    @IBAction func radarTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(layerString: "Radar")
    }
    @IBAction func visibleSatelliteTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(layerString: "Visible Satellite")
    }
    @IBAction func infraredSatelliteTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(layerString: "Infrared Satellite")
    }
    @IBAction func waterVaporTapped(_ sender: UITapGestureRecognizer) {
        setSelectedCheckMark(layerString: "Water Vapor")
    }
    
    @IBAction func alertsTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Alerts")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func temperaturesTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Temperatures")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func dewPointsTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Dew Points")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func humidityTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Humidity")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func windSpeedTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Wind Speed")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func windGustsTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Wind Gusts")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func windDirectionTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Wind Direction")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func windChillTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Wind Chill")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func heatIndexTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Heat Index")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func feelsLikeTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Feels Like")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func airQualityTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Air Quality")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func precipitationTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Precipitation")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func visibilityTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPro") == true) {
            setSelectedCheckMark(layerString: "Visibility")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Cumulus Pro")
            present(controller, animated: true, completion: nil)
        }
    }

    func setSelectedCheckMark(layerString: String) {
        if layerString == "Radar" {
            setTableViewCellColor(tableCell: radarTableCell)
            
            defaults.set(true, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "radarLayer") == true {
                radarTableCell.accessoryType = .checkmark
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Visible Satellite" {
            setTableViewCellColor(tableCell: visibleSatelliteTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(true, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "visibleSatelliteLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .checkmark
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Infrared Satellite" {
            setTableViewCellColor(tableCell: infraredSatelliteTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(true, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "infraredSatelliteLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .checkmark
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Water Vapor" {
            setTableViewCellColor(tableCell: waterVaporSatelliteTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(true, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "waterVaporLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .checkmark
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Alerts" {
            setTableViewCellColor(tableCell: alertsTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(true, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "alertsLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .checkmark
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Temperatures" {
            setTableViewCellColor(tableCell: temperaturesTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(true, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "temperaturesLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .checkmark
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Dew Points" {
            setTableViewCellColor(tableCell: dewPointsTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(true, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "dewPointsLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .checkmark
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Humidity" {
            setTableViewCellColor(tableCell: humidityTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(true, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "humidityLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .checkmark
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Wind Speed" {
            setTableViewCellColor(tableCell: windSpeedTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(true, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "windSpeedLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .checkmark
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Wind Gusts" {
            setTableViewCellColor(tableCell: windGustTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(true, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "windGustsLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .checkmark
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Wind Direction" {
            setTableViewCellColor(tableCell: windDirectionTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(true, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "windDirectionLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .checkmark
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Wind Chill" {
            setTableViewCellColor(tableCell: windChillTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(true, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "windChillLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .checkmark
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Heat Index" {
            setTableViewCellColor(tableCell: heatIndexTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(true, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "heatIndexLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .checkmark
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Feels Like" {
            setTableViewCellColor(tableCell: feelsLikeTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(true, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "feelsLikeLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .checkmark
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Air Quality" {
            setTableViewCellColor(tableCell: airQualityTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(true, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "airQualityLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .checkmark
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Precipitaiton" {
            setTableViewCellColor(tableCell: precipitationTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(true, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "precipitationLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .checkmark
                visibilityTableCell.accessoryType = .none
            }
        }
        
        if layerString == "Visibility" {
            setTableViewCellColor(tableCell: visibilityTableCell)
            
            defaults.set(false, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(true, forKey: "visibilityLayer")
            
            if defaults.bool(forKey: "visibilityLayer") == true {
                radarTableCell.accessoryType = .none
                visibleSatelliteTableCell.accessoryType = .none
                infraredSatelliteTableCell.accessoryType = .none
                waterVaporSatelliteTableCell.accessoryType = .none
                alertsTableCell.accessoryType = .none
                temperaturesTableCell.accessoryType = .none
                dewPointsTableCell.accessoryType = .none
                humidityTableCell.accessoryType = .none
                windSpeedTableCell.accessoryType = .none
                windGustTableCell.accessoryType = .none
                windDirectionTableCell.accessoryType = .none
                windChillTableCell.accessoryType = .none
                heatIndexTableCell.accessoryType = .none
                feelsLikeTableCell.accessoryType = .none
                airQualityTableCell.accessoryType = .none
                precipitationTableCell.accessoryType = .none
                visibilityTableCell.accessoryType = .checkmark
            }
        }
    }
    
    @IBAction func locationMarkerButtonTapped(_ sender: UIButton) {
        if locationMarkerButton.currentTitle == "On" {
            defaults.set("Off", forKey: "locationMarker")
        } else if locationMarkerButton.currentTitle == "Off" {
            defaults.set("On", forKey: "locationMarker")
        }
        locationMarkerButton.setTitle(defaults.string(forKey: "locationMarker"), for: .normal)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == mapStyleTextField {
            return mapStyleTypes.count
        } else if currentTextField == zoomLevelTextField {
            return zoomLevelTypes.count
        } else {
            return 0
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == mapStyleTextField {
            return mapStyleTypes[row]
        } else if currentTextField == zoomLevelTextField {
            return zoomLevelTypes[row]
        } else {
            return ""
        }
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == mapStyleTextField {
            mapStyleTextField.text = mapStyleTypes[row]
            mapStyle = "\(mapStyleTypes[row])"
            defaults.set(mapStyle, forKey: "mapStyle")
        } else if currentTextField == zoomLevelTextField {
            zoomLevelTextField.text = zoomLevelTypes[row]
            zoomLevel = "\(zoomLevelTypes[row])"
            defaults.set(zoomLevel, forKey: "zoomLevel")
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        currentTextField = textField
        let toolBar = UIToolbar().ToolbarPicker(mySelect: #selector(MapLayersTableViewController.dismissPicker))
        
        if currentTextField == mapStyleTextField {
            currentTextField.inputView = pickerView
            currentTextField.inputAccessoryView = toolBar
        } else if currentTextField == zoomLevelTextField {
            currentTextField.inputView = pickerView
            currentTextField.inputAccessoryView = toolBar
        }
    }

    @objc func dismissPicker() {
        view.endEditing(true)
    }

    @IBAction func returnRadarTapped(_ sender: UIBarButtonItem) {
        weatherLoaded = true
        self.dismiss(animated: true, completion: {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Map")
            self.present(controller, animated: true, completion: nil)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

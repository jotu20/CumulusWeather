//
//  SettingsTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/5/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import SafariServices

class SettingsTableViewController: UITableViewController, UITabBarControllerDelegate {

    @IBOutlet weak var weatherUnitsUSATableCell: UITableViewCell!
    @IBOutlet weak var weatherUnitsUKTableCell: UITableViewCell!
    @IBOutlet weak var weatherUnitsCanadaTableCell: UITableViewCell!
    @IBOutlet weak var weatherUnitsInternationalTableCell: UITableViewCell!
    
    @IBOutlet weak var preferencesLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var cumulusProLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var cumulusTipJarLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var reviewCumulusLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var privacyPolicyLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var acknowledgementsLabelWidth: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        distanceChange = false
        potentialCustomer = false
        
        title = "Settings"
        tableView.tableFooterView = UIView(frame: .zero)
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            preferencesLabelWidth.constant = 300
            cumulusProLabelWidth.constant = 300
            cumulusTipJarLabelWidth.constant = 300
            reviewCumulusLabelWidth.constant = 300
            privacyPolicyLabelWidth.constant = 300
            acknowledgementsLabelWidth.constant = 300
        } else if screenHeight == 736 || screenHeight == 896  {
            // iPhone Plus
            preferencesLabelWidth.constant = 375
            cumulusProLabelWidth.constant = 375
            cumulusTipJarLabelWidth.constant = 375
            reviewCumulusLabelWidth.constant = 375
            privacyPolicyLabelWidth.constant = 375
            acknowledgementsLabelWidth.constant = 375
        }

        if defaults.bool(forKey: "weatherUnitsUSA") == true {
            setSelectedCheckMark(unitsString: "USA")
        }
        if defaults.bool(forKey: "weatherUnitsUK") == true {
            setSelectedCheckMark(unitsString: "UK")
        }
        if defaults.bool(forKey: "weatherUnitsCanada") == true {
            setSelectedCheckMark(unitsString: "Canada")
        }
        if defaults.bool(forKey: "weatherUnitsInternational") == true {
            setSelectedCheckMark(unitsString: "International")
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        
        if tabBarIndex == 0 && userChangedColorTheme == true {
            setButtonColor()
        }
        
        if tabBarIndex == 3 {
            self.tableView.setContentOffset(CGPoint.zero, animated: true)
        }
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

    @IBAction func openPreferencesTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = true
        performSegue(withIdentifier: "preferences", sender: nil)
    }

    @IBAction func cumulusProButtonTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = true
        performSegue(withIdentifier: "cumulusPro", sender: nil)
    }
    
    @IBAction func cumulusTipJarButtonTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = true
        performSegue(withIdentifier: "cumulusTipJar", sender: nil)
    }
    
    @IBAction func reviewCumulusButtonTapped(_ sender: UITapGestureRecognizer) {
        weatherLoaded = true
        if let url = URL(string: "https://itunes.apple.com/app/id1441446893?action=write-review") {
            UIApplication.shared.open(url)
        }
    }

    @IBAction func openPrivacyPolicy(_ sender: UITapGestureRecognizer) {
        weatherLoaded = true
        performSegue(withIdentifier: "privacyPolicy", sender: nil)
    }

    @IBAction func openAcknowledgements(_ sender: UITapGestureRecognizer) {
        weatherLoaded = true
        performSegue(withIdentifier: "acknowledgements", sender: nil)
    }

    func setSelectedCheckMark(unitsString: String) {
        if unitsString == "USA" {
            setTableViewCellColor(tableCell: weatherUnitsUSATableCell)
            
            defaults.set(true, forKey: "weatherUnitsUSA")
            defaults.set(false, forKey: "weatherUnitsUK")
            defaults.set(false, forKey: "weatherUnitsCanada")
            defaults.set(false, forKey: "weatherUnitsInternational")
            
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("USA", forKey: "setUnits")
            
            if defaults.bool(forKey: "weatherUnitsUSA") == true {
                weatherUnitsUSATableCell.accessoryType = .checkmark
                weatherUnitsUKTableCell.accessoryType = .none
                weatherUnitsCanadaTableCell.accessoryType = .none
                weatherUnitsInternationalTableCell.accessoryType = .none
            }
        }
        
        if unitsString == "UK" {
            setTableViewCellColor(tableCell: weatherUnitsUKTableCell)
            
            defaults.set(false, forKey: "weatherUnitsUSA")
            defaults.set(true, forKey: "weatherUnitsUK")
            defaults.set(false, forKey: "weatherUnitsCanada")
            defaults.set(false, forKey: "weatherUnitsInternational")
            
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("UK", forKey: "setUnits")
            
            if defaults.bool(forKey: "weatherUnitsUK") == true {
                weatherUnitsUSATableCell.accessoryType = .none
                weatherUnitsUKTableCell.accessoryType = .checkmark
                weatherUnitsCanadaTableCell.accessoryType = .none
                weatherUnitsInternationalTableCell.accessoryType = .none
            }
        }
        
        if unitsString == "Canada" {
            setTableViewCellColor(tableCell: weatherUnitsCanadaTableCell)
            
            defaults.set(false, forKey: "weatherUnitsUSA")
            defaults.set(false, forKey: "weatherUnitsUK")
            defaults.set(true, forKey: "weatherUnitsCanada")
            defaults.set(false, forKey: "weatherUnitsInternational")
            
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("Canada", forKey: "setUnits")
            
            if defaults.bool(forKey: "weatherUnitsCanada") == true {
                weatherUnitsUSATableCell.accessoryType = .none
                weatherUnitsUKTableCell.accessoryType = .none
                weatherUnitsCanadaTableCell.accessoryType = .checkmark
                weatherUnitsInternationalTableCell.accessoryType = .none
            }
        }
        
        if unitsString == "International" {
            setTableViewCellColor(tableCell: weatherUnitsInternationalTableCell)
            
            defaults.set(false, forKey: "weatherUnitsUSA")
            defaults.set(false, forKey: "weatherUnitsUK")
            defaults.set(false, forKey: "weatherUnitsCanada")
            defaults.set(true, forKey: "weatherUnitsInternational")
            
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("International", forKey: "setUnits")
            
            if defaults.bool(forKey: "weatherUnitsInternational") == true {
                weatherUnitsUSATableCell.accessoryType = .none
                weatherUnitsUKTableCell.accessoryType = .none
                weatherUnitsCanadaTableCell.accessoryType = .none
                weatherUnitsInternationalTableCell.accessoryType = .checkmark
            }
        }
    }
}

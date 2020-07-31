//
//  SettingsTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/5/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import SafariServices
import SwiftyStoreKit

class SettingsTableViewController: UITableViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var weatherUnitsTableViewCell: UITableViewCell!
    @IBOutlet weak var weatherUnitsLabel: UILabel!
    
    @IBOutlet weak var darkModeTableViewCell: UITableViewCell!
    @IBOutlet weak var darkModeLabel: UILabel!
    
    @IBOutlet weak var cumulusPlusTableViewCell: UITableViewCell!
    @IBOutlet weak var cumulusPlusLabel: UILabel!
    
    @IBOutlet weak var forecastDataTableViewCell: UITableViewCell!
    @IBOutlet weak var forecastDataLabel: UILabel!
    
    @IBOutlet weak var appIconTableViewCell: UITableViewCell!
    @IBOutlet weak var appIconLabel: UILabel!
    
    @IBOutlet weak var themeColorTableViewCell: UITableViewCell!
    @IBOutlet weak var themeColorLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Settings"
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        weatherUnitsLabel.text = defaults.string(forKey: "weatherUnits")
        darkModeLabel.text = defaults.string(forKey: "darkMode")
        
        forecastDataLabel.text = defaults.string(forKey: "dataSource")
        appIconLabel.text = defaults.string(forKey: "userSavedAppIconString")
        themeColorLabel.text = defaults.string(forKey: "userSavedColorString")
        
        weatherLoaded = true
        distanceChange = false
        potentialCustomer = false
        setupObjectColors()
        
        if defaults.bool(forKey: "cumulusPlus") == false {
            forecastDataTableViewCell.isUserInteractionEnabled = false
            appIconTableViewCell.isUserInteractionEnabled = false
            themeColorTableViewCell.isUserInteractionEnabled = false
        } else {
            cumulusPlusLabel.text = "Restore Cumulus+"
        }
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
        
        weatherUnitsTableViewCell.detailTextLabel?.textColor = color
        weatherUnitsLabel.textColor = color
        
        darkModeTableViewCell.detailTextLabel?.textColor = color
        darkModeLabel.textColor = color
        
        forecastDataTableViewCell.detailTextLabel?.textColor = color
        forecastDataLabel.textColor = color
        
        appIconTableViewCell.detailTextLabel?.textColor = color
        appIconLabel.textColor = color
        
        themeColorTableViewCell.detailTextLabel?.textColor = color
        themeColorLabel.textColor = color
    }
    
    @IBAction func weatherUnitsTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "weatherUnitsPush", sender: nil)
    }
    
    @IBAction func darkModeTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "darkModePush", sender: nil)
    }
    
    @IBAction func cumulusPlusTapped(_ sender: UITapGestureRecognizer) {
        if defaults.bool(forKey: "cumulusPlus") == false {
            performSegue(withIdentifier: "cumulusPlusPush", sender: nil)
        } else {
            // Verify subscriptions
            let cumulusPlusValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
            SwiftyStoreKit.verifyReceipt(using: cumulusPlusValidator) { result in
                switch result {
                case .success(let receipt):
                    let productIds = Set([ "com.josephszafarowicz.CumulusPlus.Monthly", "com.josephszafarowicz.CumulusPlus.Yearly",])
                    let purchaseResult = SwiftyStoreKit.verifySubscriptions(productIds: productIds, inReceipt: receipt)
                    switch purchaseResult {
                    case .purchased(let expiryDate, let items):
                        print("\(productIds) are valid until \(expiryDate)\n\(items)\n")
                        defaults.set(true, forKey: "cumulusPlus")
                    case .expired(let expiryDate, let items):
                        print("\(productIds) are expired since \(expiryDate)\n\(items)\n")
                        checkForCumulusPro()
                    case .notPurchased:
                        print("The user has never purchased \(productIds)")
                        checkForCumulusPro()
                    }
                case .error(let error):
                    print("Receipt verification failed: \(error)")
                }
            }
        }
    }
    
    @IBAction func forecastDataTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "forecastDataPush", sender: nil)
    }
    
    @IBAction func appIconTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "appIconPush", sender: nil)
    }
    
    @IBAction func themeColorTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "themeColorPush", sender: nil)
    }
    
    @IBAction func siriShortcutsTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "siriShortcutsPush", sender: nil)
    }
    
    @IBAction func privacyTermsTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "privacyTermsPush", sender: nil)
    }
    
    @IBAction func acknowledgementsTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "acknowledgementsPush", sender: nil)
    }
    
    @IBAction func reviewCumulusTapped(_ sender: UITapGestureRecognizer) {
        if let url = URL(string: "https://itunes.apple.com/app/id1441446893?action=write-review") {
            UIApplication.shared.open(url)
        }
    }
}

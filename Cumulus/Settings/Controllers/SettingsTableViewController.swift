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
    
    @IBOutlet weak var twentyFourHourClockSwitch: UISwitch!
    @IBOutlet weak var hapticFeedbackTableCell: UITableViewCell!
    @IBOutlet weak var hapticFeedbackSwitch: UISwitch!
    
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
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            hapticFeedbackTableCell.isHidden = true
        } else {
            hapticFeedbackTableCell.isHidden = false
        }
        
        if (defaults.bool(forKey: "twentyFourHourClockEnabled") == true) {
            twentyFourHourClockSwitch.isOn = true
        } else {
            twentyFourHourClockSwitch.isOn = false
        }
        
        if (defaults.bool(forKey: "hapticFeedbackEnabled") == true) {
            hapticFeedbackSwitch.isOn = true
        } else {
            hapticFeedbackSwitch.isOn = false
        }
        
        forecastDataLabel.text = defaults.string(forKey: "dataSource")
        appIconLabel.text = defaults.string(forKey: "userSavedAppIconString")
        themeColorLabel.text = defaults.string(forKey: "userSavedColorString")
        
        weatherLoaded = true
        distanceChange = false
        userChangedColorTheme = false
        setupObjectColors()
        
        if (defaults.bool(forKey: "cumulusPlus") == true) {
            cumulusPlusLabel.text = "Restore Cumulus+"
        }
    }
    
    func setupObjectColors() {
        var color: UIColor?
        if (defaults.string(forKey: "userSavedColorString") == "Mango") {
            color = mango
        } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
            color = maximumRed
        } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
            color = dodgerBlue
        } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
            color = plumpPurple
        } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
            color = orchid
        } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
            color = springGreen
        } else {
            color = dodgerBlue
        }
        
        weatherUnitsTableViewCell.detailTextLabel?.textColor = color
        weatherUnitsLabel.textColor = color
        
        twentyFourHourClockSwitch.onTintColor = color
        hapticFeedbackSwitch.onTintColor = color
        
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
    
    @IBAction func twentyFourHourClockSwitchTapped(_ sender: UISwitch) {
        weatherLoaded = false
        clockChanged = true
        if (defaults.bool(forKey: "twentyFourHourClockEnabled") == false) {
            twentyFourHourClockSwitch.isOn = true
            defaults.set(true, forKey: "twentyFourHourClockEnabled")
        } else {
            twentyFourHourClockSwitch.isOn = false
            defaults.set(false, forKey: "twentyFourHourClockEnabled")
        }
    }
    
    @IBAction func hapticFeedbackSwitchTapped(_ sender: UISwitch) {
        if (defaults.bool(forKey: "hapticFeedbackEnabled") == false) {
            hapticFeedbackSwitch.isOn = true
            defaults.set(true, forKey: "hapticFeedbackEnabled")
        } else {
            hapticFeedbackSwitch.isOn = false
            defaults.set(false, forKey: "hapticFeedbackEnabled")
        }
    }
    
    @IBAction func cumulusPlusTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == false) {
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
                        UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("true", forKey: "setCumulusPlus")
                        weatherLoaded = false
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "Home")
                        self.present(controller, animated: true, completion: nil)
                    case .expired(let expiryDate, let items):
                        print("\(productIds) are expired since \(expiryDate)\n\(items)\n")
                        defaults.set(false, forKey: "cumulusPlus")
                        UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("false", forKey: "setCumulusPlus")
                    case .notPurchased:
                        print("The user has never purchased \(productIds)")
                        
                        let alert = UIAlertController(title: "", message: "No previous purchases were found.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                case .error(let error):
                    print("Receipt verification failed: \(error)")
                }
            }
            
            // Verify Lifetime purchase
            let cumulusPlusLifetimeValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
            SwiftyStoreKit.verifyReceipt(using: cumulusPlusLifetimeValidator) { result in
                switch result {
                case .success(let receipt):
                    let productId = "com.josephszafarowicz.CumulusPlus.Lifetime"
                    // Verify the purchase of Consumable or NonConsumable
                    let purchaseResult = SwiftyStoreKit.verifyPurchase(
                        productId: productId,
                        inReceipt: receipt)
                        
                    switch purchaseResult {
                    case .purchased(let receiptItem):
                        print("\(productId) is purchased: \(receiptItem)")
                        defaults.set(true, forKey: "cumulusPlus")
                        UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("true", forKey: "setCumulusPlus")
                        weatherLoaded = false
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "Home")
                        self.present(controller, animated: true, completion: nil)
                    case .notPurchased:
                        print("The user has never purchased \(productId)")
                        
                        let alert = UIAlertController(title: "", message: "No previous purchases were found.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                case .error(let error):
                    print("Receipt verification failed: \(error)")
                }
            }
        }
    }
    
    @IBAction func forecastDataTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == false) {
            performSegue(withIdentifier: "cumulusPlusPush", sender: nil)
        } else {
            performSegue(withIdentifier: "forecastDataPush", sender: nil)
        }
    }
    
    @IBAction func appIconTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == false) {
            performSegue(withIdentifier: "cumulusPlusPush", sender: nil)
        } else {
            performSegue(withIdentifier: "appIconPush", sender: nil)
        }
    }
    
    @IBAction func themeColorTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.bool(forKey: "cumulusPlus") == false) {
            performSegue(withIdentifier: "cumulusPlusPush", sender: nil)
        } else {
            performSegue(withIdentifier: "themeColorPush", sender: nil)
        }
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

extension SettingsTableViewController {
    func alertWithTitle(_ title: String, message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    
    func showAlert(_ alert: UIAlertController) {
        guard self.presentedViewController != nil else {
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func alertForPurchaseResult(_ result: PurchaseResult) -> UIAlertController? {
        switch result {
        case .success(let purchase):
            print("Purchase Success: \(purchase.productId)")
            return nil
        case .error(let error):
            print("Purchase Failed: \(error)")
            switch error.code {
            case .unknown: return alertWithTitle("Purchase failed", message: error.localizedDescription)
            case .clientInvalid: // client is not allowed to issue the request, etc.
                return alertWithTitle("Purchase failed", message: "Not allowed to make the payment")
            case .paymentCancelled: // user cancelled the request, etc.
                return nil
            case .paymentInvalid: // purchase identifier was invalid, etc.
                return alertWithTitle("Purchase failed", message: "The purchase identifier was invalid")
            case .paymentNotAllowed: // this device is not allowed to make the payment
                return alertWithTitle("Purchase failed", message: "The device is not allowed to make the payment")
            case .storeProductNotAvailable: // Product is not available in the current storefront
                return alertWithTitle("Purchase failed", message: "The product is not available in the current storefront")
            case .cloudServicePermissionDenied: // user has not allowed access to cloud service information
                return alertWithTitle("Purchase failed", message: "Access to cloud service information is not allowed")
            case .cloudServiceNetworkConnectionFailed: // the device could not connect to the nework
                return alertWithTitle("Purchase failed", message: "Could not connect to the network")
            case .cloudServiceRevoked: // user has revoked permission to use this cloud service
                return alertWithTitle("Purchase failed", message: "Cloud service was revoked")
            case .privacyAcknowledgementRequired:
                return alertWithTitle("Purchase failed", message: "Privacy Acknowledgement required")
            case .unauthorizedRequestData:
                return alertWithTitle("Purchase failed", message: "Unauthorized data")
            case .invalidOfferIdentifier:
                return alertWithTitle("Purchase failed", message: "Invalid product identifier")
            case .invalidSignature:
                return alertWithTitle("Purchase failed", message: "Invalid signature")
            case .missingOfferParams:
                return alertWithTitle("Purchase failed", message: "Missing parameters")
            case .invalidOfferPrice:
                return alertWithTitle("Purchase failed", message: "Invalid offer price")
            case .overlayCancelled:
                return alertWithTitle("Purchase failed", message: "Overlay cancelled")
            case .overlayInvalidConfiguration:
                return alertWithTitle("Purchase failed", message: "Overlay invalid configuration")
            case .overlayTimeout:
                return alertWithTitle("Purchase failed", message: "Overlay timeout")
            case .ineligibleForOffer:
                return alertWithTitle("Purchase failed", message: "Ineligible for offer")
            @unknown default:
                return alertWithTitle("Purchase failed", message: "Uknown error")
            }
        }
    }
    
    func alertForRestorePurchases(_ results: RestoreResults) -> UIAlertController {
        
        if results.restoreFailedPurchases.count > 0 {
            print("Restore Failed: \(results.restoreFailedPurchases)")
            return alertWithTitle("Restore failed", message: "Unknown error. Please contact support")
        } else if results.restoredPurchases.count > 0 {
            print("Restore Success: \(results.restoredPurchases)")
            return alertWithTitle("Purchases Restored", message: "Previous purchases have been restored")
        } else {
            print("Nothing to Restore")
            return alertWithTitle("Nothing to restore", message: "No previous purchases were found")
        }
    }
}

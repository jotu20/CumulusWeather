//
//  SettingsTableViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 7/5/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import SwiftyStoreKit
import SafariServices

class SettingsTableViewController: UITableViewController, UITabBarControllerDelegate {

    @IBOutlet weak var weatherUnitsUSATableCell: UITableViewCell!
    @IBOutlet weak var weatherUnitsUKTableCell: UITableViewCell!
    @IBOutlet weak var weatherUnitsCanadaTableCell: UITableViewCell!
    @IBOutlet weak var weatherUnitsInternationalTableCell: UITableViewCell!
    
    @IBOutlet weak var preferencesLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var cumulusProLabelWidth: NSLayoutConstraint!
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
            reviewCumulusLabelWidth.constant = 300
            privacyPolicyLabelWidth.constant = 300
            acknowledgementsLabelWidth.constant = 300
        } else if screenHeight == 736 || screenHeight == 896  {
            // iPhone Plus
            preferencesLabelWidth.constant = 375
            cumulusProLabelWidth.constant = 375
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myIndex = indexPath.row
        print(myIndex)

        performSegue(withIdentifier: "preferences", sender: self)
    }
}

extension SettingsTableViewController {
    func alertWithTitle(_ title: String, message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
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
            return alertWithTitle("Purchases Restored", message: "All purchases have been restored")
        } else {
            print("Nothing to Restore")
            return alertWithTitle("Nothing to restore", message: "No previous purchases were found")
        }
    }
}

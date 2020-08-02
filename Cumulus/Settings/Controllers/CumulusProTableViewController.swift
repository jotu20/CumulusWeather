//
//  CumulusPlusViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 8/25/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import SwiftyStoreKit

class CumulusPlusTableViewController: UITableViewController {
    
    @IBOutlet weak var cumulusPlusMonthlyButton: UIButton!
    @IBOutlet weak var cumulusPlusYearlyButton: UIButton!
    @IBOutlet weak var cumulusPlusLifetimeButton: UIButton!
    
    @IBOutlet weak var cumulusPlusTextViewWidth: NSLayoutConstraint!
    @IBOutlet weak var cumulusPlusTextViewHeight: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Cumulus+"
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        setupObjectColors()
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            self.cumulusPlusTextViewWidth.constant = 300
            self.cumulusPlusTextViewHeight.constant = 143
        }
        
        cumulusPlusMonthlyButton.layer.cornerRadius = 10
        cumulusPlusYearlyButton.layer.cornerRadius = 10
        cumulusPlusLifetimeButton.layer.cornerRadius = 10
        
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.CumulusPlus.Monthly"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.cumulusPlusMonthlyButton.setTitle("Cumulus+ Monthly (\(priceString))", for: .normal)
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }

        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.CumulusPlus.Yearly"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.cumulusPlusYearlyButton.setTitle("Cumulus+ Yearly (\(priceString))", for: .normal)
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }
        
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.CumulusPlus.Lifetime"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.cumulusPlusLifetimeButton.setTitle("Cumulus+ Lifetime (\(priceString))", for: .normal)
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }

        let restoreBarButton = UIBarButtonItem(title: "Restore", style: .plain, target: self, action: #selector(CumulusPlusTableViewController.restoreCumulusPlusTapped))
        setupBarButtonColor(button: restoreBarButton)
        self.navigationItem.leftBarButtonItem = restoreBarButton
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CumulusPlusTableViewController.doneBarButtonTapped))
        setupBarButtonColor(button: doneBarButton)
        self.navigationItem.rightBarButtonItem = doneBarButton
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
        
        cumulusPlusMonthlyButton.backgroundColor = color
        cumulusPlusYearlyButton.backgroundColor = color
        cumulusPlusLifetimeButton.backgroundColor = color
    }

    @IBAction func cumulusPlusMonthlyButtonTapped(_ sender: UIButton) {
        let productId = "com.josephszafarowicz.CumulusPlus.Monthly"
        SwiftyStoreKit.purchaseProduct(productId, atomically: true) { result in
            
            if case .success(let purchase) = result {
                // Deliver content from server, then:
                if purchase.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(purchase.transaction)
                }
                
                let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
                SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
                    
                    if case .success(let receipt) = result {
                        let purchaseResult = SwiftyStoreKit.verifySubscription(
                            ofType: .autoRenewable,
                            productId: productId,
                            inReceipt: receipt)
                        
                        switch purchaseResult {
                        case .purchased(let expiryDate, _):
                            print("Product is valid until \(expiryDate)")
                            defaults.set(true, forKey: "cumulusPlus")
                        case .expired(let expiryDate, _):
                            print("Product is expired since \(expiryDate)")
                            defaults.set(false, forKey: "cumulusPlus")
                        case .notPurchased:
                            print("This product has never been purchased")
                        }
                    } else {
                        // receipt verification error
                    }
                }
            } else {
                // purchase error
            }
        }
    }
    
    @IBAction func cumulusPlusYearlyButtonTapped(_ sender: UIButton) {
        let productId = "com.josephszafarowicz.CumulusPlus.Yearly"
        SwiftyStoreKit.purchaseProduct(productId, atomically: true) { result in
            
            if case .success(let purchase) = result {
                // Deliver content from server, then:
                if purchase.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(purchase.transaction)
                }
                
                let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
                SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
                    
                    if case .success(let receipt) = result {
                        let purchaseResult = SwiftyStoreKit.verifySubscription(
                            ofType: .autoRenewable,
                            productId: productId,
                            inReceipt: receipt)
                        
                        switch purchaseResult {
                        case .purchased(let expiryDate, _):
                            print("Product is valid until \(expiryDate)")
                            defaults.set(true, forKey: "cumulusPlus")
                        case .expired(let expiryDate, _):
                            print("Product is expired since \(expiryDate)")
                            defaults.set(false, forKey: "cumulusPlus")
                        case .notPurchased:
                            print("This product has never been purchased")
                        }
                    } else {
                        // receipt verification error
                    }
                }
            } else {
                // purchase error
            }
        }
    }
    
    @IBAction func cumulusPlustLifetimeButtonTapped(_ sender: UIButton) {
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.CumulusPlus.Lifetime", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                defaults.set(true, forKey: "cumulusPlus")
            case .error(let error):
                switch error.code {
                case .unknown: print("Unknown error. Please contact support")
                case .clientInvalid: print("Not allowed to make the payment")
                case .paymentCancelled: break
                case .paymentInvalid: print("The purchase identifier was invalid")
                case .paymentNotAllowed: print("The device is not allowed to make the payment")
                case .storeProductNotAvailable: print("The product is not available in the current storefront")
                case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
                default: print((error as NSError).localizedDescription)
                }
            }
        }
    }
    
    @IBAction func restoreCumulusPlusTapped(_ sender: UIBarButtonItem) {
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
                    defaults.set(false, forKey: "cumulusPlus")
                case .notPurchased:
                    print("The user has never purchased \(productIds)")
                    
                    let alert = UIAlertController(title: "", message: "No previous purchases were found.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
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
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                    
                    let alert = UIAlertController(title: "", message: "No previous purchases were found.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension CumulusPlusTableViewController {
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
            return alertWithTitle("Purchases Restored", message: "Previous purchases have been restored")
        } else {
            print("Nothing to Restore")
            return alertWithTitle("Nothing to restore", message: "No previous purchases were found")
        }
    }
}

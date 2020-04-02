//
//  TipJarViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 3/30/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import SwiftyStoreKit

class TipJarViewController: UIViewController {

    @IBOutlet weak var mistingTipButton: UIButton!
    @IBOutlet weak var sprinklingTipButton: UIButton!
    @IBOutlet weak var showerTipButton: UIButton!
    @IBOutlet weak var downpourTipButton: UIButton!
    @IBOutlet weak var torrentialTipButton: UIButton!
    
    @IBOutlet weak var cumulusTipJarTextViewWidth: NSLayoutConstraint!
    @IBOutlet weak var cumulusTipJarTextViewHeight: NSLayoutConstraint!
        
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        
        title = "Tip Jar"
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            cumulusTipJarTextViewWidth.constant = 300
            cumulusTipJarTextViewHeight.constant = 143
        }
        
        self.mistingTipButton.setTitle("Misting tip of $0.99", for: .normal)
        self.mistingTipButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        self.sprinklingTipButton.setTitle("Sprinkling tip of $2.99", for: .normal)
        self.sprinklingTipButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        self.showerTipButton.setTitle("Shower tip of $4.99", for: .normal)
        self.showerTipButton.titleLabel?.textAlignment = NSTextAlignment.center

        self.downpourTipButton.setTitle("Downpour tip of $9.99", for: .normal)
        self.downpourTipButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        self.torrentialTipButton.setTitle("Torrential tip of $19.99", for: .normal)
        self.torrentialTipButton.titleLabel?.textAlignment = NSTextAlignment.center

        mistingTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        sprinklingTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        showerTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        downpourTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        torrentialTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
    }

    @IBAction func mistingTipButtonTapped(_ sender: UIButton) {
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.TipJarMisting"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.TipJarMisting", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
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
            if let alert = self.alertForPurchaseResult(result) {
                self.showAlert(alert)
            }
        }
    }
    
    @IBAction func sprinklingTipButtonTapped(_ sender: UIButton) {
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.TipJarSprinkling"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.TipJarSprinkling", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
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
            if let alert = self.alertForPurchaseResult(result) {
                self.showAlert(alert)
            }
        }
    }
    
    @IBAction func showerTipButtonTapped(_ sender: UIButton) {
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.TipJarShower"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.TipJarShower", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
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
            if let alert = self.alertForPurchaseResult(result) {
                self.showAlert(alert)
            }
        }
    }
    
    @IBAction func downpourTipButtonTapped(_ sender: UIButton) {
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.TipJarDownpour"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.TipJarDownpour", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
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
            if let alert = self.alertForPurchaseResult(result) {
                self.showAlert(alert)
            }
        }
    }
    
    @IBAction func torrentialTipButtonTapped(_ sender: UIButton) {
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.TipJarTorrential"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
            }
            else {
                print("Error: \(String(describing: result.error))")
            }
        }
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.TipJarTorrential", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
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
            if let alert = self.alertForPurchaseResult(result) {
                self.showAlert(alert)
            }
        }
    }
}

    extension TipJarViewController {
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
    }


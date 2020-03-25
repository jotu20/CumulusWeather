//
//  CumulusProViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 8/25/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import SwiftyStoreKit

class CumulusProTableViewController: UITableViewController {
    
    @IBOutlet weak var mistingTipButton: UIButton!
    @IBOutlet weak var sprinklingTipButton: UIButton!
    @IBOutlet weak var showerTipButton: UIButton!
    @IBOutlet weak var downpourTipButton: UIButton!
    @IBOutlet weak var torrentialTipButton: UIButton!
    
    @IBOutlet weak var cumulusProTextViewWidth: NSLayoutConstraint!
    @IBOutlet weak var cumulusProTextViewHeight: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        weatherLoaded = true
        
        title = "Cumulus Pro"
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            cumulusProTextViewWidth.constant = 300
            cumulusProTextViewHeight.constant = 143
        }

        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProMistingTip"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.mistingTipButton.setTitle("Misting tip of \(priceString)", for: .normal)
                self.mistingTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                self.mistingTipButton.setTitle("Misting tip", for: .normal)
                self.mistingTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else {
                print("Error: \(String(describing: result.error))")
                self.mistingTipButton.setTitle("Misting tip", for: .normal)
                self.mistingTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
        }
        
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProSprinklingTip"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.sprinklingTipButton.setTitle("Sprinkling tip of \(priceString)", for: .normal)
                self.sprinklingTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                self.sprinklingTipButton.setTitle("Sprinkling tip", for: .normal)
                self.sprinklingTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else {
                print("Error: \(String(describing: result.error))")
                self.sprinklingTipButton.setTitle("Sprinkling tip", for: .normal)
                self.sprinklingTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
        }
        
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProShowerTip"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.showerTipButton.setTitle("Shower tip of \(priceString)", for: .normal)
                self.showerTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                self.showerTipButton.setTitle("Shower tip", for: .normal)
                self.showerTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else {
                print("Error: \(String(describing: result.error))")
                self.showerTipButton.setTitle("Shower tip", for: .normal)
                self.showerTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
        }
        
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProDownpourTip"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.downpourTipButton.setTitle("Downpour tip of \(priceString)", for: .normal)
                self.downpourTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                self.downpourTipButton.setTitle("Downpour tip", for: .normal)
                self.downpourTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else {
                print("Error: \(String(describing: result.error))")
                self.downpourTipButton.setTitle("Downpour tip", for: .normal)
                self.downpourTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
        }
        
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProTorrentialTip"]) { result in
            if let product = result.retrievedProducts.first {
                let priceString = product.localizedPrice!
                print("Product: \(product.localizedDescription), price: \(priceString)")
                self.torrentialTipButton.setTitle("Torrential tip of \(priceString)", for: .normal)
                self.torrentialTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else if let invalidProductId = result.invalidProductIDs.first {
                print("Invalid product identifier: \(invalidProductId)")
                self.torrentialTipButton.setTitle("Torrential tip", for: .normal)
                self.torrentialTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
            else {
                print("Error: \(String(describing: result.error))")
                self.torrentialTipButton.setTitle("Torrential tip", for: .normal)
                self.torrentialTipButton.titleLabel?.textAlignment = NSTextAlignment.center
            }
        }

        mistingTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        sprinklingTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        showerTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        downpourTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        torrentialTipButton.setBackgroundImage(UIImage(named: "Button \(buttonColor).pdf"), for: .normal)
        
        let restoreBarButton = UIButton.init(type: .custom)
        restoreBarButton.setTitle("Restore", for: .normal)
        restoreBarButton.setTitleColor(UIColor.link, for: .normal)
        restoreBarButton.addTarget(self, action: #selector(CumulusProTableViewController.restoreCumulusProTapped), for: UIControl.Event.touchUpInside)
        let barButton2 = UIBarButtonItem(customView: restoreBarButton)
        self.navigationItem.rightBarButtonItem = barButton2
        
        if potentialCustomer == true {
            let cancelBarButton = UIButton.init(type: .custom)
            cancelBarButton.setTitle("Cancel", for: .normal)
            cancelBarButton.setTitleColor(UIColor.link, for: .normal)
            cancelBarButton.addTarget(self, action: #selector(CumulusProTableViewController.cancelCumulusProTapped), for: UIControl.Event.touchUpInside)
            let barButton = UIBarButtonItem(customView: cancelBarButton)
            self.navigationItem.leftBarButtonItem = barButton
        }
    }
    
    @IBAction func cumulusProTier2ButtonTapped(_ sender: UIButton) {
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProMistingTip"]) { result in
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
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.CumulusProMistingTip", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                defaults.set(true, forKey: "cumulusPro")
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

    @IBAction func mistingTipButtonTapped(_ sender: UIButton) {
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProMistingTip"]) { result in
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
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.CumulusProMistingTip", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                defaults.set(true, forKey: "cumulusPro")
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
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProSprinklingTip"]) { result in
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
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.CumulusProSprinklingTip", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                defaults.set(true, forKey: "cumulusPro")
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
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProShowerTip"]) { result in
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
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.CumulusProShowerTip", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                defaults.set(true, forKey: "cumulusPro")
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
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProDownpourTip"]) { result in
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
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.CumulusProDownpourTip", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                defaults.set(true, forKey: "cumulusPro")
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
        SwiftyStoreKit.retrieveProductsInfo(["com.josephszafarowicz.Cumulus.CumulusProTorrentialTip"]) { result in
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
        
        SwiftyStoreKit.purchaseProduct("com.josephszafarowicz.Cumulus.CumulusProTorrentialTip", quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                print("Purchase Success: \(purchase.productId)")
                defaults.set(true, forKey: "cumulusPro")
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
    
    @IBAction func restoreCumulusProTapped(_ sender: UIBarButtonItem) {
        // Restore previous purchases
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoreFailedPurchases.count > 0 {
                print("Restore Failed: \(results.restoreFailedPurchases)")
            }
            else if results.restoredPurchases.count > 0 {
                print("Restore Success: \(results.restoredPurchases)")
                defaults.set(true, forKey: "cumulusPro")
            }
            else {
                print("Nothing to Restore")
            }
            self.showAlert(self.alertForRestorePurchases(results))
        }
        
        // Fetch and verify receipt
        SwiftyStoreKit.fetchReceipt(forceRefresh: true) { result in
            switch result {
            case .success(let receiptData):
                let encryptedReceipt = receiptData.base64EncodedString(options: [])
                print("Fetch receipt success:\n\(encryptedReceipt)")
            case .error(let error):
                print("Fetch receipt failed: \(error)")
            }
        }
        
        let recieptValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
        SwiftyStoreKit.verifyReceipt(using: recieptValidator, forceRefresh: false) { result in
            switch result {
            case .success(let receipt):
                print("Verify receipt success: \(receipt)")
            case .error(let error):
                print("Verify receipt failed: \(error)")
            }
        }
        
        let cumulusProMistingTipValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
        SwiftyStoreKit.verifyReceipt(using: cumulusProMistingTipValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = "com.josephszafarowicz.Cumulus.CumulusProMistingTip"
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(productId) is purchased: \(receiptItem)")
                    defaults.set(true, forKey: "cumulusPro")
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
        
        let cumulusProSprinklingTipValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
        SwiftyStoreKit.verifyReceipt(using: cumulusProSprinklingTipValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = "com.josephszafarowicz.Cumulus.CumulusProSprinklingTip"
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(productId) is purchased: \(receiptItem)")
                    defaults.set(true, forKey: "cumulusPro")
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
        
        let cumulusProShowerTipValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
        SwiftyStoreKit.verifyReceipt(using: cumulusProShowerTipValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = "com.josephszafarowicz.Cumulus.CumulusProShowerTip"
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(productId) is purchased: \(receiptItem)")
                    defaults.set(true, forKey: "cumulusPro")
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
        
        let cumulusProDownpourTipValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
        SwiftyStoreKit.verifyReceipt(using: cumulusProDownpourTipValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = "com.josephszafarowicz.Cumulus.CumulusProDownpourTip"
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(productId) is purchased: \(receiptItem)")
                    defaults.set(true, forKey: "cumulusPro")
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
        
        let cumulusProTorrentialTipValidator = AppleReceiptValidator(service: .production, sharedSecret: "\(sharedSecret)")
        SwiftyStoreKit.verifyReceipt(using: cumulusProTorrentialTipValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = "com.josephszafarowicz.Cumulus.CumulusProTorrentialTip"
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: productId,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(productId) is purchased: \(receiptItem)")
                    defaults.set(true, forKey: "cumulusPro")
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
    }
    
    @IBAction func cancelCumulusProTapped(_ sender: UIBarButtonItem) {
        weatherLoaded = true
        potentialCustomer = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func privacyPolicyButtonTapped(_ sender: UIButton) {
        weatherLoaded = true
        potentialCustomer = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PrivacyPolicy")
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func termsOfUseButtonTapped(_ sender: UIButton) {
        weatherLoaded = true
        potentialCustomer = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TermsOfUse")
        present(controller, animated: true, completion: nil)
    }
}

extension CumulusProTableViewController {
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

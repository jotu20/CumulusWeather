//
//  AppDelegate.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 6/20/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import CoreData
import GooglePlaces
import SwiftyStoreKit
 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        checkSavedColor()
        
        // Initialize Google Places
        GMSPlacesClient.provideAPIKey("AIzaSyBajb_PcxUkLHvkNyQjVwbLD2IIBj62kdY")
        
        // Complete transactions
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        // Deliver content from server
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                case .failed, .purchasing, .deferred:
                    break
                @unknown default:
                    print("Uknown error")
                }
            }
        }
        
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
                case .expired(let expiryDate, let items):
                    print("\(productIds) are expired since \(expiryDate)\n\(items)\n")
                    defaults.set(false, forKey: "cumulusPlus")
                    UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("false", forKey: "setCumulusPlus")
                case .notPurchased:
                    print("The user has never purchased \(productIds)")
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
                case .notPurchased:
                    print("The user has never purchased \(productId)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }

        // Setup all the default values
        if (defaults.bool(forKey: "cumulusPlus") == false) {
            defaults.set("Dodger Blue", forKey: "userSavedAppIconString")
        }
        
        if (defaults.string(forKey: "defaultHourlyCondition") == nil) || (defaults.bool(forKey: "cumulusPlus") == false) {
            defaults.set("Precipitation", forKey: "defaultHourlyCondition")
        }
        
        if (defaults.string(forKey: "defaultConditionIcons") == nil) || (defaults.bool(forKey: "cumulusPlus") == false) {
            defaults.set("", forKey: "defaultConditionIcons")
        }
        
        if (defaults.string(forKey: "dataSource") == nil) || (defaults.bool(forKey: "cumulusPlus") == false) {
            defaults.set("Dark Sky", forKey: "dataSource")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("Dark Sky", forKey: "setDataSource")
        }
        
        if (defaults.string(forKey: "weatherUnits")) == nil {
            defaults.set("USA", forKey: "weatherUnits")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("USA", forKey: "setUnits")
        }
        
        if (defaults.bool(forKey: "cumulusPlus") == false) || (defaults.bool(forKey: "autoThemeEnabled") == true) {
            let autoTheme = Int(arc4random_uniform(UInt32(6)))
            
            if autoTheme == 0 || autoTheme == 1 {
                defaults.set("Dodger Blue", forKey: "userSavedColorString")
            } else if autoTheme == 2 {
                defaults.set("Orchid", forKey: "userSavedColorString")
            } else if autoTheme == 3 {
                defaults.set("Mango", forKey: "userSavedColorString")
            } else if autoTheme == 4 {
                defaults.set("Maximum Red", forKey: "userSavedColorString")
            } else if autoTheme == 5 {
                defaults.set("Plump Purple", forKey: "userSavedColorString")
            } else if autoTheme == 6 {
                defaults.set("Spring Green", forKey: "userSavedColorString")
            }
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("\(userSavedColorString)", forKey: "setColor")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Locations")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}

// MARK: - Extension
extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

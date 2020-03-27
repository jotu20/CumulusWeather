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
        
        if (defaults.string(forKey: "defaultHourlyCondition") == nil) {
            defaults.set("Precip (%)", forKey: "defaultHourlyCondition")
        }
        
        if (defaults.string(forKey: "defaultDailyCondition") == nil) {
            defaults.set("Precip (%)", forKey: "defaultDailyCondition")
        }
        
        if (defaults.string(forKey: "defaultWidgetSlot1") == nil) {
            defaults.set("Current condition", forKey: "defaultWidgetSlot1")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("Current condition", forKey: "setDefaultWidgetSlot1")
        }
        
        if (defaults.string(forKey: "defaultWidgetSlot2") == nil) {
            defaults.set("Precip (%)", forKey: "defaultWidgetSlot2")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("Precip (%)", forKey: "setDefaultWidgetSlot2")
        }
        
        if (defaults.string(forKey: "dataSource") == nil) || (defaults.string(forKey: "dataSource") == "AerisWeather") || (defaults.bool(forKey: "cumulusPro") == false) {
            defaults.set("Dark Sky", forKey: "dataSource")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("Dark Sky", forKey: "setDataSource")
        }
        
        if defaults.bool(forKey: "weatherUnitsUSA") == false && defaults.bool(forKey: "weatherUnitsUK") == false && defaults.bool(forKey: "weatherUnitsCanada") == false && defaults.bool(forKey: "weatherUnitsInternational") == false {
            defaults.set(true, forKey: "weatherUnitsUSA")
        }
        
        if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
            defaults.set("Precip (%)", forKey: "defaultHourlyCondition")
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
            defaults.set("Temp (°\(unitsTemperature))", forKey: "defaultHourlyCondition")
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
            defaults.set("Humidity (%)", forKey: "defaultHourlyCondition")
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV index") == true) {
            defaults.set("UV index", forKey: "defaultHourlyCondition")
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
            defaults.set("Wind (\(unitsWindSpeed))", forKey: "defaultHourlyCondition")
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud cover") == true) {
            defaults.set("Cloud cover (%)", forKey: "defaultHourlyCondition")
        } else {
            defaults.set("Precip (%)", forKey: "defaultHourlyCondition")
        }
        
        if (defaults.string(forKey: "defaultDailyCondition")?.contains("Precip") == true) {
            defaults.set("Precip (%)", forKey: "defaultDailyCondition")
        } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Humidity") == true) {
            defaults.set("Humidity (%)", forKey: "defaultDailyCondition")
        } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("UV index") == true) {
            defaults.set("UV index", forKey: "defaultDailyCondition")
        } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Wind") == true) {
            defaults.set("Wind (\(unitsWindSpeed))", forKey: "defaultDailyCondition")
        } else if (defaults.string(forKey: "defaultDailyCondition")?.contains("Cloud cover") == true) {
            defaults.set("Cloud cover (%)", forKey: "defaultDailyCondition")
        } else {
            defaults.set("Precip (%)", forKey: "defaultDailyCondition")
        }
        
        if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Current condition") == true) {
            defaults.set("Current condition", forKey: "defaultWidgetSlot1")
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Feels like") == true) {
            defaults.set("Feels like (°\(unitsTemperature))", forKey: "defaultWidgetSlot1")
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Precip") == true) {
            defaults.set("Precip (%)", forKey: "defaultWidgetSlot1")
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Humidity") == true) {
            defaults.set("Humidity (%)", forKey: "defaultWidgetSlot1")
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("UV index") == true) {
            defaults.set("UV index", forKey: "defaultWidgetSlot1")
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Wind") == true) {
            defaults.set("Wind (\(unitsWindSpeed))", forKey: "defaultWidgetSlot1")
        } else if (defaults.string(forKey: "defaultWidgetSlot1")?.contains("Cloud cover") == true) {
            defaults.set("Cloud cover (%)", forKey: "defaultWidgetSlot1")
        } else {
            defaults.set("Current condition", forKey: "defaultWidgetSlot1")
        }
        
        if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Current condition") == true) {
            defaults.set("Current condition", forKey: "defaultWidgetSlot2")
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Feels like") == true) {
            defaults.set("Feels like (°\(unitsTemperature))", forKey: "defaultWidgetSlot1")
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Precip") == true) {
            defaults.set("Precip (%)", forKey: "defaultWidgetSlot2")
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Humidity") == true) {
            defaults.set("Humidity (%)", forKey: "defaultWidgetSlot2")
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("UV index") == true) {
            defaults.set("UV index", forKey: "defaultWidgetSlot2")
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Wind") == true) {
            defaults.set("Wind (\(unitsWindSpeed))", forKey: "defaultWidgetSlot2")
        } else if (defaults.string(forKey: "defaultWidgetSlot2")?.contains("Cloud cover") == true) {
            defaults.set("Cloud cover (%)", forKey: "defaultWidgetSlot2")
        } else {
            defaults.set("Current condition", forKey: "defaultWidgetSlot2")
        }
        
        if (defaults.bool(forKey: "cumulusPro") == false) || (defaults.bool(forKey: "randomColorEnabled") == true) {
            let randomTheme = Int(arc4random_uniform(UInt32(13)))
            
            if randomTheme == 0 || randomTheme == 1 {
                defaults.set("Tuscan", forKey: "userSavedColorString")
            } else if randomTheme == 2 {
                defaults.set("Mandarin", forKey: "userSavedColorString")
            } else if randomTheme == 3 {
                defaults.set("Malachite", forKey: "userSavedColorString")
            } else if randomTheme == 4 {
                defaults.set("Maximum Red", forKey: "userSavedColorString")
            } else if randomTheme == 5 {
                defaults.set("Dodger Blue", forKey: "userSavedColorString")
            } else if randomTheme == 6 {
                defaults.set("Cotton Candy", forKey: "userSavedColorString")
            } else if randomTheme == 7 {
                defaults.set("Plump Purple", forKey: "userSavedColorString")
            } else if randomTheme == 8 {
                defaults.set("Sandstorm", forKey: "userSavedColorString")
            } else if randomTheme == 9 {
                defaults.set("Asteroid", forKey: "userSavedColorString")
            } else if randomTheme == 10 {
                defaults.set("Carmine Pink", forKey: "userSavedColorString")
            } else if randomTheme == 11 {
                defaults.set("Iguana Green", forKey: "userSavedColorString")
            } else if randomTheme == 12 {
                defaults.set("Dark Cerulean", forKey: "userSavedColorString")
            } else {
                defaults.set("Dodger Blue", forKey: "userSavedColorString")
            }
        }
        setButtonColor()
        
        // Google Places initialize
        GMSPlacesClient.provideAPIKey("AIzaSyD7itQU5T62p9XCRa9qXSXvqjTCB4f9nGI")
        
        // Complete transactions
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        // Deliver content from server, then:
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                // Unlock content
                case .failed, .purchasing, .deferred:
                    break // do nothing
                @unknown default:
                    print("Uknown error")
                }
            }
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

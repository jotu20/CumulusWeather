//
//  TodayViewController.swift
//  Cumulus Today
//
//  Created by Joseph Szafarowicz on 6/26/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import NotificationCenter
import CoreLocation

class TodayViewController: UIViewController, NCWidgetProviding, CLLocationManagerDelegate {
    
    @IBOutlet var widgetView: UIView!
    
    let locationManager = CLLocationManager()
    var updateResult = NCUpdateResult.noData
    
    // MARK: - General outlets
    @IBOutlet weak var timeStackView: UIStackView!
    @IBOutlet weak var currentConditionIcon: UIImageView!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var conditionSlot1Label: UILabel!
    @IBOutlet weak var conditionSlot2Label: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var highAndLowTemperatureLabel: UILabel!
    
    // MARK: - Hourly forecast outlets
    @IBOutlet weak var hour0Time: UILabel!
    @IBOutlet weak var hour1Time: UILabel!
    @IBOutlet weak var hour2Time: UILabel!
    @IBOutlet weak var hour3Time: UILabel!
    @IBOutlet weak var hour4Time: UILabel!
    @IBOutlet weak var hour5Time: UILabel!
    
    @IBOutlet weak var hour0Image: UIImageView!
    @IBOutlet weak var hour1Image: UIImageView!
    @IBOutlet weak var hour2Image: UIImageView!
    @IBOutlet weak var hour3Image: UIImageView!
    @IBOutlet weak var hour4Image: UIImageView!
    @IBOutlet weak var hour5Image: UIImageView!
    @IBOutlet weak var hour6Image: UIImageView!
    @IBOutlet weak var hour7Image: UIImageView!
    @IBOutlet weak var hour8Image: UIImageView!
    @IBOutlet weak var hour9Image: UIImageView!
    @IBOutlet weak var hour10Image: UIImageView!
    @IBOutlet weak var hour11Image: UIImageView!
    
    @IBOutlet weak var hour0Value: UILabel!
    @IBOutlet weak var hour1Value: UILabel!
    @IBOutlet weak var hour2Value: UILabel!
    @IBOutlet weak var hour3Value: UILabel!
    @IBOutlet weak var hour4Value: UILabel!
    @IBOutlet weak var hour5Value: UILabel!
    
    // MARK: - Daily forecast outlets
    // Day One
    @IBOutlet weak var dayOneDate: UILabel!
    @IBOutlet weak var dayOneCondition: UIImageView!
    @IBOutlet weak var dayOneHighLow: UILabel!
    @IBOutlet weak var dayOnePrecipLabel: UILabel!
    
    // Day Two
    @IBOutlet weak var dayTwoDate: UILabel!
    @IBOutlet weak var dayTwoCondition: UIImageView!
    @IBOutlet weak var dayTwoHighLow: UILabel!
    @IBOutlet weak var dayTwoPrecipLabel: UILabel!
    
    // Day Three
    @IBOutlet weak var dayThreeDate: UILabel!
    @IBOutlet weak var dayThreeCondition: UIImageView!
    @IBOutlet weak var dayThreeHighLow: UILabel!
    @IBOutlet weak var dayThreePrecipLabel: UILabel!
    
    // Day Four
    @IBOutlet weak var dayFourDate: UILabel!
    @IBOutlet weak var dayFourCondition: UIImageView!
    @IBOutlet weak var dayFourHighLow: UILabel!
    @IBOutlet weak var dayFourPrecipLabel: UILabel!
    
    // MARK: - Set labels
    func setWidgetSlot(setting: String, label: UILabel!) {
        if setting.contains("Current condition") {
            label.text = "\(weatherCondition(condition: currentCondition, type: "text"))"
            
            // Check if summaries are equal for the hour
            if currentSummary == hourSummary {
                currentSummary = "\(hourSummary.capitalizingFirstLetter()) for the hour."
            }
            
            // Check for current precipitation
            if minuteSummary.isEmpty == false && minuteSummary != "none" {
                // Check if there is current precipitation
                if precipitation >= 80 && precipitationType != "none" && endingMinuteSummary != "none" {
                    label.text = "\(precipitationType.capitalizingFirstLetter()) stops in \(endingMinuteSummary)."
                }
            }
        } else if setting.contains("Feels like") {
            label.text = "Feels like \(apparentTemperature)°"
        } else if setting.contains("Precip") {
            label.text = "Precipitation \(precipitation)%"
        } else if setting.contains("Humidity") {
            label.text = "Humidity \(humidity)"
        } else if setting.contains("UV index") {
            label.text = "UV index \(uvIndex)"
        } else if setting.contains("Wind") {
            if windGust == wind {
                label.text = "Wind \(wind) \(unitsWindSpeed) \(windDirectionString)"
            } else {
                label.text = "Wind \(wind)(\(windGust)) \(unitsWindSpeed) \(windDirectionString)"
            }
        } else if setting.contains("Cloud cover") {
            label.text = "Cloud cover \(cloudCover)%"
        }
    }
    
    func setWidgetLabels() {
        universalSettings()
        currentConditionIcon.image = UIImage(named: weatherCondition(condition: currentCondition, type: "image"))
        currentLocationLabel.text = "\(userCurrentLocation)"
        currentTemperatureLabel.text = "\(currentTemperature)°"
        highAndLowTemperatureLabel.text = "\(highTemperature)°/\(lowTemperature)°"
        setWidgetSlot(setting: universalDefaultWidgetSlot1, label: conditionSlot1Label)
        setWidgetSlot(setting: universalDefaultWidgetSlot2, label: conditionSlot2Label)
        
        // 12 Hour Forecast
        hour0Time.text = "Now"
        hour1Time.text = "\(hour3)"
        hour2Time.text = "\(hour6)"
        hour3Time.text = "\(hour10)"
        hour4Time.text = "\(hour13)"
        hour5Time.text = "\(hour15)"
        
        hour0Image.image = UIImage(named: weatherCondition(condition: conditionHour1, type: "widget"))
        hour1Image.image = UIImage(named: weatherCondition(condition: conditionHour2, type: "widget"))
        hour2Image.image = UIImage(named: weatherCondition(condition: conditionHour3, type: "widget"))
        hour3Image.image = UIImage(named: weatherCondition(condition: conditionHour4, type: "widget"))
        hour4Image.image = UIImage(named: weatherCondition(condition: conditionHour5, type: "widget"))
        hour5Image.image = UIImage(named: weatherCondition(condition: conditionHour6, type: "widget"))
        hour6Image.image = UIImage(named: weatherCondition(condition: conditionHour7, type: "widget"))
        hour7Image.image = UIImage(named: weatherCondition(condition: conditionHour8, type: "widget"))
        hour8Image.image = UIImage(named: weatherCondition(condition: conditionHour10, type: "widget"))
        hour9Image.image = UIImage(named: weatherCondition(condition: conditionHour11, type: "widget"))
        hour10Image.image = UIImage(named: weatherCondition(condition: conditionHour13, type: "widget"))
        hour11Image.image = UIImage(named: weatherCondition(condition: conditionHour15, type: "widget"))
        
        hour0Value.text = "\(tempHour0)°"
        hour1Value.text = "\(tempHour3)°"
        hour2Value.text = "\(tempHour6)°"
        hour3Value.text = "\(tempHour10)°"
        hour4Value.text = "\(tempHour13)°"
        hour5Value.text = "\(tempHour15)°"
        
        // Day One
        dayOneDate.text = "\(dayZeroDayString)"
        dayOneCondition.image = UIImage(named: weatherCondition(condition: weatherCondition0, type: "daily"))
        dayOneHighLow.text = "\(dayZeroHigh)°/\(dayZeroLow)°"
        dayOnePrecipLabel.text = "\(dayZeroPrecip)%"
        
        // Day Two
        dayTwoDate.text = "\(dayOneDayString)"
        dayTwoCondition.image = UIImage(named: weatherCondition(condition: weatherCondition1, type: "daily"))
        dayTwoHighLow.text = "\(dayOneHigh)°/\(dayOneLow)°"
        dayTwoPrecipLabel.text = "\(dayOnePrecip)%"
        
        // Day Three
        dayThreeDate.text = "\(dayTwoDayString)"
        dayThreeCondition.image = UIImage(named: weatherCondition(condition: weatherCondition2, type: "daily"))
        dayThreeHighLow.text = "\(dayTwoHigh)°/\(dayTwoLow)°"
        dayThreePrecipLabel.text = "\(dayTwoPrecip)%"
        
        // Day Four
        dayFourDate.text = "\(dayThreeDayString)"
        dayFourCondition.image = UIImage(named: weatherCondition(condition: weatherCondition3, type: "daily"))
        dayFourHighLow.text = "\(dayThreeHigh)°/\(dayThreeLow)°"
        dayFourPrecipLabel.text = "\(dayThreePrecip)%"
    }
    
    @IBAction func openApplicationTapped(_ sender: UITapGestureRecognizer) {
        let url: NSURL = NSURL(string: "CumulusWeather://")!
        self.extensionContext?.open(url as URL, completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.distanceFilter = 100
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        setWidgetLabels()
        completionHandler(updateResult)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if (activeDisplayMode == NCWidgetDisplayMode.compact) {
            self.preferredContentSize = maxSize
            timeStackView.isHidden = true
        } else {
            //expanded
            self.preferredContentSize = CGSize(width: 0, height: 300)
            timeStackView.isHidden = false
        }
    }
    
    // MARK: - Get location and weather data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        universalSettings()
        geocode(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!) { placemark, error in
            guard let placemark = placemark, error == nil else { return }
            
            latitudeValue = (self.locationManager.location?.coordinate.latitude)!
            longitudeValue = (self.locationManager.location?.coordinate.longitude)!
            
            // Set state for locations in the US
            if placemark.country! == "United States" {
                self.navigationController?.navigationBar.topItem?.title = "\(placemark.locality!), \(placemark.administrativeArea!)"
                userCurrentLocation = "\(placemark.locality!), \(placemark.administrativeArea!)"
            } else {
                self.navigationController?.navigationBar.topItem?.title = "\(placemark.locality!), \(placemark.country!)"
                userCurrentLocation = "\(placemark.locality!), \(placemark.country!)"
            }
        }
        fetchDarkSkyWeatherData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setWidgetLabels()
            self.updateResult = .newData
        }
    }
    
    // MARK: - Show error when location cannot be found
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        universalSettings()
        geocode(latitude: universalLatitude, longitude: universalLongitude) { placemark, error in
            guard let placemark = placemark, error == nil else { return }
            
            latitudeValue = universalLatitude
            longitudeValue = universalLongitude
            
            // Set state for locations in the US
            if placemark.country! == "United States" {
                self.navigationController?.navigationBar.topItem?.title = "\(placemark.locality!), \(placemark.administrativeArea!)"
                userCurrentLocation = "\(placemark.locality!), \(placemark.administrativeArea!)"
            } else {
                self.navigationController?.navigationBar.topItem?.title = "\(placemark.locality!), \(placemark.country!)"
                userCurrentLocation = "\(placemark.locality!), \(placemark.country!)"
            }
        }
        fetchDarkSkyWeatherData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setWidgetLabels()
            self.updateResult = .newData
        }
    }
}

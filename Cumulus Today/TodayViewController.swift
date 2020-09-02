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
    @IBOutlet weak var currentConditionLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var accumulationLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    
    @IBOutlet weak var currentConditionsTopConstraint: NSLayoutConstraint!
    
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
    @IBOutlet weak var day0Label: UILabel!
    @IBOutlet weak var day0ConditionImage: UIImageView!
    @IBOutlet weak var day0HighLabel: UILabel!
    @IBOutlet weak var day0LowLabel: UILabel!
    
    // Day Two
    @IBOutlet weak var day1Label: UILabel!
    @IBOutlet weak var day1ConditionImage: UIImageView!
    @IBOutlet weak var day1HighLabel: UILabel!
    @IBOutlet weak var day1LowLabel: UILabel!
    
    // Day Three
    @IBOutlet weak var day2Label: UILabel!
    @IBOutlet weak var day2ConditionImage: UIImageView!
    @IBOutlet weak var day2HighLabel: UILabel!
    @IBOutlet weak var day2LowLabel: UILabel!
    
    // Day Four
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var day3ConditionImage: UIImageView!
    @IBOutlet weak var day3HighLabel: UILabel!
    @IBOutlet weak var day3LowLabel: UILabel!
    
    func setWidgetLabels() {
        universalSettings()
        // Check if summaries are equal for the hour
        if currentSummary == hourSummary {
            currentSummary = "\(hourSummary.capitalizingFirstLetter()) for the hour."
        }
        
        currentTemperatureLabel.text = "\(currentTemperature)°"
        currentConditionLabel.text = "\(currentSummary.capitalizingFirstLetter())"
        currentConditionIcon.image = UIImage(named: weatherCondition(condition: currentCondition, type: "image", circle: universalIcons))
        
        // Check for current precipitation
        if minuteSummary.isEmpty == false && minuteSummary != "none" {
            // Check if there is current precipitation
            if precipitation >= 80 && precipitationType != "none" && endingMinuteSummary != "none" {
                currentConditionLabel.text = "\(precipitationType.capitalizingFirstLetter()) stops in \(endingMinuteSummary)."
            }
        }
        
        precipitationLabel.text = "Precip. \(precipitation)%"
        accumulationLabel.text = "Accum. \(precipAccumulation)\(unitsPrecipitation)%"
        humidityLabel.text = "Humidity \(humidity)%"
        
        // Set uv index
        if uvIndex < 2 {
            uvIndexLabel.text = "UV index low (\(uvIndex))"
        } else if uvIndex >= 3 && uvIndex <= 5 {
            uvIndexLabel.text = "UV index moderate (\(uvIndex))"
        } else if uvIndex >= 6 && uvIndex <= 7 {
            uvIndexLabel.text = "UV index high (\(uvIndex))"
        } else if uvIndex >= 8 && uvIndex <= 10 {
            uvIndexLabel.text = "UV index very high (\(uvIndex))"
        } else if uvIndex >= 11 {
            uvIndexLabel.text = "UV index extreme (\(uvIndex))"
        }

        // Set wind
        if windGust == wind {
            windLabel.text = "Wind \(wind)\(unitsWindSpeed) \(windDirectionString)"
        } else {
            windLabel.text = "Wind \(wind)(\(windGust))\(unitsWindSpeed) \(windDirectionString)"
        }
        
        // Set cloud cover
        if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
            cloudCoverLabel.text = "Clouds \(cloudCover)% & decr."
        } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
            cloudCoverLabel.text = "Clouds \(cloudCover)% & incr."
        } else {
            cloudCoverLabel.text = "Clouds \(cloudCover)%"
        }
        
        // 12 Hour Forecast
        hour0Time.text = "Now"
        hour1Time.text = "\(hour3)"
        hour2Time.text = "\(hour6)"
        hour3Time.text = "\(hour10)"
        hour4Time.text = "\(hour13)"
        hour5Time.text = "\(hour15)"
        
        hour0Image.image = UIImage(named: weatherCondition(condition: conditionHour1, type: "widget", circle: universalIcons))
        hour1Image.image = UIImage(named: weatherCondition(condition: conditionHour2, type: "widget", circle: universalIcons))
        hour2Image.image = UIImage(named: weatherCondition(condition: conditionHour3, type: "widget", circle: universalIcons))
        hour3Image.image = UIImage(named: weatherCondition(condition: conditionHour4, type: "widget", circle: universalIcons))
        hour4Image.image = UIImage(named: weatherCondition(condition: conditionHour5, type: "widget", circle: universalIcons))
        hour5Image.image = UIImage(named: weatherCondition(condition: conditionHour6, type: "widget", circle: universalIcons))
        hour6Image.image = UIImage(named: weatherCondition(condition: conditionHour7, type: "widget", circle: universalIcons))
        hour7Image.image = UIImage(named: weatherCondition(condition: conditionHour8, type: "widget", circle: universalIcons))
        hour8Image.image = UIImage(named: weatherCondition(condition: conditionHour10, type: "widget", circle: universalIcons))
        hour9Image.image = UIImage(named: weatherCondition(condition: conditionHour11, type: "widget", circle: universalIcons))
        hour10Image.image = UIImage(named: weatherCondition(condition: conditionHour13, type: "widget", circle: universalIcons))
        hour11Image.image = UIImage(named: weatherCondition(condition: conditionHour15, type: "widget", circle: universalIcons))
        
        hour0Value.text = "\(tempHour0)°"
        hour1Value.text = "\(tempHour3)°"
        hour2Value.text = "\(tempHour6)°"
        hour3Value.text = "\(tempHour10)°"
        hour4Value.text = "\(tempHour13)°"
        hour5Value.text = "\(tempHour15)°"
        
        // Day Zero
        day0Label.text = "\(day0DayString.capitalizingFirstLetter())"
        day0ConditionImage.image = UIImage(named: weatherCondition(condition: day0Condition, type: "daily", circle: universalIcons))
        day0HighLabel.text = "\(day0High)°"
        day0LowLabel.text = "\(day0Low)°"
        
        // Day One
        day1Label.text = "\(day1DayString.capitalizingFirstLetter())"
        day1ConditionImage.image = UIImage(named: weatherCondition(condition: day1Condition, type: "daily", circle: universalIcons))
        day1HighLabel.text = "\(day1High)°"
        day1LowLabel.text = "\(day1Low)°"
        
        // Day Two
        day2Label.text = "\(day2DayString.capitalizingFirstLetter())"
        day2ConditionImage.image = UIImage(named: weatherCondition(condition: day2Condition, type: "daily", circle: universalIcons))
        day2HighLabel.text = "\(day2High)°"
        day2LowLabel.text = "\(day2Low)°"
        
        // Day Three
        day3Label.text = "\(day3DayString.capitalizingFirstLetter())"
        day3ConditionImage.image = UIImage(named: weatherCondition(condition: day3Condition, type: "daily", circle: universalIcons))
        day3HighLabel.text = "\(day3High)°"
        day3LowLabel.text = "\(day3Low)°"
    }
    
    @IBAction func openApplicationTapped(_ sender: UITapGestureRecognizer) {
        let url: NSURL = NSURL(string: "CumulusWeather://")!
        self.extensionContext?.open(url as URL, completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.distanceFilter = 100
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        setWidgetLabels()
        completionHandler(updateResult)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if (activeDisplayMode == NCWidgetDisplayMode.compact) {
            self.preferredContentSize = maxSize
            timeStackView.isHidden = true
            self.currentConditionsTopConstraint.constant = 50
        } else {
            //expanded
            self.preferredContentSize = CGSize(width: 0, height: 380)
            timeStackView.isHidden = false
            self.currentConditionsTopConstraint.constant = 25
        }
    }
    
    // MARK: - Get location and weather data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        universalSettings()
        
        latitudeValue = (manager.location?.coordinate.latitude)!
        longitudeValue = (manager.location?.coordinate.longitude)!
        fetchDarkSkyWeatherData()
        
        geocode(latitude: latitudeValue, longitude: longitudeValue) { placemark, error in
            guard let placemark = placemark, error == nil else { return }
            
            // Set state/province for respective locations
            if placemark.locality != nil && placemark.administrativeArea != nil && placemark.country != nil {
                if placemark.country! == "Micronesia" || placemark.country! == "Myanmar" || placemark.country! == "United States" {
                    currentLocation = "\(placemark.locality!), \(placemark.administrativeArea!)"
                } else if placemark.country! == "Japan" {
                    currentLocation = "\(placemark.administrativeArea!), \(placemark.country!)"
                 } else {
                   currentLocation = "\(placemark.locality!), \(placemark.country!)"
                }
            } else {
                currentLocation = "\(placemark.name!), \(placemark.country!)"
            }
            self.currentLocationLabel.text = "\(currentLocation)"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.setWidgetLabels()
                self.updateResult = .newData
            }
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
            fetchDarkSkyWeatherData()
            
            // Set state/province for respective locations
            if placemark.locality != nil && placemark.administrativeArea != nil && placemark.country != nil {
                if placemark.country! == "Micronesia" || placemark.country! == "Myanmar" || placemark.country! == "United States" {
                    currentLocation = "\(placemark.locality!), \(placemark.administrativeArea!)"
                } else if placemark.country! == "Japan" {
                    currentLocation = "\(placemark.administrativeArea!), \(placemark.country!)"
                 } else {
                   currentLocation = "\(placemark.locality!), \(placemark.country!)"
                }
            } else {
                currentLocation = "\(placemark.name!), \(placemark.country!)"
            }
            self.currentLocationLabel.text = "\(currentLocation)"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.setWidgetLabels()
                self.updateResult = .newData
            }
        }
    }
}

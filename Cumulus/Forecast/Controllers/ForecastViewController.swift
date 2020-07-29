//
//  ViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 6/20/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces
import SafariServices
import Intents
import StoreKit
import ForecastIO

class ForecastViewController: UIViewController, UITabBarControllerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var homeView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let locationManager = CLLocationManager()
    var refreshControl: UIRefreshControl!
    
    // MARK: - Current conditions outlets
    @IBOutlet weak var currentConditionView: UIView!
    
    @IBOutlet weak var currentLocationIcon: UIImageView!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    @IBOutlet weak var weatherAlertIcon: UIImageView!
    @IBOutlet weak var weatherAlertLabel: UILabel!
    @IBOutlet weak var weatherAlertStackView: UIStackView!
    
    @IBOutlet weak var currentConditionIcon: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentConditonLabel: UILabel!
    
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var accumulationLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var windIcon: UIImageView!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    // MARK: - Hourly outlets
    @IBOutlet weak var hourlyLabel: UILabel!
    
    @IBOutlet weak var hour0View: UIView!
    @IBOutlet weak var hour0TimeLabel: UILabel!
    @IBOutlet weak var hour0ConditionIcon: UIImageView!
    @IBOutlet weak var hour0ConditionLabel: UILabel!
    
    @IBOutlet weak var hour1View: UIView!
    @IBOutlet weak var hour1TimeLabel: UILabel!
    @IBOutlet weak var hour1ConditionIcon: UIImageView!
    @IBOutlet weak var hour1ConditionLabel: UILabel!
    
    @IBOutlet weak var hour2View: UIView!
    @IBOutlet weak var hour2TimeLabel: UILabel!
    @IBOutlet weak var hour2ConditionIcon: UIImageView!
    @IBOutlet weak var hour2ConditionLabel: UILabel!
    
    @IBOutlet weak var hour3View: UIView!
    @IBOutlet weak var hour3TimeLabel: UILabel!
    @IBOutlet weak var hour3ConditionIcon: UIImageView!
    @IBOutlet weak var hour3ConditionLabel: UILabel!

    // MARK: - Daily outlets
    @IBOutlet weak var dailyLabel: UILabel!
    
    @IBOutlet weak var day0View: UIView!
    @IBOutlet weak var day0Label: UILabel!
    @IBOutlet weak var day0ConditionIcon: UIImageView!
    @IBOutlet weak var day0ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day0ConditionLabel: UILabel!
    @IBOutlet weak var day0LowLabel: UILabel!
    @IBOutlet weak var day0HighLabel: UILabel!
    
    @IBOutlet weak var day1View: UIView!
    @IBOutlet weak var day1Label: UILabel!
    @IBOutlet weak var day1ConditionIcon: UIImageView!
    @IBOutlet weak var day1ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day1ConditionLabel: UILabel!
    @IBOutlet weak var day1LowLabel: UILabel!
    @IBOutlet weak var day1HighLabel: UILabel!
    
    @IBOutlet weak var day2View: UIView!
    @IBOutlet weak var day2Label: UILabel!
    @IBOutlet weak var day2ConditionIcon: UIImageView!
    @IBOutlet weak var day2ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day2ConditionLabel: UILabel!
    @IBOutlet weak var day2LowLabel: UILabel!
    @IBOutlet weak var day2HighLabel: UILabel!
    
    @IBOutlet weak var day3View: UIView!
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var day3ConditionIcon: UIImageView!
    @IBOutlet weak var day3ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day3ConditionLabel: UILabel!
    @IBOutlet weak var day3LowLabel: UILabel!
    @IBOutlet weak var day3HighLabel: UILabel!
    
    @IBOutlet weak var day4View: UIView!
    @IBOutlet weak var day4Label: UILabel!
    @IBOutlet weak var day4ConditionIcon: UIImageView!
    @IBOutlet weak var day4ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day4ConditionLabel: UILabel!
    @IBOutlet weak var day4LowLabel: UILabel!
    @IBOutlet weak var day4HighLabel: UILabel!
    
    @IBOutlet weak var day5View: UIView!
    @IBOutlet weak var day5Label: UILabel!
    @IBOutlet weak var day5ConditionIcon: UIImageView!
    @IBOutlet weak var day5ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day5ConditionLabel: UILabel!
    @IBOutlet weak var day5LowLabel: UILabel!
    @IBOutlet weak var day5HighLabel: UILabel!
    
    @IBOutlet weak var day6View: UIView!
    @IBOutlet weak var day6Label: UILabel!
    @IBOutlet weak var day6ConditionIcon: UIImageView!
    @IBOutlet weak var day6ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day6ConditionLabel: UILabel!
    @IBOutlet weak var day6LowLabel: UILabel!
    @IBOutlet weak var day6HighLabel: UILabel!
    
    @IBOutlet weak var day7View: UIView!
    @IBOutlet weak var day7Label: UILabel!
    @IBOutlet weak var day7ConditionIcon: UIImageView!
    @IBOutlet weak var day7ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day7ConditionLabel: UILabel!
    @IBOutlet weak var day7LowLabel: UILabel!
    @IBOutlet weak var day7HighLabel: UILabel!
    
    @IBOutlet weak var day8View: UIView!
    @IBOutlet weak var day8Label: UILabel!
    @IBOutlet weak var day8ConditionIcon: UIImageView!
    @IBOutlet weak var day8ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day8ConditionLabel: UILabel!
    @IBOutlet weak var day8LowLabel: UILabel!
    @IBOutlet weak var day8HighLabel: UILabel!
    
    @IBOutlet weak var day9View: UIView!
    @IBOutlet weak var day9Label: UILabel!
    @IBOutlet weak var day9ConditionIcon: UIImageView!
    @IBOutlet weak var day9ConditionTypeIcon: UIImageView!
    @IBOutlet weak var day9ConditionLabel: UILabel!
    @IBOutlet weak var day9LowLabel: UILabel!
    @IBOutlet weak var day9HighLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.setupGrantedLocationServices()
        
        currentConditionView.layer.cornerRadius = 10
        
        hour0View.layer.cornerRadius = 10
        hour1View.layer.cornerRadius = 10
        hour2View.layer.cornerRadius = 10
        hour3View.layer.cornerRadius = 10
        
        day0View.layer.cornerRadius = 10
        day1View.layer.cornerRadius = 10
        day2View.layer.cornerRadius = 10
        day3View.layer.cornerRadius = 10
        day4View.layer.cornerRadius = 10
        day5View.layer.cornerRadius = 10
        day6View.layer.cornerRadius = 10
        day7View.layer.cornerRadius = 10
        day8View.layer.cornerRadius = 10
        day9View.layer.cornerRadius = 10

        // If user has viewed 10 times request review
        defaults.set((defaults.integer(forKey: "userViewedCounter") + 1), forKey: "userViewedCounter")
        if defaults.integer(forKey: "userViewedCounter") == 10 {
            SKStoreReviewController.requestReview()
        }
        
        // Check for loaded weather, distance change, or color theme change
        if weatherLoaded == false || distanceChange == true || dataSourceChanged == true || userChangedColorTheme == true {
            self.loadingScreen()
        }

        // Check for units or clock change
        if unitsChanged == true || clockChanged == true {
            self.loadingScreen()
            unitsChanged = false
            clockChanged = false
        }

        // Setup for pull to refresh
        self.scrollView.alwaysBounceVertical = true
        self.scrollView.bounces  = true
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(self.didPullToRefresh), for: .valueChanged)
        self.scrollView.addSubview(self.refreshControl)
    }
    
    // MARK: - Get location and weather data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if userSelectedSavedLocation == true {
            let address = "\(selectedLocation)"
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address) { (placemark, error) in
                guard
                    let placemark = placemark,
                    let location = placemark.first?.location
                    else {
                        // handle no location found
                        return
                }

                latitudeValue = location.coordinate.latitude
                longitudeValue = location.coordinate.longitude
                
                geocode(latitude: latitudeValue, longitude: longitudeValue) { placemark, error in
                    guard let placemark = placemark, error == nil else { return }
                    
                    currentLocation = "\(placemark.locality!)"
                    self.setupInitialData()
                }
            }
        } else {
            geocode(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!) { placemark, error in
                guard let placemark = placemark, error == nil else { return }

                latitudeValue = (manager.location?.coordinate.latitude)!
                longitudeValue = (manager.location?.coordinate.longitude)!
                
                currentLocation = "\(placemark.locality!)"
                self.setupInitialData()
            }
        }
    }
    
    // MARK: - Respond to authorization status
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
            print("Authorization: No Access")
        }
        
        if status == .restricted || status == .denied {
            print("Authorization: Restricted Access")
            setupDeniedLocation()
        }
        
        if status == .authorizedWhenInUse {
            print("Authorization: Access")
            setupGrantedLocationServices()
        }
    }
    
    // MARK: - Show error when location cannot be found
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        setupDeniedLocation()
    }

    // MARK: - Fetch user location if granted location access
    func setupGrantedLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            if userSelectedSavedLocation == false {
                defaults.set(false, forKey: "userDeniedLocation")
                locationManager.distanceFilter = 100
            }
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        setupInitialLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            if currentSummary.isEmpty == false {
                self.locationManager.stopUpdatingLocation()
            }
        }
    } 
    
    // MARK: - Fetch user location if denied location access
    func setupDeniedLocation() {
        placesClient = GMSPlacesClient.shared()
        defaults.set(true, forKey: "userDeniedLocation")
        
        if userSelectedSavedLocation == true && (defaults.bool(forKey: "userDeniedLocation") == true) {
            let address = "\(defaults.string(forKey: "selectedLocation") ?? "New York, NY")"
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        // handle no location found
                        return
                }

                latitudeValue = location.coordinate.latitude
                longitudeValue = location.coordinate.longitude
                
                UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(latitudeValue, forKey: "setWidgetLatitude")
                UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(longitudeValue, forKey: "setWidgetLongitude")
                self.navigationController?.navigationBar.topItem?.title = "\(defaults.string(forKey: "selectedLocation") ?? "New York, NY")"
                self.setupInitialData()
            }
            setWeatherDataLabels()
        } else {
            showLocationDisabledPopUp()
        }
    }
    
    // MARK: - Setup loading screen view
    func loadingScreen() {
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight >= 812 {
            loadFrame = CGRect(x: 0, y: 0, width: 2000, height: 2000)
        } else {
            loadFrame = CGRect(x: 0, y: 0, width: 815, height: 815)
        }

        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.startAnimating()

        let backgroundColor = UIColor.systemBackground
        loadingView.backgroundColor = backgroundColor
        loadingView.alpha = 1.0
        loadingView.addSubview(activityIndicator)
        self.navigationController?.view.addSubview(loadingView)
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                case .notDetermined:
                    print("No access")
                case .restricted, .denied:
                    print("Restricted access")
                    setupDeniedLocation()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        loadingView.removeFromSuperview()
                        self.setupInitialLoad()
                        self.setWeatherDataLabels()
                    }
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                    setupGrantedLocationServices()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        loadingView.removeFromSuperview()
                        self.setupInitialLoad()
                        self.setWeatherDataLabels()
                    }
                @unknown default:
                break
            }
        }
    }

    // MARK: - Show popup for disabled location
    func showLocationDisabledPopUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Locations")
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Refresh data and labels
    @objc func didPullToRefresh() {
        setupInitialData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setWeatherDataLabels()
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Load all UI values for images and labels
    func setupInitialLoad() {
        setWeatherDataLabels()
        setColorTheme()
    }
    
    // MARK: Load weather data
    func setupInitialData() {
        fetchDarkSkyWeatherData()
        setWeatherDataLabels()
    }
    
    // MARK: - Set the user set theme
    func setColorTheme() {
        let color: UIColor?
        
        if defaults.string(forKey: "userSavedColorString") == "Mango" {
            color = mango
        } else if defaults.string(forKey: "userSavedColorString") == "Maximum Red" {
            color = maximumRed
        } else if defaults.string(forKey: "userSavedColorString") == "Dodger Blue" {
            color = dodgerBlue
        } else if defaults.string(forKey: "userSavedColorString") == "Plump Purple" {
            color = plumpPurple
        } else if defaults.string(forKey: "userSavedColorString") == "Spring Green" {
            color = springGreen
        } else {
            color = dodgerBlue
        }
        
        self.tabBarController?.tabBar.tintColor = color
        currentLocationIcon.tintColor = color
        currentConditonLabel.textColor = color
        day0Label.textColor = color
        day1Label.textColor = color
        day2Label.textColor = color
        day3Label.textColor = color
        day4Label.textColor = color
        day5Label.textColor = color
        day6Label.textColor = color
        day7Label.textColor = color
        day8Label.textColor = color
        day9Label.textColor = color
    }
    
    // MARK: - Set hourly outlets
    func setHourLabelAndIcons(hourTimeLabel: UILabel!, hourConditionIcon: UIImageView!, hourCondtionLabel: UILabel!, hourTimeString: String, hourIconString: String, hourConditionString: String) {
        
        hourTimeLabel.text = "\(hourTimeString)"
        hourConditionIcon.image = UIImage(named: weatherCondition(condition: hourIconString, type: "image"))
        hourCondtionLabel.text = "\(hourConditionString)"
    }

    // MARK: - Set daily outlets
    func setDayLabelAndIcons(dayLabel: UILabel!, dayConditionIcon: UIImageView!, dayConditionTypeIcon: UIImageView!, dayConditionLabel: UILabel!, dayLowLabel: UILabel!, dayHighLabel: UILabel!, dayString: String, dateString: String, dayConditionIconString: String, dayConditionTypeIconString: String, dayConditionValue: Int, dayLow: Int, dayHigh: Int) {
        
        dayLabel.text = "\(dayString) \(dateString)"
        dayConditionIcon.image = UIImage(named: weatherCondition(condition: dayConditionIconString, type: "daily"))
        dayConditionTypeIcon.image = UIImage(named: "Precipitation icon.pdf")
        dayConditionLabel.text = "\(dayConditionValue)%"
        dayLowLabel.text = "\(dayLow)°"
        dayHighLabel.text = "\(dayHigh)°"
    }
    
    func setHourlyOutlets(type: String) {
        hourlyLabel.text = "Hourly: \(type)"
        
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""
        
        if type == "Precip" {
            hour0Value = "\(precipHour0)%"
            hour1Value = "\(precipHour1)%"
            hour2Value = "\(precipHour2)%"
            hour3Value = "\(precipHour3)%"
        } else if type == "Temp" {
            hour0Value = "\(tempHour0)%"
            hour1Value = "\(tempHour1)%"
            hour2Value = "\(tempHour2)%"
            hour3Value = "\(tempHour3)%"
        } else if type == "Humidity" {
            hour0Value = "\(humidityHour0)%"
            hour1Value = "\(humidityHour1)%"
            hour2Value = "\(humidityHour2)%"
            hour3Value = "\(humidityHour3)%"
        } else if type == "Index" {
            hour0Value = "\(uvindexHour0)%"
            hour1Value = "\(uvindexHour1)%"
            hour2Value = "\(uvindexHour2)%"
            hour3Value = "\(uvindexHour3)%"
        } else if type == "Wind" {
            hour0Value = "\(windSpeedHour0)\(unitsWindSpeed)"
            hour1Value = "\(windSpeedHour1)\(unitsWindSpeed)"
            hour2Value = "\(windSpeedHour2)\(unitsWindSpeed)"
            hour3Value = "\(windSpeedHour3)\(unitsWindSpeed)"
        } else if type == "Cloud" {
            hour0Value = "\(cloudCoverHour0)%"
            hour1Value = "\(cloudCoverHour1)%"
            hour2Value = "\(cloudCoverHour2)%"
            hour3Value = "\(cloudCoverHour3)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: hour0, hourIconString: conditionHour0, hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: hour1, hourIconString: conditionHour1, hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: hour2, hourIconString: conditionHour2, hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: hour3, hourIconString: conditionHour3, hourConditionString: hour3Value)
    }
    
    func setDailyOutlets(type: String) {
        var day0Value: Int = 0
        var day1Value: Int = 0
        var day2Value: Int = 0
        var day3Value: Int = 0
        var day4Value: Int = 0
        var day5Value: Int = 0
        var day6Value: Int = 0
        var day7Value: Int = 0
        var day8Value: Int = 0
        var day9Value: Int = 0
        
        if type == "Precip" {
            day0Value = dayZeroPrecip
            day1Value = dayOnePrecip
            day2Value = dayTwoPrecip
            day3Value = dayThreePrecip
            day4Value = dayFourPrecip
            day5Value = dayFivePrecip
            day6Value = daySixPrecip
            day7Value = daySevenPrecip
            day8Value = dayEightPrecip
            day9Value = dayNinePrecip
        } else if type == "Temp" {
        } else if type == "Humidity" {
        } else if type == "Wind" {
        } else if type == "Cloud" {
        }
        
        setDayLabelAndIcons(dayLabel: day0Label, dayConditionIcon: day0ConditionIcon, dayConditionTypeIcon: day0ConditionTypeIcon, dayConditionLabel: day0ConditionLabel, dayLowLabel: day0LowLabel, dayHighLabel: day0HighLabel, dayString: dayZeroDayString, dateString: dayZeroDateString, dayConditionIconString: weatherCondition0, dayConditionTypeIconString: dayZeroConditionString, dayConditionValue: day0Value, dayLow: dayZeroLow, dayHigh: dayZeroHigh)
        
        setDayLabelAndIcons(dayLabel: day1Label, dayConditionIcon: day1ConditionIcon, dayConditionTypeIcon: day1ConditionTypeIcon, dayConditionLabel: day1ConditionLabel, dayLowLabel: day1LowLabel, dayHighLabel: day1HighLabel, dayString: dayOneDayString, dateString: dayOneDateString, dayConditionIconString: weatherCondition1, dayConditionTypeIconString: dayOneConditionString, dayConditionValue: day1Value, dayLow: dayOneLow, dayHigh: dayOneHigh)
        
        setDayLabelAndIcons(dayLabel: day2Label, dayConditionIcon: day2ConditionIcon, dayConditionTypeIcon: day2ConditionTypeIcon, dayConditionLabel: day2ConditionLabel, dayLowLabel: day2LowLabel, dayHighLabel: day2HighLabel, dayString: dayTwoDayString, dateString: dayTwoDateString, dayConditionIconString: weatherCondition2, dayConditionTypeIconString: dayTwoConditionString, dayConditionValue: day2Value, dayLow: dayTwoLow, dayHigh: dayTwoHigh)
        
        setDayLabelAndIcons(dayLabel: day3Label, dayConditionIcon: day3ConditionIcon, dayConditionTypeIcon: day3ConditionTypeIcon, dayConditionLabel: day3ConditionLabel, dayLowLabel: day3LowLabel, dayHighLabel: day3HighLabel, dayString: dayThreeDayString, dateString: dayThreeDateString, dayConditionIconString: weatherCondition3, dayConditionTypeIconString: dayThreeConditionString, dayConditionValue: day3Value, dayLow: dayThreeLow, dayHigh: dayThreeHigh)
        
        setDayLabelAndIcons(dayLabel: day4Label, dayConditionIcon: day4ConditionIcon, dayConditionTypeIcon: day4ConditionTypeIcon, dayConditionLabel: day4ConditionLabel, dayLowLabel: day4LowLabel, dayHighLabel: day4HighLabel, dayString: dayFourDayString, dateString: dayFourDateString, dayConditionIconString: weatherCondition4, dayConditionTypeIconString: dayFourConditionString, dayConditionValue: day4Value, dayLow: dayFourLow, dayHigh: dayFourHigh)
        
        setDayLabelAndIcons(dayLabel: day5Label, dayConditionIcon: day5ConditionIcon, dayConditionTypeIcon: day5ConditionTypeIcon, dayConditionLabel: day5ConditionLabel, dayLowLabel: day5LowLabel, dayHighLabel: day5HighLabel, dayString: dayFiveDayString, dateString: dayFiveDateString, dayConditionIconString: weatherCondition5, dayConditionTypeIconString: dayFiveConditionString, dayConditionValue: day5Value, dayLow: dayFiveLow, dayHigh: dayFiveHigh)
        
        setDayLabelAndIcons(dayLabel: day6Label, dayConditionIcon: day6ConditionIcon, dayConditionTypeIcon: day6ConditionTypeIcon, dayConditionLabel: day6ConditionLabel, dayLowLabel: day6LowLabel, dayHighLabel: day6HighLabel, dayString: daySixDayString, dateString: daySixDateString, dayConditionIconString: weatherCondition6, dayConditionTypeIconString: daySixConditionString, dayConditionValue: day6Value, dayLow: daySixLow, dayHigh: daySixHigh)
        
        setDayLabelAndIcons(dayLabel: day7Label, dayConditionIcon: day7ConditionIcon, dayConditionTypeIcon: day7ConditionTypeIcon, dayConditionLabel: day7ConditionLabel, dayLowLabel: day7LowLabel, dayHighLabel: day7HighLabel, dayString: daySevenDayString, dateString: daySevenDateString, dayConditionIconString: weatherCondition7, dayConditionTypeIconString: daySevenConditionString, dayConditionValue: day7Value, dayLow: daySevenLow, dayHigh: daySevenHigh)
        
        setDayLabelAndIcons(dayLabel: day8Label, dayConditionIcon: day8ConditionIcon, dayConditionTypeIcon: day8ConditionTypeIcon, dayConditionLabel: day8ConditionLabel, dayLowLabel: day8LowLabel, dayHighLabel: day8HighLabel, dayString: dayEightDayString, dateString: dayEightDateString, dayConditionIconString: weatherCondition8, dayConditionTypeIconString: dayEightConditionString, dayConditionValue: day8Value, dayLow: dayEightLow, dayHigh: dayEightHigh)
        
        setDayLabelAndIcons(dayLabel: day9Label, dayConditionIcon: day9ConditionIcon, dayConditionTypeIcon: day9ConditionTypeIcon, dayConditionLabel: day9ConditionLabel, dayLowLabel: day9LowLabel, dayHighLabel: day9HighLabel, dayString: dayNineDayString, dateString: dayNineDateString, dayConditionIconString: weatherCondition9, dayConditionTypeIconString: dayNineConditionString, dayConditionValue: day9Value, dayLow: dayNineLow, dayHigh: dayNineHigh)
    }
    
    // MARK: - Action to open weather alerts
    @IBAction func weatherAlertsButtonTapped(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: alertURI)!)
        present(svc, animated: true, completion: nil)
    }
    
    // MARK: - Set current condition labels
    func setCurrentConditionOutlets() {
        // Check for current precipitation
        if minuteSummary.isEmpty == false && minuteSummary != "none" {
            // Check if there is current precipitation
            if precipitation >= 80 && precipitationType != "none" && endingMinuteSummary != "none" {
                currentConditonLabel.text = "\(precipitationType.capitalizingFirstLetter()) stops in \(endingMinuteSummary)."
            }
        }
        
        // Set uv index
        if uvIndex < 2 {
            uvIndexLabel.text = "Low (\(uvIndex))"
        } else if uvIndex >= 3 && uvIndex <= 5 {
            uvIndexLabel.text = "Moderate (\(uvIndex))"
        } else if uvIndex >= 6 && uvIndex <= 7 {
            uvIndexLabel.text = "High (\(uvIndex))"
        } else if uvIndex >= 8 && uvIndex <= 10 {
            uvIndexLabel.text = "Very high (\(uvIndex))"
        } else if uvIndex >= 11 {
            uvIndexLabel.text = "Extreme (\(uvIndex))"
        }
        
        precipitationLabel.text = "\(precipitation)%"
        accumulationLabel.text = "\(precipAccumulation)\(unitsPrecipitation)"
        humidityLabel.text = "\(humidity)%"
        sunriseLabel.text = "\(sunrise)"
        sunsetLabel.text = "\(sunset)"
        
        // Set wind image and label
        windLabel.text = "\(wind)(\(windGust))\(unitsWindSpeed) \(windDirectionString)"
        if windDirectionString.contains("N") {
            windIcon.image = UIImage(named: "Wind N.pdf")
        }
        if windDirectionString.contains("NE") {
            windIcon.image = UIImage(named: "Wind NE.pdf")
        }
        if windDirectionString.contains("E") {
            windIcon.image = UIImage(named: "Wind E.pdf")
        }
        if windDirectionString.contains("SE") {
            windIcon.image = UIImage(named: "Wind SE.pdf")
        }
        if windDirectionString.contains("S") {
            windIcon.image = UIImage(named: "Wind S.pdf")
        }
        if windDirectionString.contains("SW") {
            windIcon.image = UIImage(named: "Wind SW.pdf")
        }
        if windDirectionString.contains("W") {
            windIcon.image = UIImage(named: "Wind W.pdf")
        }
        if windDirectionString.contains("NW") {
            windIcon.image = UIImage(named: "Wind NW.pdf")
        } else {
            windIcon.image = UIImage(named: "Wind SW.pdf")
        }

        // Set cloud cover
        if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
            cloudCoverLabel.text = "\(cloudCover)% decr."
        } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
            cloudCoverLabel.text = "\(cloudCover)% incr."
        } else {
            cloudCoverLabel.text = "\(cloudCover)%"
        }
    }
    
    // MARK: - Set weather data labels
    func setWeatherDataLabels() {
        setCurrentConditionOutlets()
        setHourlyOutlets(type: "Precip")
        setDailyOutlets(type: "Precip")
        
        // Check for default hourly condition value
        //setHourlyConditionOutlets(day: 14, segmentControl: hourlySegmentControl, pageControl: hourlyPageControl)
        
        currentLocationLabel.text = currentLocation
        
        // Check if summaries are equal for the hour
        if currentSummary == hourSummary {
            currentSummary = "\(hourSummary.capitalizingFirstLetter()) for the hour."
        }
        
        currentTemperatureLabel.text = "\(currentTemperature)°"
        currentConditonLabel.text = "\(currentSummary.capitalizingFirstLetter())"
        currentConditionIcon.image = UIImage(named: weatherCondition(condition: currentCondition, type: "image"))
        
        // If alert is active show button
        if alertTitle.isEmpty == false {
            // Check number of active alerts
            if alertCount > 1 {
                weatherAlertLabel.text = "\(alertTitle) | +\(alertCount)"
            } else {
                weatherAlertLabel.text = "\(alertTitle)"
            }
        } else {
            weatherAlertStackView.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

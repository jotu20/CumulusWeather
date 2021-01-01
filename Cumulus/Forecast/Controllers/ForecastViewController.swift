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
    var changedHourlyValues: String = ""
    
    // MARK: - Current conditions outlets
    @IBOutlet weak var currentConditionView: UIView!
    @IBOutlet weak var currentConditionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var currentLocationIcon: UIImageView!
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    @IBOutlet weak var weatherAlertIcon: UIImageView!
    @IBOutlet weak var weatherAlertLabel: UILabel!
    @IBOutlet weak var weatherAlertStackView: UIStackView!
    
    @IBOutlet weak var currentConditionIcon: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentConditonLabel: UILabel!
    
    @IBOutlet weak var conditionSlotLabel0: UILabel!
    @IBOutlet weak var conditionSlotLabel1: UILabel!
    @IBOutlet weak var conditionSlotLabel2: UILabel!
    @IBOutlet weak var conditionSlotLabel3: UILabel!
    @IBOutlet weak var conditionSlotLabel4: UILabel!
    
    // MARK: - Hourly outlets
    @IBOutlet var hourlyConditionsGesture: UITapGestureRecognizer!
    @IBOutlet var hourlyConditionsGestureSwipeLeft: UISwipeGestureRecognizer!
    @IBOutlet var hourlyConditionsGestureSwipeRight: UISwipeGestureRecognizer!
    
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
    @IBOutlet weak var day0Height: NSLayoutConstraint!
    @IBOutlet weak var day0HighLabel: UILabel!
    @IBOutlet weak var day0LowLabel: UILabel!
    @IBOutlet weak var day0SummaryLabel: UILabel!
    @IBOutlet weak var day0Slot1: UILabel!
    @IBOutlet weak var day0Slot2: UILabel!
    @IBOutlet weak var day0Slot3: UILabel!
    @IBOutlet weak var day0Slot4: UILabel!
    @IBOutlet weak var day0Slot5: UILabel!
    @IBOutlet weak var day0Slot6: UILabel!
    @IBOutlet weak var day0Slot7: UILabel!
    @IBOutlet weak var day0Slot8: UILabel!
    @IBOutlet weak var day0Slot9: UILabel!
    @IBOutlet weak var day0Slot10: UILabel!
    
    @IBOutlet weak var day1View: UIView!
    @IBOutlet weak var day1Label: UILabel!
    @IBOutlet weak var day1ConditionIcon: UIImageView!
    @IBOutlet weak var day1Height: NSLayoutConstraint!
    @IBOutlet weak var day1HighLabel: UILabel!
    @IBOutlet weak var day1LowLabel: UILabel!
    @IBOutlet weak var day1SummaryLabel: UILabel!
    @IBOutlet weak var day1Slot1: UILabel!
    @IBOutlet weak var day1Slot2: UILabel!
    @IBOutlet weak var day1Slot3: UILabel!
    @IBOutlet weak var day1Slot4: UILabel!
    @IBOutlet weak var day1Slot5: UILabel!
    @IBOutlet weak var day1Slot6: UILabel!
    @IBOutlet weak var day1Slot7: UILabel!
    @IBOutlet weak var day1Slot8: UILabel!
    @IBOutlet weak var day1Slot9: UILabel!
    @IBOutlet weak var day1Slot10: UILabel!
    
    @IBOutlet weak var day2View: UIView!
    @IBOutlet weak var day2Label: UILabel!
    @IBOutlet weak var day2ConditionIcon: UIImageView!
    @IBOutlet weak var day2Height: NSLayoutConstraint!
    @IBOutlet weak var day2HighLabel: UILabel!
    @IBOutlet weak var day2LowLabel: UILabel!
    @IBOutlet weak var day2SummaryLabel: UILabel!
    @IBOutlet weak var day2Slot1: UILabel!
    @IBOutlet weak var day2Slot2: UILabel!
    @IBOutlet weak var day2Slot3: UILabel!
    @IBOutlet weak var day2Slot4: UILabel!
    @IBOutlet weak var day2Slot5: UILabel!
    @IBOutlet weak var day2Slot6: UILabel!
    @IBOutlet weak var day2Slot7: UILabel!
    @IBOutlet weak var day2Slot8: UILabel!
    @IBOutlet weak var day2Slot9: UILabel!
    @IBOutlet weak var day2Slot10: UILabel!
    
    @IBOutlet weak var day3View: UIView!
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var day3ConditionIcon: UIImageView!
    @IBOutlet weak var day3Height: NSLayoutConstraint!
    @IBOutlet weak var day3HighLabel: UILabel!
    @IBOutlet weak var day3LowLabel: UILabel!
    @IBOutlet weak var day3SummaryLabel: UILabel!
    @IBOutlet weak var day3Slot1: UILabel!
    @IBOutlet weak var day3Slot2: UILabel!
    @IBOutlet weak var day3Slot3: UILabel!
    @IBOutlet weak var day3Slot4: UILabel!
    @IBOutlet weak var day3Slot5: UILabel!
    @IBOutlet weak var day3Slot6: UILabel!
    @IBOutlet weak var day3Slot7: UILabel!
    @IBOutlet weak var day3Slot8: UILabel!
    @IBOutlet weak var day3Slot9: UILabel!
    @IBOutlet weak var day3Slot10: UILabel!
    
    @IBOutlet weak var day4View: UIView!
    @IBOutlet weak var day4Label: UILabel!
    @IBOutlet weak var day4ConditionIcon: UIImageView!
    @IBOutlet weak var day4Height: NSLayoutConstraint!
    @IBOutlet weak var day4HighLabel: UILabel!
    @IBOutlet weak var day4LowLabel: UILabel!
    @IBOutlet weak var day4SummaryLabel: UILabel!
    @IBOutlet weak var day4Slot1: UILabel!
    @IBOutlet weak var day4Slot2: UILabel!
    @IBOutlet weak var day4Slot3: UILabel!
    @IBOutlet weak var day4Slot4: UILabel!
    @IBOutlet weak var day4Slot5: UILabel!
    @IBOutlet weak var day4Slot6: UILabel!
    @IBOutlet weak var day4Slot7: UILabel!
    @IBOutlet weak var day4Slot8: UILabel!
    @IBOutlet weak var day4Slot9: UILabel!
    @IBOutlet weak var day4Slot10: UILabel!
    
    @IBOutlet weak var day5View: UIView!
    @IBOutlet weak var day5Label: UILabel!
    @IBOutlet weak var day5ConditionIcon: UIImageView!
    @IBOutlet weak var day5Height: NSLayoutConstraint!
    @IBOutlet weak var day5HighLabel: UILabel!
    @IBOutlet weak var day5LowLabel: UILabel!
    @IBOutlet weak var day5SummaryLabel: UILabel!
    @IBOutlet weak var day5Slot1: UILabel!
    @IBOutlet weak var day5Slot2: UILabel!
    @IBOutlet weak var day5Slot3: UILabel!
    @IBOutlet weak var day5Slot4: UILabel!
    @IBOutlet weak var day5Slot5: UILabel!
    @IBOutlet weak var day5Slot6: UILabel!
    @IBOutlet weak var day5Slot7: UILabel!
    @IBOutlet weak var day5Slot8: UILabel!
    @IBOutlet weak var day5Slot9: UILabel!
    @IBOutlet weak var day5Slot10: UILabel!
    
    @IBOutlet weak var day6View: UIView!
    @IBOutlet weak var day6Label: UILabel!
    @IBOutlet weak var day6ConditionIcon: UIImageView!
    @IBOutlet weak var day6Height: NSLayoutConstraint!
    @IBOutlet weak var day6HighLabel: UILabel!
    @IBOutlet weak var day6LowLabel: UILabel!
    @IBOutlet weak var day6SummaryLabel: UILabel!
    @IBOutlet weak var day6Slot1: UILabel!
    @IBOutlet weak var day6Slot2: UILabel!
    @IBOutlet weak var day6Slot3: UILabel!
    @IBOutlet weak var day6Slot4: UILabel!
    @IBOutlet weak var day6Slot5: UILabel!
    @IBOutlet weak var day6Slot6: UILabel!
    @IBOutlet weak var day6Slot7: UILabel!
    @IBOutlet weak var day6Slot8: UILabel!
    @IBOutlet weak var day6Slot9: UILabel!
    @IBOutlet weak var day6Slot10: UILabel!
    
    @IBOutlet weak var day7View: UIView!
    @IBOutlet weak var day7Label: UILabel!
    @IBOutlet weak var day7ConditionIcon: UIImageView!
    @IBOutlet weak var day7Height: NSLayoutConstraint!
    @IBOutlet weak var day7HighLabel: UILabel!
    @IBOutlet weak var day7LowLabel: UILabel!
    @IBOutlet weak var day7SummaryLabel: UILabel!
    @IBOutlet weak var day7Slot1: UILabel!
    @IBOutlet weak var day7Slot2: UILabel!
    @IBOutlet weak var day7Slot3: UILabel!
    @IBOutlet weak var day7Slot4: UILabel!
    @IBOutlet weak var day7Slot5: UILabel!
    @IBOutlet weak var day7Slot6: UILabel!
    @IBOutlet weak var day7Slot7: UILabel!
    @IBOutlet weak var day7Slot8: UILabel!
    @IBOutlet weak var day7Slot9: UILabel!
    @IBOutlet weak var day7Slot10: UILabel!
    
    @IBOutlet weak var day8View: UIView!
    @IBOutlet weak var day8Label: UILabel!
    @IBOutlet weak var day8ConditionIcon: UIImageView!
    @IBOutlet weak var day8Height: NSLayoutConstraint!
    @IBOutlet weak var day8HighLabel: UILabel!
    @IBOutlet weak var day8LowLabel: UILabel!
    @IBOutlet weak var day8SummaryLabel: UILabel!
    @IBOutlet weak var day8Slot1: UILabel!
    @IBOutlet weak var day8Slot2: UILabel!
    @IBOutlet weak var day8Slot3: UILabel!
    @IBOutlet weak var day8Slot4: UILabel!
    @IBOutlet weak var day8Slot5: UILabel!
    @IBOutlet weak var day8Slot6: UILabel!
    @IBOutlet weak var day8Slot7: UILabel!
    @IBOutlet weak var day8Slot8: UILabel!
    @IBOutlet weak var day8Slot9: UILabel!
    @IBOutlet weak var day8Slot10: UILabel!
    
    @IBOutlet weak var day9View: UIView!
    @IBOutlet weak var day9Label: UILabel!
    @IBOutlet weak var day9ConditionIcon: UIImageView!
    @IBOutlet weak var day9Height: NSLayoutConstraint!
    @IBOutlet weak var day9HighLabel: UILabel!
    @IBOutlet weak var day9LowLabel: UILabel!
    @IBOutlet weak var day9SummaryLabel: UILabel!
    @IBOutlet weak var day9Slot1: UILabel!
    @IBOutlet weak var day9Slot2: UILabel!
    @IBOutlet weak var day9Slot3: UILabel!
    @IBOutlet weak var day9Slot4: UILabel!
    @IBOutlet weak var day9Slot5: UILabel!
    @IBOutlet weak var day9Slot6: UILabel!
    @IBOutlet weak var day9Slot7: UILabel!
    @IBOutlet weak var day9Slot8: UILabel!
    @IBOutlet weak var day9Slot9: UILabel!
    @IBOutlet weak var day9Slot10: UILabel!
    
    // MARK: - Constraints
    @IBOutlet weak var currentLocationLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var weatherAlertLableWidth: NSLayoutConstraint!
    @IBOutlet weak var currentConditionViewWidth: NSLayoutConstraint!
    @IBOutlet weak var currentConditionLabelWidth: NSLayoutConstraint!
    
    @IBOutlet weak var hourlyConditionsStackView: UIStackView!
    @IBOutlet weak var day0ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day1ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day2ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day3ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day4ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day5ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day6ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day7ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day8ViewWidth: NSLayoutConstraint!
    @IBOutlet weak var day9ViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        self.tabBarController?.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.setupGrantedLocationServices()
        
        // Check for loaded weather, distance change, or color theme change
        if weatherLoaded == false || distanceChange == true || userChangedColorTheme == true {
            loadingScreen()
        }

        // Check for units or clock change
        if unitsChanged == true || clockChanged == true {
            loadingScreen()
            unitsChanged = false
            clockChanged = false
        }
        
        DispatchQueue.main.async {
            let screenSize = UIScreen.main.bounds
            let screenWidth = screenSize.width
            if screenWidth < 375 {
                let widthSize: CGFloat = 310
                
                self.currentLocationLabelWidth.constant = widthSize
                self.weatherAlertLableWidth.constant = widthSize
                self.currentConditionViewWidth.constant = widthSize
                self.currentConditionLabelWidth.constant = 175
                
                self.hourlyConditionsStackView.spacing = 3
                self.day0ViewWidth.constant = widthSize
                self.day1ViewWidth.constant = widthSize
                self.day2ViewWidth.constant = widthSize
                self.day3ViewWidth.constant = widthSize
                self.day4ViewWidth.constant = widthSize
                self.day5ViewWidth.constant = widthSize
                self.day6ViewWidth.constant = widthSize
                self.day7ViewWidth.constant = widthSize
                self.day8ViewWidth.constant = widthSize
                self.day9ViewWidth.constant = widthSize
            }
            
            if (defaults.bool(forKey: "cumulusPlus") == false) {
                self.hourlyConditionsGesture.isEnabled = false
                self.hourlyConditionsGestureSwipeLeft.isEnabled = false
                self.hourlyConditionsGestureSwipeRight.isEnabled = false
                
                self.day6View.isHidden = true
                self.day7View.isHidden = true
                self.day8View.isHidden = true
                self.day9View.isHidden = true
            }
            
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                self.day8View.isHidden = true
                self.day9View.isHidden = true
            }
  
            self.currentConditionView.layer.cornerRadius = 10
            
            self.hour0View.layer.cornerRadius = 10
            self.hour1View.layer.cornerRadius = 10
            self.hour2View.layer.cornerRadius = 10
            self.hour3View.layer.cornerRadius = 10
            
            self.day0View.layer.cornerRadius = 10
            self.day1View.layer.cornerRadius = 10
            self.day2View.layer.cornerRadius = 10
            self.day3View.layer.cornerRadius = 10
            self.day4View.layer.cornerRadius = 10
            self.day5View.layer.cornerRadius = 10
            self.day6View.layer.cornerRadius = 10
            self.day7View.layer.cornerRadius = 10
            self.day8View.layer.cornerRadius = 10
            self.day9View.layer.cornerRadius = 10
            
            // Setup for pull to refresh
            self.scrollView.alwaysBounceVertical = true
            self.scrollView.bounces  = true
            self.refreshControl = UIRefreshControl()
            self.refreshControl.addTarget(self, action: #selector(self.didPullToRefresh), for: .valueChanged)
            self.scrollView.addSubview(self.refreshControl)
        }

        // If user has viewed 10 times request review
        defaults.set((defaults.integer(forKey: "userViewedCounter") + 1), forKey: "userViewedCounter")
        if (defaults.integer(forKey: "userViewedCounter") == 10) {
            SKStoreReviewController.requestReview()
        } else if (defaults.integer(forKey: "userViewedCounter") == 1) {
            self.setWeatherDataLabels()
        }
    }
    
    // MARK: - Location Manager
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
                currentLocation = selectedLocation
                self.locationManager.stopUpdatingLocation()
                
                if (defaults.string(forKey: "dataSource") == "Dark Sky") {
                    fetchDarkSkyWeatherData()
                } else if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                    fetchOpenWeatherData()
                }
            }
        } else {
            latitudeValue = (manager.location?.coordinate.latitude)!
            longitudeValue = (manager.location?.coordinate.longitude)!
            
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
                self.locationManager.stopUpdatingLocation()
                
                if (defaults.string(forKey: "dataSource") == "Dark Sky") {
                    fetchDarkSkyWeatherData()
                } else if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                    fetchOpenWeatherData()
                }
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

    // MARK: - Fetch granted location access
    func setupGrantedLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            defaults.set(false, forKey: "userDeniedLocation")
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - Fetch denied location access
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
                currentLocation = "\(defaults.string(forKey: "selectedLocation") ?? "New York, NY")"
                
                if (defaults.string(forKey: "dataSource") == "Dark Sky") {
                    fetchDarkSkyWeatherData()
                } else if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                    fetchOpenWeatherData()
                }
            }
        } else {
            showLocationDisabledPopUp()
        }
    }
    
    // MARK: - Setup loading screen view
    func loadingScreen() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        if screenWidth >= 375 {
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        loadingView.removeFromSuperview()
                    }
                case .restricted, .denied:
                    print("Restricted access")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        loadingView.removeFromSuperview()
                        self.setWeatherDataLabels()
                        self.setColorTheme()
                    }
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        loadingView.removeFromSuperview()
                        self.setWeatherDataLabels()
                        self.setColorTheme()
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
        if (defaults.string(forKey: "dataSource") == "Dark Sky") {
            fetchDarkSkyWeatherData()
        } else if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            fetchOpenWeatherData()
        }
        setWeatherDataLabels()
        setColorTheme()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Set the user set theme
    func setColorTheme() {
        let color: UIColor?
        
        if (defaults.string(forKey: "userSavedColorString") == "Mango") {
            color = mango
        } else if (defaults.string(forKey: "userSavedColorString") == "Maximum Red") {
            color = maximumRed
        } else if (defaults.string(forKey: "userSavedColorString") == "Dodger Blue") {
            color = dodgerBlue
        } else if (defaults.string(forKey: "userSavedColorString") == "Orchid") {
            color = orchid
        } else if (defaults.string(forKey: "userSavedColorString") == "Plump Purple") {
            color = plumpPurple
        } else if (defaults.string(forKey: "userSavedColorString") == "Spring Green") {
            color = springGreen
        } else {
            color = dodgerBlue
        }
        
        self.tabBarController?.tabBar.tintColor = color
        currentLocationIcon.tintColor = color
        currentConditonLabel.textColor = color
        
        hour0TimeLabel.textColor = color
        hour1TimeLabel.textColor = color
        hour2TimeLabel.textColor = color
        hour3TimeLabel.textColor = color
        
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
        hourConditionIcon.image = UIImage(named: weatherCondition(condition: hourIconString, type: "image", circle: defaults.string(forKey: "defaultConditionIcons")!))
        hourCondtionLabel.text = "\(hourConditionString)"
    }

    // MARK: - Set daily outlets
    func setDayLabelAndIcons(dayViewHeight: NSLayoutConstraint!, dayLabel: UILabel!, dayConditionIcon: UIImageView!, dayLowLabel: UILabel!, dayHighLabel: UILabel!, dayString: String, dateString: String, dayConditionIconString: String, dayLow: Int, dayHigh: Int) {
        
        dayViewHeight.constant = 60
        dayLabel.text = "\(dayString.capitalizingFirstLetter())"
        dayConditionIcon.image = UIImage(named: weatherCondition(condition: dayConditionIconString, type: "daily", circle: defaults.string(forKey: "defaultConditionIcons")!))
        dayLowLabel.text = "\(dayLow)°"
        dayHighLabel.text = "\(dayHigh)°"
    }
    
    func setExtendedDayLabels(summary: String, precip: Int, humidity: Int, dewPoint: Int, visibility: Int, sunrise: String, accum: Double, wind: Double, windGust: Double, windBearing: String, pressure: Double, uvIndex: Int, sunset: String, label0: UILabel!, label1: UILabel!, label2: UILabel!, label3: UILabel!, label4: UILabel!, label5: UILabel!, label6: UILabel!, label7: UILabel!, label8: UILabel!, label9: UILabel!, label10: UILabel!) {
        
        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            label0.text = summary
            label1.text = "Precip. \(precip)%"
            label2.text = "Humidity \(humidity)%"
            label3.text = "Dew point \(dewPoint)°"
            label4.text = "Sunrise \(sunrise)"
            label5.isHidden = true
            label6.text = "Wind \(Int(wind))(\(Int(windGust)))\(unitsWindSpeed) \(windBearing)"
            label7.text = "Pressure \(Int(pressure))\(unitsPressure)"
            label9.text = "Sunset \(sunset)"
            label10.isHidden = true
            
            if uvIndex < 2 {
                label8.text = "UV index low (\(uvIndex))"
            } else if uvIndex >= 3 && uvIndex <= 5 {
                label8.text = "UV index moderate (\(uvIndex))"
            } else if uvIndex >= 6 && uvIndex <= 7 {
                label8.text = "UV index high (\(uvIndex))"
            } else if uvIndex >= 8 && uvIndex <= 10 {
                label8.text = "UV index very high (\(uvIndex))"
            } else if uvIndex >= 11 {
                label8.text = "UV index extreme (\(uvIndex))"
            }  else {
                label8.text = "UV index low (0)"
            }
        } else {
            label0.text = summary
            label1.text = "Precip. \(precip)%"
            label2.text = "Humidity \(humidity)%"
            label3.text = "Dew point \(dewPoint)°"
            label4.text = "Visibility \(visibility) \(unitsDistance)"
            label5.text = "Sunrise \(sunrise)"
            label6.text = "Accum. \(accum)\(unitsPrecipitation)"
            label7.text = "Wind \(Int(wind))(\(Int(windGust)))\(unitsWindSpeed) \(windBearing)"
            label8.text = "Pressure \(Int(pressure))\(unitsPressure)"
            label10.text = "Sunset \(sunset)"
            
            if uvIndex < 2 {
                label9.text = "UV index low (\(uvIndex))"
            } else if uvIndex >= 3 && uvIndex <= 5 {
                label9.text = "UV index moderate (\(uvIndex))"
            } else if uvIndex >= 6 && uvIndex <= 7 {
                label9.text = "UV index high (\(uvIndex))"
            } else if uvIndex >= 8 && uvIndex <= 10 {
                label9.text = "UV index very high (\(uvIndex))"
            } else if uvIndex >= 11 {
                label9.text = "UV index extreme (\(uvIndex))"
            }  else {
                label9.text = "UV index low (0)"
            }
        }
    }
    
    func hideExtendedDayLabels(hidden: Bool, label0: UILabel!, label1: UILabel!, label2: UILabel!, label3: UILabel!, label4: UILabel!, label5: UILabel!, label6: UILabel!, label7: UILabel!, label8: UILabel!, label9: UILabel!, label10: UILabel!) {
        if hidden == true {
            label0.isHidden = true
            label1.isHidden = true
            label2.isHidden = true
            label3.isHidden = true
            label4.isHidden = true
            label5.isHidden = true
            label6.isHidden = true
            label7.isHidden = true
            label8.isHidden = true
            label9.isHidden = true
            label10.isHidden = true
        } else {
            label0.isHidden = false
            label1.isHidden = false
            label2.isHidden = false
            label3.isHidden = false
            label4.isHidden = false
            label5.isHidden = false
            label6.isHidden = false
            label7.isHidden = false
            label8.isHidden = false
            label9.isHidden = false
            label10.isHidden = false
        }
    }
    
    func setHourlyOutlets0(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""
        
        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(precipHour0)%"
            hour1Value = "\(precipHour1)%"
            hour2Value = "\(precipHour2)%"
            hour3Value = "\(precipHour3)%"
        } else if type.contains("Accum") == true {
            hourlyLabel.text = "Hourly accumulation"
            
            hour0Value = "\(accumHour0)\(unitsPrecipitation)"
            hour1Value = "\(accumHour1)\(unitsPrecipitation)"
            hour2Value = "\(accumHour2)\(unitsPrecipitation)"
            hour3Value = "\(accumHour3)\(unitsPrecipitation)"
        } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(tempHour0)°"
            hour1Value = "\(tempHour1)°"
            hour2Value = "\(tempHour2)°"
            hour3Value = "\(tempHour3)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(humidityHour0)%"
            hour1Value = "\(humidityHour1)%"
            hour2Value = "\(humidityHour2)%"
            hour3Value = "\(humidityHour3)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(uvindexHour0)"
            hour1Value = "\(uvindexHour1)"
            hour2Value = "\(uvindexHour2)"
            hour3Value = "\(uvindexHour3)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(windSpeedHour0)\(unitsWindSpeed)"
            hour1Value = "\(windSpeedHour1)\(unitsWindSpeed)"
            hour2Value = "\(windSpeedHour2)\(unitsWindSpeed)"
            hour3Value = "\(windSpeedHour3)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(cloudCoverHour0)%"
            hour1Value = "\(cloudCoverHour1)%"
            hour2Value = "\(cloudCoverHour2)%"
            hour3Value = "\(cloudCoverHour3)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: "NOW", hourIconString: conditionHour0, hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: hour1, hourIconString: conditionHour1, hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: hour2, hourIconString: conditionHour2, hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: hour3, hourIconString: conditionHour3, hourConditionString: hour3Value)
    }
    
    func setHourlyOutlets1(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""
        
        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(precipHour4)%"
            hour1Value = "\(precipHour5)%"
            hour2Value = "\(precipHour6)%"
            hour3Value = "\(precipHour7)%"
         } else if type.contains("Accum") == true {
             hourlyLabel.text = "Hourly accumulation"
             
             hour0Value = "\(accumHour4)\(unitsPrecipitation)"
             hour1Value = "\(accumHour5)\(unitsPrecipitation)"
             hour2Value = "\(accumHour6)\(unitsPrecipitation)"
             hour3Value = "\(accumHour7)\(unitsPrecipitation)"
         } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(tempHour4)°"
            hour1Value = "\(tempHour5)°"
            hour2Value = "\(tempHour6)°"
            hour3Value = "\(tempHour7)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(humidityHour4)%"
            hour1Value = "\(humidityHour5)%"
            hour2Value = "\(humidityHour6)%"
            hour3Value = "\(humidityHour7)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(uvindexHour4)"
            hour1Value = "\(uvindexHour5)"
            hour2Value = "\(uvindexHour6)"
            hour3Value = "\(uvindexHour7)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(windSpeedHour4)\(unitsWindSpeed)"
            hour1Value = "\(windSpeedHour5)\(unitsWindSpeed)"
            hour2Value = "\(windSpeedHour6)\(unitsWindSpeed)"
            hour3Value = "\(windSpeedHour7)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(cloudCoverHour4)%"
            hour1Value = "\(cloudCoverHour5)%"
            hour2Value = "\(cloudCoverHour6)%"
            hour3Value = "\(cloudCoverHour7)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: hour4, hourIconString: conditionHour4, hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: hour5, hourIconString: conditionHour5, hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: hour6, hourIconString: conditionHour6, hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: hour7, hourIconString: conditionHour7, hourConditionString: hour3Value)
    }
    
    func setHourlyOutlets2(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""
        
        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(precipHour8)%"
            hour1Value = "\(precipHour9)%"
            hour2Value = "\(precipHour10)%"
            hour3Value = "\(precipHour11)%"
         } else if type.contains("Accum") == true {
             hourlyLabel.text = "Hourly accumulation"
             
             hour0Value = "\(accumHour8)\(unitsPrecipitation)"
             hour1Value = "\(accumHour9)\(unitsPrecipitation)"
             hour2Value = "\(accumHour10)\(unitsPrecipitation)"
             hour3Value = "\(accumHour11)\(unitsPrecipitation)"
         } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(tempHour8)°"
            hour1Value = "\(tempHour9)°"
            hour2Value = "\(tempHour10)°"
            hour3Value = "\(tempHour11)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(humidityHour8)%"
            hour1Value = "\(humidityHour9)%"
            hour2Value = "\(humidityHour10)%"
            hour3Value = "\(humidityHour11)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(uvindexHour8)"
            hour1Value = "\(uvindexHour9)"
            hour2Value = "\(uvindexHour10)"
            hour3Value = "\(uvindexHour11)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(windSpeedHour8)\(unitsWindSpeed)"
            hour1Value = "\(windSpeedHour9)\(unitsWindSpeed)"
            hour2Value = "\(windSpeedHour10)\(unitsWindSpeed)"
            hour3Value = "\(windSpeedHour11)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(cloudCoverHour8)%"
            hour1Value = "\(cloudCoverHour9)%"
            hour2Value = "\(cloudCoverHour10)%"
            hour3Value = "\(cloudCoverHour11)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: hour8, hourIconString: conditionHour8, hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: hour9, hourIconString: conditionHour9, hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: hour10, hourIconString: conditionHour10, hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: hour11, hourIconString: conditionHour11, hourConditionString: hour3Value)
    }
    
    func setHourlyOutlets3(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""

        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(precipHour12)%"
            hour1Value = "\(precipHour13)%"
            hour2Value = "\(precipHour14)%"
            hour3Value = "\(precipHour15)%"
         } else if type.contains("Accum") == true {
             hourlyLabel.text = "Hourly accumulation"
             
             hour0Value = "\(accumHour12)\(unitsPrecipitation)"
             hour1Value = "\(accumHour13)\(unitsPrecipitation)"
             hour2Value = "\(accumHour14)\(unitsPrecipitation)"
             hour3Value = "\(accumHour15)\(unitsPrecipitation)"
         } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(tempHour12)°"
            hour1Value = "\(tempHour13)°"
            hour2Value = "\(tempHour14)°"
            hour3Value = "\(tempHour15)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(humidityHour12)%"
            hour1Value = "\(humidityHour13)%"
            hour2Value = "\(humidityHour14)%"
            hour3Value = "\(humidityHour15)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(uvindexHour12)"
            hour1Value = "\(uvindexHour13)"
            hour2Value = "\(uvindexHour14)"
            hour3Value = "\(uvindexHour15)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(windSpeedHour12)\(unitsWindSpeed)"
            hour1Value = "\(windSpeedHour13)\(unitsWindSpeed)"
            hour2Value = "\(windSpeedHour14)\(unitsWindSpeed)"
            hour3Value = "\(windSpeedHour15)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(cloudCoverHour12)%"
            hour1Value = "\(cloudCoverHour13)%"
            hour2Value = "\(cloudCoverHour14)%"
            hour3Value = "\(cloudCoverHour15)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: hour12, hourIconString: conditionHour12, hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: hour13, hourIconString: conditionHour13, hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: hour14, hourIconString: conditionHour14, hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: hour15, hourIconString: conditionHour15, hourConditionString: hour3Value)
    }
    
    func changeHourlyOutlets(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""
       
        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(precipHour0)%"
            hour1Value = "\(precipHour1)%"
            hour2Value = "\(precipHour2)%"
            hour3Value = "\(precipHour3)%"
         } else if type.contains("Accum") == true {
             hourlyLabel.text = "Hourly accumulation"
             
             hour0Value = "\(accumHour0)\(unitsPrecipitation)"
             hour1Value = "\(accumHour1)\(unitsPrecipitation)"
             hour2Value = "\(accumHour2)\(unitsPrecipitation)"
             hour3Value = "\(accumHour3)\(unitsPrecipitation)"
         } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(tempHour0)°"
            hour1Value = "\(tempHour1)°"
            hour2Value = "\(tempHour2)°"
            hour3Value = "\(tempHour3)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(humidityHour0)%"
            hour1Value = "\(humidityHour1)%"
            hour2Value = "\(humidityHour2)%"
            hour3Value = "\(humidityHour3)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(uvindexHour0)"
            hour1Value = "\(uvindexHour1)"
            hour2Value = "\(uvindexHour2)"
            hour3Value = "\(uvindexHour3)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(windSpeedHour0)\(unitsWindSpeed)"
            hour1Value = "\(windSpeedHour1)\(unitsWindSpeed)"
            hour2Value = "\(windSpeedHour2)\(unitsWindSpeed)"
            hour3Value = "\(windSpeedHour3)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(cloudCoverHour0)%"
            hour1Value = "\(cloudCoverHour1)%"
            hour2Value = "\(cloudCoverHour2)%"
            hour3Value = "\(cloudCoverHour3)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: "NOW", hourIconString: conditionHour0, hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: hour1, hourIconString: conditionHour1, hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: hour2, hourIconString: conditionHour2, hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: hour3, hourIconString: conditionHour3, hourConditionString: hour3Value)
    }
    
    func setDailyOutlets() {
        dailyLabel.text = "Daily forecast"
        
        hideExtendedDayLabels(hidden: true, label0: day0SummaryLabel, label1: day0Slot1, label2: day0Slot2, label3: day0Slot3, label4: day0Slot4, label5: day0Slot5, label6: day0Slot6!, label7: day0Slot7, label8: day0Slot8, label9: day0Slot9, label10: day0Slot10)
        hideExtendedDayLabels(hidden: true, label0: day1SummaryLabel, label1: day1Slot1, label2: day1Slot2, label3: day1Slot3, label4: day1Slot4, label5: day1Slot5, label6: day1Slot6!, label7: day1Slot7, label8: day1Slot8, label9: day1Slot9, label10: day1Slot10)
        hideExtendedDayLabels(hidden: true, label0: day2SummaryLabel, label1: day2Slot1, label2: day2Slot2, label3: day2Slot3, label4: day2Slot4, label5: day2Slot5, label6: day2Slot6!, label7: day2Slot7, label8: day2Slot8, label9: day2Slot9, label10: day2Slot10)
        hideExtendedDayLabels(hidden: true, label0: day3SummaryLabel, label1: day3Slot1, label2: day3Slot2, label3: day3Slot3, label4: day3Slot4, label5: day3Slot5, label6: day3Slot6!, label7: day3Slot7, label8: day3Slot8, label9: day3Slot9, label10: day3Slot10)
        hideExtendedDayLabels(hidden: true, label0: day4SummaryLabel, label1: day4Slot1, label2: day4Slot2, label3: day4Slot3, label4: day4Slot4, label5: day4Slot5, label6: day4Slot6!, label7: day4Slot7, label8: day4Slot8, label9: day4Slot9, label10: day4Slot10)
        hideExtendedDayLabels(hidden: true, label0: day5SummaryLabel, label1: day5Slot1, label2: day5Slot2, label3: day5Slot3, label4: day5Slot4, label5: day5Slot5, label6: day5Slot6!, label7: day5Slot7, label8: day5Slot8, label9: day5Slot9, label10: day5Slot10)
        hideExtendedDayLabels(hidden: true, label0: day6SummaryLabel, label1: day6Slot1, label2: day6Slot2, label3: day6Slot3, label4: day6Slot4, label5: day6Slot5, label6: day6Slot6!, label7: day6Slot7, label8: day6Slot8, label9: day6Slot9, label10: day6Slot10)
        hideExtendedDayLabels(hidden: true, label0: day7SummaryLabel, label1: day7Slot1, label2: day7Slot2, label3: day7Slot3, label4: day7Slot4, label5: day7Slot5, label6: day7Slot6!, label7: day7Slot7, label8: day7Slot8, label9: day7Slot9, label10: day7Slot10)
        hideExtendedDayLabels(hidden: true, label0: day8SummaryLabel, label1: day8Slot1, label2: day8Slot2, label3: day8Slot3, label4: day8Slot4, label5: day8Slot5, label6: day8Slot6!, label7: day8Slot7, label8: day8Slot8, label9: day8Slot9, label10: day8Slot10)
        hideExtendedDayLabels(hidden: true, label0: day9SummaryLabel, label1: day9Slot1, label2: day9Slot2, label3: day9Slot3, label4: day9Slot4, label5: day9Slot5, label6: day9Slot6!, label7: day9Slot7, label8: day9Slot8, label9: day9Slot9, label10: day9Slot10)
        
        setDayLabelAndIcons(dayViewHeight: day0Height, dayLabel: day0Label, dayConditionIcon: day0ConditionIcon, dayLowLabel: day0LowLabel, dayHighLabel: day0HighLabel, dayString: "TODAY", dateString: day0DateString, dayConditionIconString: day0Condition, dayLow: day0Low, dayHigh: day0High)
        setDayLabelAndIcons(dayViewHeight: day1Height, dayLabel: day1Label, dayConditionIcon: day1ConditionIcon, dayLowLabel: day1LowLabel, dayHighLabel: day1HighLabel, dayString: day1DayStringFull, dateString: day1DateString, dayConditionIconString: day1Condition, dayLow: day1Low, dayHigh: day1High)
        setDayLabelAndIcons(dayViewHeight: day2Height, dayLabel: day2Label, dayConditionIcon: day2ConditionIcon, dayLowLabel: day2LowLabel, dayHighLabel: day2HighLabel, dayString: day2DayStringFull, dateString: day2DateString, dayConditionIconString: day2Condition, dayLow: day2Low, dayHigh: day2High)
        setDayLabelAndIcons(dayViewHeight: day3Height, dayLabel: day3Label, dayConditionIcon: day3ConditionIcon, dayLowLabel: day3LowLabel, dayHighLabel: day3HighLabel, dayString: day3DayStringFull, dateString: day3DateString, dayConditionIconString: day3Condition, dayLow: day3Low, dayHigh: day3High)
        setDayLabelAndIcons(dayViewHeight: day4Height, dayLabel: day4Label, dayConditionIcon: day4ConditionIcon, dayLowLabel: day4LowLabel, dayHighLabel: day4HighLabel, dayString: day4DayStringFull, dateString: day4DateString, dayConditionIconString: day4Condition, dayLow: day4Low, dayHigh: day4High)
        setDayLabelAndIcons(dayViewHeight: day5Height, dayLabel: day5Label, dayConditionIcon: day5ConditionIcon, dayLowLabel: day5LowLabel, dayHighLabel: day5HighLabel, dayString: day5DayStringFull, dateString: day5DateString, dayConditionIconString: day5Condition, dayLow: day5Low, dayHigh: day5High)
        setDayLabelAndIcons(dayViewHeight: day6Height, dayLabel: day6Label, dayConditionIcon: day6ConditionIcon, dayLowLabel: day6LowLabel, dayHighLabel: day6HighLabel, dayString: day6DayStringFull, dateString: day6DateString, dayConditionIconString: day6Condition, dayLow: day6Low, dayHigh: day6High)
        setDayLabelAndIcons(dayViewHeight: day7Height, dayLabel: day7Label, dayConditionIcon: day7ConditionIcon, dayLowLabel: day7LowLabel, dayHighLabel: day7HighLabel, dayString: day7DayStringFull, dateString: day7DateString, dayConditionIconString: day7Condition, dayLow: day7Low, dayHigh: day7High)
        setDayLabelAndIcons(dayViewHeight: day8Height, dayLabel: day8Label, dayConditionIcon: day8ConditionIcon, dayLowLabel: day8LowLabel, dayHighLabel: day8HighLabel, dayString: day8DayStringFull, dateString: day8DateString, dayConditionIconString: day8Condition, dayLow: day8Low, dayHigh: day8High)
        setDayLabelAndIcons(dayViewHeight: day9Height, dayLabel: day9Label, dayConditionIcon: day9ConditionIcon, dayLowLabel: day9LowLabel, dayHighLabel: day9HighLabel, dayString: day9DayStringFull, dateString: day9DateString, dayConditionIconString: day9Condition, dayLow: day9Low, dayHigh: day9High)
    }
    
    // MARK: - Action to show and open weather alerts
    @IBAction func weatherAlertTapGestureTapped(_ sender: UITapGestureRecognizer) {
        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            let alert = UIAlertController(title: "\(alertTitle)", message: "\(alertDescription)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "\(alertTitle)", message: "\(alertDescription)", preferredStyle: .alert)
            let openAction = UIAlertAction(title: "Open", style: .default) {
                UIAlertAction in
                let svc = SFSafariViewController(url: URL(string: alertURI)!)
                self.present(svc, animated: true, completion: nil)
            }
            alertController.addAction(openAction)
            alertController.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // When tapped show extended current conditions
    @IBAction func currentConditionsTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if (conditionSlotLabel0.text?.contains("Feels"))! {
            setExtendedCurrentConditionOutlets()
        } else {
            setCurrentConditionOutlets()
        }
    }
    
    // When tapped change hourly condition currently being shown
    @IBAction func hourlyConditionsTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            if hourlyLabel.text?.contains("precipitation") == true {
                changedHourlyValues = "Cloud"
            } else if hourlyLabel.text?.contains("cloud cover") == true {
                changedHourlyValues = "Wind"
            } else if hourlyLabel.text?.contains("wind") == true {
                changedHourlyValues = "UV Index"
            } else if hourlyLabel.text?.contains("uv index") == true {
                changedHourlyValues = "Humidity"
            } else if hourlyLabel.text?.contains("humidity") == true {
                changedHourlyValues = "Temp"
            } else if hourlyLabel.text?.contains("temperature") == true {
                changedHourlyValues = "Precip"
            }
        } else {
            if hourlyLabel.text?.contains("precipitation") == true {
                changedHourlyValues = "Cloud"
            } else if hourlyLabel.text?.contains("cloud cover") == true {
                changedHourlyValues = "Wind"
            } else if hourlyLabel.text?.contains("wind") == true {
                changedHourlyValues = "UV Index"
            } else if hourlyLabel.text?.contains("uv index") == true {
                changedHourlyValues = "Humidity"
            } else if hourlyLabel.text?.contains("humidity") == true {
                changedHourlyValues = "Temp"
            } else if hourlyLabel.text?.contains("temperature") == true {
                changedHourlyValues = "Accum"
            } else if hourlyLabel.text?.contains("accumulation") == true {
                changedHourlyValues = "Precip"
            }
        }
        
        if hour0TimeLabel.text == "NOW" {
            setHourlyOutlets0(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour4 {
            setHourlyOutlets1(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour8 {
            setHourlyOutlets2(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour12 {
            setHourlyOutlets3(type: changedHourlyValues)
        }
    }
  
    // When tapped show extended hourly conditions
    @IBAction func hourlyConditionsGestureSwipeLeftTapped(_ sender: UISwipeGestureRecognizer) {
        if hour0TimeLabel.text == "NOW" {
            setHourlyOutlets1(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour4 {
            setHourlyOutlets2(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour8 {
            setHourlyOutlets3(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour12 {
            setHourlyOutlets0(type: changedHourlyValues)
        }
    }
    
    // When tapped show extended hourly conditions
    @IBAction func hourlyConditionsGestureSwipeRightTapped(_ sender: UISwipeGestureRecognizer) {
        if hour0TimeLabel.text == "NOW" {
            setHourlyOutlets3(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour12 {
            setHourlyOutlets2(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour8 {
            setHourlyOutlets1(type: changedHourlyValues)
        } else if hour0TimeLabel.text == hour4 {
            setHourlyOutlets0(type: changedHourlyValues)
        }
    }
    
    @IBAction func day0CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day0Height.constant == 60 {
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                day0Height.constant = 200
            } else {
                day0Height.constant = 220
            }
            
            hideExtendedDayLabels(hidden: false, label0: day0SummaryLabel, label1: day0Slot1, label2: day0Slot2, label3: day0Slot3, label4: day0Slot4, label5: day0Slot5, label6: day0Slot6!, label7: day0Slot7, label8: day0Slot8, label9: day0Slot9, label10: day0Slot10)
            setExtendedDayLabels(summary: day0Summary, precip: day0Precip, humidity: day0Humidity, dewPoint: day0DewPoint, visibility: day0Visibility, sunrise: day0Sunrise, accum: day0PrecipAccum, wind: day0Wind, windGust: day0WindGust, windBearing: day0WindBearing, pressure: day0Pressure, uvIndex: day0UVIndex, sunset: day0Sunset, label0: day0SummaryLabel, label1: day0Slot1, label2: day0Slot2, label3: day0Slot3, label4: day0Slot4, label5: day0Slot5, label6: day0Slot6, label7: day0Slot7, label8: day0Slot8, label9: day0Slot9, label10: day0Slot10)
        } else {
            day0Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day0SummaryLabel, label1: day0Slot1, label2: day0Slot2, label3: day0Slot3, label4: day0Slot4, label5: day0Slot5, label6: day0Slot6!, label7: day0Slot7, label8: day0Slot8, label9: day0Slot9, label10: day0Slot10)
        }
    }
    
    @IBAction func day1CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day1Height.constant == 60 {
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                day1Height.constant = 200
            } else {
                day1Height.constant = 220
            }
            
            hideExtendedDayLabels(hidden: false, label0: day1SummaryLabel, label1: day1Slot1, label2: day1Slot2, label3: day1Slot3, label4: day1Slot4, label5: day1Slot5, label6: day1Slot6!, label7: day1Slot7, label8: day1Slot8, label9: day1Slot9, label10: day1Slot10)
            setExtendedDayLabels(summary: day1Summary, precip: day1Precip, humidity: day1Humidity, dewPoint: day1DewPoint, visibility: day1Visibility, sunrise: day1Sunrise, accum: day1PrecipAccum, wind: day1Wind, windGust: day1WindGust, windBearing: day1WindBearing, pressure: day1Pressure, uvIndex: day1UVIndex, sunset: day1Sunset, label0: day1SummaryLabel, label1: day1Slot1, label2: day1Slot2, label3: day1Slot3, label4: day1Slot4, label5: day1Slot5, label6: day1Slot6, label7: day1Slot7, label8: day1Slot8, label9: day1Slot9, label10: day1Slot10)
        } else {
            day1Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day1SummaryLabel, label1: day1Slot1, label2: day1Slot2, label3: day1Slot3, label4: day1Slot4, label5: day1Slot5, label6: day1Slot6!, label7: day1Slot7, label8: day1Slot8, label9: day1Slot9, label10: day1Slot10)
        }
    }
    
    @IBAction func day2CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day2Height.constant == 60 {
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                day2Height.constant = 200
            } else {
                day2Height.constant = 220
            }
            
            hideExtendedDayLabels(hidden: false, label0: day2SummaryLabel, label1: day2Slot1, label2: day2Slot2, label3: day2Slot3, label4: day2Slot4, label5: day2Slot5, label6: day2Slot6!, label7: day2Slot7, label8: day2Slot8, label9: day2Slot9, label10: day2Slot10)
            setExtendedDayLabels(summary: day2Summary, precip: day2Precip, humidity: day2Humidity, dewPoint: day2DewPoint, visibility: day2Visibility, sunrise: day2Sunrise, accum: day2PrecipAccum, wind: day2Wind, windGust: day2WindGust, windBearing: day2WindBearing, pressure: day2Pressure, uvIndex: day2UVIndex, sunset: day2Sunset, label0: day2SummaryLabel, label1: day2Slot1, label2: day2Slot2, label3: day2Slot3, label4: day2Slot4, label5: day2Slot5, label6: day2Slot6, label7: day2Slot7, label8: day2Slot8, label9: day2Slot9, label10: day2Slot10)
        } else {
            day2Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day2SummaryLabel, label1: day2Slot1, label2: day2Slot2, label3: day2Slot3, label4: day2Slot4, label5: day2Slot5, label6: day2Slot6!, label7: day2Slot7, label8: day2Slot8, label9: day2Slot9, label10: day2Slot10)
        }
    }

    @IBAction func day3CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day3Height.constant == 60 {
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                day3Height.constant = 200
            } else {
                day3Height.constant = 220
            }
            
            hideExtendedDayLabels(hidden: false, label0: day3SummaryLabel, label1: day3Slot1, label2: day3Slot2, label3: day3Slot3, label4: day3Slot4, label5: day3Slot5, label6: day3Slot6!, label7: day3Slot7, label8: day3Slot8, label9: day3Slot9, label10: day3Slot10)
            setExtendedDayLabels(summary: day3Summary, precip: day3Precip, humidity: day3Humidity, dewPoint: day3DewPoint, visibility: day3Visibility, sunrise: day3Sunrise, accum: day3PrecipAccum, wind: day3Wind, windGust: day3WindGust, windBearing: day3WindBearing, pressure: day3Pressure, uvIndex: day3UVIndex, sunset: day3Sunset, label0: day3SummaryLabel, label1: day3Slot1, label2: day3Slot2, label3: day3Slot3, label4: day3Slot4, label5: day3Slot5, label6: day3Slot6, label7: day3Slot7, label8: day3Slot8, label9: day3Slot9, label10: day3Slot10)
        } else {
            day3Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day3SummaryLabel, label1: day3Slot1, label2: day3Slot2, label3: day3Slot3, label4: day3Slot4, label5: day3Slot5, label6: day3Slot6!, label7: day3Slot7, label8: day3Slot8, label9: day3Slot9, label10: day3Slot10)
        }
    }

    @IBAction func day4CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day4Height.constant == 60 {
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                day4Height.constant = 200
            } else {
                day4Height.constant = 220
            }
            
            hideExtendedDayLabels(hidden: false, label0: day4SummaryLabel, label1: day4Slot1, label2: day4Slot2, label3: day4Slot3, label4: day4Slot4, label5: day4Slot5, label6: day4Slot6!, label7: day4Slot7, label8: day4Slot8, label9: day4Slot9, label10: day4Slot10)
            setExtendedDayLabels(summary: day4Summary, precip: day4Precip, humidity: day4Humidity, dewPoint: day4DewPoint, visibility: day4Visibility, sunrise: day4Sunrise, accum: day4PrecipAccum, wind: day4Wind, windGust: day4WindGust, windBearing: day4WindBearing, pressure: day4Pressure, uvIndex: day4UVIndex, sunset: day4Sunset, label0: day4SummaryLabel, label1: day4Slot1, label2: day4Slot2, label3: day4Slot3, label4: day4Slot4, label5: day4Slot5, label6: day4Slot6, label7: day4Slot7, label8: day4Slot8, label9: day4Slot9, label10: day4Slot10)
        } else {
            day4Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day4SummaryLabel, label1: day4Slot1, label2: day4Slot2, label3: day4Slot3, label4: day4Slot4, label5: day4Slot5, label6: day4Slot6!, label7: day4Slot7, label8: day4Slot8, label9: day4Slot9, label10: day4Slot10)
        }
    }

    @IBAction func day5CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day5Height.constant == 60 {
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                day5Height.constant = 200
            } else {
                day5Height.constant = 220
            }
            
            hideExtendedDayLabels(hidden: false, label0: day5SummaryLabel, label1: day5Slot1, label2: day5Slot2, label3: day5Slot3, label4: day5Slot4, label5: day5Slot5, label6: day5Slot6!, label7: day5Slot7, label8: day5Slot8, label9: day5Slot9, label10: day5Slot10)
            setExtendedDayLabels(summary: day5Summary, precip: day5Precip, humidity: day5Humidity, dewPoint: day5DewPoint, visibility: day5Visibility, sunrise: day5Sunrise, accum: day5PrecipAccum, wind: day5Wind, windGust: day5WindGust, windBearing: day5WindBearing, pressure: day5Pressure, uvIndex: day5UVIndex, sunset: day5Sunset, label0: day5SummaryLabel, label1: day5Slot1, label2: day5Slot2, label3: day5Slot3, label4: day5Slot4, label5: day5Slot5, label6: day5Slot6, label7: day5Slot7, label8: day5Slot8, label9: day5Slot9, label10: day5Slot10)
        } else {
            day5Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day5SummaryLabel, label1: day5Slot1, label2: day5Slot2, label3: day5Slot3, label4: day5Slot4, label5: day5Slot5, label6: day5Slot6!, label7: day5Slot7, label8: day5Slot8, label9: day5Slot9, label10: day5Slot10)
        }
    }
    
    @IBAction func day6CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day6Height.constant == 60 {
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                day6Height.constant = 200
            } else {
                day6Height.constant = 220
            }
            
            hideExtendedDayLabels(hidden: false, label0: day6SummaryLabel, label1: day6Slot1, label2: day6Slot2, label3: day6Slot3, label4: day6Slot4, label5: day6Slot5, label6: day6Slot6!, label7: day6Slot7, label8: day6Slot8, label9: day6Slot9, label10: day6Slot10)
            setExtendedDayLabels(summary: day6Summary, precip: day6Precip, humidity: day6Humidity, dewPoint: day6DewPoint, visibility: day6Visibility, sunrise: day6Sunrise, accum: day6PrecipAccum, wind: day6Wind, windGust: day6WindGust, windBearing: day6WindBearing, pressure: day6Pressure, uvIndex: day6UVIndex, sunset: day6Sunset, label0: day6SummaryLabel, label1: day6Slot1, label2: day6Slot2, label3: day6Slot3, label4: day6Slot4, label5: day6Slot5, label6: day6Slot6, label7: day6Slot7, label8: day6Slot8, label9: day6Slot9, label10: day6Slot10)
        } else {
            day6Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day6SummaryLabel, label1: day6Slot1, label2: day6Slot2, label3: day6Slot3, label4: day6Slot4, label5: day6Slot5, label6: day6Slot6!, label7: day6Slot7, label8: day6Slot8, label9: day6Slot9, label10: day6Slot10)
        }
    }
    
    @IBAction func day7CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day7Height.constant == 60 {
            if (defaults.string(forKey: "dataSource") == "OpenWeather") {
                day7Height.constant = 200
            } else {
                day7Height.constant = 220
            }
            
            hideExtendedDayLabels(hidden: false, label0: day7SummaryLabel, label1: day7Slot1, label2: day7Slot2, label3: day7Slot3, label4: day7Slot4, label5: day7Slot5, label6: day7Slot6!, label7: day7Slot7, label8: day7Slot8, label9: day7Slot9, label10: day7Slot10)
            setExtendedDayLabels(summary: day7Summary, precip: day7Precip, humidity: day7Humidity, dewPoint: day7DewPoint, visibility: day7Visibility, sunrise: day7Sunrise, accum: day7PrecipAccum, wind: day7Wind, windGust: day7WindGust, windBearing: day7WindBearing, pressure: day7Pressure, uvIndex: day7UVIndex, sunset: day7Sunset, label0: day7SummaryLabel, label1: day7Slot1, label2: day7Slot2, label3: day7Slot3, label4: day7Slot4, label5: day7Slot5, label6: day7Slot6, label7: day7Slot7, label8: day7Slot8, label9: day7Slot9, label10: day7Slot10)
        } else {
            day7Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day7SummaryLabel, label1: day7Slot1, label2: day7Slot2, label3: day7Slot3, label4: day7Slot4, label5: day7Slot5, label6: day7Slot6!, label7: day7Slot7, label8: day7Slot8, label9: day7Slot9, label10: day7Slot10)
        }
    }
    
    @IBAction func day8CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day8Height.constant == 60 {
            day8Height.constant = 220
            hideExtendedDayLabels(hidden: false, label0: day8SummaryLabel, label1: day8Slot1, label2: day8Slot2, label3: day8Slot3, label4: day8Slot4, label5: day8Slot5, label6: day8Slot6!, label7: day8Slot7, label8: day8Slot8, label9: day8Slot9, label10: day8Slot10)
            setExtendedDayLabels(summary: day8Summary, precip: day8Precip, humidity: day8Humidity, dewPoint: day8DewPoint, visibility: day8Visibility, sunrise: day8Sunrise, accum: day8PrecipAccum, wind: day8Wind, windGust: day8WindGust, windBearing: day8WindBearing, pressure: day8Pressure, uvIndex: day8UVIndex, sunset: day8Sunset, label0: day8SummaryLabel, label1: day8Slot1, label2: day8Slot2, label3: day8Slot3, label4: day8Slot4, label5: day8Slot5, label6: day8Slot6, label7: day8Slot7, label8: day8Slot8, label9: day8Slot9, label10: day8Slot10)
        } else {
            day8Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day8SummaryLabel, label1: day8Slot1, label2: day8Slot2, label3: day8Slot3, label4: day8Slot4, label5: day8Slot5, label6: day8Slot6!, label7: day8Slot7, label8: day8Slot8, label9: day8Slot9, label10: day8Slot10)
        }
    }
    
    @IBAction func day9CardTapped(_ sender: UITapGestureRecognizer) {
        enabledHapticFeedback()
        
        if day9Height.constant == 60 {
            day9Height.constant = 220
            hideExtendedDayLabels(hidden: false, label0: day9SummaryLabel, label1: day9Slot1, label2: day9Slot2, label3: day9Slot3, label4: day9Slot4, label5: day9Slot5, label6: day9Slot6!, label7: day9Slot7, label8: day9Slot8, label9: day9Slot9, label10: day9Slot10)
            setExtendedDayLabels(summary: day9Summary, precip: day9Precip, humidity: day9Humidity, dewPoint: day9DewPoint, visibility: day9Visibility, sunrise: day9Sunrise, accum: day9PrecipAccum, wind: day9Wind, windGust: day9WindGust, windBearing: day9WindBearing, pressure: day9Pressure, uvIndex: day9UVIndex, sunset: day9Sunset, label0: day9SummaryLabel, label1: day9Slot1, label2: day9Slot2, label3: day9Slot3, label4: day9Slot4, label5: day9Slot5, label6: day9Slot6, label7: day9Slot7, label8: day9Slot8, label9: day9Slot9, label10: day9Slot10)
        } else {
            day9Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day9SummaryLabel, label1: day9Slot1, label2: day9Slot2, label3: day9Slot3, label4: day9Slot4, label5: day9Slot5, label6: day9Slot6!, label7: day9Slot7, label8: day9Slot8, label9: day9Slot9, label10: day9Slot10)
        }
    }
    
    // MARK: - Set current condition labels
    func setCurrentConditionOutlets() {
        if (defaults.string(forKey: "dataSource") == "ClimaCell") {
            conditionSlotLabel4.isHidden = false
            currentConditionViewHeight.constant = 135
            conditionSlotLabel4.text = "AQ is \(airQualityConcern.lowercased())"
        } else {
            conditionSlotLabel4.isHidden = true
            currentConditionViewHeight.constant = 115
        }
        
        if minuteSummary.isEmpty == false && minuteSummary != "none" {
            // Check if there is current precipitation
            if precipitation >= 80 && precipitationType != "none" && endingMinuteSummary != "none" {
                currentConditonLabel.text = "\(precipitationType.capitalizingFirstLetter()) stops in \(endingMinuteSummary)."
            }
        }
        
        conditionSlotLabel0.text = "Feels like \(feelsLikeTemperature)°"
        conditionSlotLabel1.text = "Precipitation \(precipitation)%"
        
        if uvIndex < 2 {
            conditionSlotLabel3.text = "UV index low (\(uvIndex))"
        } else if uvIndex >= 3 && uvIndex <= 5 {
            conditionSlotLabel3.text = "UV index moderate (\(uvIndex))"
        } else if uvIndex >= 6 && uvIndex <= 7 {
            conditionSlotLabel3.text = "UV index high (\(uvIndex))"
        } else if uvIndex >= 8 && uvIndex <= 10 {
            conditionSlotLabel3.text = "UV index very high (\(uvIndex))"
        } else if uvIndex >= 11 {
            conditionSlotLabel3.text = "UV index extreme (\(uvIndex))"
        }
        
        if windGust == wind {
            conditionSlotLabel2.text = "Wind \(wind)\(unitsWindSpeed) \(windBearing)"
        } else {
            conditionSlotLabel2.text = "Wind \(wind)(\(windGust))\(unitsWindSpeed) \(windBearing)"
        }
    }
    
    // MARK: - Set extended current condition labels
    func setExtendedCurrentConditionOutlets() {
        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            conditionSlotLabel0.text = "Humidity \(humidity)%"
            conditionSlotLabel1.text = "Pressure \(pressure)\(unitsPressure)"
            conditionSlotLabel4.isHidden = true

            if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
                conditionSlotLabel2.text = "Clouds \(cloudCover)% & decr."
            } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
                conditionSlotLabel2.text = "Clouds \(cloudCover)% & incr."
            } else {
                conditionSlotLabel2.text = "Clouds \(cloudCover)%"
            }
            
            if currentCondition.contains("night") {
                conditionSlotLabel3.text = "Sunrise \(sunrise)"
            } else {
                conditionSlotLabel3.text = "Sunset \(sunset)"
            }
        } else {
            currentConditionViewHeight.constant = 115
            conditionSlotLabel0.text = "Accum. \(precipAccumulation)\(unitsPrecipitation)"
            conditionSlotLabel1.text = "Humidity \(humidity)%"

            if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
                conditionSlotLabel2.text = "Clouds \(cloudCover)% & decr."
            } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
                conditionSlotLabel2.text = "Clouds \(cloudCover)% & incr."
            } else {
                conditionSlotLabel2.text = "Clouds \(cloudCover)%"
            }
            
            if currentCondition.contains("night") {
                conditionSlotLabel3.text = "Sunrise \(sunrise)"
            } else {
                conditionSlotLabel3.text = "Sunset \(sunset)"
            }
        }
    }
    
    // MARK: - Set weather data labels
    func setWeatherDataLabels() {
        setCurrentConditionOutlets()
        setHourlyOutlets0(type: defaults.string(forKey: "defaultHourlyCondition")!)
        setDailyOutlets()
        
        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                changedHourlyValues = "Precip"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                changedHourlyValues = "Temp"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                changedHourlyValues = "Humidity"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                changedHourlyValues = "UV Index"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                changedHourlyValues = "Wind"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud") == true) {
                changedHourlyValues = "Cloud"
            }
        } else {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                changedHourlyValues = "Precip"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Accum") == true) {
                changedHourlyValues = "Accum"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                changedHourlyValues = "Temp"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                changedHourlyValues = "Humidity"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                changedHourlyValues = "UV Index"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                changedHourlyValues = "Wind"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud") == true) {
                changedHourlyValues = "Cloud"
            }
        }
        
        currentLocationLabel.text = currentLocation
        
        // Check if summaries are equal for the hour
        if currentSummary == hourSummary {
            currentSummary = "\(hourSummary.capitalizingFirstLetter()) for the hour."
        }
        
        currentTemperatureLabel.text = "\(currentTemperature)°"
        currentConditonLabel.text = "\(currentSummary.capitalizingFirstLetter())"
        currentConditionIcon.image = UIImage(named: weatherCondition(condition: currentCondition.lowercased(), type: "image", circle: defaults.string(forKey: "defaultConditionIcons")!))
        
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
    
    // MARK: - Haptic feedback
    func enabledHapticFeedback() {
        if (defaults.bool(forKey: "hapticFeedbackEnabled") == true) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

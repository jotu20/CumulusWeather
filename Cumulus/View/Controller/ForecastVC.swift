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
        if weatherLoaded == false || distanceChange == true || userChangedTheme == true {
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
                
                self.day5View.isHidden = true
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
                        self.setTheme()
                    }
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        loadingView.removeFromSuperview()
                        self.setWeatherDataLabels()
                        self.setTheme()
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
        setTheme()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Set the user set theme
    func setTheme() {
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
        hourConditionIcon.image = UIImage(named: setWeatherConditionImage(condition: hourIconString, type: "image", circle: defaults.string(forKey: "defaultConditionIcons")!))
        hourCondtionLabel.text = "\(hourConditionString)"
    }

    // MARK: - Set daily outlets
    func setDayLabelAndIcons(dayViewHeight: NSLayoutConstraint!, dayLabel: UILabel!, dayConditionIcon: UIImageView!, dayLowLabel: UILabel!, dayHighLabel: UILabel!, dayString: String, dateString: String, dayConditionIconString: String, dayLow: Int, dayHigh: Int) {
        
        dayViewHeight.constant = 60
        dayLabel.text = "\(dayString.capitalizingFirstLetter())"
        dayConditionIcon.image = UIImage(named: setWeatherConditionImage(condition: dayConditionIconString, type: "daily", circle: defaults.string(forKey: "defaultConditionIcons")!))
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
            
            hour0Value = "\(HourlyPrecipitation.sharedInstance.hour0 ?? 0)%"
            hour1Value = "\(HourlyPrecipitation.sharedInstance.hour1 ?? 0)%"
            hour2Value = "\(HourlyPrecipitation.sharedInstance.hour2 ?? 0)%"
            hour3Value = "\(HourlyPrecipitation.sharedInstance.hour3 ?? 0)%"
        } else if type.contains("Accum") == true {
            hourlyLabel.text = "Hourly accumulation"
            
            hour0Value = "\(HourlyAccumulation.sharedInstance.hour0 ?? 0)\(unitsPrecipitation)"
            hour1Value = "\(HourlyAccumulation.sharedInstance.hour1 ?? 0)\(unitsPrecipitation)"
            hour2Value = "\(HourlyAccumulation.sharedInstance.hour2 ?? 0)\(unitsPrecipitation)"
            hour3Value = "\(HourlyAccumulation.sharedInstance.hour3 ?? 0)\(unitsPrecipitation)"
        } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(HourlyTemperature.sharedInstance.hour0 ?? 0)°"
            hour1Value = "\(HourlyTemperature.sharedInstance.hour1 ?? 0)°"
            hour2Value = "\(HourlyTemperature.sharedInstance.hour2 ?? 0)°"
            hour3Value = "\(HourlyTemperature.sharedInstance.hour3 ?? 0)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(HourlyHumidity.sharedInstance.hour0 ?? 0)%"
            hour1Value = "\(HourlyHumidity.sharedInstance.hour1 ?? 0)%"
            hour2Value = "\(HourlyHumidity.sharedInstance.hour2 ?? 0)%"
            hour3Value = "\(HourlyHumidity.sharedInstance.hour3 ?? 0)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(HourlyUVIndex.sharedInstance.hour0 ?? 0)"
            hour1Value = "\(HourlyUVIndex.sharedInstance.hour1 ?? 0)"
            hour2Value = "\(HourlyUVIndex.sharedInstance.hour2 ?? 0)"
            hour3Value = "\(HourlyUVIndex.sharedInstance.hour3 ?? 0)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(HourlyWindSpeed.sharedInstance.hour0 ?? 0)\(unitsWindSpeed)"
            hour1Value = "\(HourlyWindSpeed.sharedInstance.hour1 ?? 0)\(unitsWindSpeed)"
            hour2Value = "\(HourlyWindSpeed.sharedInstance.hour2 ?? 0)\(unitsWindSpeed)"
            hour3Value = "\(HourlyWindSpeed.sharedInstance.hour3 ?? 0)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(HourlyCloudCover.sharedInstance.hour0 ?? 0)%"
            hour1Value = "\(HourlyCloudCover.sharedInstance.hour1 ?? 0)%"
            hour2Value = "\(HourlyCloudCover.sharedInstance.hour2 ?? 0)%"
            hour3Value = "\(HourlyCloudCover.sharedInstance.hour3 ?? 0)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: "NOW", hourIconString: HourlyCondition.sharedInstance.hour0 ?? "", hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: Hour.sharedInstance.hour1 ?? "", hourIconString: HourlyCondition.sharedInstance.hour1 ?? "", hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: Hour.sharedInstance.hour2 ?? "", hourIconString: HourlyCondition.sharedInstance.hour2 ?? "", hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: Hour.sharedInstance.hour3 ?? "", hourIconString: HourlyCondition.sharedInstance.hour3 ?? "", hourConditionString: hour3Value)
    }
    
    func setHourlyOutlets1(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""
        
        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(HourlyPrecipitation.sharedInstance.hour4 ?? 0)%"
            hour1Value = "\(HourlyPrecipitation.sharedInstance.hour5 ?? 0)%"
            hour2Value = "\(HourlyPrecipitation.sharedInstance.hour6 ?? 0)%"
            hour3Value = "\(HourlyPrecipitation.sharedInstance.hour7 ?? 0)%"
         } else if type.contains("Accum") == true {
             hourlyLabel.text = "Hourly accumulation"
             
            hour0Value = "\(HourlyAccumulation.sharedInstance.hour4 ?? 0)\(unitsPrecipitation)"
            hour1Value = "\(HourlyAccumulation.sharedInstance.hour5 ?? 0)\(unitsPrecipitation)"
            hour2Value = "\(HourlyAccumulation.sharedInstance.hour6 ?? 0)\(unitsPrecipitation)"
            hour3Value = "\(HourlyAccumulation.sharedInstance.hour7 ?? 0)\(unitsPrecipitation)"
         } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(HourlyTemperature.sharedInstance.hour4 ?? 0)°"
            hour1Value = "\(HourlyTemperature.sharedInstance.hour5 ?? 0)°"
            hour2Value = "\(HourlyTemperature.sharedInstance.hour6 ?? 0)°"
            hour3Value = "\(HourlyTemperature.sharedInstance.hour7 ?? 0)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(HourlyHumidity.sharedInstance.hour4 ?? 0)%"
            hour1Value = "\(HourlyHumidity.sharedInstance.hour5 ?? 0)%"
            hour2Value = "\(HourlyHumidity.sharedInstance.hour6 ?? 0)%"
            hour3Value = "\(HourlyHumidity.sharedInstance.hour7 ?? 0)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(HourlyUVIndex.sharedInstance.hour4 ?? 0)"
            hour1Value = "\(HourlyUVIndex.sharedInstance.hour5 ?? 0)"
            hour2Value = "\(HourlyUVIndex.sharedInstance.hour6 ?? 0)"
            hour3Value = "\(HourlyUVIndex.sharedInstance.hour7 ?? 0)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(HourlyWindSpeed.sharedInstance.hour4 ?? 0)\(unitsWindSpeed)"
            hour1Value = "\(HourlyWindSpeed.sharedInstance.hour5 ?? 0)\(unitsWindSpeed)"
            hour2Value = "\(HourlyWindSpeed.sharedInstance.hour6 ?? 0)\(unitsWindSpeed)"
            hour3Value = "\(HourlyWindSpeed.sharedInstance.hour7 ?? 0)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(HourlyCloudCover.sharedInstance.hour4 ?? 0)%"
            hour1Value = "\(HourlyCloudCover.sharedInstance.hour5 ?? 0)%"
            hour2Value = "\(HourlyCloudCover.sharedInstance.hour6 ?? 0)%"
            hour3Value = "\(HourlyCloudCover.sharedInstance.hour7 ?? 0)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: Hour.sharedInstance.hour4 ?? "", hourIconString: HourlyCondition.sharedInstance.hour4 ?? "", hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: Hour.sharedInstance.hour5 ?? "", hourIconString: HourlyCondition.sharedInstance.hour5 ?? "", hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: Hour.sharedInstance.hour6 ?? "", hourIconString: HourlyCondition.sharedInstance.hour6 ?? "", hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: Hour.sharedInstance.hour7 ?? "", hourIconString: HourlyCondition.sharedInstance.hour7 ?? "", hourConditionString: hour3Value)
    }
    
    func setHourlyOutlets2(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""
        
        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(HourlyPrecipitation.sharedInstance.hour8 ?? 0)%"
            hour1Value = "\(HourlyPrecipitation.sharedInstance.hour9 ?? 0)%"
            hour2Value = "\(HourlyPrecipitation.sharedInstance.hour10 ?? 0)%"
            hour3Value = "\(HourlyPrecipitation.sharedInstance.hour11 ?? 0)%"
         } else if type.contains("Accum") == true {
             hourlyLabel.text = "Hourly accumulation"
             
            hour0Value = "\(HourlyAccumulation.sharedInstance.hour8 ?? 0)\(unitsPrecipitation)"
            hour1Value = "\(HourlyAccumulation.sharedInstance.hour9 ?? 0)\(unitsPrecipitation)"
            hour2Value = "\(HourlyAccumulation.sharedInstance.hour10 ?? 0)\(unitsPrecipitation)"
            hour3Value = "\(HourlyAccumulation.sharedInstance.hour11 ?? 0)\(unitsPrecipitation)"
         } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(HourlyTemperature.sharedInstance.hour8 ?? 0)°"
            hour1Value = "\(HourlyTemperature.sharedInstance.hour9 ?? 0)°"
            hour2Value = "\(HourlyTemperature.sharedInstance.hour10 ?? 0)°"
            hour3Value = "\(HourlyTemperature.sharedInstance.hour11 ?? 0)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(HourlyHumidity.sharedInstance.hour8 ?? 0)%"
            hour1Value = "\(HourlyHumidity.sharedInstance.hour9 ?? 0)%"
            hour2Value = "\(HourlyHumidity.sharedInstance.hour10 ?? 0)%"
            hour3Value = "\(HourlyHumidity.sharedInstance.hour11 ?? 0)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(HourlyUVIndex.sharedInstance.hour8 ?? 0)"
            hour1Value = "\(HourlyUVIndex.sharedInstance.hour9 ?? 0)"
            hour2Value = "\(HourlyUVIndex.sharedInstance.hour10 ?? 0)"
            hour3Value = "\(HourlyUVIndex.sharedInstance.hour11 ?? 0)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(HourlyWindSpeed.sharedInstance.hour8 ?? 0)\(unitsWindSpeed)"
            hour1Value = "\(HourlyWindSpeed.sharedInstance.hour9 ?? 0)\(unitsWindSpeed)"
            hour2Value = "\(HourlyWindSpeed.sharedInstance.hour10 ?? 0)\(unitsWindSpeed)"
            hour3Value = "\(HourlyWindSpeed.sharedInstance.hour11 ?? 0)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(HourlyCloudCover.sharedInstance.hour8 ?? 0)%"
            hour1Value = "\(HourlyCloudCover.sharedInstance.hour9 ?? 0)%"
            hour2Value = "\(HourlyCloudCover.sharedInstance.hour10 ?? 0)%"
            hour3Value = "\(HourlyCloudCover.sharedInstance.hour11 ?? 0)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: Hour.sharedInstance.hour8 ?? "", hourIconString: HourlyCondition.sharedInstance.hour8 ?? "", hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: Hour.sharedInstance.hour9 ?? "", hourIconString: HourlyCondition.sharedInstance.hour9 ?? "", hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: Hour.sharedInstance.hour10 ?? "", hourIconString: HourlyCondition.sharedInstance.hour10 ?? "", hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: Hour.sharedInstance.hour11 ?? "", hourIconString: HourlyCondition.sharedInstance.hour11 ?? "", hourConditionString: hour3Value)
    }
    
    func setHourlyOutlets3(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""

        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(HourlyPrecipitation.sharedInstance.hour12 ?? 0)%"
            hour1Value = "\(HourlyPrecipitation.sharedInstance.hour13 ?? 0)%"
            hour2Value = "\(HourlyPrecipitation.sharedInstance.hour14 ?? 0)%"
            hour3Value = "\(HourlyPrecipitation.sharedInstance.hour15 ?? 0)%"
         } else if type.contains("Accum") == true {
             hourlyLabel.text = "Hourly accumulation"
             
            hour0Value = "\(HourlyAccumulation.sharedInstance.hour12 ?? 0)\(unitsPrecipitation)"
            hour1Value = "\(HourlyAccumulation.sharedInstance.hour13 ?? 0)\(unitsPrecipitation)"
            hour2Value = "\(HourlyAccumulation.sharedInstance.hour14 ?? 0)\(unitsPrecipitation)"
            hour3Value = "\(HourlyAccumulation.sharedInstance.hour15 ?? 0)\(unitsPrecipitation)"
         } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(HourlyTemperature.sharedInstance.hour12 ?? 0)°"
            hour1Value = "\(HourlyTemperature.sharedInstance.hour13 ?? 0)°"
            hour2Value = "\(HourlyTemperature.sharedInstance.hour14 ?? 0)°"
            hour3Value = "\(HourlyTemperature.sharedInstance.hour15 ?? 0)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(HourlyHumidity.sharedInstance.hour12 ?? 0)%"
            hour1Value = "\(HourlyHumidity.sharedInstance.hour13 ?? 0)%"
            hour2Value = "\(HourlyHumidity.sharedInstance.hour14 ?? 0)%"
            hour3Value = "\(HourlyHumidity.sharedInstance.hour15 ?? 0)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(HourlyUVIndex.sharedInstance.hour12 ?? 0)"
            hour1Value = "\(HourlyUVIndex.sharedInstance.hour13 ?? 0)"
            hour2Value = "\(HourlyUVIndex.sharedInstance.hour14 ?? 0)"
            hour3Value = "\(HourlyUVIndex.sharedInstance.hour15 ?? 0)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(HourlyWindSpeed.sharedInstance.hour12 ?? 0)\(unitsWindSpeed)"
            hour1Value = "\(HourlyWindSpeed.sharedInstance.hour13 ?? 0)\(unitsWindSpeed)"
            hour2Value = "\(HourlyWindSpeed.sharedInstance.hour14 ?? 0)\(unitsWindSpeed)"
            hour3Value = "\(HourlyWindSpeed.sharedInstance.hour15 ?? 0)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(HourlyCloudCover.sharedInstance.hour12 ?? 0)%"
            hour1Value = "\(HourlyCloudCover.sharedInstance.hour13 ?? 0)%"
            hour2Value = "\(HourlyCloudCover.sharedInstance.hour14 ?? 0)%"
            hour3Value = "\(HourlyCloudCover.sharedInstance.hour15 ?? 0)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: Hour.sharedInstance.hour12 ?? "", hourIconString: HourlyCondition.sharedInstance.hour12 ?? "", hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: Hour.sharedInstance.hour13 ?? "", hourIconString: HourlyCondition.sharedInstance.hour13 ?? "", hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: Hour.sharedInstance.hour14 ?? "", hourIconString: HourlyCondition.sharedInstance.hour14 ?? "", hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: Hour.sharedInstance.hour15 ?? "", hourIconString: HourlyCondition.sharedInstance.hour15 ?? "", hourConditionString: hour3Value)
    }
    
    func changeHourlyOutlets(type: String) {
        var hour0Value: String = ""
        var hour1Value: String = ""
        var hour2Value: String = ""
        var hour3Value: String = ""
       
        if type.contains("Precip") == true {
            hourlyLabel.text = "Hourly precipitation"
            
            hour0Value = "\(HourlyPrecipitation.sharedInstance.hour0 ?? 0)%"
            hour1Value = "\(HourlyPrecipitation.sharedInstance.hour1 ?? 0)%"
            hour2Value = "\(HourlyPrecipitation.sharedInstance.hour2 ?? 0)%"
            hour3Value = "\(HourlyPrecipitation.sharedInstance.hour3 ?? 0)%"
         } else if type.contains("Accum") == true {
             hourlyLabel.text = "Hourly accumulation"
             
            hour0Value = "\(HourlyAccumulation.sharedInstance.hour0 ?? 0)\(unitsPrecipitation)"
            hour1Value = "\(HourlyAccumulation.sharedInstance.hour1 ?? 0)\(unitsPrecipitation)"
            hour2Value = "\(HourlyAccumulation.sharedInstance.hour2 ?? 0)\(unitsPrecipitation)"
            hour3Value = "\(HourlyAccumulation.sharedInstance.hour3 ?? 0)\(unitsPrecipitation)"
         } else if type.contains("Temp") == true {
            hourlyLabel.text = "Hourly temperature"
            
            hour0Value = "\(HourlyTemperature.sharedInstance.hour0 ?? 0)°"
            hour1Value = "\(HourlyTemperature.sharedInstance.hour1 ?? 0)°"
            hour2Value = "\(HourlyTemperature.sharedInstance.hour2 ?? 0)°"
            hour3Value = "\(HourlyTemperature.sharedInstance.hour3 ?? 0)°"
        } else if type.contains("Humidity") == true {
            hourlyLabel.text = "Hourly humidity"
            
            hour0Value = "\(HourlyHumidity.sharedInstance.hour0 ?? 0)%"
            hour1Value = "\(HourlyHumidity.sharedInstance.hour1 ?? 0)%"
            hour2Value = "\(HourlyHumidity.sharedInstance.hour2 ?? 0)%"
            hour3Value = "\(HourlyHumidity.sharedInstance.hour3 ?? 0)%"
        } else if type.contains("UV Index") == true {
            hourlyLabel.text = "Hourly uv index"
            
            hour0Value = "\(HourlyUVIndex.sharedInstance.hour0 ?? 0)"
            hour1Value = "\(HourlyUVIndex.sharedInstance.hour1 ?? 0)"
            hour2Value = "\(HourlyUVIndex.sharedInstance.hour2 ?? 0)"
            hour3Value = "\(HourlyUVIndex.sharedInstance.hour3 ?? 0)"
        } else if type.contains("Wind") == true {
            hourlyLabel.text = "Hourly wind"
            
            hour0Value = "\(HourlyWindSpeed.sharedInstance.hour0 ?? 0)\(unitsWindSpeed)"
            hour1Value = "\(HourlyWindSpeed.sharedInstance.hour1 ?? 0)\(unitsWindSpeed)"
            hour2Value = "\(HourlyWindSpeed.sharedInstance.hour2 ?? 0)\(unitsWindSpeed)"
            hour3Value = "\(HourlyWindSpeed.sharedInstance.hour3 ?? 0)\(unitsWindSpeed)"
        } else if type.contains("Cloud") == true {
            hourlyLabel.text = "Hourly cloud cover"
            
            hour0Value = "\(HourlyCloudCover.sharedInstance.hour0 ?? 0)%"
            hour1Value = "\(HourlyCloudCover.sharedInstance.hour1 ?? 0)%"
            hour2Value = "\(HourlyCloudCover.sharedInstance.hour2 ?? 0)%"
            hour3Value = "\(HourlyCloudCover.sharedInstance.hour3 ?? 0)%"
        }
        
        setHourLabelAndIcons(hourTimeLabel: hour0TimeLabel, hourConditionIcon: hour0ConditionIcon, hourCondtionLabel: hour0ConditionLabel, hourTimeString: "NOW", hourIconString: HourlyCondition.sharedInstance.hour0 ?? "", hourConditionString: hour0Value)
        setHourLabelAndIcons(hourTimeLabel: hour1TimeLabel, hourConditionIcon: hour1ConditionIcon, hourCondtionLabel: hour1ConditionLabel, hourTimeString: Hour.sharedInstance.hour1 ?? "", hourIconString: HourlyCondition.sharedInstance.hour1 ?? "", hourConditionString: hour1Value)
        setHourLabelAndIcons(hourTimeLabel: hour2TimeLabel, hourConditionIcon: hour2ConditionIcon, hourCondtionLabel: hour2ConditionLabel, hourTimeString: Hour.sharedInstance.hour2 ?? "", hourIconString: HourlyCondition.sharedInstance.hour2 ?? "", hourConditionString: hour2Value)
        setHourLabelAndIcons(hourTimeLabel: hour3TimeLabel, hourConditionIcon: hour3ConditionIcon, hourCondtionLabel: hour3ConditionLabel, hourTimeString: Hour.sharedInstance.hour3 ?? "", hourIconString: HourlyCondition.sharedInstance.hour3 ?? "", hourConditionString: hour3Value)
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
        
        setDayLabelAndIcons(dayViewHeight: day0Height, dayLabel: day0Label, dayConditionIcon: day0ConditionIcon, dayLowLabel: day0LowLabel, dayHighLabel: day0HighLabel, dayString: Day0.sharedInstance.dayStringFull ?? "", dateString: Day0.sharedInstance.dateString ?? "", dayConditionIconString: Day0.sharedInstance.condition ?? "", dayLow: Day0.sharedInstance.low ?? 0, dayHigh: Day0.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day1Height, dayLabel: day1Label, dayConditionIcon: day1ConditionIcon, dayLowLabel: day1LowLabel, dayHighLabel: day1HighLabel, dayString: Day1.sharedInstance.dayStringFull ?? "", dateString: Day1.sharedInstance.dateString ?? "", dayConditionIconString: Day1.sharedInstance.condition ?? "", dayLow: Day1.sharedInstance.low ?? 0, dayHigh: Day1.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day2Height, dayLabel: day2Label, dayConditionIcon: day2ConditionIcon, dayLowLabel: day2LowLabel, dayHighLabel: day2HighLabel, dayString: Day2.sharedInstance.dayStringFull ?? "", dateString: Day2.sharedInstance.dateString ?? "", dayConditionIconString: Day2.sharedInstance.condition ?? "", dayLow: Day2.sharedInstance.low ?? 0, dayHigh: Day2.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day3Height, dayLabel: day3Label, dayConditionIcon: day3ConditionIcon, dayLowLabel: day3LowLabel, dayHighLabel: day3HighLabel, dayString: Day3.sharedInstance.dayStringFull ?? "", dateString: Day3.sharedInstance.dateString ?? "", dayConditionIconString: Day3.sharedInstance.condition ?? "", dayLow: Day3.sharedInstance.low ?? 0, dayHigh: Day3.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day4Height, dayLabel: day4Label, dayConditionIcon: day4ConditionIcon, dayLowLabel: day4LowLabel, dayHighLabel: day4HighLabel, dayString: Day4.sharedInstance.dayStringFull ?? "", dateString: Day4.sharedInstance.dateString ?? "", dayConditionIconString: Day4.sharedInstance.condition ?? "", dayLow: Day4.sharedInstance.low ?? 0, dayHigh: Day4.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day5Height, dayLabel: day5Label, dayConditionIcon: day5ConditionIcon, dayLowLabel: day5LowLabel, dayHighLabel: day5HighLabel, dayString: Day5.sharedInstance.dayStringFull ?? "", dateString: Day5.sharedInstance.dateString ?? "", dayConditionIconString: Day5.sharedInstance.condition ?? "", dayLow: Day5.sharedInstance.low ?? 0, dayHigh: Day5.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day6Height, dayLabel: day6Label, dayConditionIcon: day6ConditionIcon, dayLowLabel: day6LowLabel, dayHighLabel: day6HighLabel, dayString: Day6.sharedInstance.dayStringFull ?? "", dateString: Day6.sharedInstance.dateString ?? "", dayConditionIconString: Day6.sharedInstance.condition ?? "", dayLow: Day6.sharedInstance.low ?? 0, dayHigh: Day6.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day7Height, dayLabel: day7Label, dayConditionIcon: day7ConditionIcon, dayLowLabel: day7LowLabel, dayHighLabel: day7HighLabel, dayString: Day7.sharedInstance.dayStringFull ?? "", dateString: Day7.sharedInstance.dateString ?? "", dayConditionIconString: Day7.sharedInstance.condition ?? "", dayLow: Day7.sharedInstance.low ?? 0, dayHigh: Day7.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day8Height, dayLabel: day8Label, dayConditionIcon: day8ConditionIcon, dayLowLabel: day8LowLabel, dayHighLabel: day8HighLabel, dayString: Day8.sharedInstance.dayStringFull ?? "", dateString: Day8.sharedInstance.dateString ?? "", dayConditionIconString: Day8.sharedInstance.condition ?? "", dayLow: Day8.sharedInstance.low ?? 0, dayHigh: Day8.sharedInstance.high ?? 0)
        setDayLabelAndIcons(dayViewHeight: day9Height, dayLabel: day9Label, dayConditionIcon: day9ConditionIcon, dayLowLabel: day9LowLabel, dayHighLabel: day9HighLabel, dayString: Day9.sharedInstance.dayStringFull ?? "", dateString: Day9.sharedInstance.dateString ?? "", dayConditionIconString: Day9.sharedInstance.condition ?? "", dayLow: Day9.sharedInstance.low ?? 0, dayHigh: Day9.sharedInstance.high ?? 0)
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
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour4 {
            setHourlyOutlets1(type: changedHourlyValues)
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour8 {
            setHourlyOutlets2(type: changedHourlyValues)
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour12 {
            setHourlyOutlets3(type: changedHourlyValues)
        }
    }
  
    // When tapped show extended hourly conditions
    @IBAction func hourlyConditionsGestureSwipeLeftTapped(_ sender: UISwipeGestureRecognizer) {
        if hour0TimeLabel.text == "NOW" {
            setHourlyOutlets1(type: changedHourlyValues)
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour4 {
            setHourlyOutlets2(type: changedHourlyValues)
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour8 {
            setHourlyOutlets3(type: changedHourlyValues)
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour12 {
            setHourlyOutlets0(type: changedHourlyValues)
        }
    }
    
    // When tapped show extended hourly conditions
    @IBAction func hourlyConditionsGestureSwipeRightTapped(_ sender: UISwipeGestureRecognizer) {
        if hour0TimeLabel.text == "NOW" {
            setHourlyOutlets3(type: changedHourlyValues)
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour12 {
            setHourlyOutlets2(type: changedHourlyValues)
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour8 {
            setHourlyOutlets1(type: changedHourlyValues)
        } else if hour0TimeLabel.text == Hour.sharedInstance.hour4 {
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
            setExtendedDayLabels(summary: Day0.sharedInstance.summary ?? "", precip: Day0.sharedInstance.precip ?? 0, humidity: Day0.sharedInstance.humidity ?? 0, dewPoint: Day0.sharedInstance.dewPoint , visibility: Day0.sharedInstance.visibility, sunrise: Day0.sharedInstance.sunrise ?? "", accum: Day0.sharedInstance.precipAccum ?? 0, wind: Day0.sharedInstance.wind ?? 0, windGust: Day0.sharedInstance.windGust, windBearing: Day0.sharedInstance.windBearing, pressure: Day0.sharedInstance.pressure, uvIndex: Day0.sharedInstance.uvIndex, sunset: Day0.sharedInstance.sunset ?? "", label0: day0SummaryLabel, label1: day0Slot1, label2: day0Slot2, label3: day0Slot3, label4: day0Slot4, label5: day0Slot5, label6: day0Slot6, label7: day0Slot7, label8: day0Slot8, label9: day0Slot9, label10: day0Slot10)
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
            setExtendedDayLabels(summary: Day1.sharedInstance.summary ?? "", precip: Day1.sharedInstance.precip ?? 0, humidity: Day1.sharedInstance.humidity ?? 0, dewPoint: Day1.sharedInstance.dewPoint , visibility: Day1.sharedInstance.visibility, sunrise: Day1.sharedInstance.sunrise ?? "", accum: Day1.sharedInstance.precipAccum ?? 0, wind: Day1.sharedInstance.wind ?? 0, windGust: Day1.sharedInstance.windGust, windBearing: Day1.sharedInstance.windBearing, pressure: Day1.sharedInstance.pressure, uvIndex: Day1.sharedInstance.uvIndex, sunset: Day1.sharedInstance.sunset ?? "", label0: day1SummaryLabel, label1: day1Slot1, label2: day1Slot2, label3: day1Slot3, label4: day1Slot4, label5: day1Slot5, label6: day1Slot6, label7: day1Slot7, label8: day1Slot8, label9: day1Slot9, label10: day1Slot10)
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
            setExtendedDayLabels(summary: Day2.sharedInstance.summary ?? "", precip: Day2.sharedInstance.precip ?? 0, humidity: Day2.sharedInstance.humidity ?? 0, dewPoint: Day2.sharedInstance.dewPoint , visibility: Day2.sharedInstance.visibility, sunrise: Day2.sharedInstance.sunrise ?? "", accum: Day2.sharedInstance.precipAccum ?? 0, wind: Day2.sharedInstance.wind ?? 0, windGust: Day2.sharedInstance.windGust, windBearing: Day2.sharedInstance.windBearing, pressure: Day2.sharedInstance.pressure, uvIndex: Day2.sharedInstance.uvIndex, sunset: Day2.sharedInstance.sunset ?? "", label0: day2SummaryLabel, label1: day2Slot1, label2: day2Slot2, label3: day2Slot3, label4: day2Slot4, label5: day2Slot5, label6: day2Slot6, label7: day2Slot7, label8: day2Slot8, label9: day2Slot9, label10: day2Slot10)
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
            setExtendedDayLabels(summary: Day3.sharedInstance.summary ?? "", precip: Day3.sharedInstance.precip ?? 0, humidity: Day3.sharedInstance.humidity ?? 0, dewPoint: Day3.sharedInstance.dewPoint , visibility: Day3.sharedInstance.visibility, sunrise: Day3.sharedInstance.sunrise ?? "", accum: Day3.sharedInstance.precipAccum ?? 0, wind: Day3.sharedInstance.wind ?? 0, windGust: Day3.sharedInstance.windGust, windBearing: Day3.sharedInstance.windBearing, pressure: Day3.sharedInstance.pressure, uvIndex: Day3.sharedInstance.uvIndex, sunset: Day3.sharedInstance.sunset ?? "", label0: day3SummaryLabel, label1: day3Slot1, label2: day3Slot2, label3: day3Slot3, label4: day3Slot4, label5: day3Slot5, label6: day3Slot6, label7: day3Slot7, label8: day3Slot8, label9: day3Slot9, label10: day3Slot10)
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
            setExtendedDayLabels(summary: Day4.sharedInstance.summary ?? "", precip: Day4.sharedInstance.precip ?? 0, humidity: Day4.sharedInstance.humidity ?? 0, dewPoint: Day4.sharedInstance.dewPoint , visibility: Day4.sharedInstance.visibility, sunrise: Day4.sharedInstance.sunrise ?? "", accum: Day4.sharedInstance.precipAccum ?? 0, wind: Day4.sharedInstance.wind ?? 0, windGust: Day4.sharedInstance.windGust, windBearing: Day4.sharedInstance.windBearing, pressure: Day4.sharedInstance.pressure, uvIndex: Day4.sharedInstance.uvIndex, sunset: Day4.sharedInstance.sunset ?? "", label0: day4SummaryLabel, label1: day4Slot1, label2: day4Slot2, label3: day4Slot3, label4: day4Slot4, label5: day4Slot5, label6: day4Slot6, label7: day4Slot7, label8: day4Slot8, label9: day4Slot9, label10: day4Slot10)
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
            setExtendedDayLabels(summary: Day5.sharedInstance.summary ?? "", precip: Day5.sharedInstance.precip ?? 0, humidity: Day5.sharedInstance.humidity ?? 0, dewPoint: Day5.sharedInstance.dewPoint , visibility: Day5.sharedInstance.visibility, sunrise: Day5.sharedInstance.sunrise ?? "", accum: Day5.sharedInstance.precipAccum ?? 0, wind: Day5.sharedInstance.wind ?? 0, windGust: Day5.sharedInstance.windGust, windBearing: Day5.sharedInstance.windBearing, pressure: Day5.sharedInstance.pressure, uvIndex: Day5.sharedInstance.uvIndex, sunset: Day5.sharedInstance.sunset ?? "", label0: day5SummaryLabel, label1: day5Slot1, label2: day5Slot2, label3: day5Slot3, label4: day5Slot4, label5: day5Slot5, label6: day5Slot6, label7: day5Slot7, label8: day5Slot8, label9: day5Slot9, label10: day5Slot10)
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
            setExtendedDayLabels(summary: Day6.sharedInstance.summary ?? "", precip: Day6.sharedInstance.precip ?? 0, humidity: Day6.sharedInstance.humidity ?? 0, dewPoint: Day6.sharedInstance.dewPoint , visibility: Day6.sharedInstance.visibility, sunrise: Day6.sharedInstance.sunrise ?? "", accum: Day6.sharedInstance.precipAccum ?? 0, wind: Day6.sharedInstance.wind ?? 0, windGust: Day6.sharedInstance.windGust, windBearing: Day6.sharedInstance.windBearing, pressure: Day6.sharedInstance.pressure, uvIndex: Day6.sharedInstance.uvIndex, sunset: Day6.sharedInstance.sunset ?? "", label0: day6SummaryLabel, label1: day6Slot1, label2: day6Slot2, label3: day6Slot3, label4: day6Slot4, label5: day6Slot5, label6: day6Slot6, label7: day6Slot7, label8: day6Slot8, label9: day6Slot9, label10: day6Slot10)
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
            setExtendedDayLabels(summary: Day7.sharedInstance.summary ?? "", precip: Day7.sharedInstance.precip ?? 0, humidity: Day7.sharedInstance.humidity ?? 0, dewPoint: Day7.sharedInstance.dewPoint , visibility: Day7.sharedInstance.visibility, sunrise: Day7.sharedInstance.sunrise ?? "", accum: Day7.sharedInstance.precipAccum ?? 0, wind: Day7.sharedInstance.wind ?? 0, windGust: Day7.sharedInstance.windGust, windBearing: Day7.sharedInstance.windBearing, pressure: Day7.sharedInstance.pressure, uvIndex: Day7.sharedInstance.uvIndex, sunset: Day7.sharedInstance.sunset ?? "", label0: day7SummaryLabel, label1: day7Slot1, label2: day7Slot2, label3: day7Slot3, label4: day7Slot4, label5: day7Slot5, label6: day7Slot6, label7: day7Slot7, label8: day7Slot8, label9: day7Slot9, label10: day7Slot10)
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
            setExtendedDayLabels(summary: Day8.sharedInstance.summary ?? "", precip: Day8.sharedInstance.precip ?? 0, humidity: Day8.sharedInstance.humidity ?? 0, dewPoint: Day8.sharedInstance.dewPoint , visibility: Day8.sharedInstance.visibility, sunrise: Day8.sharedInstance.sunrise ?? "", accum: Day8.sharedInstance.precipAccum ?? 0, wind: Day8.sharedInstance.wind ?? 0, windGust: Day8.sharedInstance.windGust, windBearing: Day8.sharedInstance.windBearing, pressure: Day8.sharedInstance.pressure, uvIndex: Day8.sharedInstance.uvIndex, sunset: Day8.sharedInstance.sunset ?? "", label0: day8SummaryLabel, label1: day8Slot1, label2: day8Slot2, label3: day8Slot3, label4: day8Slot4, label5: day8Slot5, label6: day8Slot6, label7: day8Slot7, label8: day8Slot8, label9: day8Slot9, label10: day8Slot10)
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
            setExtendedDayLabels(summary: Day9.sharedInstance.summary ?? "", precip: Day9.sharedInstance.precip ?? 0, humidity: Day9.sharedInstance.humidity ?? 0, dewPoint: Day9.sharedInstance.dewPoint , visibility: Day9.sharedInstance.visibility, sunrise: Day9.sharedInstance.sunrise ?? "", accum: Day9.sharedInstance.precipAccum ?? 0, wind: Day9.sharedInstance.wind ?? 0, windGust: Day9.sharedInstance.windGust, windBearing: Day9.sharedInstance.windBearing, pressure: Day9.sharedInstance.pressure, uvIndex: Day9.sharedInstance.uvIndex, sunset: Day9.sharedInstance.sunset ?? "", label0: day9SummaryLabel, label1: day9Slot1, label2: day9Slot2, label3: day9Slot3, label4: day9Slot4, label5: day9Slot5, label6: day9Slot6, label7: day9Slot7, label8: day9Slot8, label9: day9Slot9, label10: day9Slot10)
        } else {
            day9Height.constant = 60
            hideExtendedDayLabels(hidden: true, label0: day9SummaryLabel, label1: day9Slot1, label2: day9Slot2, label3: day9Slot3, label4: day9Slot4, label5: day9Slot5, label6: day9Slot6!, label7: day9Slot7, label8: day9Slot8, label9: day9Slot9, label10: day9Slot10)
        }
    }
    
    // MARK: - Set current condition labels
    func setCurrentConditionOutlets() {
        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            currentConditionViewHeight.constant = 135
            conditionSlotLabel4.text = "\(aqi)"
        } else {
            currentConditionViewHeight.constant = 115
            conditionSlotLabel4.isHidden = true
        }
        
        conditionSlotLabel0.text = "Feels like \(feelsLikeTemperature)°"
        conditionSlotLabel1.text = "Precipitation \(precipitation)%"
        
        if windGust == wind {
            conditionSlotLabel2.text = "Wind \(wind)\(unitsWindSpeed) \(windBearing)"
        } else {
            conditionSlotLabel2.text = "Wind \(wind)(\(windGust))\(unitsWindSpeed) \(windBearing)"
        }
        
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
        } else {
            conditionSlotLabel3.text = "UV index low (0)"
        }
    }
    
    // MARK: - Set extended current condition labels
    func setExtendedCurrentConditionOutlets() {
        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            currentConditionViewHeight.constant = 135
        } else {
            currentConditionViewHeight.constant = 115
            conditionSlotLabel4.isHidden = true
        }
        
        conditionSlotLabel0.text = "Accum. \(precipAccumulation)\(unitsPrecipitation)"
        conditionSlotLabel1.text = "Humidity \(humidity)%"
        conditionSlotLabel2.text = "Pressure \(pressure)\(unitsPressure)"
        
        if cloudCover > HourlyCloudCover.sharedInstance.hour1 ?? 0 || cloudCover > HourlyCloudCover.sharedInstance.hour2 ?? 0 || cloudCover > HourlyCloudCover.sharedInstance.hour3 ?? 0 || cloudCover > HourlyCloudCover.sharedInstance.hour4 ?? 0 {
            conditionSlotLabel3.text = "Clouds \(cloudCover)% & decr."
        } else if cloudCover < HourlyCloudCover.sharedInstance.hour1 ?? 0 || cloudCover < HourlyCloudCover.sharedInstance.hour2 ?? 0 || cloudCover < HourlyCloudCover.sharedInstance.hour3 ?? 0 || cloudCover < HourlyCloudCover.sharedInstance.hour4 ?? 0 {
            conditionSlotLabel3.text = "Clouds \(cloudCover)% & incr."
        } else {
            conditionSlotLabel3.text = "Clouds \(cloudCover)%"
        }
        
        if currentCondition.contains("night") {
            conditionSlotLabel4.text = "Sunrise \(sunrise)"
        } else {
            conditionSlotLabel4.text = "Sunset \(sunset)"
        }
    }
    
    // MARK: - Set weather data labels
    func setWeatherDataLabels() {
        setCurrentConditionOutlets()
        setHourlyOutlets0(type: defaults.string(forKey: "defaultHourlyCondition")!)
        setDailyOutlets()
        
        if (defaults.string(forKey: "dataSource") == "OpenWeather") {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precipitation") == true) {
                changedHourlyValues = "Precip"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temperature") == true) {
                changedHourlyValues = "Temp"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                changedHourlyValues = "Humidity"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV index") == true) {
                changedHourlyValues = "UV Index"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind speed") == true) {
                changedHourlyValues = "Wind"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud cover") == true) {
                changedHourlyValues = "Cloud"
            }
        } else {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precipitation") == true) {
                changedHourlyValues = "Precip"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Accumulation") == true) {
                changedHourlyValues = "Accum"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temperature") == true) {
                changedHourlyValues = "Temp"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                changedHourlyValues = "Humidity"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV index") == true) {
                changedHourlyValues = "UV Index"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind speed") == true) {
                changedHourlyValues = "Wind"
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud cover") == true) {
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
        currentConditionIcon.image = UIImage(named: setWeatherConditionImage(condition: currentCondition.lowercased(), type: "image", circle: defaults.string(forKey: "defaultConditionIcons")!))
        
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

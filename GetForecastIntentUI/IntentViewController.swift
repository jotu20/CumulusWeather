//
//  IntentViewController.swift
//  GetForecastIntentUI
//
//  Created by Joseph Szafarowicz on 10/5/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import IntentsUI
import CoreLocation
import ForecastIO

class IntentViewController: UIViewController, INUIHostedViewControlling, CLLocationManagerDelegate {
    
    @IBOutlet weak var currentConditionIcon: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHighAndLowTemperatureLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var currentConditionLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var precipitationAccumulationLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    
    @IBOutlet weak var day0ConditionImage: UIImageView!
    @IBOutlet weak var day1ConditionImage: UIImageView!
    @IBOutlet weak var day2ConditionImage: UIImageView!
    @IBOutlet weak var day3ConditionImage: UIImageView!
    
    @IBOutlet weak var day0Label: UILabel!
    @IBOutlet weak var day0HighLabel: UILabel!
    @IBOutlet weak var day0LowLabel: UILabel!
    
    @IBOutlet weak var day1Label: UILabel!
    @IBOutlet weak var day1HighLabel: UILabel!
    @IBOutlet weak var day1LowLabel: UILabel!
    
    @IBOutlet weak var day2Label: UILabel!
    @IBOutlet weak var day2HighLabel: UILabel!
    @IBOutlet weak var day2LowLabel: UILabel!
    
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var day3HighLabel: UILabel!
    @IBOutlet weak var day3LowLabel: UILabel!
    
    func setWeatherDataLabels() {
        // Current condition labels
        self.currentConditionIcon.image = UIImage(named: weatherCondition(condition: currentCondition, type: "image", circle: universalIcons))
        self.currentTemperatureLabel.text = "\(currentTemperature)°"
        self.currentHighAndLowTemperatureLabel.text = "↑\(highTemperature)° ↓\(lowTemperature)°"
        self.currentConditionLabel.text = "\(weatherCondition(condition: currentCondition, type: "text", circle: universalIcons))"
        
        self.precipitationLabel.text = "Precip. \(precipitation)%"
        self.precipitationAccumulationLabel.text = "Accum. \(precipAccumulation) \(unitsPrecipitation)"
        self.humidityLabel.text = "Humidity \(humidity)%"
        
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
            windLabel.text = "Wind \(wind)\(unitsWindSpeed) \(windBearing)"
        } else {
            windLabel.text = "Wind \(wind)(\(windGust))\(unitsWindSpeed) \(windBearing)"
        }
        
        // Set cloud cover
        if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
            cloudCoverLabel.text = "Clouds \(cloudCover)% & decr."
        } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
            cloudCoverLabel.text = "Clouds \(cloudCover)% & incr."
        } else {
            cloudCoverLabel.text = "Clouds \(cloudCover)%"
        }
        
        // Day Zero
        self.day0ConditionImage.image = UIImage(named: weatherCondition(condition: day1Condition, type: "daily", circle: universalIcons))
        self.day0Label.text = "\(day1DayStringFull.capitalizingFirstLetter())"
        self.day0HighLabel.text = "\(day1High)°"
        self.day0LowLabel.text = "\(day1Low)°"
        
        // Day One
        self.day1ConditionImage.image = UIImage(named: weatherCondition(condition: day2Condition, type: "daily", circle: universalIcons))
        self.day1Label.text = "\(day2DayStringFull.capitalizingFirstLetter())"
        self.day1HighLabel.text = "\(day2High)°"
        self.day1LowLabel.text = "\(day2Low)°"
        
        // Day Two
        self.day2ConditionImage.image = UIImage(named: weatherCondition(condition: day3Condition, type: "daily", circle: universalIcons))
        self.day2Label.text = "\(day3DayStringFull.capitalizingFirstLetter())"
        self.day2HighLabel.text = "\(day3High)°"
        self.day2LowLabel.text = "\(day3Low)°"
        
        // Day Three
        self.day3ConditionImage.image = UIImage(named: weatherCondition(condition: day4Condition, type: "daily", circle: universalIcons))
        self.day3Label.text = "\(day4DayStringFull.capitalizingFirstLetter())"
        self.day3HighLabel.text = "\(day4High)°"
        self.day3LowLabel.text = "\(day4Low)°"
    }
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        let locationManager = CLLocationManager()
        universalSettings()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        geocode(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!) { placemark, error in
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
        }
        
        if universalDataSource == "Dark Sky" {
            fetchDarkSkyWeatherData()
        } else if universalDataSource == "OpenWeather" {
            fetchOpenWeatherData()
        }
    }
    
    var desiredSize: CGSize {
        let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
        return CGSize(width: width, height: 425)
    }
}

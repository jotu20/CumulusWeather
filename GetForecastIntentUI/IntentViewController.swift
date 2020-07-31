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
    @IBOutlet weak var highAndLowTemperatureLabel: UILabel!
    @IBOutlet weak var currentConditionLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var precipitationAccumulationLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    
    @IBOutlet weak var dayZeroConditionImage: UIImageView!
    @IBOutlet weak var dayOneConditionImage: UIImageView!
    @IBOutlet weak var dayTwoConditionImage: UIImageView!
    @IBOutlet weak var dayThreeConditionImage: UIImageView!
    
    @IBOutlet weak var dayZeroDateLabel: UILabel!
    @IBOutlet weak var dayOneDateLabel: UILabel!
    @IBOutlet weak var dayTwoDateLabel: UILabel!
    @IBOutlet weak var dayThreeDateLabel: UILabel!
    
    @IBOutlet weak var dayZeroHighLowTempLabel: UILabel!
    @IBOutlet weak var dayOneHighLowTempLabel: UILabel!
    @IBOutlet weak var dayTwoHighLowTempLabel: UILabel!
    @IBOutlet weak var dayThreeHighLowTempLabel: UILabel!
    
    @IBOutlet weak var dayZeroPrecipLabel: UILabel!
    @IBOutlet weak var dayOnePrecipLabel: UILabel!
    @IBOutlet weak var dayTwoPrecipLabel: UILabel!
    @IBOutlet weak var dayThreePrecipLabel: UILabel!
    
    func setWeatherDataLabels() {
        // Current condition labels
        self.currentConditionIcon.image = UIImage(named: weatherCondition(condition: currentCondition, type: "image"))
        self.currentTemperatureLabel.text = "\(currentTemperature)°"
        self.highAndLowTemperatureLabel.text = "\(dayZeroHigh)°/\(dayZeroLow)°"
        self.currentConditionLabel.text = "\(weatherCondition(condition: currentCondition, type: "text"))"
        
        self.precipitationLabel.text = "Precip. \(precipitation)%"
        self.precipitationAccumulationLabel.text = "Accum. \(precipAccumulation) \(unitsPrecipitation)"
        
        self.humidityLabel.text = "Humidity \(humidity)%"
        self.uvIndexLabel.text = "UV Index \(uvIndex)"
        
        if windGust == wind {
            self.windLabel.text = "Wind \(wind) \(unitsWindSpeed) \(windDirectionString)"
        } else {
            self.windLabel.text = "Wind \(wind)(\(windGust)) \(unitsWindSpeed) \(windDirectionString)"
        }
        self.cloudCoverLabel.text = "Cloud cover \(cloudCover)%"
        
        // Day Zero
        self.dayZeroConditionImage.image = UIImage(named: weatherCondition(condition: weatherCondition0, type: "daily"))
        self.dayZeroDateLabel.text = "\(dayZeroDayString)"
        self.dayZeroHighLowTempLabel.text = "\(dayZeroHigh)°/\(dayZeroLow)°"
        self.dayZeroPrecipLabel.text = "\(dayZeroPrecip)%"
        
        // Day One
        self.dayOneConditionImage.image = UIImage(named: weatherCondition(condition: weatherCondition1, type: "daily"))
        self.dayOneDateLabel.text = "\(dayOneDayString)"
        self.dayOneHighLowTempLabel.text = "\(dayOneHigh)°/\(dayOneLow)°"
        self.dayOnePrecipLabel.text = "\(dayOnePrecip)%"
        
        // Day Two
        self.dayTwoConditionImage.image = UIImage(named: weatherCondition(condition: weatherCondition2, type: "daily"))
        self.dayTwoDateLabel.text = "\(dayTwoDayString)"
        self.dayTwoHighLowTempLabel.text = "\(dayTwoHigh)°/\(dayTwoLow)°"
        self.dayTwoPrecipLabel.text = "\(dayTwoPrecip)%"
        
        // Day Three
        self.dayThreeConditionImage.image = UIImage(named: weatherCondition(condition: weatherCondition3, type: "daily"))
        self.dayThreeDateLabel.text = "\(dayThreeDayString)"
        self.dayThreeHighLowTempLabel.text = "\(dayThreeHigh)°/\(dayThreeLow)°"
        self.dayThreePrecipLabel.text = "\(dayThreePrecip)%"
    }
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        let locationManager = CLLocationManager()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.distanceFilter = 100
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        let userLocation = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        
        client.getForecast(location: userLocation) { result in
            switch result {
            case .success(let tuple):
                let (currentForecast, _) = tuple
                universalSettings()
                
                if universalUnits == "USA" {
                    client.units = .us
                    client.language = .english
                    unitsTemperature = "F"
                    unitsDistance = "miles"
                    unitsWindSpeed = "mph"
                    unitsPressure = "mB"
                    unitsPrecipitation = "in"
                }
                
                if universalUnits == "UK" {
                    client.units = .uk
                    client.language = .english
                    unitsTemperature = "C"
                    unitsDistance = "miles"
                    unitsWindSpeed = "mph"
                    unitsPressure = "hPa"
                    unitsPrecipitation = "mm"
                }
                
                if universalUnits == "Canada" {
                    client.units = .ca
                    client.language = .english
                    unitsTemperature = "C"
                    unitsDistance = "kilometers"
                    unitsWindSpeed = "km/h"
                    unitsPressure = "hPa"
                    unitsPrecipitation = "mm"
                }
                
                if universalUnits == "International" {
                    client.units = .si
                    client.language = .english
                    unitsTemperature = "C"
                    unitsDistance = "kilometers"
                    unitsWindSpeed = "m/s"
                    unitsPressure = "hPa"
                    unitsPrecipitation = "mm"
                }
                
                // Set timezone to local timezone of location
                TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!
                
                // Manage weather data
                // Get current weather data
                if let current = currentForecast.currently {
                    currentCondition = "\(current.icon!.rawValue)"
                    currentTemperature = Int(current.temperature!)
                    precipitation = dailyPrecipProb(day: current)
                    humidity = dailyHumidityProb(day: current)
                    cloudCover = dailyCloudCoverProb(day: current)
                    uvIndex = Int(current.uvIndex!)
                    wind = Int(current.windSpeed!)
                    windGust = Int(current.windGust!)
                    windDirectionDegree = current.windBearing!
                    windDirectionString = windDirection(degree: windDirectionDegree)
                    
                    if current.precipitationAccumulation != nil {
                        precipAccumulation = Double(current.precipitationAccumulation!)
                    }
                }
                
                // Get weather data for the day
                if let daily = currentForecast.daily {
                    let firstArray = daily.data[0]
                    let fetchArray = firstArray
                    
                    weatherCondition0 = "\(fetchArray.icon!.rawValue)"
                    
                    highTemperature = Int(fetchArray.temperatureHigh!)
                    lowTemperature = Int(fetchArray.temperatureLow!)
                    
                    // Seven day forecast
                    // Day Zero
                    let dayZeroArray = daily.data[0]
                    let fetchDayZeroArray = dayZeroArray
                    
                    // Date
                    dayZeroDayString = dayFormat(date: dayZeroArray.time)
                    
                    // High and Low
                    dayZeroHigh = Int(fetchDayZeroArray.temperatureHigh!)
                    dayZeroLow = Int(fetchDayZeroArray.temperatureLow!)
                    
                    // Precipitation
                    dayZeroPrecip = Int(fetchDayZeroArray.precipitationProbability! * 100)
                    
                    // Day One
                    let dayOneArray = daily.data[1]
                    let fetchDayOneArray = dayOneArray
                    
                    weatherCondition1 = "\(fetchDayOneArray.icon!.rawValue)"
                    
                    // Date
                    dayOneDayString = dayFormat(date: dayOneArray.time)
                    
                    // High and Low
                    dayOneHigh = Int(fetchDayOneArray.temperatureHigh!)
                    dayOneLow = Int(fetchDayOneArray.temperatureLow!)
                    
                    // Precipitation
                    dayOnePrecip = Int(fetchDayOneArray.precipitationProbability! * 100)
                    
                    // Day Two
                    let dayTwoArray = daily.data[2]
                    let fetchDayTwoArray = dayTwoArray
                    
                    weatherCondition2 = "\(fetchDayTwoArray.icon!.rawValue)"
                    
                    // Date
                    dayTwoDayString = dayFormat(date: dayTwoArray.time)
                    
                    // High and Low
                    dayTwoHigh = Int(fetchDayTwoArray.temperatureHigh!)
                    dayTwoLow = Int(fetchDayTwoArray.temperatureLow!)
                    
                    // Precipitation
                    dayTwoPrecip = Int(fetchDayTwoArray.precipitationProbability! * 100)
                    
                    // Day Three
                    let dayThreeArray = daily.data[3]
                    let fetchDayThreeArray = dayThreeArray
                    
                    weatherCondition3 = "\(fetchDayThreeArray.icon!.rawValue)"
                    
                    // Date
                    dayThreeDayString = dayFormat(date: dayThreeArray.time)
                    
                    // High and Low
                    dayThreeHigh = Int(fetchDayThreeArray.temperatureHigh!)
                    dayThreeLow = Int(fetchDayThreeArray.temperatureLow!)
                    
                    // Precipitation
                    dayThreePrecip = Int(fetchDayThreeArray.precipitationProbability! * 100)
                }
                
                DispatchQueue.main.async() {
                    self.setWeatherDataLabels()
                    completion(true, parameters, self.desiredSize)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var desiredSize: CGSize {
        let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
        return CGSize(width: width, height: 425)
    }
}

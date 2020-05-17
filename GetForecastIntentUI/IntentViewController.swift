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
    @IBOutlet weak var apparentTemperatureLabel: UILabel!
    @IBOutlet weak var currentConditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var temperatureImage: UIImageView!
    @IBOutlet weak var precipitationImage: UIImageView!
    @IBOutlet weak var windImage: UIImageView!
    
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
        // Day Zero
        self.currentConditionIcon.image = UIImage(named: weatherCondition(condition: weatherCondition0, type: "daily"))
        self.currentTemperatureLabel.text = "\(currentTemperature)°"
        self.apparentTemperatureLabel.text = "Feels like \(apparentTemperature)°"
        self.currentConditionLabel.text = "\(currentCondition)"
        
        // Set temperature image and label
        self.temperatureLabel.text = "Temperature \(dayZeroHigh)°/\(dayZeroLow)°"
        if universalUnits == "USA" {
            if currentTemperature >= 80 {
                self.temperatureImage.image = UIImage(named: "Temperature high.pdf")
            } else if currentTemperature < 80 && currentTemperature >= 50 {
                self.temperatureImage.image = UIImage(named: "Temperature moderate.pdf")
            } else if currentTemperature < 50 {
                self.temperatureImage.image = UIImage(named: "Temperature low.pdf")
            }
        } else {
            if currentTemperature >= 26 {
                self.temperatureImage.image = UIImage(named: "Temperature high.pdf")
            } else if currentTemperature < 26 && currentTemperature >= 10 {
                self.temperatureImage.image = UIImage(named: "Temperature moderate.pdf")
            } else if currentTemperature < 10 {
                self.temperatureImage.image = UIImage(named: "Temperature low.pdf")
            }
        }
        
        // Set precipitation image and label
        self.precipitationLabel.text = "Precipitation \(precipitation)%"
        if precipitation == 0 {
            self.precipitationImage.image = UIImage(named: "Precipitation none.pdf")
        } else if precipitation <= 20 {
            self.precipitationImage.image = UIImage(named: "Precipitation low.pdf")
        } else if precipitation > 20 && precipitation < 80 {
            self.precipitationImage.image = UIImage(named: "Precipitation moderate.pdf")
        } else if precipitation >= 80 {
            self.precipitationImage.image = UIImage(named: "Precipitation heavy.pdf")
        }
        
        // Set wind image and label
        if windGust == wind {
            self.windLabel.text = "Wind \(wind) \(unitsWindSpeed) \(windDirectionString)"
        } else {
            self.windLabel.text = "Wind \(wind)(\(windGust)) \(unitsWindSpeed) \(windDirectionString)"
        }
        
        if windDirectionString.contains("N") {
            self.windImage.image = UIImage(named: "Wind N.pdf")
        }
        if windDirectionString.contains("NE") {
            self.windImage.image = UIImage(named: "Wind NE.pdf")
        }
        if windDirectionString.contains("E") {
            self.windImage.image = UIImage(named: "Wind E.pdf")
        }
        if windDirectionString.contains("SE") {
            self.windImage.image = UIImage(named: "Wind SE.pdf")
        }
        if windDirectionString.contains("S") {
            self.windImage.image = UIImage(named: "Wind S.pdf")
        }
        if windDirectionString.contains("SW") {
            self.windImage.image = UIImage(named: "Wind SW.pdf")
        }
        if windDirectionString.contains("W") {
            self.windImage.image = UIImage(named: "Wind W.pdf")
        }
        if windDirectionString.contains("NW") {
            self.windImage.image = UIImage(named: "Wind NW.pdf")
        } else {
            self.windImage.image = UIImage(named: "Wind SW.pdf")
        }
        
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
            case .success(let currentForecast, _):
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
                    // Hour Zero
                    currentTemperature = Int(current.temperature!)
                    apparentTemperature = Int(current.apparentTemperature!)
                    currentSummary = "\(current.summary!)"
                    precipHour0 = precipitation
                    wind = Int(current.windSpeed!)
                    windGust = Int(current.windGust!)
                    windDirectionDegree = current.windBearing!
                    windDirectionString = windDirection(degree: windDirectionDegree)
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
        return CGSize(width: width, height: 520)
    }
}

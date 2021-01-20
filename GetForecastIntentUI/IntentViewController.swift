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
    
    @IBOutlet weak var conditionLabel0: UILabel!
    @IBOutlet weak var conditionLabel1: UILabel!
    @IBOutlet weak var conditionLabel2: UILabel!
    @IBOutlet weak var conditionLabel3: UILabel!
    @IBOutlet weak var conditionLabel4: UILabel!
    @IBOutlet weak var conditionLabel5: UILabel!
    
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
        
        self.conditionLabel0.text = "Precip. \(precipitation)%"
        self.conditionLabel1.text = "Accum. \(precipAccumulation) \(unitsPrecipitation)"
        self.conditionLabel2.text = "Humidity \(humidity)%"
        
        // Set uv index
        if uvIndex < 2 {
            conditionLabel3.text = "UV index low (\(uvIndex))"
        } else if uvIndex >= 3 && uvIndex <= 5 {
            conditionLabel3.text = "UV index moderate (\(uvIndex))"
        } else if uvIndex >= 6 && uvIndex <= 7 {
            conditionLabel3.text = "UV index high (\(uvIndex))"
        } else if uvIndex >= 8 && uvIndex <= 10 {
            conditionLabel3.text = "UV index very high (\(uvIndex))"
        } else if uvIndex >= 11 {
            conditionLabel3.text = "UV index extreme (\(uvIndex))"
        }

        // Set wind
        if windGust == wind {
            conditionLabel4.text = "Wind \(wind)\(unitsWindSpeed) \(windBearing)"
        } else {
            conditionLabel4.text = "Wind \(wind)(\(windGust))\(unitsWindSpeed) \(windBearing)"
        }
        
        // Set cloud cover
        if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
            conditionLabel5.text = "Clouds \(cloudCover)% & decr."
        } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
            conditionLabel5.text = "Clouds \(cloudCover)% & incr."
        } else {
            conditionLabel5.text = "Clouds \(cloudCover)%"
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
            universalSettings()
            let dayOneDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
            let dayTwoDate = Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date()
            let dayThreeDate = Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date()
            let dayFourDate = Calendar.current.date(byAdding: .day, value: 4, to: Date()) ?? Date()
            
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
            
            let userLocation = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
            client.getForecast(location: userLocation) { result in
                switch result {
                case .success(let tuple):
                    let (currentForecast, _) = tuple
                    TimeZone.ReferenceType.default = TimeZone(identifier: "\(currentForecast.timezone)")!
                    
                    if let current = currentForecast.currently {
                        currentCondition = "\(current.icon!.rawValue)"
                        currentTemperature = Int(current.temperature!)
                        currentSummary = "\(current.summary!)"
                        precipitation = dailyPrecipProb(day: current)
                        humidity = dailyHumidityProb(day: current)
                        cloudCover = dailyCloudCoverProb(day: current)
                        uvIndex = Int(current.uvIndex!)
                        visibility = Int(current.visibility!)
                        wind = Int(current.windSpeed!)
                        windGust = Int(current.windGust!)
                        windBearing = windDirection(degree: current.windBearing!)
                        
                        if current.precipitationAccumulation != nil {
                            precipAccumulation = Double(current.precipitationAccumulation!)
                        }
                    }
                    
                    client.getForecast(location: userLocation, time: dayOneDate) { result in
                        switch result {
                        case .success(let tuple):
                            let (forecast, _) = tuple
                            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
                            
                        if let daily = forecast.daily {
                            let day1Array = daily.data[0]
                            let fetchDay1Array = day1Array
                            
                            day1Condition = "\(fetchDay1Array.icon!.rawValue)"
                            day1DayStringFull = dayFormat(date: fetchDay1Array.time, fullLength: true)
                            day1Summary = fetchDay1Array.summary ?? "Summary error."
                            day1High = Int(fetchDay1Array.temperatureHigh ?? defaultInteger)
                            day1Low = Int(fetchDay1Array.temperatureLow ?? defaultInteger)
                        }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                    client.getForecast(location: userLocation, time: dayTwoDate) { result in
                        switch result {
                        case .success(let tuple):
                            let (forecast, _) = tuple
                            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
                            
                        if let daily = forecast.daily {
                            let day2Array = daily.data[0]
                            let fetchDay2Array = day2Array
                            
                            day2Condition = "\(fetchDay2Array.icon!.rawValue)"
                            day2DayStringFull = dayFormat(date: fetchDay2Array.time, fullLength: true)
                            day2Summary = fetchDay2Array.summary ?? "Summary error."
                            day2High = Int(fetchDay2Array.temperatureHigh ?? defaultInteger)
                            day2Low = Int(fetchDay2Array.temperatureLow ?? defaultInteger)
                        }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                    client.getForecast(location: userLocation, time: dayThreeDate) { result in
                        switch result {
                        case .success(let tuple):
                            let (forecast, _) = tuple
                            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
                            
                        if let daily = forecast.daily {
                            let day3Array = daily.data[0]
                            let fetchDay3Array = day3Array
                            
                            day3Condition = "\(fetchDay3Array.icon!.rawValue)"
                            day3DayStringFull = dayFormat(date: fetchDay3Array.time, fullLength: true)
                            day3Summary = fetchDay3Array.summary!
                            day3High = Int(fetchDay3Array.temperatureHigh ?? defaultInteger)
                            day3Low = Int(fetchDay3Array.temperatureLow ?? defaultInteger)
                        }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                    client.getForecast(location: userLocation, time: dayFourDate) { result in
                        switch result {
                        case .success(let tuple):
                            let (forecast, _) = tuple
                            TimeZone.ReferenceType.default = TimeZone(identifier: "\(forecast.timezone)")!
                            
                        if let daily = forecast.daily {
                            let day4Array = daily.data[0]
                            let fetchDay4Array = day4Array
                            
                            day4Condition = "\(fetchDay4Array.icon!.rawValue)"
                            day4DayStringFull = dayFormat(date: fetchDay4Array.time, fullLength: true)
                            day4Summary = fetchDay4Array.summary ?? "Summary error."
                            day4High = Int(fetchDay4Array.temperatureHigh ?? defaultInteger)
                            day4Low = Int(fetchDay4Array.temperatureLow ?? defaultInteger)
                        }
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.setWeatherDataLabels()
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
        } else if universalDataSource == "OpenWeather" {
            universalSettings()
            
            if universalUnits == "USA" {
                openWeatherUnits = "imperial"
                unitsTemperature = "F"
                unitsDistance = "miles"
                unitsWindSpeed = "mph"
                unitsPressure = "hPa"
                unitsPrecipitation = "mm"
            }
            
            if universalUnits == "UK" || universalUnits == "Canada" || universalUnits == "Intertnational" {
                openWeatherUnits = "metric"
                unitsTemperature = "C"
                unitsDistance = "meters"
                unitsWindSpeed = "m/s"
                unitsPressure = "hPa"
                unitsPrecipitation = "mm"
            }
            
            fetchOpenWeatherDataAlerts()
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\((locationManager.location?.coordinate.latitude)!)&lon=\((locationManager.location?.coordinate.longitude)!)&units=\(openWeatherUnits)&exclude=minutely,alerts&appid=8426f2e9a7736dbbb6db33e8bc36c0ed") else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) {data, response, error in
                if let data = data {
                  do {
                    let decodedResponse = try JSONDecoder().decode(OpenWeather.self, from: data)

                    currentTemperature = Int(decodedResponse.current.temp)
                    highTemperature = Int(decodedResponse.daily[0].temp.max)
                    lowTemperature = Int(decodedResponse.daily[0].temp.min)
                    currentSummary = decodedResponse.current.currentWeather[0].weatherDescription
                    precipitation = Int(decodedResponse.hourly[0].pop * 100)
                    
                    day1Condition = decodedResponse.daily[1].dailyWeather[0].main.lowercased()
                    day1DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].dt)), fullLength: true)
                    day1Summary = decodedResponse.daily[1].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
                    day1High = Int(decodedResponse.daily[1].temp.max)
                    day1Low = Int(decodedResponse.daily[1].temp.min)
                              
                    day2Condition = decodedResponse.daily[2].dailyWeather[0].main.lowercased()
                    day2DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].dt)), fullLength: true)
                    day2Summary = decodedResponse.daily[2].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
                    day2High = Int(decodedResponse.daily[2].temp.max)
                    day2Low = Int(decodedResponse.daily[2].temp.min)
                    
                    day3Condition = decodedResponse.daily[3].dailyWeather[0].main.lowercased()
                    day3DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].dt)), fullLength: true)
                    day3Summary = decodedResponse.daily[3].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
                    day3High = Int(decodedResponse.daily[3].temp.max)
                    day3Low = Int(decodedResponse.daily[3].temp.min)
                    
                    day4Condition = decodedResponse.daily[4].dailyWeather[0].main.lowercased()
                    day4DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].dt)), fullLength: true)
                    day4Summary = decodedResponse.daily[4].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
                    day4High = Int(decodedResponse.daily[4].temp.max)
                    day4Low = Int(decodedResponse.daily[4].temp.min)
    
                  } catch {
                    debugPrint(error)
                    print(error.localizedDescription)
                  }
                    
                    DispatchQueue.main.async {
                        self.setWeatherDataLabels()
                    }
                    
                  return
                }
            }.resume()
        }
    }
    
    var desiredSize: CGSize {
        let width = self.extensionContext?.hostedViewMaximumAllowedSize.width ?? 320
        return CGSize(width: width, height: 425)
    }
}

//
//  OpenWeatherData.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 12/29/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

// API Key: 8426f2e9a7736dbbb6db33e8bc36c0ed

import Foundation

// MARK: - OpenWeather
struct OpenWeather: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone, timezoneOffset = "timezone_offset", current
    }
}

// MARK: - Current
struct Current: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main, description, icon
    }
}

func fetchOpenWeatherData(lat: Double, long: Double) {
    var openWeatherUnits: String = ""
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
    
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&units=\(openWeatherUnits)&exclude=minutely,hourly,daily&appid=8426f2e9a7736dbbb6db33e8bc36c0ed") else {
        print("Invalid URL")
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) {data, response, error in
        if let data = data {
          do {
            let decodedResponse = try JSONDecoder().decode(OpenWeather.self, from: data)

            currentTemperature = Int(decodedResponse.current.temp)
            currentCondition = decodedResponse.current.weather[0].main
            feelsLikeTemperature = Int(decodedResponse.current.feelsLike)
            currentSummary = decodedResponse.current.weather[0].description
            humidity = Int(decodedResponse.current.humidity)
            cloudCover = Int(decodedResponse.current.clouds)
            uvIndex = Int(decodedResponse.current.uvi)
            pressure = Int(decodedResponse.current.pressure)
            wind = Int(decodedResponse.current.windSpeed)
            windBearing = windDirection(degree: Double(decodedResponse.current.windDeg))

            // precipitation
          } catch {
            debugPrint(error)
            print(error.localizedDescription)
          }
          return
        }
    }.resume()
}

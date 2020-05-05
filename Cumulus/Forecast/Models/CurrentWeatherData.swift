//
//  CurrentWeatherData.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 5/5/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import Foundation

// Fetch Realtime data <1min out
func fetchCurrentWeatherData(latitude: Double, longitude: Double) {
    universalSettings()
    var units: String = ""
    
    if universalUnits == "USA" {
        units = "us"
    }
    
    if universalUnits == "UK" {
        units = "si"
    }
    
    if universalUnits == "Canada" {
        units = "si"
    }
    
    if universalUnits == "International" {
        units = "si"
    }
    
    if let url = URL(string: "https://api.climacell.co/v3/weather/realtime?lat=\(latitude)&lon=\(longitude)&unit_system=\(units)&fields=weather_code%2Cprecipitation%2Cprecipitation_type%2Cprecipitation_accumulation%2Ctemp%2Cfeels_like%2Cwind_speed%2Cwind_gust%2Cwind_direction%2Chumidity%2Cvisibility%2Csunrise%2Csunset%2Ccloud_cover%2Cmoon_phase%2Cepa_aqi&apikey=pSqs1x4glR8edUIRmvTF3aR6FZbuF4EW") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              do {
                let forecast = try JSONDecoder().decode(Weather.self, from: data)
                
                currentCondition = forecast.weatherCode.value
                currentTemperature = Int(forecast.temp.value)
                apparentTemperature = Int(forecast.feelsLike.value)
//                currentSummary = "\(current.summary!)"
                precipitation = Int(forecast.precipitation.value)
                precipAccumulation = forecast.precipitationAccumulation.value
                precipitationType = forecast.precipitationType.value
                humidity = Int(forecast.humidity.value)
                cloudCover = Int(forecast.cloudCover.value)
//                uvIndex = Int(current.uvIndex!)
                visibility = Int(forecast.visibility.value)
//                pressure = Int(current.pressure!)
                wind = Int(forecast.windSpeed.value)
                windGust = Int(forecast.windGust.value)
                windDirectionDegree = forecast.windDirection.value
                windDirectionString = windDirection(degree: windDirectionDegree)
                
                precipHour0 = precipitation
                tempHour0 = currentTemperature
                humidityHour0 = humidity
                uvindexHour0 = uvIndex
                windSpeedHour0 = wind
                cloudCoverHour0 = cloudCover
              } catch let error {
                 print(error)
              }
           }
       }.resume()
    }
}

// MARK: - Weather
struct Weather: Codable {
    let lat, lon: Double
    let temp, feelsLike, windSpeed, windGust, visibility, humidity, windDirection, precipitation, precipitationAccumulation, cloudCover: DoubleAndString
    let weatherCode, precipitationType, sunrise, sunset, moonPhase, observationTime: StringValue
    let epaAqi: IntegerValue

    enum CodingKeys: String, CodingKey {
        case lat, lon, temp
        case weatherCode = "weather_code"
        case feelsLike = "feels_like"
        case windSpeed = "wind_speed"
        case windGust = "wind_gust"
        case visibility, humidity
        case windDirection = "wind_direction"
        case precipitation
        case precipitationType = "precipitation_type"
        case precipitationAccumulation = "precipitation_accumulation"
        case cloudCover = "cloud_cover"
        case sunrise, sunset
        case moonPhase = "moon_phase"
        case epaAqi = "epa_aqi"
        case observationTime = "observation_time"
    }
}

struct DoubleAndString: Codable {
    let value: Double
    let units: String
}

struct IntegerValue: Codable {
    let value: Int
}

struct StringValue: Codable {
    let value: String
}

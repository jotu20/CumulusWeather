//
//  ClimaCellWeatherData.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 9/16/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import Foundation

// Fetch Realtime data <1min out
func fetchClimaCellCurrentForecastData() {
    universalSettings()
    
    var units: String = ""
    
    if universalUnits == "USA" {
        units = "us"
        unitsTemperature = "F"
        unitsDistance = "miles"
        unitsWindSpeed = "mph"
        unitsPressure = "mB"
        unitsPrecipitation = "in"
    }

    if universalUnits == "UK" || universalUnits == "Canada" || universalUnits == "International" {
        units = "si"
        unitsTemperature = "C"
        unitsDistance = "kilometers"
        unitsWindSpeed = "m/s"
        unitsPressure = "hPa"
        unitsPrecipitation = "mm"
    }
    
    if let url = URL(string: "https://api.climacell.co/v3/weather/realtime?lat=\(latitudeValue)&lon=\(longitudeValue)&unit_system=\(units)&fields=weather_code%2Cprecipitation%2Cprecipitation_type%2Ctemp%2Cfeels_like%2Cwind_speed%2Cwind_gust%2Cwind_direction%2Chumidity%2Cvisibility%2Cbaro_pressure%2Csunrise%2Csunset%2Ccloud_cover%2Cepa_health_concern&apikey=pSqs1x4glR8edUIRmvTF3aR6FZbuF4EW") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
              do {
                let forecast = try JSONDecoder().decode(Weather.self, from: data)
                
//                currentCondition = "\(current.icon!.rawValue)"
                currentTemperature = Int(forecast.temp.value)
                feelsLikeTemperature = Int(forecast.feelsLike.value)
                currentSummary = "\(forecast.weatherCode.value.capitalizingFirstLetter())"
                precipitation = Int(forecast.precipitation.value)
                humidity = Int(forecast.humidity.value)
                cloudCover = Int(forecast.cloudCover.value)
//                uvIndex = Int(current.uvIndex!)
                visibility = Int(forecast.visibility.value)
                pressure = Int(forecast.pressure.value)
                wind = Int(forecast.windSpeed.value)
                windGust = Int(forecast.windGust.value)
//                windDirectionDegree = current.windBearing!
                windDirectionString = windDirection(degree: forecast.windDirection.value)
                print(forecast.windDirection.value)
                print(windDirectionString)
//
//                if current.precipitationAccumulation != nil {
//                    precipAccumulation = Double(current.precipitationAccumulation!)
//                }
//
                precipitationType = "\(forecast.precipitationType.value)"

//
//                precipHour0 = precipitation
//                tempHour0 = currentTemperature
//                humidityHour0 = humidity
//                uvindexHour0 = uvIndex
//                windSpeedHour0 = wind
//                cloudCoverHour0 = cloudCover
                
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
    let temp, feelsLike, windSpeed, windGust, visibility, pressure, humidity, windDirection, precipitation, cloudCover: DoubleAndString
    let weatherCode, precipitationType, sunrise, sunset, observationTime, epaHealthConcern: StringValue

    enum CodingKeys: String, CodingKey {
        case lat, lon, temp
        case weatherCode = "weather_code"
        case feelsLike = "feels_like"
        case windSpeed = "wind_speed"
        case windGust = "wind_gust"
        case visibility, humidity
        case pressure = "baro_pressure"
        case windDirection = "wind_direction"
        case precipitation
        case precipitationType = "precipitation_type"
        case cloudCover = "cloud_cover"
        case sunrise, sunset
        case observationTime = "observation_time"
        case epaHealthConcern = "epa_health_concern"
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

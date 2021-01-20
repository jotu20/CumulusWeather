//
//  OpenWeatherData.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 12/29/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//
// API Key: 8426f2e9a7736dbbb6db33e8bc36c0ed

import Foundation

var openWeatherUnits: String = ""

// MARK: - OpenWeather
struct OpenWeather: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
}

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
    let currentWeather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case currentWeather = "weather"
    }
}

struct Hourly: Codable {
    let dt: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let hourlyWeather: [Weather]
    let pop: Double
    let hourlyRain: HourlyRain?

    enum CodingKeys: String, CodingKey {
        case dt, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case hourlyWeather = "weather"
        case hourlyRain = "rain"
        case pop
    }
}

struct HourlyRain: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

struct Daily: Codable {
    let dt, sunrise, sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let dailyWeather: [DailyWeather]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let uvi: Double

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case dailyWeather = "weather"
        case clouds, pop, rain, uvi
    }
}

struct DailyWeather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: - OpenWeatherAlerts
struct OpenWeatherAlerts: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let alerts: [Alert]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case alerts
    }
}

struct Alert: Codable {
    let senderName, event: String
    let start, end: Int
    let alertDescription: String

    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event, start, end
        case alertDescription = "description"
    }
}

func conditionIcon(id: Int, main: String, icon: String) -> String {
    var conditionIcon: String = ""

    if icon == "01d" {
        // clear sky
        conditionIcon = "clear"
    } else if icon == "01n" {
        // clear sky
        conditionIcon = "clear-night"
    } else if icon == "02d" {
        // few clouds
        conditionIcon = "partly-cloudy"
    } else if icon == "02n" {
        // few clouds
        conditionIcon = "partly-cloudy-night"
    } else if icon == "03d" || icon == "03n" {
        // scattered clouds
        conditionIcon = "mostly-cloudy"
    } else if icon == "04d" || icon == "04n" {
        // broken clouds
        conditionIcon = "cloudy"
    } else if id == 500 {
        conditionIcon = "light-rain"
    } else if id == 501 {
        conditionIcon = "moderate-rain"
    } else if id == 502 || id == 503 || id == 504 {
        conditionIcon = "heavy-rain"
    } else if id == 511 {
        conditionIcon = "freezing-rain"
    } else if id == 600 {
        conditionIcon = "light-snow"
    } else if id == 601 {
        conditionIcon = "snow"
    } else if id == 602 {
        conditionIcon = "heavy-snow"
    } else if id == 611 {
        conditionIcon = "ice-pellets"
    } else if id == 612 {
        conditionIcon = "light-ice-pellets"
    } else if id == 613 {
        conditionIcon = "heavy-ice-pellets"
    } else if id == 620 {
        conditionIcon = "light-snow"
    } else if id == 621 {
        conditionIcon = "snow"
    } else if id == 622 {
        conditionIcon = "heavy-snow"
    } else {
        conditionIcon = main
    }
    
    return conditionIcon
}

func fetchOpenWeatherDataAlerts() {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitudeValue)&lon=\(longitudeValue)&units=\(openWeatherUnits)&exclude=minutely,hourly,daily&appid=8426f2e9a7736dbbb6db33e8bc36c0ed") else {
        print("Invalid URL")
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) {data, response, error in
        
        if let data = data {
          do {
            let decodedResponse = try JSONDecoder().decode(OpenWeatherAlerts.self, from: data)
            
            if decodedResponse.alerts.count > 0 {
                alertCount = decodedResponse.alerts.count
                alertTitle = decodedResponse.alerts[0].event
                alertDescription = decodedResponse.alerts[0].alertDescription
            }
          } catch {
            debugPrint(error)
            print(error.localizedDescription)
          }
          return
        }
    }.resume()
}

func fetchOpenWeatherData() {
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
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitudeValue)&lon=\(longitudeValue)&units=\(openWeatherUnits)&exclude=minutely,alerts&appid=8426f2e9a7736dbbb6db33e8bc36c0ed") else {
        print("Invalid URL")
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) {data, response, error in
        if let data = data {
          do {
            let decodedResponse = try JSONDecoder().decode(OpenWeather.self, from: data)

            // MARK: - Current
            currentCondition = conditionIcon(id: decodedResponse.current.currentWeather[0].id, main: decodedResponse.current.currentWeather[0].main.lowercased(), icon: decodedResponse.current.currentWeather[0].icon.lowercased())
            currentTemperature = Int(decodedResponse.current.temp)
            feelsLikeTemperature = Int(decodedResponse.current.feelsLike)
            highTemperature = Int(decodedResponse.daily[0].temp.max)
            lowTemperature = Int(decodedResponse.daily[0].temp.min)
            currentSummary = decodedResponse.current.currentWeather[0].weatherDescription
            precipitation = Int(decodedResponse.hourly[0].pop * 100)
            humidity = Int(decodedResponse.current.humidity)
            cloudCover = Int(decodedResponse.current.clouds)
            uvIndex = Int(decodedResponse.current.uvi)
            pressure = Int(decodedResponse.current.pressure)
            wind = Int(decodedResponse.current.windSpeed)
            windGust = wind
            windBearing = windDirection(degree: Double(decodedResponse.current.windDeg))
            
            sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.current.sunrise)))
            sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.current.sunset)))

            // MARK: - Hourly
            hour0 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[0].dt)))
            conditionHour0 = currentCondition
            precipHour0 = Int(decodedResponse.hourly[0].pop * 100)
            tempHour0 = Int(decodedResponse.hourly[0].temp)
            humidityHour0 = Int(decodedResponse.hourly[0].humidity)
            uvindexHour0 = Int(decodedResponse.hourly[0].uvi)
            windSpeedHour0 = Int(decodedResponse.hourly[0].windSpeed)
            cloudCoverHour0 = Int(decodedResponse.hourly[0].clouds)

            hour1 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[1].dt)))
            conditionHour1 = conditionIcon(id: decodedResponse.hourly[1].hourlyWeather[0].id, main: decodedResponse.hourly[1].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[1].hourlyWeather[0].icon.lowercased())
            precipHour1 = Int(decodedResponse.hourly[1].pop * 100)
            tempHour1 = Int(decodedResponse.hourly[1].temp)
            humidityHour1 = Int(decodedResponse.hourly[1].humidity)
            uvindexHour1 = Int(decodedResponse.hourly[1].uvi)
            windSpeedHour1 = Int(decodedResponse.hourly[1].windSpeed)
            cloudCoverHour1 = Int(decodedResponse.hourly[1].clouds)
            
            hour2 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[2].dt)))
            conditionHour2 = conditionIcon(id: decodedResponse.hourly[2].hourlyWeather[0].id, main: decodedResponse.hourly[2].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[2].hourlyWeather[0].icon.lowercased())
            precipHour2 = Int(decodedResponse.hourly[2].pop * 100)
            tempHour2 = Int(decodedResponse.hourly[2].temp)
            humidityHour2 = Int(decodedResponse.hourly[2].humidity)
            uvindexHour2 = Int(decodedResponse.hourly[2].uvi)
            windSpeedHour2 = Int(decodedResponse.hourly[2].windSpeed)
            cloudCoverHour2 = Int(decodedResponse.hourly[2].clouds)
            
            hour3 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[3].dt)))
            conditionHour3 = conditionIcon(id: decodedResponse.hourly[3].hourlyWeather[0].id, main: decodedResponse.hourly[3].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[3].hourlyWeather[0].icon.lowercased())
            precipHour3 = Int(decodedResponse.hourly[3].pop * 100)
            tempHour3 = Int(decodedResponse.hourly[3].temp)
            humidityHour3 = Int(decodedResponse.hourly[3].humidity)
            uvindexHour3 = Int(decodedResponse.hourly[3].uvi)
            windSpeedHour3 = Int(decodedResponse.hourly[3].windSpeed)
            cloudCoverHour3 = Int(decodedResponse.hourly[3].clouds)
            
            hour4 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[4].dt)))
            conditionHour4 = conditionIcon(id: decodedResponse.hourly[4].hourlyWeather[0].id, main: decodedResponse.hourly[4].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[4].hourlyWeather[0].icon.lowercased())
            precipHour4 = Int(decodedResponse.hourly[4].pop * 100)
            tempHour4 = Int(decodedResponse.hourly[4].temp)
            humidityHour4 = Int(decodedResponse.hourly[4].humidity)
            uvindexHour4 = Int(decodedResponse.hourly[4].uvi)
            windSpeedHour4 = Int(decodedResponse.hourly[4].windSpeed)
            cloudCoverHour4 = Int(decodedResponse.hourly[4].clouds)
            
            hour5 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[5].dt)))
            conditionHour5 = conditionIcon(id: decodedResponse.hourly[5].hourlyWeather[0].id, main: decodedResponse.hourly[5].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[5].hourlyWeather[0].icon.lowercased())
            precipHour5 = Int(decodedResponse.hourly[5].pop * 100)
            tempHour5 = Int(decodedResponse.hourly[5].temp)
            humidityHour5 = Int(decodedResponse.hourly[5].humidity)
            uvindexHour5 = Int(decodedResponse.hourly[5].uvi)
            windSpeedHour5 = Int(decodedResponse.hourly[5].windSpeed)
            cloudCoverHour5 = Int(decodedResponse.hourly[5].clouds)
            
            hour6 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[6].dt)))
            conditionHour6 = conditionIcon(id: decodedResponse.hourly[6].hourlyWeather[0].id, main: decodedResponse.hourly[6].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[6].hourlyWeather[0].icon.lowercased())
            precipHour6 = Int(decodedResponse.hourly[6].pop * 100)
            tempHour6 = Int(decodedResponse.hourly[6].temp)
            humidityHour6 = Int(decodedResponse.hourly[6].humidity)
            uvindexHour6 = Int(decodedResponse.hourly[6].uvi)
            windSpeedHour6 = Int(decodedResponse.hourly[6].windSpeed)
            cloudCoverHour6 = Int(decodedResponse.hourly[6].clouds)
            
            hour7 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[7].dt)))
            conditionHour7 = conditionIcon(id: decodedResponse.hourly[7].hourlyWeather[0].id, main: decodedResponse.hourly[7].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[7].hourlyWeather[0].icon.lowercased())
            precipHour7 = Int(decodedResponse.hourly[7].pop * 100)
            tempHour7 = Int(decodedResponse.hourly[7].temp)
            humidityHour7 = Int(decodedResponse.hourly[7].humidity)
            uvindexHour7 = Int(decodedResponse.hourly[7].uvi)
            windSpeedHour7 = Int(decodedResponse.hourly[7].windSpeed)
            cloudCoverHour7 = Int(decodedResponse.hourly[7].clouds)
            
            hour8 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[8].dt)))
            conditionHour8 = conditionIcon(id: decodedResponse.hourly[8].hourlyWeather[0].id, main: decodedResponse.hourly[8].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[8].hourlyWeather[0].icon.lowercased())
            precipHour8 = Int(decodedResponse.hourly[8].pop * 100)
            tempHour8 = Int(decodedResponse.hourly[8].temp)
            humidityHour8 = Int(decodedResponse.hourly[8].humidity)
            uvindexHour8 = Int(decodedResponse.hourly[8].uvi)
            windSpeedHour8 = Int(decodedResponse.hourly[8].windSpeed)
            cloudCoverHour8 = Int(decodedResponse.hourly[8].clouds)
            
            hour9 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[9].dt)))
            conditionHour9 = conditionIcon(id: decodedResponse.hourly[9].hourlyWeather[0].id, main: decodedResponse.hourly[9].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[9].hourlyWeather[0].icon.lowercased())
            precipHour9 = Int(decodedResponse.hourly[9].pop * 100)
            tempHour9 = Int(decodedResponse.hourly[9].temp)
            humidityHour9 = Int(decodedResponse.hourly[9].humidity)
            uvindexHour9 = Int(decodedResponse.hourly[9].uvi)
            windSpeedHour9 = Int(decodedResponse.hourly[9].windSpeed)
            cloudCoverHour9 = Int(decodedResponse.hourly[9].clouds)
            
            hour10 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[10].dt)))
            conditionHour10 = conditionIcon(id: decodedResponse.hourly[10].hourlyWeather[0].id, main: decodedResponse.hourly[10].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[10].hourlyWeather[0].icon.lowercased())
            precipHour10 = Int(decodedResponse.hourly[10].pop * 100)
            tempHour10 = Int(decodedResponse.hourly[10].temp)
            humidityHour10 = Int(decodedResponse.hourly[10].humidity)
            uvindexHour10 = Int(decodedResponse.hourly[10].uvi)
            windSpeedHour10 = Int(decodedResponse.hourly[10].windSpeed)
            cloudCoverHour10 = Int(decodedResponse.hourly[10].clouds)
            
            hour11 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[11].dt)))
            conditionHour11 = conditionIcon(id: decodedResponse.hourly[11].hourlyWeather[0].id, main: decodedResponse.hourly[11].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[11].hourlyWeather[0].icon.lowercased())
            precipHour11 = Int(decodedResponse.hourly[11].pop * 100)
            tempHour11 = Int(decodedResponse.hourly[11].temp)
            humidityHour11 = Int(decodedResponse.hourly[11].humidity)
            uvindexHour11 = Int(decodedResponse.hourly[11].uvi)
            windSpeedHour11 = Int(decodedResponse.hourly[11].windSpeed)
            cloudCoverHour11 = Int(decodedResponse.hourly[11].clouds)
            
            hour12 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[12].dt)))
            conditionHour12 = conditionIcon(id: decodedResponse.hourly[12].hourlyWeather[0].id, main: decodedResponse.hourly[12].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[12].hourlyWeather[0].icon.lowercased())
            precipHour12 = Int(decodedResponse.hourly[12].pop * 100)
            tempHour12 = Int(decodedResponse.hourly[12].temp)
            humidityHour12 = Int(decodedResponse.hourly[12].humidity)
            uvindexHour12 = Int(decodedResponse.hourly[12].uvi)
            windSpeedHour12 = Int(decodedResponse.hourly[12].windSpeed)
            cloudCoverHour12 = Int(decodedResponse.hourly[12].clouds)
            
            hour13 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[13].dt)))
            conditionHour13 = conditionIcon(id: decodedResponse.hourly[13].hourlyWeather[0].id, main: decodedResponse.hourly[13].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[13].hourlyWeather[0].icon.lowercased())
            precipHour13 = Int(decodedResponse.hourly[13].pop * 100)
            tempHour13 = Int(decodedResponse.hourly[13].temp)
            humidityHour13 = Int(decodedResponse.hourly[13].humidity)
            uvindexHour13 = Int(decodedResponse.hourly[13].uvi)
            windSpeedHour13 = Int(decodedResponse.hourly[13].windSpeed)
            cloudCoverHour13 = Int(decodedResponse.hourly[13].clouds)
            
            hour14 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[14].dt)))
            conditionHour14 = conditionIcon(id: decodedResponse.hourly[14].hourlyWeather[0].id, main: decodedResponse.hourly[14].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[14].hourlyWeather[0].icon.lowercased())
            precipHour14 = Int(decodedResponse.hourly[14].pop * 100)
            tempHour14 = Int(decodedResponse.hourly[14].temp)
            humidityHour14 = Int(decodedResponse.hourly[14].humidity)
            uvindexHour14 = Int(decodedResponse.hourly[14].uvi)
            windSpeedHour14 = Int(decodedResponse.hourly[14].windSpeed)
            cloudCoverHour14 = Int(decodedResponse.hourly[14].clouds)
            
            hour15 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[15].dt)))
            conditionHour15 = conditionIcon(id: decodedResponse.hourly[15].hourlyWeather[0].id, main: decodedResponse.hourly[15].hourlyWeather[0].main.lowercased(), icon: decodedResponse.hourly[15].hourlyWeather[0].icon.lowercased())
            precipHour15 = Int(decodedResponse.hourly[15].pop * 100)
            tempHour15 = Int(decodedResponse.hourly[15].temp)
            humidityHour15 = Int(decodedResponse.hourly[15].humidity)
            uvindexHour15 = Int(decodedResponse.hourly[15].uvi)
            windSpeedHour15 = Int(decodedResponse.hourly[15].windSpeed)
            cloudCoverHour15 = Int(decodedResponse.hourly[15].clouds)
            
            // MARK: - Daily
            day0Condition = decodedResponse.daily[0].dailyWeather[0].main.lowercased()
            day0DayString = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].dt)), fullLength: false)
            day0DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].dt)), fullLength: true)
            day0DateString = dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].dt)))
            day0Summary = decodedResponse.daily[0].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            day0Sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].sunrise)))
            day0Sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].sunset)))
            day0High = Int(decodedResponse.daily[0].temp.max)
            day0Low = Int(decodedResponse.daily[0].temp.min)
            day0Precip = Int(decodedResponse.daily[0].pop * 100)
            day0Humidity = Int(decodedResponse.daily[0].humidity)
            day0Wind = decodedResponse.daily[0].windSpeed
            day0WindGust = day1Wind
            day0WindBearing = windDirection(degree: Double(decodedResponse.daily[0].windDeg))
            day0DewPoint = Int(decodedResponse.daily[0].dewPoint)
            day0Pressure = Double(decodedResponse.daily[0].pressure)
            day0UVIndex = Int(decodedResponse.daily[0].uvi)
            
            day1Condition = decodedResponse.daily[1].dailyWeather[0].main.lowercased()
            day1DayString = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].dt)), fullLength: false)
            day1DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].dt)), fullLength: true)
            day1DateString = dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].dt)))
            day1Summary = decodedResponse.daily[1].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            day1Sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].sunrise)))
            day1Sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].sunset)))
            day1High = Int(decodedResponse.daily[1].temp.max)
            day1Low = Int(decodedResponse.daily[1].temp.min)
            day1Precip = Int(decodedResponse.daily[1].pop * 100)
            day1Humidity = Int(decodedResponse.daily[1].humidity)
            day1Wind = decodedResponse.daily[1].windSpeed
            day1WindGust = day1Wind
            day1WindBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            day1DewPoint = Int(decodedResponse.daily[1].dewPoint)
            day1Pressure = Double(decodedResponse.daily[1].pressure)
            day1UVIndex = Int(decodedResponse.daily[1].uvi)
                      
            day2Condition = decodedResponse.daily[2].dailyWeather[0].main.lowercased()
            day2DayString = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].dt)), fullLength: false)
            day2DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].dt)), fullLength: true)
            day2DateString = dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].dt)))
            day2Summary = decodedResponse.daily[2].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            day2Sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].sunrise)))
            day2Sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].sunset)))
            day2High = Int(decodedResponse.daily[2].temp.max)
            day2Low = Int(decodedResponse.daily[2].temp.min)
            day2Precip = Int(decodedResponse.daily[2].pop * 100)
            day2Humidity = Int(decodedResponse.daily[2].humidity)
            day2Wind = decodedResponse.daily[2].windSpeed
            day2WindGust = day1Wind
            day2WindBearing = windDirection(degree: Double(decodedResponse.daily[2].windDeg))
            day2DewPoint = Int(decodedResponse.daily[2].dewPoint)
            day2Pressure = Double(decodedResponse.daily[2].pressure)
            day2UVIndex = Int(decodedResponse.daily[2].uvi)
            
            day3Condition = decodedResponse.daily[3].dailyWeather[0].main.lowercased()
            day3DayString = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].dt)), fullLength: false)
            day3DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].dt)), fullLength: true)
            day3DateString = dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].dt)))
            day3Summary = decodedResponse.daily[3].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            day3Sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].sunrise)))
            day3Sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].sunset)))
            day3High = Int(decodedResponse.daily[3].temp.max)
            day3Low = Int(decodedResponse.daily[3].temp.min)
            day3Precip = Int(decodedResponse.daily[3].pop * 100)
            day3Humidity = Int(decodedResponse.daily[3].humidity)
            day3Wind = decodedResponse.daily[3].windSpeed
            day3WindGust = day1Wind
            day3WindBearing = windDirection(degree: Double(decodedResponse.daily[3].windDeg))
            day3DewPoint = Int(decodedResponse.daily[3].dewPoint)
            day3Pressure = Double(decodedResponse.daily[3].pressure)
            day3UVIndex = Int(decodedResponse.daily[3].uvi)
            
            day4Condition = decodedResponse.daily[4].dailyWeather[0].main.lowercased()
            day4DayString = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].dt)), fullLength: false)
            day4DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].dt)), fullLength: true)
            day4DateString = dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].dt)))
            day4Summary = decodedResponse.daily[4].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            day4Sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].sunrise)))
            day4Sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].sunset)))
            day4High = Int(decodedResponse.daily[4].temp.max)
            day4Low = Int(decodedResponse.daily[4].temp.min)
            day4Precip = Int(decodedResponse.daily[4].pop * 100)
            day4Humidity = Int(decodedResponse.daily[4].humidity)
            day4Wind = decodedResponse.daily[4].windSpeed
            day4WindGust = day1Wind
            day4WindBearing = windDirection(degree: Double(decodedResponse.daily[4].windDeg))
            day4DewPoint = Int(decodedResponse.daily[4].dewPoint)
            day4Pressure = Double(decodedResponse.daily[4].pressure)
            day4UVIndex = Int(decodedResponse.daily[4].uvi)
            
            day5Condition = decodedResponse.daily[5].dailyWeather[0].main.lowercased()
            day5DayString = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].dt)), fullLength: false)
            day5DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].dt)), fullLength: true)
            day5DateString = dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].dt)))
            day5Summary = decodedResponse.daily[5].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            day5Sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].sunrise)))
            day5Sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].sunset)))
            day5High = Int(decodedResponse.daily[5].temp.max)
            day5Low = Int(decodedResponse.daily[5].temp.min)
            day5Precip = Int(decodedResponse.daily[5].pop * 100)
            day5Humidity = Int(decodedResponse.daily[5].humidity)
            day5Wind = decodedResponse.daily[5].windSpeed
            day5WindGust = day1Wind
            day5WindBearing = windDirection(degree: Double(decodedResponse.daily[5].windDeg))
            day5DewPoint = Int(decodedResponse.daily[5].dewPoint)
            day5Pressure = Double(decodedResponse.daily[5].pressure)
            day5UVIndex = Int(decodedResponse.daily[5].uvi)
            
            day6Condition = decodedResponse.daily[6].dailyWeather[0].main.lowercased()
            day6DayString = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].dt)), fullLength: false)
            day6DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].dt)), fullLength: true)
            day6DateString = dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].dt)))
            day6Summary = decodedResponse.daily[6].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            day6Sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].sunrise)))
            day6Sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].sunset)))
            day6High = Int(decodedResponse.daily[6].temp.max)
            day6Low = Int(decodedResponse.daily[6].temp.min)
            day6Precip = Int(decodedResponse.daily[6].pop * 100)
            day6Humidity = Int(decodedResponse.daily[6].humidity)
            day6Wind = decodedResponse.daily[6].windSpeed
            day6WindGust = day1Wind
            day6WindBearing = windDirection(degree: Double(decodedResponse.daily[6].windDeg))
            day6DewPoint = Int(decodedResponse.daily[6].dewPoint)
            day6Pressure = Double(decodedResponse.daily[6].pressure)
            day6UVIndex = Int(decodedResponse.daily[6].uvi)
            
            day7Condition = decodedResponse.daily[7].dailyWeather[0].main.lowercased()
            day7DayString = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].dt)), fullLength: false)
            day7DayStringFull = dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].dt)), fullLength: true)
            day7DateString = dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].dt)))
            day7Summary = decodedResponse.daily[7].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            day7Sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].sunrise)))
            day7Sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].sunset)))
            day7High = Int(decodedResponse.daily[7].temp.max)
            day7Low = Int(decodedResponse.daily[7].temp.min)
            day7Precip = Int(decodedResponse.daily[7].pop * 100)
            day7Humidity = Int(decodedResponse.daily[7].humidity)
            day7Wind = decodedResponse.daily[7].windSpeed
            day7WindGust = day1Wind
            day7WindBearing = windDirection(degree: Double(decodedResponse.daily[7].windDeg))
            day7DewPoint = Int(decodedResponse.daily[7].dewPoint)
            day7Pressure = Double(decodedResponse.daily[7].pressure)
            day7UVIndex = Int(decodedResponse.daily[7].uvi)
          } catch {
            debugPrint(error)
            print(error.localizedDescription)
          }
          return
        }
    }.resume()
}

//
//  OpenWeatherModel.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 8/16/21.
//  Copyright © 2021 Joseph Szafarowicz. All rights reserved.
//

import Foundation

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

struct OpenWeatherAQ: Codable {
    let coord: Coord
    let list: [List]
}

struct Coord: Codable {
    let lon, lat: Double
}

struct List: Codable {
    let main: Main
    let components: [String: Double]
    let dt: Int
}

struct Main: Codable {
    let aqi: Int
}

func conditionIcon(id: Int, main: String, icon: String) -> String {
    switch id {
    case 800:
        if icon.contains("n") {
            return "clear-night"
        } else {
            return "clear"
        }
    case 801:
        if icon.contains("n") {
            return "partly-cloudy-night"
        } else {
            return "partly-cloudy"
        }
    case 802:
        return "mostly-cloudy"
    case 803:
        return "mostly-cloudy"
    case 804:
        return "cloudy"
    case 500:
        return "light-rain"
    case 501:
        return "moderate-rain"
    case 502:
        return "heavy-rain"
    case 503:
        return "heavy-rain"
    case 504:
        return "heavy-rain"
    case 511:
        return "freezing-rain"
    case 600:
        return "light-snow"
    case 601:
        return "snow"
    case 602:
        return "heavy-snow"
    case 611:
        return "ice-pellets"
    case 612:
        return "light-ice-pellets"
    case 613:
        return "heavy-ice-pellets"
    case 620:
        return "light-snow"
    case 621:
        return "snow"
    case 622:
        return "heavy-snow"
    default:
        return main
    }
}

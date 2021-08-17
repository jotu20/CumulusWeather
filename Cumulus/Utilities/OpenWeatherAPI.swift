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

func fetchOpenWeatherDataAQ() {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(latitudeValue)&lon=\(longitudeValue)&appid=8426f2e9a7736dbbb6db33e8bc36c0ed") else {
        print("Invalid URL")
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) {data, response, error in
        
        if let data = data {
          do {
            let decodedResponse = try JSONDecoder().decode(OpenWeatherAQ.self, from: data)
            let int = decodedResponse.list[0].main.aqi
            
            if int >= 0 && int <= 50 {
                aqi = "AQI good (\(int))"
            } else if int >= 51 && int <= 100 {
                aqi = "AQI moderate (\(int))"
            } else if int >= 101 && int <= 150 {
                aqi = "AQI unhealthy if sensitive (\(int))"
            } else if int >= 151 && int <= 200 {
                aqi = "AQI unhealthy (\(int))"
            } else if int >= 201 && int <= 300 {
                aqi = "AQI very unhealthy (\(int))"
            } else if int >= 301 {
                aqi = "AQI hazardous (\(int))"
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
    fetchOpenWeatherDataAQ()
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
            Hour.sharedInstance.hour0 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[0].dt)))
            HourlyCondition.sharedInstance.hour0 = currentCondition
            HourlyPrecipitation.sharedInstance.hour0 = Int(decodedResponse.hourly[0].pop * 100)
            HourlyTemperature.sharedInstance.hour0 = Int(decodedResponse.hourly[0].temp)
            HourlyHumidity.sharedInstance.hour0 = Int(decodedResponse.hourly[0].humidity)
            HourlyUVIndex.sharedInstance.hour0 = Int(decodedResponse.hourly[0].uvi)
            HourlyWindSpeed.sharedInstance.hour0 = Int(decodedResponse.hourly[0].windSpeed)
            HourlyCloudCover.sharedInstance.hour0 = Int(decodedResponse.hourly[0].clouds)
            
            Hour.sharedInstance.hour1 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[1].dt)))
            HourlyCondition.sharedInstance.hour1 = currentCondition
            HourlyPrecipitation.sharedInstance.hour1 = Int(decodedResponse.hourly[1].pop * 100)
            HourlyTemperature.sharedInstance.hour1 = Int(decodedResponse.hourly[1].temp)
            HourlyHumidity.sharedInstance.hour1 = Int(decodedResponse.hourly[1].humidity)
            HourlyUVIndex.sharedInstance.hour1 = Int(decodedResponse.hourly[1].uvi)
            HourlyWindSpeed.sharedInstance.hour1 = Int(decodedResponse.hourly[1].windSpeed)
            HourlyCloudCover.sharedInstance.hour1 = Int(decodedResponse.hourly[1].clouds)
            
            Hour.sharedInstance.hour2 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[2].dt)))
            HourlyCondition.sharedInstance.hour2 = currentCondition
            HourlyPrecipitation.sharedInstance.hour2 = Int(decodedResponse.hourly[2].pop * 100)
            HourlyTemperature.sharedInstance.hour2 = Int(decodedResponse.hourly[2].temp)
            HourlyHumidity.sharedInstance.hour2 = Int(decodedResponse.hourly[2].humidity)
            HourlyUVIndex.sharedInstance.hour2 = Int(decodedResponse.hourly[2].uvi)
            HourlyWindSpeed.sharedInstance.hour2 = Int(decodedResponse.hourly[2].windSpeed)
            HourlyCloudCover.sharedInstance.hour2 = Int(decodedResponse.hourly[2].clouds)
            
            Hour.sharedInstance.hour3 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[3].dt)))
            HourlyCondition.sharedInstance.hour3 = currentCondition
            HourlyPrecipitation.sharedInstance.hour3 = Int(decodedResponse.hourly[3].pop * 100)
            HourlyTemperature.sharedInstance.hour3 = Int(decodedResponse.hourly[3].temp)
            HourlyHumidity.sharedInstance.hour3 = Int(decodedResponse.hourly[3].humidity)
            HourlyUVIndex.sharedInstance.hour3 = Int(decodedResponse.hourly[3].uvi)
            HourlyWindSpeed.sharedInstance.hour3 = Int(decodedResponse.hourly[3].windSpeed)
            HourlyCloudCover.sharedInstance.hour3 = Int(decodedResponse.hourly[3].clouds)
            
            Hour.sharedInstance.hour4 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[4].dt)))
            HourlyCondition.sharedInstance.hour4 = currentCondition
            HourlyPrecipitation.sharedInstance.hour4 = Int(decodedResponse.hourly[4].pop * 100)
            HourlyTemperature.sharedInstance.hour4 = Int(decodedResponse.hourly[4].temp)
            HourlyHumidity.sharedInstance.hour4 = Int(decodedResponse.hourly[4].humidity)
            HourlyUVIndex.sharedInstance.hour4 = Int(decodedResponse.hourly[4].uvi)
            HourlyWindSpeed.sharedInstance.hour4 = Int(decodedResponse.hourly[4].windSpeed)
            HourlyCloudCover.sharedInstance.hour4 = Int(decodedResponse.hourly[4].clouds)
            
            Hour.sharedInstance.hour5 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[5].dt)))
            HourlyCondition.sharedInstance.hour5 = currentCondition
            HourlyPrecipitation.sharedInstance.hour5 = Int(decodedResponse.hourly[5].pop * 100)
            HourlyTemperature.sharedInstance.hour5 = Int(decodedResponse.hourly[5].temp)
            HourlyHumidity.sharedInstance.hour5 = Int(decodedResponse.hourly[5].humidity)
            HourlyUVIndex.sharedInstance.hour5 = Int(decodedResponse.hourly[5].uvi)
            HourlyWindSpeed.sharedInstance.hour5 = Int(decodedResponse.hourly[5].windSpeed)
            HourlyCloudCover.sharedInstance.hour5 = Int(decodedResponse.hourly[5].clouds)
            
            Hour.sharedInstance.hour6 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[6].dt)))
            HourlyCondition.sharedInstance.hour6 = currentCondition
            HourlyPrecipitation.sharedInstance.hour6 = Int(decodedResponse.hourly[6].pop * 100)
            HourlyTemperature.sharedInstance.hour6 = Int(decodedResponse.hourly[6].temp)
            HourlyHumidity.sharedInstance.hour6 = Int(decodedResponse.hourly[6].humidity)
            HourlyUVIndex.sharedInstance.hour6 = Int(decodedResponse.hourly[6].uvi)
            HourlyWindSpeed.sharedInstance.hour6 = Int(decodedResponse.hourly[6].windSpeed)
            HourlyCloudCover.sharedInstance.hour6 = Int(decodedResponse.hourly[6].clouds)
            
            Hour.sharedInstance.hour7 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[7].dt)))
            HourlyCondition.sharedInstance.hour7 = currentCondition
            HourlyPrecipitation.sharedInstance.hour7 = Int(decodedResponse.hourly[7].pop * 100)
            HourlyTemperature.sharedInstance.hour7 = Int(decodedResponse.hourly[7].temp)
            HourlyHumidity.sharedInstance.hour7 = Int(decodedResponse.hourly[7].humidity)
            HourlyUVIndex.sharedInstance.hour7 = Int(decodedResponse.hourly[7].uvi)
            HourlyWindSpeed.sharedInstance.hour7 = Int(decodedResponse.hourly[7].windSpeed)
            HourlyCloudCover.sharedInstance.hour7 = Int(decodedResponse.hourly[7].clouds)
            
            Hour.sharedInstance.hour8 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[8].dt)))
            HourlyCondition.sharedInstance.hour8 = currentCondition
            HourlyPrecipitation.sharedInstance.hour8 = Int(decodedResponse.hourly[8].pop * 100)
            HourlyTemperature.sharedInstance.hour8 = Int(decodedResponse.hourly[8].temp)
            HourlyHumidity.sharedInstance.hour8 = Int(decodedResponse.hourly[8].humidity)
            HourlyUVIndex.sharedInstance.hour8 = Int(decodedResponse.hourly[8].uvi)
            HourlyWindSpeed.sharedInstance.hour8 = Int(decodedResponse.hourly[8].windSpeed)
            HourlyCloudCover.sharedInstance.hour8 = Int(decodedResponse.hourly[8].clouds)
            
            Hour.sharedInstance.hour9 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[9].dt)))
            HourlyCondition.sharedInstance.hour9 = currentCondition
            HourlyPrecipitation.sharedInstance.hour9 = Int(decodedResponse.hourly[9].pop * 100)
            HourlyTemperature.sharedInstance.hour9 = Int(decodedResponse.hourly[9].temp)
            HourlyHumidity.sharedInstance.hour9 = Int(decodedResponse.hourly[9].humidity)
            HourlyUVIndex.sharedInstance.hour9 = Int(decodedResponse.hourly[9].uvi)
            HourlyWindSpeed.sharedInstance.hour9 = Int(decodedResponse.hourly[9].windSpeed)
            HourlyCloudCover.sharedInstance.hour9 = Int(decodedResponse.hourly[9].clouds)
            
            Hour.sharedInstance.hour10 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[10].dt)))
            HourlyCondition.sharedInstance.hour10 = currentCondition
            HourlyPrecipitation.sharedInstance.hour10 = Int(decodedResponse.hourly[10].pop * 100)
            HourlyTemperature.sharedInstance.hour10 = Int(decodedResponse.hourly[10].temp)
            HourlyHumidity.sharedInstance.hour10 = Int(decodedResponse.hourly[10].humidity)
            HourlyUVIndex.sharedInstance.hour10 = Int(decodedResponse.hourly[10].uvi)
            HourlyWindSpeed.sharedInstance.hour10 = Int(decodedResponse.hourly[10].windSpeed)
            HourlyCloudCover.sharedInstance.hour10 = Int(decodedResponse.hourly[10].clouds)
            
            Hour.sharedInstance.hour11 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[11].dt)))
            HourlyCondition.sharedInstance.hour11 = currentCondition
            HourlyPrecipitation.sharedInstance.hour11 = Int(decodedResponse.hourly[11].pop * 100)
            HourlyTemperature.sharedInstance.hour11 = Int(decodedResponse.hourly[11].temp)
            HourlyHumidity.sharedInstance.hour11 = Int(decodedResponse.hourly[11].humidity)
            HourlyUVIndex.sharedInstance.hour11 = Int(decodedResponse.hourly[11].uvi)
            HourlyWindSpeed.sharedInstance.hour11 = Int(decodedResponse.hourly[11].windSpeed)
            HourlyCloudCover.sharedInstance.hour11 = Int(decodedResponse.hourly[11].clouds)
            
            Hour.sharedInstance.hour12 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[12].dt)))
            HourlyCondition.sharedInstance.hour12 = currentCondition
            HourlyPrecipitation.sharedInstance.hour12 = Int(decodedResponse.hourly[12].pop * 100)
            HourlyTemperature.sharedInstance.hour12 = Int(decodedResponse.hourly[12].temp)
            HourlyHumidity.sharedInstance.hour12 = Int(decodedResponse.hourly[12].humidity)
            HourlyUVIndex.sharedInstance.hour12 = Int(decodedResponse.hourly[12].uvi)
            HourlyWindSpeed.sharedInstance.hour12 = Int(decodedResponse.hourly[12].windSpeed)
            HourlyCloudCover.sharedInstance.hour12 = Int(decodedResponse.hourly[12].clouds)
            
            Hour.sharedInstance.hour13 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[13].dt)))
            HourlyCondition.sharedInstance.hour13 = currentCondition
            HourlyPrecipitation.sharedInstance.hour13 = Int(decodedResponse.hourly[13].pop * 100)
            HourlyTemperature.sharedInstance.hour13 = Int(decodedResponse.hourly[13].temp)
            HourlyHumidity.sharedInstance.hour13 = Int(decodedResponse.hourly[13].humidity)
            HourlyUVIndex.sharedInstance.hour13 = Int(decodedResponse.hourly[13].uvi)
            HourlyWindSpeed.sharedInstance.hour13 = Int(decodedResponse.hourly[13].windSpeed)
            HourlyCloudCover.sharedInstance.hour13 = Int(decodedResponse.hourly[13].clouds)
            
            Hour.sharedInstance.hour14 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[14].dt)))
            HourlyCondition.sharedInstance.hour14 = currentCondition
            HourlyPrecipitation.sharedInstance.hour14 = Int(decodedResponse.hourly[14].pop * 100)
            HourlyTemperature.sharedInstance.hour14 = Int(decodedResponse.hourly[14].temp)
            HourlyHumidity.sharedInstance.hour14 = Int(decodedResponse.hourly[14].humidity)
            HourlyUVIndex.sharedInstance.hour14 = Int(decodedResponse.hourly[14].uvi)
            HourlyWindSpeed.sharedInstance.hour14 = Int(decodedResponse.hourly[14].windSpeed)
            HourlyCloudCover.sharedInstance.hour14 = Int(decodedResponse.hourly[14].clouds)
            
            Hour.sharedInstance.hour15 = hourFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.hourly[15].dt)))
            HourlyCondition.sharedInstance.hour15 = currentCondition
            HourlyPrecipitation.sharedInstance.hour15 = Int(decodedResponse.hourly[15].pop * 100)
            HourlyTemperature.sharedInstance.hour15 = Int(decodedResponse.hourly[15].temp)
            HourlyHumidity.sharedInstance.hour15 = Int(decodedResponse.hourly[15].humidity)
            HourlyUVIndex.sharedInstance.hour15 = Int(decodedResponse.hourly[15].uvi)
            HourlyWindSpeed.sharedInstance.hour15 = Int(decodedResponse.hourly[15].windSpeed)
            HourlyCloudCover.sharedInstance.hour15 = Int(decodedResponse.hourly[15].clouds)
            
            // MARK: Day 0
            Day0.sharedInstance.dateString =  dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].dt)))
            Day0.sharedInstance.dayString =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].dt)), fullLength: false)
            Day0.sharedInstance.dayStringFull =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].dt)), fullLength: true)
            
            Day0.sharedInstance.condition = decodedResponse.daily[0].dailyWeather[0].main.lowercased()
            Day0.sharedInstance.summary = decodedResponse.daily[0].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            
            Day0.sharedInstance.high = Int(decodedResponse.daily[0].temp.max)
            Day0.sharedInstance.low = Int(decodedResponse.daily[0].temp.min)
            Day0.sharedInstance.precip = Int(decodedResponse.daily[0].pop * 100)
            Day0.sharedInstance.humidity = Int(decodedResponse.daily[0].humidity)
            
            Day0.sharedInstance.wind = decodedResponse.daily[0].windSpeed
            Day0.sharedInstance.windGust = decodedResponse.daily[0].windSpeed
            Day0.sharedInstance.windBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            Day0.sharedInstance.dewPoint = Int(decodedResponse.daily[0].dewPoint)
            Day0.sharedInstance.pressure = Double(decodedResponse.daily[0].pressure)
            Day0.sharedInstance.uvIndex = Int(decodedResponse.daily[0].uvi)
            
            Day0.sharedInstance.sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].sunrise)))
            Day0.sharedInstance.sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[0].sunset)))
            
            // MARK: Day 1
            Day1.sharedInstance.dateString =  dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].dt)))
            Day1.sharedInstance.dayString =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].dt)), fullLength: false)
            Day1.sharedInstance.dayStringFull =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].dt)), fullLength: true)
            
            Day1.sharedInstance.condition = decodedResponse.daily[1].dailyWeather[0].main.lowercased()
            Day1.sharedInstance.summary = decodedResponse.daily[1].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            
            Day1.sharedInstance.high = Int(decodedResponse.daily[1].temp.max)
            Day1.sharedInstance.low = Int(decodedResponse.daily[1].temp.min)
            Day1.sharedInstance.precip = Int(decodedResponse.daily[1].pop * 100)
            Day1.sharedInstance.humidity = Int(decodedResponse.daily[1].humidity)
            
            Day1.sharedInstance.wind = decodedResponse.daily[1].windSpeed
            Day1.sharedInstance.windGust = decodedResponse.daily[1].windSpeed
            Day1.sharedInstance.windBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            Day1.sharedInstance.dewPoint = Int(decodedResponse.daily[1].dewPoint)
            Day1.sharedInstance.pressure = Double(decodedResponse.daily[1].pressure)
            Day1.sharedInstance.uvIndex = Int(decodedResponse.daily[1].uvi)
            
            Day1.sharedInstance.sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].sunrise)))
            Day1.sharedInstance.sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[1].sunset)))
                  
            // MARK: Day 2
            Day2.sharedInstance.dateString =  dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].dt)))
            Day2.sharedInstance.dayString =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].dt)), fullLength: false)
            Day2.sharedInstance.dayStringFull =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].dt)), fullLength: true)
            
            Day2.sharedInstance.condition = decodedResponse.daily[2].dailyWeather[0].main.lowercased()
            Day2.sharedInstance.summary = decodedResponse.daily[2].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            
            Day2.sharedInstance.high = Int(decodedResponse.daily[2].temp.max)
            Day2.sharedInstance.low = Int(decodedResponse.daily[2].temp.min)
            Day2.sharedInstance.precip = Int(decodedResponse.daily[2].pop * 100)
            Day2.sharedInstance.humidity = Int(decodedResponse.daily[2].humidity)
            
            Day2.sharedInstance.wind = decodedResponse.daily[2].windSpeed
            Day2.sharedInstance.windGust = decodedResponse.daily[2].windSpeed
            Day2.sharedInstance.windBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            Day2.sharedInstance.dewPoint = Int(decodedResponse.daily[2].dewPoint)
            Day2.sharedInstance.pressure = Double(decodedResponse.daily[2].pressure)
            Day2.sharedInstance.uvIndex = Int(decodedResponse.daily[2].uvi)
            
            Day2.sharedInstance.sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].sunrise)))
            Day2.sharedInstance.sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[2].sunset)))
            
            // MARK: Day 3
            Day3.sharedInstance.dateString =  dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].dt)))
            Day3.sharedInstance.dayString =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].dt)), fullLength: false)
            Day3.sharedInstance.dayStringFull =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].dt)), fullLength: true)
            
            Day3.sharedInstance.condition = decodedResponse.daily[3].dailyWeather[0].main.lowercased()
            Day3.sharedInstance.summary = decodedResponse.daily[3].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            
            Day3.sharedInstance.high = Int(decodedResponse.daily[3].temp.max)
            Day3.sharedInstance.low = Int(decodedResponse.daily[3].temp.min)
            Day3.sharedInstance.precip = Int(decodedResponse.daily[3].pop * 100)
            Day3.sharedInstance.humidity = Int(decodedResponse.daily[3].humidity)
            
            Day3.sharedInstance.wind = decodedResponse.daily[3].windSpeed
            Day3.sharedInstance.windGust = decodedResponse.daily[3].windSpeed
            Day3.sharedInstance.windBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            Day3.sharedInstance.dewPoint = Int(decodedResponse.daily[3].dewPoint)
            Day3.sharedInstance.pressure = Double(decodedResponse.daily[3].pressure)
            Day3.sharedInstance.uvIndex = Int(decodedResponse.daily[3].uvi)
            
            Day3.sharedInstance.sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].sunrise)))
            Day3.sharedInstance.sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[3].sunset)))
            
            // MARK: Day 4
            Day4.sharedInstance.dateString =  dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].dt)))
            Day4.sharedInstance.dayString =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].dt)), fullLength: false)
            Day4.sharedInstance.dayStringFull =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].dt)), fullLength: true)
            
            Day4.sharedInstance.condition = decodedResponse.daily[4].dailyWeather[0].main.lowercased()
            Day4.sharedInstance.summary = decodedResponse.daily[4].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            
            Day4.sharedInstance.high = Int(decodedResponse.daily[4].temp.max)
            Day4.sharedInstance.low = Int(decodedResponse.daily[4].temp.min)
            Day4.sharedInstance.precip = Int(decodedResponse.daily[4].pop * 100)
            Day4.sharedInstance.humidity = Int(decodedResponse.daily[4].humidity)
            
            Day4.sharedInstance.wind = decodedResponse.daily[4].windSpeed
            Day4.sharedInstance.windGust = decodedResponse.daily[4].windSpeed
            Day4.sharedInstance.windBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            Day4.sharedInstance.dewPoint = Int(decodedResponse.daily[4].dewPoint)
            Day4.sharedInstance.pressure = Double(decodedResponse.daily[4].pressure)
            Day4.sharedInstance.uvIndex = Int(decodedResponse.daily[4].uvi)
            
            Day4.sharedInstance.sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].sunrise)))
            Day4.sharedInstance.sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[4].sunset)))
            
            // MARK: Day 5
            Day5.sharedInstance.dateString =  dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].dt)))
            Day5.sharedInstance.dayString =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].dt)), fullLength: false)
            Day5.sharedInstance.dayStringFull =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].dt)), fullLength: true)
            
            Day5.sharedInstance.condition = decodedResponse.daily[5].dailyWeather[0].main.lowercased()
            Day5.sharedInstance.summary = decodedResponse.daily[5].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            
            Day5.sharedInstance.high = Int(decodedResponse.daily[5].temp.max)
            Day5.sharedInstance.low = Int(decodedResponse.daily[5].temp.min)
            Day5.sharedInstance.precip = Int(decodedResponse.daily[5].pop * 100)
            Day5.sharedInstance.humidity = Int(decodedResponse.daily[5].humidity)
            
            Day5.sharedInstance.wind = decodedResponse.daily[5].windSpeed
            Day5.sharedInstance.windGust = decodedResponse.daily[5].windSpeed
            Day5.sharedInstance.windBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            Day5.sharedInstance.dewPoint = Int(decodedResponse.daily[5].dewPoint)
            Day5.sharedInstance.pressure = Double(decodedResponse.daily[5].pressure)
            Day5.sharedInstance.uvIndex = Int(decodedResponse.daily[5].uvi)
            
            Day5.sharedInstance.sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].sunrise)))
            Day5.sharedInstance.sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[5].sunset)))
            
            // MARK: Day 6
            Day6.sharedInstance.dateString =  dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].dt)))
            Day6.sharedInstance.dayString =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].dt)), fullLength: false)
            Day6.sharedInstance.dayStringFull =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].dt)), fullLength: true)
            
            Day6.sharedInstance.condition = decodedResponse.daily[6].dailyWeather[0].main.lowercased()
            Day6.sharedInstance.summary = decodedResponse.daily[6].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            
            Day6.sharedInstance.high = Int(decodedResponse.daily[6].temp.max)
            Day6.sharedInstance.low = Int(decodedResponse.daily[6].temp.min)
            Day6.sharedInstance.precip = Int(decodedResponse.daily[6].pop * 100)
            Day6.sharedInstance.humidity = Int(decodedResponse.daily[6].humidity)
            
            Day6.sharedInstance.wind = decodedResponse.daily[6].windSpeed
            Day6.sharedInstance.windGust = decodedResponse.daily[6].windSpeed
            Day6.sharedInstance.windBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            Day6.sharedInstance.dewPoint = Int(decodedResponse.daily[6].dewPoint)
            Day6.sharedInstance.pressure = Double(decodedResponse.daily[6].pressure)
            Day6.sharedInstance.uvIndex = Int(decodedResponse.daily[6].uvi)
            
            Day6.sharedInstance.sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].sunrise)))
            Day6.sharedInstance.sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[6].sunset)))
            
            // MARK: Day 7
            Day7.sharedInstance.dateString =  dateFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].dt)))
            Day7.sharedInstance.dayString =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].dt)), fullLength: false)
            Day7.sharedInstance.dayStringFull =  dayFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].dt)), fullLength: true)
            
            Day7.sharedInstance.condition = decodedResponse.daily[7].dailyWeather[0].main.lowercased()
            Day7.sharedInstance.summary = decodedResponse.daily[7].dailyWeather[0].weatherDescription.capitalizingFirstLetter()
            
            Day7.sharedInstance.high = Int(decodedResponse.daily[7].temp.max)
            Day7.sharedInstance.low = Int(decodedResponse.daily[7].temp.min)
            Day7.sharedInstance.precip = Int(decodedResponse.daily[7].pop * 100)
            Day7.sharedInstance.humidity = Int(decodedResponse.daily[7].humidity)
            
            Day7.sharedInstance.wind = decodedResponse.daily[7].windSpeed
            Day7.sharedInstance.windGust = decodedResponse.daily[7].windSpeed
            Day7.sharedInstance.windBearing = windDirection(degree: Double(decodedResponse.daily[1].windDeg))
            Day7.sharedInstance.dewPoint = Int(decodedResponse.daily[7].dewPoint)
            Day7.sharedInstance.pressure = Double(decodedResponse.daily[7].pressure)
            Day7.sharedInstance.uvIndex = Int(decodedResponse.daily[7].uvi)
            
            Day7.sharedInstance.sunrise = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].sunrise)))
            Day7.sharedInstance.sunset = sunFormat(date: Date(timeIntervalSince1970: TimeInterval(decodedResponse.daily[7].sunset)))
          } catch {
            debugPrint(error)
            print(error.localizedDescription)
          }
          return
        }
    }.resume()
}

//
//  Cumulus_Widget.swift
//  Cumulus Widget
//
//  Created by Joseph Szafarowicz on 10/3/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import WidgetKit
import SwiftUI
import CoreLocation
import ForecastIO
import Combine

struct ForecastTimeline: TimelineProvider {
    var widgetLocationManager = WidgetLocationManager()
    
    func placeholder(in context: Context) -> ForecastEntry {
        return ForecastEntry(date: Date(), latitude: 37.3230, longitude: -122.0322, currentLocation: "Cupertino,CA", currentCondition: "Partly cloudy", currentTemperature: 79, currentSummary: "Partly cloudy for the hour.")
    }

    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> ()) {
        if widgetLocationManager.locationManager == nil {
            widgetLocationManager.locationManager = CLLocationManager()
            widgetLocationManager.locationManager!.requestWhenInUseAuthorization()
        }
        widgetLocationManager.fetchLocation(handler: { location in
            let entry = ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary)
            return completion(entry)
        })
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [ForecastEntry] = []
        
        if widgetLocationManager.locationManager == nil {
            widgetLocationManager.locationManager = CLLocationManager()
            widgetLocationManager.locationManager!.requestWhenInUseAuthorization()
        }
        widgetLocationManager.fetchLocation(handler: { location in
            let currentDate = Date()
            let entryDate = Calendar.current.date(byAdding: .minute, value: 10, to: currentDate)!
            let entry = ForecastEntry(date: entryDate, latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary)
            entries.append(entry)

            let timeline = Timeline(entries: entries, policy: .after(currentDate))
            completion(timeline)
        })
    }
}

struct ForecastEntry: TimelineEntry {
    let date: Date
    let latitude: Double
    let longitude: Double
    
    var currentLocation: String
    var currentCondition: String
    var currentTemperature: Int
    var currentSummary: String
}

struct CurrentForecastWidgetView : View {
    let data: ForecastEntry

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
            VStack {
                Spacer()
                    .frame(height: 20)
                Text("\(data.currentLocation)")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity, maxHeight: 20, alignment: .bottom)
                HStack {
                    Image(weatherCondition(condition: data.currentCondition, type: "widget", circle: universalIcons))
                        .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                    Text("\(data.currentTemperature)°")
                        .font(.system(size: 30, weight: .semibold, design: .default))
                        .frame(maxWidth: 80, maxHeight: 60, alignment: .leading)
                }
                Text("\(data.currentSummary)")
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

struct HourlyForecastWidgetView : View {
    let data: ForecastEntry
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
            VStack {
                // Current values
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: 10)
                        Text("\(currentLocation)")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                            .frame(maxWidth: 175, maxHeight: 20, alignment: .leading)
                        Text("\(currentTemperature)°")
                            .font(.system(size: 30, weight: .semibold, design: .default))
                            .frame(maxWidth: 80, maxHeight: 30, alignment: .leading)
                    }
                    VStack(alignment: .trailing) {
                        Spacer()
                            .frame(height: 10)
                        Text("\(currentSummary)")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 150, maxHeight: 30, alignment: .trailing)
                        HStack {
                            Text("\(highTemperature)° \(lowTemperature)°")
                                .font(.system(size: 12, weight: .regular, design: .default))
                                .frame(maxWidth: 70, maxHeight: 20, alignment: .center)
                        }
                    }
                }

                // Hourly values
                HStack(spacing: 10) {
                    VStack {
                        Text("NOW")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour1, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour0)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour3)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour3, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour3)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour6)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour6, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour6)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour10)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour10, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour10)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour13)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour13, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour13)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour15)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour15, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour15)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                }
            }
        }
    }
}

struct DailyForecastWidgetView : View {
    let data: ForecastEntry
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
            VStack {
                // Current values
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: 10)
                        Text("\(currentLocation)")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                            .frame(maxWidth: 175, maxHeight: 20, alignment: .leading)
                        Text("\(currentTemperature)°")
                            .font(.system(size: 30, weight: .semibold, design: .default))
                            .frame(maxWidth: 80, maxHeight: 30, alignment: .leading)
                    }
                    VStack(alignment: .trailing) {
                        Spacer()
                            .frame(height: 10)
                        Text("\(currentSummary)")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 150, maxHeight: 30, alignment: .trailing)
                        HStack {
                            Text("\(highTemperature)° \(lowTemperature)°")
                                .font(.system(size: 12, weight: .regular, design: .default))
                                .frame(maxWidth: 70, maxHeight: 20, alignment: .center)
                        }
                    }
                }

                // Hourly values
                HStack(spacing: 10) {
                    VStack {
                        Text("NOW")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour1, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour0)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour3)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour3, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour3)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour6)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour6, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour6)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour10)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour10, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour10)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour13)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour13, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour13)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour15)")
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                            .font(.system(size: 12, weight: .medium, design: .default))
                        Image(weatherCondition(condition: conditionHour15, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour15)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                }
                
                VStack {
                    HStack {
                        Text("\(day1DayStringFull)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 175, maxHeight: 10, alignment: .leading)
                        Image(weatherCondition(condition: day1Condition, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(day1High)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .trailing)
                        Text("\(day1Low)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .leading)
                    }
                    HStack {
                        Text("\(day2DayStringFull)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 175, maxHeight: 10, alignment: .leading)
                        Image(weatherCondition(condition: day2Condition, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(day2High)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .trailing)
                        Text("\(day2Low)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .leading)
                    }
                    HStack {
                        Text("\(day3DayStringFull)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 175, maxHeight: 10, alignment: .leading)
                        Image(weatherCondition(condition: day3Condition, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(day3High)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .trailing)
                        Text("\(day3Low)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .leading)
                    }
                    HStack {
                        Text("\(day4DayStringFull)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 175, maxHeight: 10, alignment: .leading)
                        Image(weatherCondition(condition: day4Condition, type: "widget", circle: universalIcons))
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(day4High)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .trailing)
                        Text("\(day4Low)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .leading)
                    }
                }
            }
        }
    }
}

struct CurrentForecastWidget: Widget {
    private let kind = "CurrentForecastWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ForecastTimeline()) { entry in
            CurrentForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
        }
        .configurationDisplayName("Current Forecast")
        .description("View the current forecast for your area.")
        .supportedFamilies([.systemSmall])
    }
}

struct HourlyForecastWidget: Widget {
    private let kind = "HourlyForecastWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ForecastTimeline()) { entry in
            HourlyForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
        }
        .configurationDisplayName("Hourly Forecast")
        .description("View the hourly forecast for your area.")
        .supportedFamilies([.systemMedium])
    }
}

struct DailyForecastWidget: Widget {
    private let kind = "DailyForecastWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ForecastTimeline()) { entry in
            DailyForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
        }
        .configurationDisplayName("Daily Forecast")
        .description("View the daily forecast for your area.")
        .supportedFamilies([.systemLarge])
    }
}

@main
struct SwiftWidgetsBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        CurrentForecastWidget()
        HourlyForecastWidget()
        DailyForecastWidget()
    }
}

struct Cumulus_Widget_Previews: PreviewProvider {
    static var previews: some View {
        CurrentForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        HourlyForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        DailyForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

class WidgetLocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager? {
        didSet {
            self.locationManager!.delegate = self
        }
    }
    private var handler: ((CLLocation) -> Void)?
    func fetchLocation(handler: @escaping (CLLocation) -> Void) {
        self.handler = handler
        self.locationManager!.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.handler!(locations.last!)
        
//        latitudeValue = 37.3230
//        longitudeValue = -122.0322
        latitudeValue = (manager.location?.coordinate.latitude)!
        longitudeValue = (manager.location?.coordinate.longitude)!
        
        geocode(latitude: latitudeValue, longitude: longitudeValue) { placemark, error in
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
            fetchDarkSkyWeatherData(lat: latitudeValue, long: longitudeValue)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
    
//    func colorCoder() -> Color {
//        let color = universalColor
//        var textColor: Color!
//
//        if color == "Mango" {
//            textColor = Color(mango)
//        }
//        if color == "Maximum Red" {
//            textColor = Color(maximumRed)
//        }
//        if color == "Dodger Blue" {
//            textColor = Color(dodgerBlue)
//        }
//        if color == "Plump Purple" {
//            textColor = Color(plumpPurple)
//        }
//        if color == "Orchid" {
//            textColor = Color(orchid)
//        }
//        if color == "Spring Green" {
//            textColor = Color(springGreen)
//        }
//
//        return textColor
//    }

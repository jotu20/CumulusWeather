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

struct ForecastTimeline: TimelineProvider {
    func placeholder(in context: Context) -> ForecastEntry {
//        let fakeForecast = Forecast(currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Clear")
        ForecastEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> ()) {
//        let fakeForecast = Forecast(currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Clear")
        let entry = ForecastEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ForecastEntry>) -> ()) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
        ForecastLoader.fetch { result in
//            let forecast: Forecast
//            if case .success(let fetchedForecast) = result {
//                forecast = fetchedForecast
//            } else {
//                forecast = Forecast(currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Clear")
//            }
            let entry = ForecastEntry(date: currentDate)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}

//struct Forecast {
//    let currentLocation: String
//    let currentTemperature: String
//    let currentCondition: String
//}

struct ForecastLoader {
    static func fetch(completion: @escaping (Result<Forecast, Error>) -> Void) {
        fetchDarkSkyWeatherData()
    }
//    static func getForecastInfo(fromData data: Foundation.Data) -> Forecast {
//        return Forecast(currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Clear")
//    }
}

struct ForecastEntry: TimelineEntry {
    let date: Date
//    let forecast: Forecast
}

struct CurrentForecastWidgetView : View {
    let entry: ForecastEntry
    
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
            VStack {
                Spacer()
                    .frame(height: 20)
                Text("\(currentLocation)")
                    .font(Font.body.weight(.semibold))
                    .frame(maxWidth: .infinity, maxHeight: 10, alignment: .bottom)
                HStack {
                    Image(weatherCondition(condition: currentCondition, type: "widget", circle: universalIcons))
                        .resizable()
                        .frame(maxWidth: 60, maxHeight: 60, alignment: .center)
                    Text("\(currentTemperature)°")
                        .font(Font.largeTitle.weight(.semibold))
                        .frame(maxWidth: 80, maxHeight: 60, alignment: .leading)
                }
                Text("\(currentSummary)")
                    .font(Font.body.weight(.regular))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

struct HourlyForecastWidgetView : View {
    let entry: ForecastEntry
    
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
            VStack {
                // Current values
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(currentLocation)")
                            .font(Font.body.weight(.semibold))
                            .frame(maxWidth: 175, maxHeight: 10,alignment: .leading)
                        Text("\(currentTemperature)°")
                            .font(Font.largeTitle.weight(.semibold))
                            .frame(maxWidth: 80, maxHeight: 50, alignment: .leading)
                    }
                    VStack(alignment: .trailing) {
                        Text("\(currentSummary)")
                            .font(Font.body.weight(.regular))
                            .frame(maxWidth: 150, maxHeight: 25, alignment: .trailing)
                        HStack {
                            Text("\(highTemperature)° \(lowTemperature)°")
                                .font(Font.body.weight(.regular))
                                .frame(maxWidth: 150, maxHeight: 25, alignment: .trailing)
                        }
                    }
                }

                // Hourly values
                HStack(spacing: 20) {
                    VStack {
                        Text("NOW")
                            .font(Font.subheadline.weight(.medium))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour1, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour0)°")
                            .font(Font.subheadline.weight(.regular))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour3)")
                            .font(Font.subheadline.weight(.medium))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour3, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour3)°")
                            .font(Font.subheadline.weight(.regular))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour6)")
                            .font(Font.subheadline.weight(.medium))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour6, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour6)°")
                            .font(Font.subheadline.weight(.regular))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour10)")
                            .font(Font.subheadline.weight(.medium))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour10, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour10)°")
                            .font(Font.subheadline.weight(.regular))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour13)")
                            .font(Font.subheadline.weight(.medium))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour13, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour13)°")
                            .font(Font.subheadline.weight(.regular))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour15)")
                            .font(Font.subheadline.weight(.medium))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour15, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour15)°")
                            .font(Font.subheadline.weight(.regular))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                }
            }
        }
    }
}

struct CurrentForecastWidget: Widget {
    let kind: String = "CurrentForecastWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ForecastTimeline()) { entry in
            CurrentForecastWidgetView(entry: entry)
        }
        .configurationDisplayName("Current Forecast")
        .description("Shows the current forecast in your area.")
        .supportedFamilies([.systemSmall])
    }
}

struct HourlyForecastWidget: Widget {
    let kind: String = "HourlyForecastWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ForecastTimeline()) { entry in
            HourlyForecastWidgetView(entry: entry)
        }
        .configurationDisplayName("Hourly Forecast")
        .description("Shows the hourly forecasts in your area.")
        .supportedFamilies([.systemMedium])
    }
}

@main
struct SwiftWidgetsBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        CurrentForecastWidget()
        HourlyForecastWidget()
    }
}

struct Cumulus_Widget_Previews: PreviewProvider {
    static var previews: some View {
//        let fakeForecast = Forecast(currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Clear")
        CurrentForecastWidgetView(entry: ForecastEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        HourlyForecastWidgetView(entry: ForecastEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

class LocationManager: NSObject, ObservableObject {
    override init() {
        super.init()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        latitudeValue = (locationManager.location?.coordinate.latitude)! //37.3230
        longitudeValue = (locationManager.location?.coordinate.longitude)! //-122.0322
        fetchDarkSkyWeatherData()

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
        }
    }

    @Published var locationStatus: CLAuthorizationStatus? {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var lastLocation: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }

    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }

        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }
    private let locationManager = CLLocationManager()
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        print(#function, statusString)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.lastLocation = location
        print(#function, location)
    }
}

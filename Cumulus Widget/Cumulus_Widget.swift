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
        return ForecastEntry(date: Date(), latitude: 37.3230, longitude: -122.0322, currentLocation: "Cupertino,CA", currentCondition: "Partly Cloudy", currentTemperature: 79, currentSummary: "Partly cloudy for the hour.")
    }

    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> ()) {
        let entry = ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary)
        return completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ForecastEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 10, to: currentDate)!
        let entry = ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary)
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        completion(timeline)
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

struct PlaceholderView : View {
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
            VStack {
                Spacer()
                    .frame(height: 20)
                Text("Cupertino, CA")
                    .font(Font.body.weight(.semibold))
                    .frame(maxWidth: .infinity, maxHeight: 10, alignment: .bottom)
                HStack {
                    Image("Partly Cloudy")
                        .resizable()
                        .frame(maxWidth: 60, maxHeight: 60, alignment: .center)
                    Text("79°")
                        .font(Font.largeTitle.weight(.semibold))
                        .frame(maxWidth: 80, maxHeight: 60, alignment: .leading)
                }
                Text("Partly cloudy for the hour.")
                    .font(Font.body.weight(.regular))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

struct CurrentForecastWidgetView : View {
    let data: ForecastEntry
    @ObservedObject var locationManager = LocationManager()
    
//    var color = universalColor
//    var textColor: Color!
    var body: some View {
        
//        if color == "Mango" {
//            textColor = mango
//        }
//        if color == "Maximum Red" {
//            textColor = maximumRed
//        }
//        if color == "Dodger Blue" {
//            textColor = dodgerBlue
//        }
//        if color == "Plump Purple" {
//            textColor = plumpPurple
//        }
//        if color == "Orchid" {
//            textColor = orchid
//        }
//        if color == "Spring Green" {
//            textColor = springGreen
//        }
        
        ZStack {
            Color(UIColor.systemBackground)
            VStack {
                Spacer()
                    .frame(height: 20)
                Text("\(data.currentLocation)")
                    .font(Font.body.weight(.semibold))
                    .frame(maxWidth: .infinity, maxHeight: 10, alignment: .bottom)
                HStack {
                    Image(weatherCondition(condition: data.currentCondition, type: "widget", circle: universalIcons))
                        .resizable()
                        .frame(maxWidth: 60, maxHeight: 60, alignment: .center)
                    Text("\(data.currentTemperature)°")
                        .font(Font.largeTitle.weight(.semibold))
                        .frame(maxWidth: 80, maxHeight: 60, alignment: .leading)
                }
                Text("\(data.currentSummary)")
                    .font(Font.body.weight(.regular))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

struct HourlyForecastWidgetView : View {
    let data: ForecastEntry
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
    private let kind = "CurrentForecastWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ForecastTimeline()) { entry in
            CurrentForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
        }
        .configurationDisplayName("Current Forecast")
        .description("Shows the current forecast in your area.")
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
        CurrentForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        HourlyForecastWidgetView(data: ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()

        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
            
//            latitudeValue = 37.3230
//            longitudeValue = -122.0322
//
//            latitudeValue = (locationManager.location?.coordinate.latitude)!
//            longitudeValue = (locationManager.location?.coordinate.longitude)!
//
//            geocode(latitude: latitudeValue, longitude: longitudeValue) { placemark, error in
//                guard let placemark = placemark, error == nil else { return }
//
//                // Set state/province for respective locations
//                if placemark.locality != nil && placemark.administrativeArea != nil && placemark.country != nil {
//                    if placemark.country! == "Micronesia" || placemark.country! == "Myanmar" || placemark.country! == "United States" {
//                        currentLocation = "\(placemark.locality!), \(placemark.administrativeArea!)"
//                    } else if placemark.country! == "Japan" {
//                        currentLocation = "\(placemark.administrativeArea!), \(placemark.country!)"
//                     } else {
//                       currentLocation = "\(placemark.locality!), \(placemark.country!)"
//                    }
//                } else {
//                    currentLocation = "\(placemark.name!), \(placemark.country!)"
//                }
//                self.locationManager.stopUpdatingLocation()
//                fetchDarkSkyWeatherData(lat: latitudeValue, long: longitudeValue)
//            }
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
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        print(#function, statusString)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        latitudeValue = 37.3230 //(manager.location?.coordinate.latitude)!
        longitudeValue = -122.0322 //(manager.location?.coordinate.longitude)!

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
            self.locationManager.stopUpdatingLocation()
            fetchDarkSkyWeatherData(lat: latitudeValue, long: longitudeValue)
        }
    }
}

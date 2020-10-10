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
    var hasFetchedForecastStatus: Bool
    var forecastStatusFromServer: String
    
    func placeholder(in context: Context) -> ForecastEntry {
       return ForecastEntry(date: Date(), currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Partly cloudy for the hour.")
    }

//    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> ()) {
//        let entry = ForecastEntry(date: Date(), currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Partly cloudy for the hour.")
//        completion(entry)
//    }
    
    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> Void) {
        let date = Date()
        let entry: ForecastEntry

        if context.isPreview && !hasFetchedForecastStatus {
            entry = ForecastEntry(date: date, currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Partly cloudy for the hour.")
        } else {
            entry = ForecastEntry(date: date, currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: forecastStatusFromServer)
        }
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ForecastEntry>) -> ()) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 30, to: currentDate)!
        let entry = ForecastEntry(date: Date(), currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Partly cloudy for the hour.")
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        completion(timeline)
    }
}

struct ForecastLoader {
    static func fetch(completion: @escaping (Result<Forecast, Error>) -> Void) {
        let widgetLocationManager = WidgetLocationManager()
        
        widgetLocationManager.fetchLocation(handler: { location in
            latitudeValue = 37.3230 //location.coordinate.latitude  //37.3230
            longitudeValue = -122.0322 //location.coordinate.longitude //-122.0322
            //fetchDarkSkyWeatherData()

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
        })
    }
}

struct ForecastEntry: TimelineEntry {
    let date: Date
    var currentLocation: String
    var currentTemperature: String
    var currentCondition: String
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
    let entry: ForecastEntry
    
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
        StaticConfiguration(kind: kind, provider: ForecastTimeline(hasFetchedForecastStatus: true, forecastStatusFromServer: "Test")) { entry in
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
        StaticConfiguration(kind: kind, provider: ForecastTimeline(hasFetchedForecastStatus: true, forecastStatusFromServer: "Test")) { entry in
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
        CurrentForecastWidgetView(entry: ForecastEntry(date: Date(), currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Partly cloudy for the hour."))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        HourlyForecastWidgetView(entry: ForecastEntry(date: Date(), currentLocation: "Cupertino, CA", currentTemperature: "79°", currentCondition: "Partly cloudy for the hour."))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

class WidgetLocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    private var handler: ((CLLocation) -> Void)?

    override init() {
        super.init()
        DispatchQueue.main.async {
            self.locationManager = CLLocationManager()
            self.locationManager!.delegate = self
            if self.locationManager!.authorizationStatus == .notDetermined {
                self.locationManager!.requestWhenInUseAuthorization()
            }
            
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager!.delegate = self
                self.locationManager!.desiredAccuracy = kCLLocationAccuracyBest
                self.locationManager!.startUpdatingLocation()
            }
        }
    }
    
    func fetchLocation(handler: @escaping (CLLocation) -> Void) {
        self.handler = handler
        self.locationManager!.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.handler!(locations.last!)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

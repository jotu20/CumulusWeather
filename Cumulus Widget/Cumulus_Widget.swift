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
    func placeholder(in context: Context) -> ForecastEntry {
        ForecastEntry(date: Date(), latitude: 37.3230, longitude: -122.0322, currentLocation: "Cupertino,CA", currentCondition: "Partly cloudy", currentTemperature: 79, currentSummary: "Partly cloudy for the hour.")
    }

    func getSnapshot(in context: Context, completion: @escaping (ForecastEntry) -> ()) {
        let entry = ForecastEntry(date: Date(), latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [ForecastEntry] = []

        // Generate a timeline for ten minute intervals, starting from the current date.
        let currentDate = Date()
        let entryDate = Calendar.current.date(byAdding: .minute, value: 10, to: currentDate)!
        let entry = ForecastEntry(date: entryDate, latitude: latitudeValue, longitude: longitudeValue, currentLocation: currentLocation, currentCondition: currentCondition, currentTemperature: currentTemperature, currentSummary: currentSummary)
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .atEnd)
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

struct CurrentForecastWidgetView : View {
    let data: ForecastEntry
    @ObservedObject var lm = LocationManager()
    
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
    @ObservedObject var lm = LocationManager()
    
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
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .frame(maxWidth: 150, maxHeight: 25, alignment: .trailing)
                        HStack {
                            Text("\(highTemperature)° \(lowTemperature)°")
                                .font(.system(size: 15, weight: .regular, design: .default))
                                .frame(maxWidth: 150, maxHeight: 25, alignment: .trailing)
                        }
                    }
                }

                // Hourly values
                HStack(spacing: 20) {
                    VStack {
                        Text("NOW")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour1, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour0)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour3)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour3, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour3)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour6)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour6, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour6)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour10)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour10, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour10)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour13)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour13, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour13)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour15)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour15, type: "widget", circle: universalIcons))
                            .resizable()
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
    @ObservedObject var lm = LocationManager()
    
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
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .frame(maxWidth: 150, maxHeight: 25, alignment: .trailing)
                        HStack {
                            Text("\(highTemperature)° \(lowTemperature)°")
                                .font(.system(size: 15, weight: .regular, design: .default))
                                .frame(maxWidth: 150, maxHeight: 25, alignment: .trailing)
                        }
                    }
                }

                // Hourly values
                HStack(spacing: 20) {
                    VStack {
                        Text("NOW")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour1, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour0)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour3)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour3, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour3)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour6)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour6, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour6)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour10)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour10, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour10)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour13)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour13, type: "widget", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 45, maxHeight: 45, alignment: .center)
                        Text("\(tempHour13)°")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                    }
                    VStack {
                        Text("\(hour15)")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .frame(maxWidth: 45, maxHeight: 10, alignment: .center)
                        Image(weatherCondition(condition: conditionHour15, type: "widget", circle: universalIcons))
                            .resizable()
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
                            .resizable()
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
                            .resizable()
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
                            .resizable()
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
                            .resizable()
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

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
  private let locationManager = CLLocationManager()
  let objectWillChange = PassthroughSubject<Void, Never>()

  @Published var status: CLAuthorizationStatus? {
    willSet { objectWillChange.send() }
  }

  @Published var location: CLLocation? {
    willSet { objectWillChange.send() }
  }

  override init() {
    super.init()

    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
    self.geocoder()
  }

  private func geocoder() {
//    latitudeValue = 37.3230
//    longitudeValue = -122.0322
        latitudeValue = (locationManager.location?.coordinate.latitude)!
        longitudeValue = (locationManager.location?.coordinate.longitude)!
    
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

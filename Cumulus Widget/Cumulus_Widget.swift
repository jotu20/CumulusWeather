//
//  Cumulus_Widget.swift
//  Cumulus Widget
//
//  Created by Joseph Szafarowicz on 9/19/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import WidgetKit
import SwiftUI
import CoreLocation
import ForecastIO

struct WidgetData {
    let date: Date
    let latitude: Double
    let longitude: Double 
}

extension WidgetData {
    static let previewData = WidgetData(date: Date(), latitude: latitudeValue, longitude: longitudeValue)
}

@available(iOS 14.0, *)
struct WidgetView: View {
    let data: WidgetData
    
    @ObservedObject var locationManager = LocationManager()
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        ZStack {
            if widgetFamily == .systemSmall {
                Color(UIColor.systemBackground)
                VStack {
                    Spacer()
                        .frame(height: 20)
                    Text("\(currentLocation)")
                        .font(Font.body.weight(.semibold))
                        .frame(maxWidth: .infinity, maxHeight: 10, alignment: .bottom)
                        .foregroundColor(Color(dodgerBlue))
                    HStack {
                        Image(weatherCondition(condition: currentCondition, type: "image", circle: universalIcons))
                            .resizable()
                            .frame(maxWidth: 60, maxHeight: 60, alignment: .center)
                        Text("\(currentTemperature)°")
                            .font(Font.largeTitle.weight(.semibold))
                            .frame(maxWidth: 80, maxHeight: 60, alignment: .leading)
                            .foregroundColor(Color(dodgerBlue))
                    }
                    Text("\(currentSummary)")
                        .font(Font.body.weight(.regular))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .foregroundColor(Color(dodgerBlue))
                }
            }
            
            if widgetFamily == .systemMedium {
                Color(UIColor.systemBackground)
                VStack {
                    // Current values
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(currentLocation)")
                                .font(Font.body.weight(.semibold))
                                .frame(maxWidth: 175, maxHeight: 10,alignment: .leading)
                                .foregroundColor(Color(dodgerBlue))
                            Text("\(currentTemperature)°")
                                .font(Font.largeTitle.weight(.semibold))
                                .frame(maxWidth: 80, maxHeight: 50, alignment: .leading)
                                .foregroundColor(Color(dodgerBlue))
                        }
                        VStack {
                            Text("\(currentSummary)")
                                .font(Font.body.weight(.regular))
                                .frame(maxWidth: 150, maxHeight: 60, alignment: .top)
                                .foregroundColor(Color(dodgerBlue))
                        }
                    }
                    
                    // Hourly values
                    HStack(spacing: 20) {
                        VStack {
                            Text("Now")
                                .font(Font.subheadline.weight(.medium))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                            Image(weatherCondition(condition: conditionHour1, type: "widget", circle: universalIcons))
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 40, alignment: .center)
                            Text("100%")
                                .font(Font.subheadline.weight(.regular))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                        }
                        VStack {
                            Text("\(hour3)")
                                .font(Font.subheadline.weight(.medium))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                            Image(weatherCondition(condition: conditionHour3, type: "widget", circle: universalIcons))
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 40, alignment: .center)
                            Text("100%")
                                .font(Font.subheadline.weight(.regular))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                        }
                        VStack {
                            Text("\(hour6)")
                                .font(Font.subheadline.weight(.medium))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                            Image(weatherCondition(condition: conditionHour6, type: "widget", circle: universalIcons))
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 40, alignment: .center)
                            Text("100%")
                                .font(Font.subheadline.weight(.regular))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                        }
                        VStack {
                            Text("\(hour10)")
                                .font(Font.subheadline.weight(.medium))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                            Image(weatherCondition(condition: conditionHour10, type: "widget", circle: universalIcons))
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 40, alignment: .center)
                            Text("100%")
                                .font(Font.subheadline.weight(.regular))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                        }
                        VStack {
                            Text("\(hour13)")
                                .font(Font.subheadline.weight(.medium))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                            Image(weatherCondition(condition: conditionHour13, type: "widget", circle: universalIcons))
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 40, alignment: .center)
                            Text("100%")
                                .font(Font.subheadline.weight(.regular))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                        }
                        VStack {
                            Text("\(hour15)")
                                .font(Font.subheadline.weight(.medium))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                            Image(weatherCondition(condition: conditionHour15, type: "widget", circle: universalIcons))
                                .resizable()
                                .frame(maxWidth: 40, maxHeight: 40, alignment: .center)
                            Text("100%")
                                .font(Font.subheadline.weight(.regular))
                                .frame(maxWidth: 40, maxHeight: 10, alignment: .center)
                                .foregroundColor(Color(dodgerBlue))
                        }
                    }
                }
            }
            
            if widgetFamily == .systemLarge {
                
            }
        }
    }
}

struct WidgetView_Previews:  PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 14.0, *) {
                WidgetView(data:
                    .previewData)
                    .previewContext(WidgetPreviewContext(family: .systemSmall))
                WidgetView(data:
                    .previewData)
                    .previewContext(WidgetPreviewContext(family: .systemMedium))
                WidgetView(data:
                    .previewData)
                    .previewContext(WidgetPreviewContext(family: .systemLarge))
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

class LocationManager: NSObject, ObservableObject {
    override init() {
        super.init()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.distanceFilter = 100
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        latitudeValue = 37.3230 //(locationManager.location?.coordinate.latitude)!
        longitudeValue = -122.0322 //(locationManager.location?.coordinate.longitude)!
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
                print(currentLocation)
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

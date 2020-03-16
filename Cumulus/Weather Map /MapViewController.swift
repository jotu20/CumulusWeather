//
//  RadarViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 8/24/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import AerisWeatherKit
import AerisMapKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, AWFWeatherMapDelegate, MKMapViewDelegate {

    let mapView = MKMapView()
    var weatherMap: AWFWeatherMap!
    let locationManager = CLLocationManager()
    
    let playButton = UIButton()
    let currentLocationButton = UIButton()
    let layersButton = UIButton()
    let timeLabel = UILabel()

    var playButtonCenterX: CGFloat = 0
    var currentLocationButtonCenterX: CGFloat = 0
    var layersButtonCenterX: CGFloat = 0
    
    var timeLabelCenterX: CGFloat = 0
    
    var buttonWidthHeight: CGFloat = 0
    var buttonTops: CGFloat = 0
    
    var legendViewTop: CGFloat = 0
    var legendColor: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
         weatherLoaded = true
        self.navigationController?.isNavigationBarHidden = true
        
        if traitCollection.userInterfaceStyle == .light {
            legendColor = "light"
        } else {
            legendColor = "dark"
        }
        
        if (defaults.string(forKey: "locationMarker") == "Off") {
            mapView.showsUserLocation = false
        } else if (defaults.string(forKey: "locationMarker") == "On") {
            mapView.showsUserLocation = true
        }
        
        if (defaults.string(forKey: "mapStyle") == "Standard") {
            mapView.mapType = MKMapType.standard
        } else if (defaults.string(forKey: "mapStyle") == "Satellite") {
            mapView.mapType = MKMapType.satellite
        } else if (defaults.string(forKey: "mapStyle") == "Hybrid") {
            mapView.mapType = MKMapType.hybrid
        }
        
        mapView.delegate = self
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
                
        weatherMap = AWFWeatherMap(mapView: mapView, config: WeatherMapConfig())
        weatherMap.delegate = self
        view.addSubview(weatherMap.weatherMapView)
        
        weatherMap.weatherMapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([weatherMap.weatherMapView.topAnchor.constraint(equalTo: view.topAnchor),
                                     weatherMap.weatherMapView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     weatherMap.weatherMapView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                     weatherMap.weatherMapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mapView.topAnchor.constraint(equalTo: view.superview!.topAnchor),
                                     mapView.leftAnchor.constraint(equalTo: view.superview!.leftAnchor),
                                     mapView.rightAnchor.constraint(equalTo: view.superview!.rightAnchor),
                                     mapView.bottomAnchor.constraint(equalTo: view.superview!.bottomAnchor)])
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            playButtonCenterX = -124
            currentLocationButtonCenterX = 76
            layersButtonCenterX = 124
            timeLabelCenterX = -41
            
            buttonWidthHeight = 40
            buttonTops = 449
            legendViewTop = 30
        } else if screenHeight == 667 {
            // iPhone 8
            playButtonCenterX = -151.5
            currentLocationButtonCenterX = 103.5
            layersButtonCenterX = 151.5
            timeLabelCenterX = -68.5
            
            buttonWidthHeight = 40
            buttonTops = 548
            legendViewTop = 30
        } else if screenHeight == 736 {
            // iPhone Plus
            playButtonCenterX = -167
            currentLocationButtonCenterX = 119
            layersButtonCenterX = 167
            timeLabelCenterX = -84
            
            buttonWidthHeight = 40
            buttonTops = 627
            legendViewTop = 30
        } else if screenHeight == 812 {
            // iPhone XS
            playButtonCenterX = -151.5
            currentLocationButtonCenterX = 103.5
            layersButtonCenterX = 151.5
            timeLabelCenterX = -68.5
            
            buttonWidthHeight = 40
            buttonTops = 669
            legendViewTop = 50
        } else if screenHeight == 896 {
            // iPhone XR & XS Max
            playButtonCenterX = -167
            currentLocationButtonCenterX = 119
            layersButtonCenterX = 167
            timeLabelCenterX = -84
            
            buttonWidthHeight = 40
            buttonTops = 749
            legendViewTop = 50
        } else if screenHeight == 1024 {
            // iPad 9.7"
            playButtonCenterX = -344
            currentLocationButtonCenterX = 296
            layersButtonCenterX = 344
            timeLabelCenterX = -261
            
            buttonWidthHeight = 40
            buttonTops = 894
            legendViewTop = 30
        } else if screenHeight == 1112 {
            // iPad 10.5"
            playButtonCenterX = -377
            currentLocationButtonCenterX = 329
            layersButtonCenterX = 377
            timeLabelCenterX = -294
            
            buttonWidthHeight = 40
            buttonTops = 982
            legendViewTop = 30
        } else if screenHeight == 1194 {
            // iPad 11"
            playButtonCenterX = -377
            currentLocationButtonCenterX = 329
            layersButtonCenterX = 377
            timeLabelCenterX = -294
            
            buttonWidthHeight = 40
            buttonTops = 1055
            legendViewTop = 50
        } else if screenHeight == 1366 {
            // iPad 12.9"
            playButtonCenterX = -472
            currentLocationButtonCenterX = 424
            layersButtonCenterX = 472
            timeLabelCenterX = -389
            
            buttonWidthHeight = 40
            buttonTops = 1237
            legendViewTop = 50
        }
        
        weatherMap.go(toTime: Date())
        if screenHeight >= 1024 {
            timeLabel.font = UIFont.systemFont(ofSize: 20)
        } else {
            timeLabel.font = UIFont.systemFont(ofSize: 17)
        }
        timeLabel.textColor = UIColor.label
        timeLabel.text = "Now"
        view.addSubview(timeLabel)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraintTL = timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: timeLabelCenterX)
        let topConstraintTL = timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: buttonTops)
        let widthConstraintTL = timeLabel.widthAnchor.constraint(equalToConstant: 110)
        let heightConstraintTL = timeLabel.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([horizontalConstraintTL, topConstraintTL, widthConstraintTL, heightConstraintTL])
        
        // Play Button
        playButton.setBackgroundImage(UIImage(named: "Play button \(legendColor).pdf"), for: .normal)
        playButton.addTarget(self, action: #selector(playButtonAction(sender:)), for: .touchUpInside)
        playButton.adjustsImageWhenHighlighted = false
        view.addSubview(playButton)
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraintPB = playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: playButtonCenterX)
        let topConstraintPB = playButton.topAnchor.constraint(equalTo: view.topAnchor, constant: buttonTops)
        let widthConstraintPB = playButton.widthAnchor.constraint(equalToConstant: buttonWidthHeight)
        let heightConstraintPB = playButton.heightAnchor.constraint(equalToConstant: buttonWidthHeight)
        NSLayoutConstraint.activate([horizontalConstraintPB, topConstraintPB, widthConstraintPB, heightConstraintPB])
        
        currentLocationButton.setBackgroundImage(UIImage(named: "Current location button \(legendColor).pdf"), for: .normal)
        currentLocationButton.addTarget(self, action: #selector(currentLocationButtonAction(sender:)), for: .touchUpInside)
        currentLocationButton.adjustsImageWhenHighlighted = false
        view.addSubview(currentLocationButton)
        
        currentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraintCLB = currentLocationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: currentLocationButtonCenterX)
        let topConstraintCLB = currentLocationButton.topAnchor.constraint(equalTo: view.topAnchor, constant: buttonTops)
        let widthConstraintCLB = currentLocationButton.widthAnchor.constraint(equalToConstant: buttonWidthHeight)
        let heightConstraintCLB = currentLocationButton.heightAnchor.constraint(equalToConstant: buttonWidthHeight)
        NSLayoutConstraint.activate([horizontalConstraintCLB, topConstraintCLB, widthConstraintCLB, heightConstraintCLB])
        
        layersButton.setBackgroundImage(UIImage(named: "Layers button \(legendColor).pdf"), for: .normal)
        layersButton.addTarget(self, action: #selector(layersButtonAction(sender:)), for: .touchUpInside)
        layersButton.adjustsImageWhenHighlighted = false
        view.addSubview(layersButton)

        layersButton.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraintLB = layersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: layersButtonCenterX)
        let topConstraintLB = layersButton.topAnchor.constraint(equalTo: view.topAnchor, constant: buttonTops)
        let widthConstraintLB = layersButton.widthAnchor.constraint(equalToConstant: buttonWidthHeight)
        let heightConstraintLB = layersButton.heightAnchor.constraint(equalToConstant: buttonWidthHeight)
        NSLayoutConstraint.activate([horizontalConstraintLB, topConstraintLB, widthConstraintLB, heightConstraintLB])
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        initialMapLayerSetup()
    }

    func initialMapLocationSetup() {
        if defaults.bool(forKey: "userDeniedLocation") == true {
            let center = CLLocationCoordinate2D(latitude: defaults.double(forKey: "savedSelectedLatitudeValue"), longitude: defaults.double(forKey: "savedSelectedLongitudeValue"))
            
            if (defaults.string(forKey: "zoomLevel") == "City") {
                weatherMap.strategy.setCenter(center, zoomLevel: 3, animated: true)
            } else if (defaults.string(forKey: "zoomLevel") == "State") {
                weatherMap.strategy.setCenter(center, zoomLevel: 6, animated: true)
            } else if (defaults.string(forKey: "zoomLevel") == "Country") {
                weatherMap.strategy.setCenter(center, zoomLevel: 12, animated: true)
            }
            
            locationManager.stopUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let center = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        
        if (defaults.string(forKey: "zoomLevel") == "City") {
            weatherMap.strategy.setCenter(center, zoomLevel: 3, animated: true)
        } else if (defaults.string(forKey: "zoomLevel") == "State") {
            weatherMap.strategy.setCenter(center, zoomLevel: 6, animated: true)
        } else if (defaults.string(forKey: "zoomLevel") == "Country") {
            weatherMap.strategy.setCenter(center, zoomLevel: 12, animated: true)
        }
        
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        initialMapLocationSetup()
        initialMapLayerSetup()
    }

    func initialMapLayerSetup() {
        if (defaults.bool(forKey: "radarLayer") == true) {
            weatherMap.addSource(forLayerType: .radar)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Radar legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .radar)
        }
        
        if (defaults.bool(forKey: "visibleSatelliteLayer") == true) {
            weatherMap.addSource(forLayerType: .satelliteVisible)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Visibility legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .satelliteVisible)
        }
        
        if (defaults.bool(forKey: "infraredSatelliteLayer") == true) {
            weatherMap.addSource(forLayerType: .satelliteInfraredColor)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Infrared Satellite legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .satelliteInfraredColor)
        }
        
        if (defaults.bool(forKey: "waterVaporLayer") == true) {
            weatherMap.addSource(forLayerType: .satelliteWaterVapor)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Water Vapor legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .satelliteWaterVapor)
        }
        
        if (defaults.bool(forKey: "alertsLayer") == true) {
            weatherMap.addSource(forLayerType: .advisories)
        } else {
            weatherMap.removeSource(forLayerType: .advisories)
        }
        
        if (defaults.bool(forKey: "temperaturesLayer") == true) {
            weatherMap.addSource(forLayerType: .temperatures)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Temperatures legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .temperatures)
        }
        
        if (defaults.bool(forKey: "dewPointsLayer") == true) {
            weatherMap.addSource(forLayerType: .dewPoints)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Dew Point legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .dewPoints)
        }
        
        if (defaults.bool(forKey: "humidityLayer") == true) {
            weatherMap.addSource(forLayerType: .humidity)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Humidity legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .humidity)
        }
        
        if (defaults.bool(forKey: "windSpeedLayer") == true) {
            weatherMap.addSource(forLayerType: .windSpeeds)
        } else {
            weatherMap.removeSource(forLayerType: .windSpeeds)
        }
        
        if (defaults.bool(forKey: "windGustsLayer") == true) {
            weatherMap.addSource(forLayerType: .windGusts)
        } else {
            weatherMap.removeSource(forLayerType: .windGusts)
        }
        
        if (defaults.bool(forKey: "windDirectionLayer") == true) {
            weatherMap.addSource(forLayerType: .windDirection)
        } else {
            weatherMap.removeSource(forLayerType: .windDirection)
        }
        
        if (defaults.bool(forKey: "windChillLayer") == true) {
            weatherMap.addSource(forLayerType: .windChill)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Wind Chill legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .windChill)
        }
        
        if (defaults.bool(forKey: "heatIndexLayer") == true) {
            weatherMap.addSource(forLayerType: .heatIndex)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Heat Index legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .heatIndex)
        }
        
        if (defaults.bool(forKey: "feelsLikeLayer") == true) {
            weatherMap.addSource(forLayerType: .feelsLike)
        } else {
            weatherMap.removeSource(forLayerType: .feelsLike)
        }
        
        if (defaults.bool(forKey: "airQualityLayer") == true) {
            weatherMap.addSource(forLayerType: .airQuality)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Air Quality legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .airQuality)
        }
        
        if (defaults.bool(forKey: "precipitationLayer") == true) {
            weatherMap.addSource(forLayerType: .precip)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Precip legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .precip)
        }
        
        if (defaults.bool(forKey: "visbilityLayer") == true) {
            weatherMap.addSource(forLayerType: .visibility)
            
            let legendImage = UIImageView()
            legendImage.image = UIImage(named: "Visibility legend \(legendColor).pdf")
            legendImage.contentMode = .scaleToFill
            self.view.addSubview(legendImage)
            
            legendImage.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = legendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let topConstraint = legendImage.topAnchor.constraint(equalTo: view.topAnchor, constant: legendViewTop)
            let widthConstraint = legendImage.widthAnchor.constraint(equalToConstant: 310)
            let heightConstraint = legendImage.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstraint, heightConstraint])
        } else {
            weatherMap.removeSource(forLayerType: .visibility)
        }
        
        // If no layers are active default to radar
        if (defaults.bool(forKey: "radarLayer") == false) && (defaults.bool(forKey: "visibleSatelliteLayer") == false) && (defaults.bool(forKey: "infraredSatelliteLayer") == false) && (defaults.bool(forKey: "waterVaporLayer") == false) && (defaults.bool(forKey: "alertsLayer") == false) && (defaults.bool(forKey: "temperaturesLayer") == false) && (defaults.bool(forKey: "dewPointsLayer") == false)  && (defaults.bool(forKey: "humidityLayer") == false) && (defaults.bool(forKey: "windSpeedLayer") == false) && (defaults.bool(forKey: "windGustsLayer") == false) && (defaults.bool(forKey: "windDirectionLayer") == false) && (defaults.bool(forKey: "windChillLayer") == false) && (defaults.bool(forKey: "heatIndexLayer") == false) && (defaults.bool(forKey: "feelsLikeLayer") == false) && (defaults.bool(forKey: "airQualityLayer") == false) && (defaults.bool(forKey: "precipitationLayer") == false) && (defaults.bool(forKey: "visibilityLayer") == false) {
            weatherMap.addSource(forLayerType: .radar)
            
            defaults.set(true, forKey: "radarLayer")
            defaults.set(false, forKey: "visibleSatelliteLayer")
            defaults.set(false, forKey: "infraredSatelliteLayer")
            defaults.set(false, forKey: "waterVaporLayer")
            defaults.set(false, forKey: "alertsLayer")
            defaults.set(false, forKey: "temperaturesLayer")
            defaults.set(false, forKey: "dewPointsLayer")
            defaults.set(false, forKey: "humidityLayer")
            defaults.set(false, forKey: "windSpeedLayer")
            defaults.set(false, forKey: "windGustsLayer")
            defaults.set(false, forKey: "windDirectionLayer")
            defaults.set(false, forKey: "windChillLayer")
            defaults.set(false, forKey: "heatIndexLayer")
            defaults.set(false, forKey: "feelsLikeLayer")
            defaults.set(false, forKey: "airQualityLayer")
            defaults.set(false, forKey: "precipitationLayer")
            defaults.set(false, forKey: "visibilityLayer")
        }
    }
    
    @objc func currentLocationButtonAction(sender: UIButton!) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        } else {
            initialMapLocationSetup()
        }
    }
    
    // MARK: - Open Map Layers Button Action
    @objc func layersButtonAction(sender: UIButton!) {
        weatherLoaded = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MapLayers")
        present(controller, animated: true, completion: nil)
    }
    
    @objc func update() {
        self.timeLabel.text = "\(sunFormat(date: weatherMap.timeline.currentTime!))"
    }

    @objc func playButtonAction(sender: UIButton!) {
        weatherLoaded = true
        
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        if weatherMap.isAnimating || weatherMap.isLoadingAnimation {
            weatherMap.stopAnimating()
            playButton.setImage(UIImage(named: "Play button \(legendColor).pdf"), for: .normal)
            self.timeLabel.text = "Now"
            timer.invalidate()
        } else {
            weatherMap.startAnimating()
            playButton.setImage(UIImage(named: "Pause button \(legendColor).pdf"), for: .normal)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        weatherMap.enableAutoRefresh()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        weatherMap.disableAutoRefresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class WeatherMapConfig: AWFWeatherMapConfig {
    
    override init() {
        super.init()
        
        self.showsAnnotationForLongPress = false
        self.showsAnnotationDuringLongPress = false
        self.refreshInterval = 15 * AWFMinuteInterval
        self.animationEnabled = true
        self.shouldUseRetinaImagery = true
        self.shouldUseRetinaImageryForAnimation = true
        self.shouldReloadDataOnRegionChange = true
    }
}

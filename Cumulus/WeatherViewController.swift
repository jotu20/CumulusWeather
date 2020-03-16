//
//  ViewController.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 6/20/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces
import SafariServices
import Intents
import StoreKit
import ForecastIO
import AerisMapKit

class WeatherViewController: UIViewController, CLLocationManagerDelegate, UITabBarControllerDelegate {
    
    @IBOutlet var homeView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let locationManager = CLLocationManager()
    var placesClient: GMSPlacesClient!
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var nextHoursLabel: UILabel!
    @IBOutlet weak var nextDaysLabel: UILabel!
    @IBOutlet weak var currentConditionIcon: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var apparentTemperatureLabel: UILabel!
    @IBOutlet weak var currentConditonLabel: UILabel!
    @IBOutlet weak var currentConditionStackView: UIStackView!
    @IBOutlet weak var weatherAlertsButton: UIButton!
    
    // MARK: - Daily 12 hour outlets
    // Day Zero
    @IBOutlet weak var dayZeroTopStackView: UIStackView!
    @IBOutlet weak var dayZeroStackView: UIStackView!
    
    // Day One
    @IBOutlet weak var dayOneTopStackView: UIStackView!
    @IBOutlet weak var dayOneStackView: UIStackView!
    
    // Day Two
    @IBOutlet weak var dayTwoTopStackView: UIStackView!
    @IBOutlet weak var dayTwoStackView: UIStackView!
    
    // Day Three
    @IBOutlet weak var dayThreeTopStackView: UIStackView!
    @IBOutlet weak var dayThreeStackView: UIStackView!
    
    // Day Four
    @IBOutlet weak var dayFourTopStackView: UIStackView!
    @IBOutlet weak var dayFourStackView: UIStackView!
    
    // Day Five
    @IBOutlet weak var dayFiveTopStackView: UIStackView!
    @IBOutlet weak var dayFiveStackView: UIStackView!
    
    // Day Six
    @IBOutlet weak var daySixTopStackView: UIStackView!
    @IBOutlet weak var daySixStackView: UIStackView!
    
    // Day Seven
    @IBOutlet weak var daySevenTopStackView: UIStackView!
    @IBOutlet weak var daySevenStackView: UIStackView!
    
    // MARK: - Tap gestures
    @IBOutlet var dayZeroTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayOneTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayTwoTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayThreeTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayFourTapGesture: UITapGestureRecognizer!
    @IBOutlet var dayFiveTapGesture: UITapGestureRecognizer!
    @IBOutlet var daySixTapGesture: UITapGestureRecognizer!
    @IBOutlet var daySevenTapGesture: UITapGestureRecognizer!
    
    // MARK: - Current conditions outlets
    @IBOutlet weak var currentCondition1Image: UIImageView!
    @IBOutlet weak var currentCondition2Image: UIImageView!
    @IBOutlet weak var currentCondition3Image: UIImageView!
    @IBOutlet weak var currentCondition4Image: UIImageView!
    @IBOutlet weak var currentCondition5Image: UIImageView!
    @IBOutlet weak var currentCondition6ImageButton: UIButton!
    @IBOutlet weak var currentCondition7Image: UIImageView!
    @IBOutlet weak var currentCondition8Image: UIImageView!
    @IBOutlet weak var currentCondition9Image: UIImageView!
    @IBOutlet weak var currentCondition10Image: UIImageView!
    
    @IBOutlet weak var currentCondition1Label: UILabel!
    @IBOutlet weak var currentCondition2Label: UILabel!
    @IBOutlet weak var currentCondition3Label: UILabel!
    @IBOutlet weak var currentCondition4Label: UILabel!
    @IBOutlet weak var currentCondition5Label: UILabel!
    @IBOutlet weak var currentCondition6Label: UILabel!
    @IBOutlet weak var currentCondition7Label: UILabel!
    @IBOutlet weak var currentCondition8Label: UILabel!
    @IBOutlet weak var currentCondition9Label: UILabel!
    @IBOutlet weak var currentCondition10Label: UILabel!
    
    // MARK: - Hourly Forecast outlets
    @IBOutlet weak var hourlySegmentControl: UISegmentedControl!
    @IBOutlet weak var hourlyPageControl: UIPageControl!
    
    @IBOutlet weak var hour0Condition: UIImageView!
    @IBOutlet weak var hour0ValueText: UILabel!
    @IBOutlet weak var hour0Image: UIImageView!
    @IBOutlet weak var hour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour0Time: UILabel!
    
    @IBOutlet weak var hour1Condition: UIImageView!
    @IBOutlet weak var hour1ValueText: UILabel!
    @IBOutlet weak var hour1Image: UIImageView!
    @IBOutlet weak var hour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour1Time: UILabel!
    
    @IBOutlet weak var hour2Condition: UIImageView!
    @IBOutlet weak var hour2ValueText: UILabel!
    @IBOutlet weak var hour2Image: UIImageView!
    @IBOutlet weak var hour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour2Time: UILabel!
    
    @IBOutlet weak var hour3Condition: UIImageView!
    @IBOutlet weak var hour3ValueText: UILabel!
    @IBOutlet weak var hour3Image: UIImageView!
    @IBOutlet weak var hour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour3Time: UILabel!
    
    @IBOutlet weak var hour4Condition: UIImageView!
    @IBOutlet weak var hour4ValueText: UILabel!
    @IBOutlet weak var hour4Image: UIImageView!
    @IBOutlet weak var hour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour4Time: UILabel!
    
    @IBOutlet weak var hour5Condition: UIImageView!
    @IBOutlet weak var hour5ValueText: UILabel!
    @IBOutlet weak var hour5Image: UIImageView!
    @IBOutlet weak var hour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour5Time: UILabel!
    
    @IBOutlet weak var hour6Condition: UIImageView!
    @IBOutlet weak var hour6ValueText: UILabel!
    @IBOutlet weak var hour6Image: UIImageView!
    @IBOutlet weak var hour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour6Time: UILabel!

    @IBOutlet weak var hour7Condition: UIImageView!
    @IBOutlet weak var hour7ValueText: UILabel!
    @IBOutlet weak var hour7Image: UIImageView!
    @IBOutlet weak var hour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var hour7Time: UILabel!

    // MARK: - Day Zero outlets
    @IBOutlet weak var dayZeroDay: UILabel!
    @IBOutlet weak var dayZeroHighLow: UILabel!
    @IBOutlet weak var dayZeroPrecipitation: UILabel!
    @IBOutlet weak var dayZeroSummary: UITextView!
    @IBOutlet weak var dayZeroCondition: UIImageView!
    @IBOutlet weak var dayZeroForecastBar: UIImageView!
    
    @IBOutlet weak var dayZeroSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayZeroPageControl: UIPageControl!
    
    @IBOutlet weak var dayZeroHour0Condition: UIImageView!
    @IBOutlet weak var dayZeroHour0ValueText: UILabel!
    @IBOutlet weak var dayZeroHour0Image: UIImageView!
    @IBOutlet weak var dayZeroHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour0Time: UILabel!
    
    @IBOutlet weak var dayZeroHour1Condition: UIImageView!
    @IBOutlet weak var dayZeroHour1ValueText: UILabel!
    @IBOutlet weak var dayZeroHour1Image: UIImageView!
    @IBOutlet weak var dayZeroHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour1Time: UILabel!
    
    @IBOutlet weak var dayZeroHour2Condition: UIImageView!
    @IBOutlet weak var dayZeroHour2ValueText: UILabel!
    @IBOutlet weak var dayZeroHour2Image: UIImageView!
    @IBOutlet weak var dayZeroHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour2Time: UILabel!
    
    @IBOutlet weak var dayZeroHour3Condition: UIImageView!
    @IBOutlet weak var dayZeroHour3ValueText: UILabel!
    @IBOutlet weak var dayZeroHour3Image: UIImageView!
    @IBOutlet weak var dayZeroHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour3Time: UILabel!
    
    @IBOutlet weak var dayZeroHour4Condition: UIImageView!
    @IBOutlet weak var dayZeroHour4ValueText: UILabel!
    @IBOutlet weak var dayZeroHour4Image: UIImageView!
    @IBOutlet weak var dayZeroHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour4Time: UILabel!
    
    @IBOutlet weak var dayZeroHour5Condition: UIImageView!
    @IBOutlet weak var dayZeroHour5ValueText: UILabel!
    @IBOutlet weak var dayZeroHour5Image: UIImageView!
    @IBOutlet weak var dayZeroHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour5Time: UILabel!
    
    @IBOutlet weak var dayZeroHour6Condition: UIImageView!
    @IBOutlet weak var dayZeroHour6ValueText: UILabel!
    @IBOutlet weak var dayZeroHour6Image: UIImageView!
    @IBOutlet weak var dayZeroHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour6Time: UILabel!
    
    @IBOutlet weak var dayZeroHour7Condition: UIImageView!
    @IBOutlet weak var dayZeroHour7ValueText: UILabel!
    @IBOutlet weak var dayZeroHour7Image: UIImageView!
    @IBOutlet weak var dayZeroHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayZeroHour7Time: UILabel!
    
    // MARK: - Day One outlets
    @IBOutlet weak var dayOneDay: UILabel!
    @IBOutlet weak var dayOneHighLow: UILabel!
    @IBOutlet weak var dayOnePrecipitation: UILabel!
    @IBOutlet weak var dayOneSummary: UITextView!
    @IBOutlet weak var dayOneCondition: UIImageView!
    @IBOutlet weak var dayOneForecastBar: UIImageView!
    
    @IBOutlet weak var dayOneSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayOnePageControl: UIPageControl!
    
    @IBOutlet weak var dayOneHour0Condition: UIImageView!
    @IBOutlet weak var dayOneHour0ValueText: UILabel!
    @IBOutlet weak var dayOneHour0Image: UIImageView!
    @IBOutlet weak var dayOneHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour0Time: UILabel!
    
    @IBOutlet weak var dayOneHour1Condition: UIImageView!
    @IBOutlet weak var dayOneHour1ValueText: UILabel!
    @IBOutlet weak var dayOneHour1Image: UIImageView!
    @IBOutlet weak var dayOneHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour1Time: UILabel!
    
    @IBOutlet weak var dayOneHour2Condition: UIImageView!
    @IBOutlet weak var dayOneHour2ValueText: UILabel!
    @IBOutlet weak var dayOneHour2Image: UIImageView!
    @IBOutlet weak var dayOneHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour2Time: UILabel!
    
    @IBOutlet weak var dayOneHour3Condition: UIImageView!
    @IBOutlet weak var dayOneHour3ValueText: UILabel!
    @IBOutlet weak var dayOneHour3Image: UIImageView!
    @IBOutlet weak var dayOneHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour3Time: UILabel!
    
    @IBOutlet weak var dayOneHour4Condition: UIImageView!
    @IBOutlet weak var dayOneHour4ValueText: UILabel!
    @IBOutlet weak var dayOneHour4Image: UIImageView!
    @IBOutlet weak var dayOneHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour4Time: UILabel!
    
    @IBOutlet weak var dayOneHour5Condition: UIImageView!
    @IBOutlet weak var dayOneHour5ValueText: UILabel!
    @IBOutlet weak var dayOneHour5Image: UIImageView!
    @IBOutlet weak var dayOneHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour5Time: UILabel!
    
    @IBOutlet weak var dayOneHour6Condition: UIImageView!
    @IBOutlet weak var dayOneHour6ValueText: UILabel!
    @IBOutlet weak var dayOneHour6Image: UIImageView!
    @IBOutlet weak var dayOneHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour6Time: UILabel!
    
    @IBOutlet weak var dayOneHour7Condition: UIImageView!
    @IBOutlet weak var dayOneHour7ValueText: UILabel!
    @IBOutlet weak var dayOneHour7Image: UIImageView!
    @IBOutlet weak var dayOneHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayOneHour7Time: UILabel!
    
    // MARK: - Day Two outlets
    @IBOutlet weak var dayTwoDay: UILabel!
    @IBOutlet weak var dayTwoHighLow: UILabel!
    @IBOutlet weak var dayTwoPrecipitation: UILabel!
    @IBOutlet weak var dayTwoSummary: UITextView!
    @IBOutlet weak var dayTwoCondition: UIImageView!
    @IBOutlet weak var dayTwoForecastBar: UIImageView!
    
    @IBOutlet weak var dayTwoSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayTwoPageControl: UIPageControl!
    
    @IBOutlet weak var dayTwoHour0Condition: UIImageView!
    @IBOutlet weak var dayTwoHour0ValueText: UILabel!
    @IBOutlet weak var dayTwoHour0Image: UIImageView!
    @IBOutlet weak var dayTwoHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour0Time: UILabel!
    
    @IBOutlet weak var dayTwoHour1Condition: UIImageView!
    @IBOutlet weak var dayTwoHour1ValueText: UILabel!
    @IBOutlet weak var dayTwoHour1Image: UIImageView!
    @IBOutlet weak var dayTwoHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour1Time: UILabel!
    
    @IBOutlet weak var dayTwoHour2Condition: UIImageView!
    @IBOutlet weak var dayTwoHour2ValueText: UILabel!
    @IBOutlet weak var dayTwoHour2Image: UIImageView!
    @IBOutlet weak var dayTwoHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour2Time: UILabel!
    
    @IBOutlet weak var dayTwoHour3Condition: UIImageView!
    @IBOutlet weak var dayTwoHour3ValueText: UILabel!
    @IBOutlet weak var dayTwoHour3Image: UIImageView!
    @IBOutlet weak var dayTwoHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour3Time: UILabel!
    
    @IBOutlet weak var dayTwoHour4Condition: UIImageView!
    @IBOutlet weak var dayTwoHour4ValueText: UILabel!
    @IBOutlet weak var dayTwoHour4Image: UIImageView!
    @IBOutlet weak var dayTwoHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour4Time: UILabel!
    
    @IBOutlet weak var dayTwoHour5Condition: UIImageView!
    @IBOutlet weak var dayTwoHour5ValueText: UILabel!
    @IBOutlet weak var dayTwoHour5Image: UIImageView!
    @IBOutlet weak var dayTwoHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour5Time: UILabel!
    
    @IBOutlet weak var dayTwoHour6Condition: UIImageView!
    @IBOutlet weak var dayTwoHour6ValueText: UILabel!
    @IBOutlet weak var dayTwoHour6Image: UIImageView!
    @IBOutlet weak var dayTwoHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour6Time: UILabel!
    
    @IBOutlet weak var dayTwoHour7Condition: UIImageView!
    @IBOutlet weak var dayTwoHour7ValueText: UILabel!
    @IBOutlet weak var dayTwoHour7Image: UIImageView!
    @IBOutlet weak var dayTwoHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayTwoHour7Time: UILabel!
    
    // MARK: - Day Three outlets
    @IBOutlet weak var dayThreeDay: UILabel!
    @IBOutlet weak var dayThreeHighLow: UILabel!
    @IBOutlet weak var dayThreePrecipitation: UILabel!
    @IBOutlet weak var dayThreeSummary: UITextView!
    @IBOutlet weak var dayThreeCondition: UIImageView!
    @IBOutlet weak var dayThreeForecastBar: UIImageView!
    
    @IBOutlet weak var dayThreeSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayThreePageControl: UIPageControl!
    
    @IBOutlet weak var dayThreeHour0Condition: UIImageView!
    @IBOutlet weak var dayThreeHour0ValueText: UILabel!
    @IBOutlet weak var dayThreeHour0Image: UIImageView!
    @IBOutlet weak var dayThreeHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour0Time: UILabel!
    
    @IBOutlet weak var dayThreeHour1Condition: UIImageView!
    @IBOutlet weak var dayThreeHour1ValueText: UILabel!
    @IBOutlet weak var dayThreeHour1Image: UIImageView!
    @IBOutlet weak var dayThreeHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour1Time: UILabel!
    
    @IBOutlet weak var dayThreeHour2Condition: UIImageView!
    @IBOutlet weak var dayThreeHour2ValueText: UILabel!
    @IBOutlet weak var dayThreeHour2Image: UIImageView!
    @IBOutlet weak var dayThreeHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour2Time: UILabel!
    
    @IBOutlet weak var dayThreeHour3Condition: UIImageView!
    @IBOutlet weak var dayThreeHour3ValueText: UILabel!
    @IBOutlet weak var dayThreeHour3Image: UIImageView!
    @IBOutlet weak var dayThreeHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour3Time: UILabel!
    
    @IBOutlet weak var dayThreeHour4Condition: UIImageView!
    @IBOutlet weak var dayThreeHour4ValueText: UILabel!
    @IBOutlet weak var dayThreeHour4Image: UIImageView!
    @IBOutlet weak var dayThreeHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour4Time: UILabel!
    
    @IBOutlet weak var dayThreeHour5Condition: UIImageView!
    @IBOutlet weak var dayThreeHour5ValueText: UILabel!
    @IBOutlet weak var dayThreeHour5Image: UIImageView!
    @IBOutlet weak var dayThreeHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour5Time: UILabel!
    
    @IBOutlet weak var dayThreeHour6Condition: UIImageView!
    @IBOutlet weak var dayThreeHour6ValueText: UILabel!
    @IBOutlet weak var dayThreeHour6Image: UIImageView!
    @IBOutlet weak var dayThreeHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour6Time: UILabel!
    
    @IBOutlet weak var dayThreeHour7Condition: UIImageView!
    @IBOutlet weak var dayThreeHour7ValueText: UILabel!
    @IBOutlet weak var dayThreeHour7Image: UIImageView!
    @IBOutlet weak var dayThreeHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayThreeHour7Time: UILabel!
    
    // MARK: - Day Four outlets
    @IBOutlet weak var dayFourDay: UILabel!
    @IBOutlet weak var dayFourHighLow: UILabel!
    @IBOutlet weak var dayFourPrecipitation: UILabel!
    @IBOutlet weak var dayFourSummary: UITextView!
    @IBOutlet weak var dayFourCondition: UIImageView!
    @IBOutlet weak var dayFourForecastBar: UIImageView!
    
    @IBOutlet weak var dayFourSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayFourPageControl: UIPageControl!
    
    @IBOutlet weak var dayFourHour0Condition: UIImageView!
    @IBOutlet weak var dayFourHour0ValueText: UILabel!
    @IBOutlet weak var dayFourHour0Image: UIImageView!
    @IBOutlet weak var dayFourHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour0Time: UILabel!
    
    @IBOutlet weak var dayFourHour1Condition: UIImageView!
    @IBOutlet weak var dayFourHour1ValueText: UILabel!
    @IBOutlet weak var dayFourHour1Image: UIImageView!
    @IBOutlet weak var dayFourHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour1Time: UILabel!
    
    @IBOutlet weak var dayFourHour2Condition: UIImageView!
    @IBOutlet weak var dayFourHour2ValueText: UILabel!
    @IBOutlet weak var dayFourHour2Image: UIImageView!
    @IBOutlet weak var dayFourHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour2Time: UILabel!
    
    @IBOutlet weak var dayFourHour3Condition: UIImageView!
    @IBOutlet weak var dayFourHour3ValueText: UILabel!
    @IBOutlet weak var dayFourHour3Image: UIImageView!
    @IBOutlet weak var dayFourHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour3Time: UILabel!
    
    @IBOutlet weak var dayFourHour4Condition: UIImageView!
    @IBOutlet weak var dayFourHour4ValueText: UILabel!
    @IBOutlet weak var dayFourHour4Image: UIImageView!
    @IBOutlet weak var dayFourHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour4Time: UILabel!
    
    @IBOutlet weak var dayFourHour5Condition: UIImageView!
    @IBOutlet weak var dayFourHour5ValueText: UILabel!
    @IBOutlet weak var dayFourHour5Image: UIImageView!
    @IBOutlet weak var dayFourHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour5Time: UILabel!
    
    @IBOutlet weak var dayFourHour6Condition: UIImageView!
    @IBOutlet weak var dayFourHour6ValueText: UILabel!
    @IBOutlet weak var dayFourHour6Image: UIImageView!
    @IBOutlet weak var dayFourHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour6Time: UILabel!
    
    @IBOutlet weak var dayFourHour7Condition: UIImageView!
    @IBOutlet weak var dayFourHour7ValueText: UILabel!
    @IBOutlet weak var dayFourHour7Image: UIImageView!
    @IBOutlet weak var dayFourHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFourHour7Time: UILabel!
    
    // MARK: - Day Five outlets
    @IBOutlet weak var dayFiveDay: UILabel!
    @IBOutlet weak var dayFiveHighLow: UILabel!
    @IBOutlet weak var dayFivePrecipitation: UILabel!
    @IBOutlet weak var dayFiveSummary: UITextView!
    @IBOutlet weak var dayFiveCondition: UIImageView!
    @IBOutlet weak var dayFiveForecastBar: UIImageView!
    
    @IBOutlet weak var dayFiveSegmentControl: UISegmentedControl!
    @IBOutlet weak var dayFivePageControl: UIPageControl!
    
    @IBOutlet weak var dayFiveHour0Condition: UIImageView!
    @IBOutlet weak var dayFiveHour0ValueText: UILabel!
    @IBOutlet weak var dayFiveHour0Image: UIImageView!
    @IBOutlet weak var dayFiveHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour0Time: UILabel!
    
    @IBOutlet weak var dayFiveHour1Condition: UIImageView!
    @IBOutlet weak var dayFiveHour1ValueText: UILabel!
    @IBOutlet weak var dayFiveHour1Image: UIImageView!
    @IBOutlet weak var dayFiveHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour1Time: UILabel!
    
    @IBOutlet weak var dayFiveHour2Condition: UIImageView!
    @IBOutlet weak var dayFiveHour2ValueText: UILabel!
    @IBOutlet weak var dayFiveHour2Image: UIImageView!
    @IBOutlet weak var dayFiveHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour2Time: UILabel!
    
    @IBOutlet weak var dayFiveHour3Condition: UIImageView!
    @IBOutlet weak var dayFiveHour3ValueText: UILabel!
    @IBOutlet weak var dayFiveHour3Image: UIImageView!
    @IBOutlet weak var dayFiveHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour3Time: UILabel!
    
    @IBOutlet weak var dayFiveHour4Condition: UIImageView!
    @IBOutlet weak var dayFiveHour4ValueText: UILabel!
    @IBOutlet weak var dayFiveHour4Image: UIImageView!
    @IBOutlet weak var dayFiveHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour4Time: UILabel!
    
    @IBOutlet weak var dayFiveHour5Condition: UIImageView!
    @IBOutlet weak var dayFiveHour5ValueText: UILabel!
    @IBOutlet weak var dayFiveHour5Image: UIImageView!
    @IBOutlet weak var dayFiveHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour5Time: UILabel!
    
    @IBOutlet weak var dayFiveHour6Condition: UIImageView!
    @IBOutlet weak var dayFiveHour6ValueText: UILabel!
    @IBOutlet weak var dayFiveHour6Image: UIImageView!
    @IBOutlet weak var dayFiveHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour6Time: UILabel!
    
    @IBOutlet weak var dayFiveHour7Condition: UIImageView!
    @IBOutlet weak var dayFiveHour7ValueText: UILabel!
    @IBOutlet weak var dayFiveHour7Image: UIImageView!
    @IBOutlet weak var dayFiveHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var dayFiveHour7Time: UILabel!
    
    // MARK: - Day Six outlets
    @IBOutlet weak var daySixDay: UILabel!
    @IBOutlet weak var daySixHighLow: UILabel!
    @IBOutlet weak var daySixPrecipitation: UILabel!
    @IBOutlet weak var daySixSummary: UITextView!
    @IBOutlet weak var daySixCondition: UIImageView!
    @IBOutlet weak var daySixForecastBar: UIImageView!
    
    @IBOutlet weak var daySixSegmentControl: UISegmentedControl!
    @IBOutlet weak var daySixPageControl: UIPageControl!
    
    @IBOutlet weak var daySixHour0Condition: UIImageView!
    @IBOutlet weak var daySixHour0ValueText: UILabel!
    @IBOutlet weak var daySixHour0Image: UIImageView!
    @IBOutlet weak var daySixHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour0Time: UILabel!
    
    @IBOutlet weak var daySixHour1Condition: UIImageView!
    @IBOutlet weak var daySixHour1ValueText: UILabel!
    @IBOutlet weak var daySixHour1Image: UIImageView!
    @IBOutlet weak var daySixHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour1Time: UILabel!
    
    @IBOutlet weak var daySixHour2Condition: UIImageView!
    @IBOutlet weak var daySixHour2ValueText: UILabel!
    @IBOutlet weak var daySixHour2Image: UIImageView!
    @IBOutlet weak var daySixHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour2Time: UILabel!
    
    @IBOutlet weak var daySixHour3Condition: UIImageView!
    @IBOutlet weak var daySixHour3ValueText: UILabel!
    @IBOutlet weak var daySixHour3Image: UIImageView!
    @IBOutlet weak var daySixHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour3Time: UILabel!
    
    @IBOutlet weak var daySixHour4Condition: UIImageView!
    @IBOutlet weak var daySixHour4ValueText: UILabel!
    @IBOutlet weak var daySixHour4Image: UIImageView!
    @IBOutlet weak var daySixHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour4Time: UILabel!
    
    @IBOutlet weak var daySixHour5Condition: UIImageView!
    @IBOutlet weak var daySixHour5ValueText: UILabel!
    @IBOutlet weak var daySixHour5Image: UIImageView!
    @IBOutlet weak var daySixHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour5Time: UILabel!
    
    @IBOutlet weak var daySixHour6Condition: UIImageView!
    @IBOutlet weak var daySixHour6ValueText: UILabel!
    @IBOutlet weak var daySixHour6Image: UIImageView!
    @IBOutlet weak var daySixHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour6Time: UILabel!
    
    @IBOutlet weak var daySixHour7Condition: UIImageView!
    @IBOutlet weak var daySixHour7ValueText: UILabel!
    @IBOutlet weak var daySixHour7Image: UIImageView!
    @IBOutlet weak var daySixHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySixHour7Time: UILabel!
    
    // MARK: - Day Seven outlets
    @IBOutlet weak var daySevenDay: UILabel!
    @IBOutlet weak var daySevenHighLow: UILabel!
    @IBOutlet weak var daySevenPrecipitation: UILabel!
    @IBOutlet weak var daySevenSummary: UITextView!
    @IBOutlet weak var daySevenCondition: UIImageView!
    @IBOutlet weak var daySevenForecastBar: UIImageView!
    
    @IBOutlet weak var daySevenSegmentControl: UISegmentedControl!
    @IBOutlet weak var daySevenPageControl: UIPageControl!
    
    @IBOutlet weak var daySevenHour0Condition: UIImageView!
    @IBOutlet weak var daySevenHour0ValueText: UILabel!
    @IBOutlet weak var daySevenHour0Image: UIImageView!
    @IBOutlet weak var daySevenHour0ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour0Time: UILabel!
    
    @IBOutlet weak var daySevenHour1Condition: UIImageView!
    @IBOutlet weak var daySevenHour1ValueText: UILabel!
    @IBOutlet weak var daySevenHour1Image: UIImageView!
    @IBOutlet weak var daySevenHour1ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour1Time: UILabel!
    
    @IBOutlet weak var daySevenHour2Condition: UIImageView!
    @IBOutlet weak var daySevenHour2ValueText: UILabel!
    @IBOutlet weak var daySevenHour2Image: UIImageView!
    @IBOutlet weak var daySevenHour2ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour2Time: UILabel!
    
    @IBOutlet weak var daySevenHour3Condition: UIImageView!
    @IBOutlet weak var daySevenHour3ValueText: UILabel!
    @IBOutlet weak var daySevenHour3Image: UIImageView!
    @IBOutlet weak var daySevenHour3ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour3Time: UILabel!
    
    @IBOutlet weak var daySevenHour4Condition: UIImageView!
    @IBOutlet weak var daySevenHour4ValueText: UILabel!
    @IBOutlet weak var daySevenHour4Image: UIImageView!
    @IBOutlet weak var daySevenHour4ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour4Time: UILabel!
    
    @IBOutlet weak var daySevenHour5Condition: UIImageView!
    @IBOutlet weak var daySevenHour5ValueText: UILabel!
    @IBOutlet weak var daySevenHour5Image: UIImageView!
    @IBOutlet weak var daySevenHour5ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour5Time: UILabel!
    
    @IBOutlet weak var daySevenHour6Condition: UIImageView!
    @IBOutlet weak var daySevenHour6ValueText: UILabel!
    @IBOutlet weak var daySevenHour6Image: UIImageView!
    @IBOutlet weak var daySevenHour6ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour6Time: UILabel!
    
    @IBOutlet weak var daySevenHour7Condition: UIImageView!
    @IBOutlet weak var daySevenHour7ValueText: UILabel!
    @IBOutlet weak var daySevenHour7Image: UIImageView!
    @IBOutlet weak var daySevenHour7ValueHeight: NSLayoutConstraint!
    @IBOutlet weak var daySevenHour7Time: UILabel!
    
    // MARK: - General constraints
    @IBOutlet weak var daysStackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var nextDaysLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var dailyStackViewBottom: NSLayoutConstraint!
    @IBOutlet weak var weatherAlertWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayZeroHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayZeroPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayZeroSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayZeroBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayOneHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayOnePrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayOneSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayOneBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayTwoHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwoPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwoSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayTwoBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayThreeHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThreePrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThreeSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayThreeBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayFourHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFourPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFourSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFourBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dayFiveHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFivePrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFiveSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var dayFiveBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var daySixHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var daySixPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var daySixSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var daySixBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var daySevenHighLowWidth: NSLayoutConstraint!
    @IBOutlet weak var daySevenPrecipitationWidth: NSLayoutConstraint!
    @IBOutlet weak var daySevenSummaryWidth: NSLayoutConstraint!
    @IBOutlet weak var daySevenBarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var detailsLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var nextHoursLabelWidth: NSLayoutConstraint!
    
    @IBOutlet weak var currentConditionStackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition1LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition2LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition3LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition4LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition5LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition6LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition7LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition8LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition9LabelWidth: NSLayoutConstraint!
    @IBOutlet weak var currentCondition10LabelWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        locationManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        setupInitialData()
        setupInitialLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            if currentSummary.isEmpty == false {
                self.locationManager.stopUpdatingLocation()
            }
        }
        
        // Check for loaded weather, distance change, or color theme change
        if weatherLoaded == false || distanceChange == true || dataSourceChanged == true {
            loadingScreen()
        }
        
        // Check for units or clock change
        if unitsChanged == true || clockChanged == true {
            loadingScreen()
            unitsChanged = false
            clockChanged = false
        }
        
        // If user has viewed 10 times request review
        defaults.set((defaults.integer(forKey: "userViewedCounter") + 1), forKey: "userViewedCounter")
        if defaults.integer(forKey: "userViewedCounter") == 10 {
            SKStoreReviewController.requestReview()
        }
        
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            if defaults.bool(forKey: "cumulusPro") == false {
                dailyStackViewBottom.constant = 85
            } else {
                dailyStackViewBottom.constant = 25
            }
        } else if screenHeight == 667 {
            // iPhone 8
            if defaults.bool(forKey: "cumulusPro") == false {
                dailyStackViewBottom.constant = 85
            } else {
                dailyStackViewBottom.constant = 25
            }
        } else if screenHeight == 736 {
            // iPhone Plus
            dailyStackViewBottom.constant = 95
        } else if screenHeight == 812 {
            // iPhone XS
            dailyStackViewBottom.constant = 110
        } else if screenHeight == 896 {
            // iPhone XR & XS Max
            dailyStackViewBottom.constant = 195
        } else if screenHeight == 1024 {
            // iPad 9.7"
            dailyStackViewBottom.constant = 275
        } else if screenHeight == 1112 {
            // iPad 10.5"
            dailyStackViewBottom.constant = 360
        } else if screenHeight == 1194 {
            // iPad 11"
            dailyStackViewBottom.constant = 430
        } else if screenHeight == 1366 {
            // iPad 12.9"
            dailyStackViewBottom.constant = 600
        }
        
        // Setup for pull to refresh
        scrollView.alwaysBounceVertical = true
        scrollView.bounces  = true
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        self.scrollView.addSubview(refreshControl)
    }
    
    // MARK: - Action to scroll to top
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        
        if tabBarIndex == 0 {
            self.scrollView.setContentOffset(CGPoint.zero, animated: true)
        }
    }
    
    // MARK: - Refresh data and labels
    @objc func didPullToRefresh() {
        setupInitialData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.setWeatherDataLabels()
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Initial load of all values for images and labels
    func setupInitialLoad() {
        DispatchQueue.main.async {
            self.setWeatherDataLabels()
            self.setupObjectColors()
            self.setupConstraints()
        }
    }
    
    // MARK: Intial load of weather data
    func setupInitialData() {
        if (defaults.string(forKey: "dataSource")?.contains("Dark Sky") == true) {
            fetchDarkSkyWeatherData()
        } else if (defaults.string(forKey: "dataSource")?.contains("Aeris Weather") == true) {
            fetchAerisWeatherData()
        } else {
            fetchDarkSkyWeatherData()
            defaults.set("Dark Sky", forKey: "dataSource")
            UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set("Dark Sky", forKey: "setDataSource")
        }
        self.setWeatherDataLabels()
    }
    
    // MARK: - Check for default hourly condition value
    func setupDefaultHourlyCondition() {
        if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
            completePrecipUISetup()
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
            completeTempUISetup()
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
            completeHumidityUISetup()
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
            completeUVIndexUISetup()
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
            completeWindSpeedUISetup()
        } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
            completeCloudCoverUISetup()
        } else {
            completePrecipUISetup()
        }
    }
    
    // MARK: - Setup constraints & stack views
    func setSpacing(width: CGFloat, spacing: CGFloat) {
        daysStackViewWidth.constant = width
        weatherAlertWidth.constant = width
        
        dayZeroTopStackView.spacing = spacing
        dayOneTopStackView.spacing = spacing
        dayTwoTopStackView.spacing = spacing
        dayThreeTopStackView.spacing = spacing
        dayFourTopStackView.spacing = spacing
        dayFiveTopStackView.spacing = spacing
        daySixTopStackView.spacing = spacing
        daySevenTopStackView.spacing = spacing
    }
    
    func setupConstraints() {
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight == 568 {
            // iPhone SE
            setSpacing(width: 300, spacing: 2)
            
            currentConditionStackViewWidth.constant = 300
            detailsLabelWidth.constant = 300
            nextHoursLabelWidth.constant = 300
            nextDaysLabelWidth.constant = 300
            
            currentCondition1LabelWidth.constant = 110
            currentCondition2LabelWidth.constant = 110
            currentCondition3LabelWidth.constant = 110
            currentCondition4LabelWidth.constant = 110
            currentCondition5LabelWidth.constant = 110
            currentCondition6LabelWidth.constant = 110
            currentCondition7LabelWidth.constant = 110
            currentCondition8LabelWidth.constant = 110
            currentCondition9LabelWidth.constant = 110
            currentCondition10LabelWidth.constant = 110
            
            dayZeroHighLowWidth.constant = 101
            dayZeroPrecipitationWidth.constant = 100
            dayZeroSummaryWidth.constant = 300
            dayZeroBarWidth.constant = 300
            
            dayOneHighLowWidth.constant = 101
            dayOnePrecipitationWidth.constant = 100
            dayOneSummaryWidth.constant = 300
            dayOneBarWidth.constant = 300
            
            dayTwoHighLowWidth.constant = 101
            dayTwoPrecipitationWidth.constant = 100
            dayTwoSummaryWidth.constant = 300
            dayTwoBarWidth.constant = 300
            
            dayThreeHighLowWidth.constant = 101
            dayThreePrecipitationWidth.constant = 100
            dayThreeSummaryWidth.constant = 300
            dayThreeBarWidth.constant = 300
            
            dayFourHighLowWidth.constant = 101
            dayFourPrecipitationWidth.constant = 100
            dayFourSummaryWidth.constant = 300
            dayFourBarWidth.constant = 300
            
            dayFiveHighLowWidth.constant = 101
            dayFivePrecipitationWidth.constant = 100
            dayFiveSummaryWidth.constant = 300
            dayFiveBarWidth.constant = 300
            
            daySixHighLowWidth.constant = 101
            daySixPrecipitationWidth.constant = 100
            daySixSummaryWidth.constant = 300
            daySixBarWidth.constant = 300
            
            daySevenHighLowWidth.constant = 101
            daySevenPrecipitationWidth.constant = 100
            daySevenSummaryWidth.constant = 300
            daySevenBarWidth.constant = 300
        }
        
        dayZeroStackView.isHidden = true
        dayOneStackView.isHidden = true
        dayTwoStackView.isHidden = true
        dayThreeStackView.isHidden = true
        dayFourStackView.isHidden = true
        dayFiveStackView.isHidden = true
        daySixStackView.isHidden = true
        daySevenStackView.isHidden = true
    }
    
    // MARK: - Set colors for all objects
    func setupObjectColors() {
        checkColorTheme(color: defaults.string(forKey: "userSavedColorString")!)
        setTabBarColor(tabBar: tabBarController!)
        
        if traitCollection.userInterfaceStyle == .light {
            hourlyPageControl.currentPageIndicatorTintColor = .label
            dayZeroPageControl.currentPageIndicatorTintColor = .label
            dayOnePageControl.currentPageIndicatorTintColor = .label
            dayTwoPageControl.currentPageIndicatorTintColor = .label
            dayThreePageControl.currentPageIndicatorTintColor = .label
            dayFourPageControl.currentPageIndicatorTintColor = .label
            dayFivePageControl.currentPageIndicatorTintColor = .label
            daySixPageControl.currentPageIndicatorTintColor = .label
            daySevenPageControl.currentPageIndicatorTintColor = .label
            hourlyPageControl.pageIndicatorTintColor = .secondaryLabel
            dayZeroPageControl.pageIndicatorTintColor = .secondaryLabel
            dayOnePageControl.pageIndicatorTintColor = .secondaryLabel
            dayTwoPageControl.pageIndicatorTintColor = .secondaryLabel
            dayThreePageControl.pageIndicatorTintColor = .secondaryLabel
            dayFourPageControl.pageIndicatorTintColor = .secondaryLabel
            dayFivePageControl.pageIndicatorTintColor = .secondaryLabel
            daySixPageControl.pageIndicatorTintColor = .secondaryLabel
            daySevenPageControl.pageIndicatorTintColor = .secondaryLabel
        }
    }
    
    // MARK: - Check Color Theme and set forecast bar images
    func checkColorTheme(color: String) {
        // Forecast Bars
        dayZeroForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayOneForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayTwoForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayThreeForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayFourForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        dayFiveForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        daySixForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
        daySevenForecastBar.image = UIImage(named: "Forecast bar \(buttonColor).pdf")
    }
    
    // MARK: - Set daily condition images
    // Days 0-7
    func setDailyConditionImages() {
        dayZeroCondition.image = UIImage(named: weatherCondition(condition: weatherCondition0, type: "daily"))
        dayOneCondition.image = UIImage(named: weatherCondition(condition: weatherCondition1, type: "daily"))
        dayTwoCondition.image = UIImage(named: weatherCondition(condition: weatherCondition2, type: "daily"))
        dayThreeCondition.image = UIImage(named: weatherCondition(condition: weatherCondition3, type: "daily"))
        dayFourCondition.image = UIImage(named: weatherCondition(condition: weatherCondition4, type: "daily"))
        dayFiveCondition.image = UIImage(named: weatherCondition(condition: weatherCondition5, type: "daily"))
        daySixCondition.image = UIImage(named: weatherCondition(condition: weatherCondition6, type: "daily"))
        daySevenCondition.image = UIImage(named: weatherCondition(condition: weatherCondition7, type: "daily"))
    }
    
    // Set hourly condition values for each day
    func setHourlyConditionTextForDay(day: Int) {
        if day == 0 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                completeDayZeroPrecipUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                completeDayZeroTempUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                completeDayZeroHumidityUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                completeDayZeroUVIndexUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                completeDayZeroWindSpeedUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                completeDayZeroCloudCoverUISetup()
            } else {
                completeDayZeroPrecipUISetup()
            }
        } else if day == 1 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                completeDayOnePrecipUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                completeDayOneTempUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                completeDayOneHumidityUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                completeDayOneUVIndexUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                completeDayOneWindSpeedUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                completeDayOneCloudCoverUISetup()
            } else {
                completeDayOnePrecipUISetup()
            }
        } else if day == 2 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                completeDayTwoPrecipUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                completeDayTwoTempUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                completeDayTwoHumidityUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                completeDayTwoUVIndexUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                completeDayTwoWindSpeedUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                completeDayTwoCloudCoverUISetup()
            } else {
                completeDayTwoPrecipUISetup()
            }
        } else if day == 3 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                completeDayThreePrecipUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                completeDayThreeTempUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                completeDayThreeHumidityUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                completeDayThreeUVIndexUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("WIND") == true) {
                completeDayThreeWindSpeedUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                completeDayThreeCloudCoverUISetup()
            } else {
                completeDayThreePrecipUISetup()
            }
        } else if day == 4 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                completeDayFourPrecipUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                completeDayFourTempUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                completeDayFourHumidityUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                completeDayFourUVIndexUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                completeDayFourWindSpeedUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                completeDayFourCloudCoverUISetup()
            } else {
                completeDayFourPrecipUISetup()
            }
        } else if day == 5 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                completeDayFivePrecipUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("TEMP") == true) {
                completeDayFiveTempUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                completeDayFiveHumidityUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                completeDayFiveUVIndexUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                completeDayFiveWindSpeedUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                completeDayFiveCloudCoverUISetup()
            } else {
                completeDayFivePrecipUISetup()
            }
        } else if day == 6 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                completeDaySixPrecipUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                completeDaySixTempUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                completeDaySixHumidityUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                completeDaySixUVIndexUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                completeDaySixWindSpeedUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                completeDaySixCloudCoverUISetup()
            } else {
                completeDaySixPrecipUISetup()
            }
        } else if day == 7 {
            if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Precip") == true) {
                completeDaySevenPrecipUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Temp") == true) {
                completeDaySevenTempUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Humidity") == true) {
                completeDaySevenHumidityUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("UV Index") == true) {
                completeDaySevenUVIndexUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Wind") == true) {
                completeDaySevenWindSpeedUISetup()
            } else if (defaults.string(forKey: "defaultHourlyCondition")?.contains("Cloud Cover") == true) {
                completeDaySevenCloudCoverUISetup()
            } else {
                completeDaySevenPrecipUISetup()
            }
        }
    }
    
    // MARK: - Set up hourly values for daily and hourly forecasts
    func hourSetup(conditionImage: UIImageView!, conditionImageType: String, conditionValueText: UILabel!, conditionValue: Int, image: UIImageView!, timeText: UILabel!, timeValue: String, height: NSLayoutConstraint!) {
        conditionImage.image = UIImage(named: weatherCondition(condition: conditionImageType, type: "image"))
        conditionValueText.text = "\(conditionValue)"
        image.image = UIImage(named: "Rectangle \(buttonColor).pdf")
        timeText.text = "\(timeValue)"
        height.constant = CGFloat(hourlyValue(value: conditionValue))
    }
    
    func completePrecipUISetup() {
        if hourlyPageControl.currentPage == 0 {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour0, conditionValueText: hour0ValueText, conditionValue: precipHour0, image: hour0Image, timeText: hour0Time, timeValue: hour0, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour1, conditionValueText: hour1ValueText, conditionValue: precipHour1, image: hour1Image, timeText: hour1Time, timeValue: hour1, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour2, conditionValueText: hour2ValueText, conditionValue: precipHour2, image: hour2Image, timeText: hour2Time, timeValue: hour2, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour3, conditionValueText: hour3ValueText, conditionValue: precipHour3, image: hour3Image, timeText: hour3Time, timeValue: hour3, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour4, conditionValueText: hour4ValueText, conditionValue: precipHour4, image: hour4Image, timeText: hour4Time, timeValue: hour4, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour5, conditionValueText: hour5ValueText, conditionValue: precipHour5, image: hour5Image, timeText: hour5Time, timeValue: hour5, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour6, conditionValueText: hour6ValueText, conditionValue: precipHour6, image: hour6Image, timeText: hour6Time, timeValue: hour6, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour7, conditionValueText: hour7ValueText, conditionValue: precipHour7, image: hour7Image, timeText: hour7Time, timeValue: hour7, height: hour7ValueHeight)
        } else {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour8, conditionValueText: hour0ValueText, conditionValue: precipHour8, image: hour0Image, timeText: hour0Time, timeValue: hour8, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour9, conditionValueText: hour1ValueText, conditionValue: precipHour9, image: hour1Image, timeText: hour1Time, timeValue: hour9, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour10, conditionValueText: hour2ValueText, conditionValue: precipHour10, image: hour2Image, timeText: hour2Time, timeValue: hour10, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour11, conditionValueText: hour3ValueText, conditionValue: precipHour11, image: hour3Image, timeText: hour3Time, timeValue: hour11, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour12, conditionValueText: hour4ValueText, conditionValue: precipHour12, image: hour4Image, timeText: hour4Time, timeValue: hour12, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour13, conditionValueText: hour5ValueText, conditionValue: precipHour13, image: hour5Image, timeText: hour5Time, timeValue: hour13, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour14, conditionValueText: hour6ValueText, conditionValue: precipHour14, image: hour6Image, timeText: hour6Time, timeValue: hour14, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour15, conditionValueText: hour7ValueText, conditionValue: precipHour15, image: hour7Image, timeText: hour7Time, timeValue: hour15, height: hour7ValueHeight)
        }
    }
    
    func completeTempUISetup() {
        if hourlyPageControl.currentPage == 0 {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour0, conditionValueText: hour0ValueText, conditionValue: tempHour0, image: hour0Image, timeText: hour0Time, timeValue: hour0, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour1, conditionValueText: hour1ValueText, conditionValue: tempHour1, image: hour1Image, timeText: hour1Time, timeValue: hour1, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour2, conditionValueText: hour2ValueText, conditionValue: tempHour2, image: hour2Image, timeText: hour2Time, timeValue: hour2, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour3, conditionValueText: hour3ValueText, conditionValue: tempHour3, image: hour3Image, timeText: hour3Time, timeValue: hour3, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour4, conditionValueText: hour4ValueText, conditionValue: tempHour4, image: hour4Image, timeText: hour4Time, timeValue: hour4, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour5, conditionValueText: hour5ValueText, conditionValue: tempHour5, image: hour5Image, timeText: hour5Time, timeValue: hour5, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour6, conditionValueText: hour6ValueText, conditionValue: tempHour6, image: hour6Image, timeText: hour6Time, timeValue: hour6, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour7, conditionValueText: hour7ValueText, conditionValue: tempHour7, image: hour7Image, timeText: hour7Time, timeValue: hour7, height: hour7ValueHeight)
        } else {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour8, conditionValueText: hour0ValueText, conditionValue: tempHour8, image: hour0Image, timeText: hour0Time, timeValue: hour8, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour9, conditionValueText: hour1ValueText, conditionValue: tempHour9, image: hour1Image, timeText: hour1Time, timeValue: hour9, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour10, conditionValueText: hour2ValueText, conditionValue: tempHour10, image: hour2Image, timeText: hour2Time, timeValue: hour10, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour11, conditionValueText: hour3ValueText, conditionValue: tempHour11, image: hour3Image, timeText: hour3Time, timeValue: hour11, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour12, conditionValueText: hour4ValueText, conditionValue: tempHour12, image: hour4Image, timeText: hour4Time, timeValue: hour12, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour13, conditionValueText: hour5ValueText, conditionValue: tempHour13, image: hour5Image, timeText: hour5Time, timeValue: hour13, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour14, conditionValueText: hour6ValueText, conditionValue: tempHour14, image: hour6Image, timeText: hour6Time, timeValue: hour14, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour15, conditionValueText: hour7ValueText, conditionValue: tempHour15, image: hour7Image, timeText: hour7Time, timeValue: hour15, height: hour7ValueHeight)
        }
    }
    
    func completeHumidityUISetup() {
        if hourlyPageControl.currentPage == 0 {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour0, conditionValueText: hour0ValueText, conditionValue: humidityHour0, image: hour0Image, timeText: hour0Time, timeValue: hour0, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour1, conditionValueText: hour1ValueText, conditionValue: humidityHour1, image: hour1Image, timeText: hour1Time, timeValue: hour1, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour2, conditionValueText: hour2ValueText, conditionValue: humidityHour2, image: hour2Image, timeText: hour2Time, timeValue: hour2, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour3, conditionValueText: hour3ValueText, conditionValue: humidityHour3, image: hour3Image, timeText: hour3Time, timeValue: hour3, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour4, conditionValueText: hour4ValueText, conditionValue: humidityHour4, image: hour4Image, timeText: hour4Time, timeValue: hour4, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour5, conditionValueText: hour5ValueText, conditionValue: humidityHour5, image: hour5Image, timeText: hour5Time, timeValue: hour5, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour6, conditionValueText: hour6ValueText, conditionValue: humidityHour6, image: hour6Image, timeText: hour6Time, timeValue: hour6, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour7, conditionValueText: hour7ValueText, conditionValue: humidityHour7, image: hour7Image, timeText: hour7Time, timeValue: hour7, height: hour7ValueHeight)
        } else {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour8, conditionValueText: hour0ValueText, conditionValue: humidityHour8, image: hour0Image, timeText: hour0Time, timeValue: hour8, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour9, conditionValueText: hour1ValueText, conditionValue: humidityHour9, image: hour1Image, timeText: hour1Time, timeValue: hour9, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour10, conditionValueText: hour2ValueText, conditionValue: humidityHour10, image: hour2Image, timeText: hour2Time, timeValue: hour10, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour11, conditionValueText: hour3ValueText, conditionValue: humidityHour11, image: hour3Image, timeText: hour3Time, timeValue: hour11, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour12, conditionValueText: hour4ValueText, conditionValue: humidityHour12, image: hour4Image, timeText: hour4Time, timeValue: hour12, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour13, conditionValueText: hour5ValueText, conditionValue: humidityHour13, image: hour5Image, timeText: hour5Time, timeValue: hour13, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour14, conditionValueText: hour6ValueText, conditionValue: humidityHour14, image: hour6Image, timeText: hour6Time, timeValue: hour14, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour15, conditionValueText: hour7ValueText, conditionValue: humidityHour15, image: hour7Image, timeText: hour7Time, timeValue: hour15, height: hour7ValueHeight)
        }
    }
    
    func completeUVIndexUISetup() {
        if hourlyPageControl.currentPage == 0 {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour0, conditionValueText: hour0ValueText, conditionValue: uvindexHour0, image: hour0Image, timeText: hour0Time, timeValue: hour0, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour1, conditionValueText: hour1ValueText, conditionValue: uvindexHour1, image: hour1Image, timeText: hour1Time, timeValue: hour1, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour2, conditionValueText: hour2ValueText, conditionValue: uvindexHour2, image: hour2Image, timeText: hour2Time, timeValue: hour2, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour3, conditionValueText: hour3ValueText, conditionValue: uvindexHour3, image: hour3Image, timeText: hour3Time, timeValue: hour3, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour4, conditionValueText: hour4ValueText, conditionValue: uvindexHour4, image: hour4Image, timeText: hour4Time, timeValue: hour4, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour5, conditionValueText: hour5ValueText, conditionValue: uvindexHour5, image: hour5Image, timeText: hour5Time, timeValue: hour5, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour6, conditionValueText: hour6ValueText, conditionValue: uvindexHour6, image: hour6Image, timeText: hour6Time, timeValue: hour6, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour7, conditionValueText: hour7ValueText, conditionValue: uvindexHour7, image: hour7Image, timeText: hour7Time, timeValue: hour7, height: hour7ValueHeight)
        } else {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour8, conditionValueText: hour0ValueText, conditionValue: uvindexHour8, image: hour0Image, timeText: hour0Time, timeValue: hour8, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour9, conditionValueText: hour1ValueText, conditionValue: uvindexHour9, image: hour1Image, timeText: hour1Time, timeValue: hour9, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour10, conditionValueText: hour2ValueText, conditionValue: uvindexHour10, image: hour2Image, timeText: hour2Time, timeValue: hour10, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour11, conditionValueText: hour3ValueText, conditionValue: uvindexHour11, image: hour3Image, timeText: hour3Time, timeValue: hour11, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour12, conditionValueText: hour4ValueText, conditionValue: uvindexHour12, image: hour4Image, timeText: hour4Time, timeValue: hour12, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour13, conditionValueText: hour5ValueText, conditionValue: uvindexHour13, image: hour5Image, timeText: hour5Time, timeValue: hour13, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour14, conditionValueText: hour6ValueText, conditionValue: uvindexHour14, image: hour6Image, timeText: hour6Time, timeValue: hour14, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour15, conditionValueText: hour7ValueText, conditionValue: uvindexHour15, image: hour7Image, timeText: hour7Time, timeValue: hour15, height: hour7ValueHeight)
        }
    }

    func completeWindSpeedUISetup() {
        if hourlyPageControl.currentPage == 0 {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour0, conditionValueText: hour0ValueText, conditionValue: windSpeedHour0, image: hour0Image, timeText: hour0Time, timeValue: hour0, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour1, conditionValueText: hour1ValueText, conditionValue: windSpeedHour1, image: hour1Image, timeText: hour1Time, timeValue: hour1, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour2, conditionValueText: hour2ValueText, conditionValue: windSpeedHour2, image: hour2Image, timeText: hour2Time, timeValue: hour2, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour3, conditionValueText: hour3ValueText, conditionValue: windSpeedHour3, image: hour3Image, timeText: hour3Time, timeValue: hour3, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour4, conditionValueText: hour4ValueText, conditionValue: windSpeedHour4, image: hour4Image, timeText: hour4Time, timeValue: hour4, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour5, conditionValueText: hour5ValueText, conditionValue: windSpeedHour5, image: hour5Image, timeText: hour5Time, timeValue: hour5, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour6, conditionValueText: hour6ValueText, conditionValue: windSpeedHour6, image: hour6Image, timeText: hour6Time, timeValue: hour6, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour7, conditionValueText: hour7ValueText, conditionValue: windSpeedHour7, image: hour7Image, timeText: hour7Time, timeValue: hour7, height: hour7ValueHeight)
        } else {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour8, conditionValueText: hour0ValueText, conditionValue: windSpeedHour8, image: hour0Image, timeText: hour0Time, timeValue: hour8, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour9, conditionValueText: hour1ValueText, conditionValue: windSpeedHour9, image: hour1Image, timeText: hour1Time, timeValue: hour9, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour10, conditionValueText: hour2ValueText, conditionValue: windSpeedHour10, image: hour2Image, timeText: hour2Time, timeValue: hour10, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour11, conditionValueText: hour3ValueText, conditionValue: windSpeedHour11, image: hour3Image, timeText: hour3Time, timeValue: hour11, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour12, conditionValueText: hour4ValueText, conditionValue: windSpeedHour12, image: hour4Image, timeText: hour4Time, timeValue: hour12, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour13, conditionValueText: hour5ValueText, conditionValue: windSpeedHour13, image: hour5Image, timeText: hour5Time, timeValue: hour13, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour14, conditionValueText: hour6ValueText, conditionValue: windSpeedHour14, image: hour6Image, timeText: hour6Time, timeValue: hour14, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour15, conditionValueText: hour7ValueText, conditionValue: windSpeedHour15, image: hour7Image, timeText: hour7Time, timeValue: hour15, height: hour7ValueHeight)
        }
    }
    
    func completeCloudCoverUISetup() {
        if hourlyPageControl.currentPage == 0 {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour0, conditionValueText: hour0ValueText, conditionValue: cloudCoverHour0, image: hour0Image, timeText: hour0Time, timeValue: hour0, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour1, conditionValueText: hour1ValueText, conditionValue: cloudCoverHour1, image: hour1Image, timeText: hour1Time, timeValue: hour1, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour2, conditionValueText: hour2ValueText, conditionValue: cloudCoverHour2, image: hour2Image, timeText: hour2Time, timeValue: hour2, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour3, conditionValueText: hour3ValueText, conditionValue: cloudCoverHour3, image: hour3Image, timeText: hour3Time, timeValue: hour3, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour4, conditionValueText: hour4ValueText, conditionValue: cloudCoverHour4, image: hour4Image, timeText: hour4Time, timeValue: hour4, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour5, conditionValueText: hour5ValueText, conditionValue: cloudCoverHour5, image: hour5Image, timeText: hour5Time, timeValue: hour5, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour6, conditionValueText: hour6ValueText, conditionValue: cloudCoverHour6, image: hour6Image, timeText: hour6Time, timeValue: hour6, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour7, conditionValueText: hour7ValueText, conditionValue: cloudCoverHour7, image: hour7Image, timeText: hour7Time, timeValue: hour7, height: hour7ValueHeight)
        } else {
            hourSetup(conditionImage: hour0Condition, conditionImageType: conditionHour8, conditionValueText: hour0ValueText, conditionValue: cloudCoverHour8, image: hour0Image, timeText: hour0Time, timeValue: hour8, height: hour0ValueHeight)
            hourSetup(conditionImage: hour1Condition, conditionImageType: conditionHour9, conditionValueText: hour1ValueText, conditionValue: cloudCoverHour9, image: hour1Image, timeText: hour1Time, timeValue: hour9, height: hour1ValueHeight)
            hourSetup(conditionImage: hour2Condition, conditionImageType: conditionHour10, conditionValueText: hour2ValueText, conditionValue: cloudCoverHour10, image: hour2Image, timeText: hour2Time, timeValue: hour10, height: hour2ValueHeight)
            hourSetup(conditionImage: hour3Condition, conditionImageType: conditionHour11, conditionValueText: hour3ValueText, conditionValue: cloudCoverHour11, image: hour3Image, timeText: hour3Time, timeValue: hour11, height: hour3ValueHeight)
            hourSetup(conditionImage: hour4Condition, conditionImageType: conditionHour12, conditionValueText: hour4ValueText, conditionValue: cloudCoverHour12, image: hour4Image, timeText: hour4Time, timeValue: hour12, height: hour4ValueHeight)
            hourSetup(conditionImage: hour5Condition, conditionImageType: conditionHour13, conditionValueText: hour5ValueText, conditionValue: cloudCoverHour13, image: hour5Image, timeText: hour5Time, timeValue: hour13, height: hour5ValueHeight)
            hourSetup(conditionImage: hour6Condition, conditionImageType: conditionHour14, conditionValueText: hour6ValueText, conditionValue: cloudCoverHour14, image: hour6Image, timeText: hour6Time, timeValue: hour14, height: hour6ValueHeight)
            hourSetup(conditionImage: hour7Condition, conditionImageType: conditionHour15, conditionValueText: hour7ValueText, conditionValue: cloudCoverHour15, image: hour7Image, timeText: hour7Time, timeValue: hour15, height: hour7ValueHeight)
        }
    }
    
    func completeDayZeroPrecipUISetup() {
        if dayZeroPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition0, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroPrecip0, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime0, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition1, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroPrecip1, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime1, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition2, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroPrecip2, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime2, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition3, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroPrecip3, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime3, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition4, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroPrecip4, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime4, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition5, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroPrecip5, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime5, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition6, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroPrecip6, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime6, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition7, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroPrecip7, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime7, height: dayZeroHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition8, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroPrecip8, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime8, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition9, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroPrecip9, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime9, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition10, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroPrecip10, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime10, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition11, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroPrecip11, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime11, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition12, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroPrecip12, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime12, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition13, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroPrecip13, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime13, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition14, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroPrecip14, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime14, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition15, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroPrecip15, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime15, height: dayZeroHour7ValueHeight)
        }
    }
    
    func completeDayZeroTempUISetup() {
        if dayZeroPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition0, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroTemp0, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime0, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition1, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroTemp1, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime1, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition2, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroTemp2, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime2, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition3, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroTemp3, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime3, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition4, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroTemp4, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime4, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition5, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroTemp5, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime5, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition6, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroTemp6, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime6, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition7, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroTemp7, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime7, height: dayZeroHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition8, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroTemp8, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime8, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition9, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroTemp9, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime9, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition10, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroTemp10, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime10, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition11, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroTemp11, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime11, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition12, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroTemp12, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime12, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition13, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroTemp13, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime13, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition14, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroTemp14, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime14, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition15, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroTemp15, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime15, height: dayZeroHour7ValueHeight)
        }
    }
    
    func completeDayZeroHumidityUISetup() {
        if dayZeroPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition0, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroHumidity0, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime0, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition1, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroHumidity1, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime1, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition2, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroHumidity2, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime2, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition3, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroHumidity3, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime3, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition4, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroHumidity4, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime4, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition5, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroHumidity5, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime5, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition6, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroHumidity6, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime6, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition7, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroHumidity7, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime7, height: dayZeroHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition8, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroHumidity8, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime8, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition9, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroHumidity9, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime9, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition10, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroHumidity10, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime10, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition11, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroHumidity11, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime11, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition12, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroHumidity12, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime12, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition13, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroHumidity13, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime13, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition14, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroHumidity14, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime14, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition15, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroHumidity15, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime15, height: dayZeroHour7ValueHeight)
        }
    }
    
    func completeDayZeroUVIndexUISetup() {
        if dayZeroPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition0, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroIndex0, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime0, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition1, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroIndex1, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime1, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition2, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroIndex2, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime2, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition3, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroIndex3, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime3, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition4, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroIndex4, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime4, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition5, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroIndex5, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime5, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition6, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroIndex6, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime6, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition7, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroIndex7, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime7, height: dayZeroHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition8, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroIndex8, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime8, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition9, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroIndex9, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime9, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition10, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroIndex10, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime10, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition11, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroIndex11, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime11, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition12, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroIndex12, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime12, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition13, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroIndex13, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime13, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition14, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroIndex14, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime14, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition15, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroIndex15, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime15, height: dayZeroHour7ValueHeight)
        }
    }

    func completeDayZeroWindSpeedUISetup() {
        if dayZeroPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition0, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroWindSpeed0, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime0, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition1, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroWindSpeed1, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime1, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition2, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroWindSpeed2, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime2, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition3, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroWindSpeed3, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime3, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition4, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroWindSpeed4, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime4, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition5, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroWindSpeed5, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime5, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition6, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroWindSpeed6, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime6, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition7, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroWindSpeed7, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime7, height: dayZeroHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition8, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroWindSpeed8, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime8, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition9, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroWindSpeed9, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime9, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition10, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroWindSpeed10, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime10, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition11, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroWindSpeed11, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime11, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition12, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroWindSpeed12, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime12, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition13, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroWindSpeed13, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime13, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition14, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroWindSpeed14, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime14, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition15, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroWindSpeed15, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime15, height: dayZeroHour7ValueHeight)
        }
    }
    
    func completeDayZeroCloudCoverUISetup() {
        if dayZeroPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition0, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroCloudCover0, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime0, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition1, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroCloudCover1, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime1, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition2, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroCloudCover2, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime2, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition3, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroCloudCover3, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime3, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition4, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroCloudCover4, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime4, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition5, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroCloudCover5, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime5, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition6, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroCloudCover6, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime6, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition7, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroCloudCover7, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime7, height: dayZeroHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayZeroHour0Condition, conditionImageType: dayZeroCondition8, conditionValueText: dayZeroHour0ValueText, conditionValue: dayZeroCloudCover8, image: dayZeroHour0Image, timeText: dayZeroHour0Time, timeValue: dayZeroTime8, height: dayZeroHour0ValueHeight)
            hourSetup(conditionImage: dayZeroHour1Condition, conditionImageType: dayZeroCondition9, conditionValueText: dayZeroHour1ValueText, conditionValue: dayZeroCloudCover9, image: dayZeroHour1Image, timeText: dayZeroHour1Time, timeValue: dayZeroTime9, height: dayZeroHour1ValueHeight)
            hourSetup(conditionImage: dayZeroHour2Condition, conditionImageType: dayZeroCondition10, conditionValueText: dayZeroHour2ValueText, conditionValue: dayZeroCloudCover10, image: dayZeroHour2Image, timeText: dayZeroHour2Time, timeValue: dayZeroTime10, height: dayZeroHour2ValueHeight)
            hourSetup(conditionImage: dayZeroHour3Condition, conditionImageType: dayZeroCondition11, conditionValueText: dayZeroHour3ValueText, conditionValue: dayZeroCloudCover11, image: dayZeroHour3Image, timeText: dayZeroHour3Time, timeValue: dayZeroTime11, height: dayZeroHour3ValueHeight)
            hourSetup(conditionImage: dayZeroHour4Condition, conditionImageType: dayZeroCondition12, conditionValueText: dayZeroHour4ValueText, conditionValue: dayZeroCloudCover12, image: dayZeroHour4Image, timeText: dayZeroHour4Time, timeValue: dayZeroTime12, height: dayZeroHour4ValueHeight)
            hourSetup(conditionImage: dayZeroHour5Condition, conditionImageType: dayZeroCondition13, conditionValueText: dayZeroHour5ValueText, conditionValue: dayZeroCloudCover13, image: dayZeroHour5Image, timeText: dayZeroHour5Time, timeValue: dayZeroTime13, height: dayZeroHour5ValueHeight)
            hourSetup(conditionImage: dayZeroHour6Condition, conditionImageType: dayZeroCondition14, conditionValueText: dayZeroHour6ValueText, conditionValue: dayZeroCloudCover14, image: dayZeroHour6Image, timeText: dayZeroHour6Time, timeValue: dayZeroTime14, height: dayZeroHour6ValueHeight)
            hourSetup(conditionImage: dayZeroHour7Condition, conditionImageType: dayZeroCondition15, conditionValueText: dayZeroHour7ValueText, conditionValue: dayZeroCloudCover15, image: dayZeroHour7Image, timeText: dayZeroHour7Time, timeValue: dayZeroTime15, height: dayZeroHour7ValueHeight)
        }
    }
    
    func completeDayOnePrecipUISetup() {
        if dayOnePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition0, conditionValueText: dayOneHour0ValueText, conditionValue: dayOnePrecip0, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime0, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition1, conditionValueText: dayOneHour1ValueText, conditionValue: dayOnePrecip1, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime1, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition2, conditionValueText: dayOneHour2ValueText, conditionValue: dayOnePrecip2, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime2, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition3, conditionValueText: dayOneHour3ValueText, conditionValue: dayOnePrecip3, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime3, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition4, conditionValueText: dayOneHour4ValueText, conditionValue: dayOnePrecip4, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime4, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition5, conditionValueText: dayOneHour5ValueText, conditionValue: dayOnePrecip5, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime5, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition6, conditionValueText: dayOneHour6ValueText, conditionValue: dayOnePrecip6, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime6, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition7, conditionValueText: dayOneHour7ValueText, conditionValue: dayOnePrecip7, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime7, height: dayOneHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition8, conditionValueText: dayOneHour0ValueText, conditionValue: dayOnePrecip8, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime8, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition9, conditionValueText: dayOneHour1ValueText, conditionValue: dayOnePrecip9, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime9, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition10, conditionValueText: dayOneHour2ValueText, conditionValue: dayOnePrecip10, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime10, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition11, conditionValueText: dayOneHour3ValueText, conditionValue: dayOnePrecip11, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime11, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition12, conditionValueText: dayOneHour4ValueText, conditionValue: dayOnePrecip12, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime12, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition13, conditionValueText: dayOneHour5ValueText, conditionValue: dayOnePrecip13, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime13, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition14, conditionValueText: dayOneHour6ValueText, conditionValue: dayOnePrecip14, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime14, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition15, conditionValueText: dayOneHour7ValueText, conditionValue: dayOnePrecip15, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime15, height: dayOneHour7ValueHeight)
        }
    }
    
    func completeDayOneTempUISetup() {
        if dayOnePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition0, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneTemp0, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime0, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition1, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneTemp1, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime1, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition2, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneTemp2, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime2, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition3, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneTemp3, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime3, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition4, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneTemp4, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime4, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition5, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneTemp5, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime5, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition6, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneTemp6, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime6, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition7, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneTemp7, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime7, height: dayOneHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition8, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneTemp8, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime8, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition9, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneTemp9, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime9, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition10, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneTemp10, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime10, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition11, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneTemp11, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime11, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition12, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneTemp12, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime12, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition13, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneTemp13, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime13, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition14, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneTemp14, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime14, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition15, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneTemp15, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime15, height: dayOneHour7ValueHeight)
        }
    }
    
    func completeDayOneHumidityUISetup() {
        if dayOnePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition0, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneHumidity0, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime0, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition1, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneHumidity1, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime1, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition2, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneHumidity2, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime2, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition3, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneHumidity3, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime3, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition4, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneHumidity4, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime4, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition5, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneHumidity5, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime5, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition6, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneHumidity6, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime6, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition7, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneHumidity7, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime7, height: dayOneHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition8, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneHumidity8, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime8, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition9, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneHumidity9, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime9, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition10, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneHumidity10, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime10, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition11, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneHumidity11, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime11, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition12, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneHumidity12, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime12, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition13, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneHumidity13, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime13, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition14, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneHumidity14, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime14, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition15, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneHumidity15, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime15, height: dayOneHour7ValueHeight)
        }
    }
    
    func completeDayOneUVIndexUISetup() {
        if dayOnePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition0, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneIndex0, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime0, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition1, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneIndex1, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime1, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition2, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneIndex2, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime2, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition3, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneIndex3, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime3, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition4, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneIndex4, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime4, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition5, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneIndex5, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime5, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition6, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneIndex6, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime6, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition7, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneIndex7, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime7, height: dayOneHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition8, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneIndex8, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime8, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition9, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneIndex9, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime9, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition10, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneIndex10, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime10, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition11, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneIndex11, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime11, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition12, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneIndex12, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime12, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition13, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneIndex13, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime13, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition14, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneIndex14, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime14, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition15, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneIndex15, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime15, height: dayOneHour7ValueHeight)
        }
    }

    func completeDayOneWindSpeedUISetup() {
        if dayOnePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition0, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneWindSpeed0, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime0, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition1, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneWindSpeed1, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime1, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition2, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneWindSpeed2, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime2, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition3, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneWindSpeed3, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime3, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition4, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneWindSpeed4, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime4, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition5, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneWindSpeed5, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime5, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition6, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneWindSpeed6, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime6, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition7, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneWindSpeed7, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime7, height: dayOneHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition8, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneWindSpeed8, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime8, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition9, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneWindSpeed9, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime9, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition10, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneWindSpeed10, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime10, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition11, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneWindSpeed11, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime11, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition12, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneWindSpeed12, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime12, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition13, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneWindSpeed13, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime13, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition14, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneWindSpeed14, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime14, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition15, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneWindSpeed15, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime15, height: dayOneHour7ValueHeight)
        }
    }
    
    func completeDayOneCloudCoverUISetup() {
        if dayOnePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition0, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneCloudCover0, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime0, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition1, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneCloudCover1, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime1, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition2, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneCloudCover2, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime2, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition3, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneCloudCover3, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime3, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition4, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneCloudCover4, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime4, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition5, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneCloudCover5, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime5, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition6, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneCloudCover6, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime6, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition7, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneCloudCover7, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime7, height: dayOneHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayOneHour0Condition, conditionImageType: dayOneCondition8, conditionValueText: dayOneHour0ValueText, conditionValue: dayOneCloudCover8, image: dayOneHour0Image, timeText: dayOneHour0Time, timeValue: dayOneTime8, height: dayOneHour0ValueHeight)
            hourSetup(conditionImage: dayOneHour1Condition, conditionImageType: dayOneCondition9, conditionValueText: dayOneHour1ValueText, conditionValue: dayOneCloudCover9, image: dayOneHour1Image, timeText: dayOneHour1Time, timeValue: dayOneTime9, height: dayOneHour1ValueHeight)
            hourSetup(conditionImage: dayOneHour2Condition, conditionImageType: dayOneCondition10, conditionValueText: dayOneHour2ValueText, conditionValue: dayOneCloudCover10, image: dayOneHour2Image, timeText: dayOneHour2Time, timeValue: dayOneTime10, height: dayOneHour2ValueHeight)
            hourSetup(conditionImage: dayOneHour3Condition, conditionImageType: dayOneCondition11, conditionValueText: dayOneHour3ValueText, conditionValue: dayOneCloudCover11, image: dayOneHour3Image, timeText: dayOneHour3Time, timeValue: dayOneTime11, height: dayOneHour3ValueHeight)
            hourSetup(conditionImage: dayOneHour4Condition, conditionImageType: dayOneCondition12, conditionValueText: dayOneHour4ValueText, conditionValue: dayOneCloudCover12, image: dayOneHour4Image, timeText: dayOneHour4Time, timeValue: dayOneTime12, height: dayOneHour4ValueHeight)
            hourSetup(conditionImage: dayOneHour5Condition, conditionImageType: dayOneCondition13, conditionValueText: dayOneHour5ValueText, conditionValue: dayOneCloudCover13, image: dayOneHour5Image, timeText: dayOneHour5Time, timeValue: dayOneTime13, height: dayOneHour5ValueHeight)
            hourSetup(conditionImage: dayOneHour6Condition, conditionImageType: dayOneCondition14, conditionValueText: dayOneHour6ValueText, conditionValue: dayOneCloudCover14, image: dayOneHour6Image, timeText: dayOneHour6Time, timeValue: dayOneTime14, height: dayOneHour6ValueHeight)
            hourSetup(conditionImage: dayOneHour7Condition, conditionImageType: dayOneCondition15, conditionValueText: dayOneHour7ValueText, conditionValue: dayOneCloudCover15, image: dayOneHour7Image, timeText: dayOneHour7Time, timeValue: dayOneTime15, height: dayOneHour7ValueHeight)
        }
    }
    
    func completeDayTwoPrecipUISetup() {
        if dayTwoPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition0, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoPrecip0, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime0, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition1, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoPrecip1, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime1, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition2, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoPrecip2, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime2, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition3, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoPrecip3, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime3, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition4, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoPrecip4, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime4, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition5, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoPrecip5, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime5, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition6, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoPrecip6, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime6, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition7, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoPrecip7, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime7, height: dayTwoHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition8, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoPrecip8, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime8, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition9, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoPrecip9, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime9, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition10, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoPrecip10, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime10, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition11, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoPrecip11, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime11, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition12, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoPrecip12, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime12, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition13, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoPrecip13, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime13, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition14, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoPrecip14, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime14, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition15, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoPrecip15, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime15, height: dayTwoHour7ValueHeight)
        }
    }
    
    func completeDayTwoTempUISetup() {
        if dayTwoPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition0, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoTemp0, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime0, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition1, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoTemp1, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime1, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition2, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoTemp2, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime2, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition3, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoTemp3, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime3, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition4, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoTemp4, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime4, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition5, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoTemp5, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime5, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition6, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoTemp6, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime6, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition7, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoTemp7, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime7, height: dayTwoHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition8, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoTemp8, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime8, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition9, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoTemp9, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime9, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition10, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoTemp10, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime10, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition11, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoTemp11, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime11, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition12, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoTemp12, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime12, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition13, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoTemp13, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime13, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition14, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoTemp14, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime14, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition15, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoTemp15, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime15, height: dayTwoHour7ValueHeight)
        }
    }
    
    func completeDayTwoHumidityUISetup() {
        if dayTwoPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition0, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoHumidity0, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime0, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition1, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoHumidity1, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime1, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition2, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoHumidity2, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime2, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition3, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoHumidity3, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime3, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition4, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoHumidity4, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime4, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition5, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoHumidity5, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime5, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition6, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoHumidity6, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime6, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition7, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoHumidity7, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime7, height: dayTwoHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition8, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoHumidity8, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime8, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition9, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoHumidity9, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime9, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition10, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoHumidity10, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime10, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition11, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoHumidity11, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime11, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition12, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoHumidity12, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime12, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition13, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoHumidity13, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime13, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition14, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoHumidity14, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime14, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition15, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoHumidity15, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime15, height: dayTwoHour7ValueHeight)
        }
    }
    
    func completeDayTwoUVIndexUISetup() {
        if dayTwoPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition0, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoIndex0, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime0, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition1, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoIndex1, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime1, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition2, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoIndex2, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime2, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition3, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoIndex3, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime3, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition4, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoIndex4, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime4, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition5, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoIndex5, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime5, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition6, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoIndex6, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime6, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition7, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoIndex7, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime7, height: dayTwoHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition8, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoIndex8, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime8, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition9, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoIndex9, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime9, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition10, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoIndex10, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime10, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition11, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoIndex11, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime11, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition12, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoIndex12, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime12, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition13, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoIndex13, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime13, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition14, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoIndex14, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime14, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition15, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoIndex15, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime15, height: dayTwoHour7ValueHeight)
        }
    }

    func completeDayTwoWindSpeedUISetup() {
        if dayTwoPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition0, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoWindSpeed0, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime0, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition1, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoWindSpeed1, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime1, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition2, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoWindSpeed2, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime2, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition3, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoWindSpeed3, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime3, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition4, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoWindSpeed4, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime4, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition5, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoWindSpeed5, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime5, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition6, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoWindSpeed6, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime6, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition7, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoWindSpeed7, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime7, height: dayTwoHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition8, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoWindSpeed8, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime8, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition9, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoWindSpeed9, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime9, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition10, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoWindSpeed10, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime10, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition11, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoWindSpeed11, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime11, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition12, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoWindSpeed12, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime12, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition13, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoWindSpeed13, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime13, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition14, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoWindSpeed14, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime14, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition15, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoWindSpeed15, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime15, height: dayTwoHour7ValueHeight)
        }
    }
    
    func completeDayTwoCloudCoverUISetup() {
        if dayTwoPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition0, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoCloudCover0, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime0, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition1, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoCloudCover1, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime1, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition2, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoCloudCover2, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime2, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition3, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoCloudCover3, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime3, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition4, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoCloudCover4, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime4, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition5, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoCloudCover5, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime5, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition6, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoCloudCover6, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime6, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition7, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoCloudCover7, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime7, height: dayTwoHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayTwoHour0Condition, conditionImageType: dayTwoCondition8, conditionValueText: dayTwoHour0ValueText, conditionValue: dayTwoCloudCover8, image: dayTwoHour0Image, timeText: dayTwoHour0Time, timeValue: dayTwoTime8, height: dayTwoHour0ValueHeight)
            hourSetup(conditionImage: dayTwoHour1Condition, conditionImageType: dayTwoCondition9, conditionValueText: dayTwoHour1ValueText, conditionValue: dayTwoCloudCover9, image: dayTwoHour1Image, timeText: dayTwoHour1Time, timeValue: dayTwoTime9, height: dayTwoHour1ValueHeight)
            hourSetup(conditionImage: dayTwoHour2Condition, conditionImageType: dayTwoCondition10, conditionValueText: dayTwoHour2ValueText, conditionValue: dayTwoCloudCover10, image: dayTwoHour2Image, timeText: dayTwoHour2Time, timeValue: dayTwoTime10, height: dayTwoHour2ValueHeight)
            hourSetup(conditionImage: dayTwoHour3Condition, conditionImageType: dayTwoCondition11, conditionValueText: dayTwoHour3ValueText, conditionValue: dayTwoCloudCover11, image: dayTwoHour3Image, timeText: dayTwoHour3Time, timeValue: dayTwoTime11, height: dayTwoHour3ValueHeight)
            hourSetup(conditionImage: dayTwoHour4Condition, conditionImageType: dayTwoCondition12, conditionValueText: dayTwoHour4ValueText, conditionValue: dayTwoCloudCover12, image: dayTwoHour4Image, timeText: dayTwoHour4Time, timeValue: dayTwoTime12, height: dayTwoHour4ValueHeight)
            hourSetup(conditionImage: dayTwoHour5Condition, conditionImageType: dayTwoCondition13, conditionValueText: dayTwoHour5ValueText, conditionValue: dayTwoCloudCover13, image: dayTwoHour5Image, timeText: dayTwoHour5Time, timeValue: dayTwoTime13, height: dayTwoHour5ValueHeight)
            hourSetup(conditionImage: dayTwoHour6Condition, conditionImageType: dayTwoCondition14, conditionValueText: dayTwoHour6ValueText, conditionValue: dayTwoCloudCover14, image: dayTwoHour6Image, timeText: dayTwoHour6Time, timeValue: dayTwoTime14, height: dayTwoHour6ValueHeight)
            hourSetup(conditionImage: dayTwoHour7Condition, conditionImageType: dayTwoCondition15, conditionValueText: dayTwoHour7ValueText, conditionValue: dayTwoCloudCover15, image: dayTwoHour7Image, timeText: dayTwoHour7Time, timeValue: dayTwoTime15, height: dayTwoHour7ValueHeight)
        }
    }
    
    func completeDayThreePrecipUISetup() {
        if dayThreePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition0, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreePrecip0, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime0, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition1, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreePrecip1, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime1, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition2, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreePrecip2, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime2, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition3, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreePrecip3, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime3, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition4, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreePrecip4, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime4, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition5, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreePrecip5, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime5, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition6, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreePrecip6, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime6, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition7, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreePrecip7, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime7, height: dayThreeHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition8, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreePrecip8, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime8, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition9, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreePrecip9, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime9, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition10, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreePrecip10, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime10, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition11, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreePrecip11, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime11, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition12, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreePrecip12, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime12, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition13, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreePrecip13, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime13, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition14, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreePrecip14, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime14, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition15, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreePrecip15, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime15, height: dayThreeHour7ValueHeight)
        }
    }
    
    func completeDayThreeTempUISetup() {
        if dayThreePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition0, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeTemp0, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime0, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition1, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeTemp1, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime1, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition2, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeTemp2, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime2, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition3, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeTemp3, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime3, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition4, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeTemp4, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime4, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition5, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeTemp5, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime5, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition6, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeTemp6, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime6, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition7, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeTemp7, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime7, height: dayThreeHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition8, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeTemp8, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime8, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition9, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeTemp9, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime9, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition10, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeTemp10, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime10, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition11, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeTemp11, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime11, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition12, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeTemp12, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime12, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition13, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeTemp13, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime13, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition14, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeTemp14, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime14, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition15, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeTemp15, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime15, height: dayThreeHour7ValueHeight)
        }
    }
    
    func completeDayThreeHumidityUISetup() {
        if dayThreePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition0, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeHumidity0, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime0, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition1, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeHumidity1, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime1, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition2, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeHumidity2, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime2, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition3, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeHumidity3, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime3, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition4, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeHumidity4, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime4, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition5, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeHumidity5, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime5, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition6, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeHumidity6, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime6, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition7, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeHumidity7, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime7, height: dayThreeHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition8, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeHumidity8, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime8, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition9, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeHumidity9, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime9, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition10, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeHumidity10, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime10, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition11, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeHumidity11, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime11, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition12, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeHumidity12, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime12, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition13, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeHumidity13, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime13, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition14, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeHumidity14, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime14, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition15, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeHumidity15, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime15, height: dayThreeHour7ValueHeight)
        }
    }
    
    func completeDayThreeUVIndexUISetup() {
        if dayThreePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition0, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeIndex0, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime0, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition1, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeIndex1, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime1, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition2, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeIndex2, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime2, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition3, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeIndex3, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime3, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition4, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeIndex4, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime4, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition5, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeIndex5, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime5, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition6, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeIndex6, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime6, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition7, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeIndex7, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime7, height: dayThreeHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition8, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeIndex8, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime8, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition9, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeIndex9, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime9, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition10, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeIndex10, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime10, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition11, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeIndex11, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime11, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition12, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeIndex12, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime12, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition13, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeIndex13, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime13, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition14, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeIndex14, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime14, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition15, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeIndex15, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime15, height: dayThreeHour7ValueHeight)
        }
    }

    func completeDayThreeWindSpeedUISetup() {
        if dayThreePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition0, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeWindSpeed0, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime0, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition1, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeWindSpeed1, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime1, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition2, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeWindSpeed2, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime2, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition3, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeWindSpeed3, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime3, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition4, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeWindSpeed4, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime4, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition5, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeWindSpeed5, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime5, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition6, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeWindSpeed6, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime6, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition7, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeWindSpeed7, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime7, height: dayThreeHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition8, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeWindSpeed8, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime8, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition9, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeWindSpeed9, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime9, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition10, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeWindSpeed10, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime10, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition11, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeWindSpeed11, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime11, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition12, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeWindSpeed12, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime12, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition13, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeWindSpeed13, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime13, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition14, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeWindSpeed14, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime14, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition15, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeWindSpeed15, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime15, height: dayThreeHour7ValueHeight)
        }
    }
    
    func completeDayThreeCloudCoverUISetup() {
        if dayThreePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition0, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeCloudCover0, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime0, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition1, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeCloudCover1, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime1, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition2, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeCloudCover2, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime2, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition3, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeCloudCover3, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime3, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition4, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeCloudCover4, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime4, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition5, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeCloudCover5, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime5, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition6, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeCloudCover6, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime6, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition7, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeCloudCover7, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime7, height: dayThreeHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayThreeHour0Condition, conditionImageType: dayThreeCondition8, conditionValueText: dayThreeHour0ValueText, conditionValue: dayThreeCloudCover8, image: dayThreeHour0Image, timeText: dayThreeHour0Time, timeValue: dayThreeTime8, height: dayThreeHour0ValueHeight)
            hourSetup(conditionImage: dayThreeHour1Condition, conditionImageType: dayThreeCondition9, conditionValueText: dayThreeHour1ValueText, conditionValue: dayThreeCloudCover9, image: dayThreeHour1Image, timeText: dayThreeHour1Time, timeValue: dayThreeTime9, height: dayThreeHour1ValueHeight)
            hourSetup(conditionImage: dayThreeHour2Condition, conditionImageType: dayThreeCondition10, conditionValueText: dayThreeHour2ValueText, conditionValue: dayThreeCloudCover10, image: dayThreeHour2Image, timeText: dayThreeHour2Time, timeValue: dayThreeTime10, height: dayThreeHour2ValueHeight)
            hourSetup(conditionImage: dayThreeHour3Condition, conditionImageType: dayThreeCondition11, conditionValueText: dayThreeHour3ValueText, conditionValue: dayThreeCloudCover11, image: dayThreeHour3Image, timeText: dayThreeHour3Time, timeValue: dayThreeTime11, height: dayThreeHour3ValueHeight)
            hourSetup(conditionImage: dayThreeHour4Condition, conditionImageType: dayThreeCondition12, conditionValueText: dayThreeHour4ValueText, conditionValue: dayThreeCloudCover12, image: dayThreeHour4Image, timeText: dayThreeHour4Time, timeValue: dayThreeTime12, height: dayThreeHour4ValueHeight)
            hourSetup(conditionImage: dayThreeHour5Condition, conditionImageType: dayThreeCondition13, conditionValueText: dayThreeHour5ValueText, conditionValue: dayThreeCloudCover13, image: dayThreeHour5Image, timeText: dayThreeHour5Time, timeValue: dayThreeTime13, height: dayThreeHour5ValueHeight)
            hourSetup(conditionImage: dayThreeHour6Condition, conditionImageType: dayThreeCondition14, conditionValueText: dayThreeHour6ValueText, conditionValue: dayThreeCloudCover14, image: dayThreeHour6Image, timeText: dayThreeHour6Time, timeValue: dayThreeTime14, height: dayThreeHour6ValueHeight)
            hourSetup(conditionImage: dayThreeHour7Condition, conditionImageType: dayThreeCondition15, conditionValueText: dayThreeHour7ValueText, conditionValue: dayThreeCloudCover15, image: dayThreeHour7Image, timeText: dayThreeHour7Time, timeValue: dayThreeTime15, height: dayThreeHour7ValueHeight)
        }
    }
    
    func completeDayFourPrecipUISetup() {
        if dayFourPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition0, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourPrecip0, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime0, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition1, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourPrecip1, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime1, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition2, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourPrecip2, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime2, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition3, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourPrecip3, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime3, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition4, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourPrecip4, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime4, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition5, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourPrecip5, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime5, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition6, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourPrecip6, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime6, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition7, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourPrecip7, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime7, height: dayFourHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition8, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourPrecip8, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime8, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition9, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourPrecip9, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime9, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition10, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourPrecip10, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime10, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition11, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourPrecip11, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime11, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition12, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourPrecip12, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime12, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition13, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourPrecip13, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime13, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition14, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourPrecip14, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime14, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition15, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourPrecip15, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime15, height: dayFourHour7ValueHeight)
        }
    }
    
    func completeDayFourTempUISetup() {
        if dayFourPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition0, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourTemp0, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime0, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition1, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourTemp1, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime1, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition2, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourTemp2, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime2, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition3, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourTemp3, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime3, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition4, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourTemp4, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime4, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition5, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourTemp5, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime5, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition6, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourTemp6, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime6, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition7, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourTemp7, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime7, height: dayFourHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition8, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourTemp8, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime8, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition9, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourTemp9, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime9, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition10, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourTemp10, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime10, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition11, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourTemp11, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime11, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition12, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourTemp12, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime12, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition13, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourTemp13, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime13, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition14, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourTemp14, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime14, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition15, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourTemp15, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime15, height: dayFourHour7ValueHeight)
        }
    }
    
    func completeDayFourHumidityUISetup() {
        if dayFourPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition0, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourHumidity0, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime0, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition1, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourHumidity1, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime1, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition2, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourHumidity2, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime2, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition3, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourHumidity3, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime3, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition4, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourHumidity4, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime4, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition5, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourHumidity5, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime5, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition6, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourHumidity6, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime6, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition7, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourHumidity7, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime7, height: dayFourHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition8, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourHumidity8, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime8, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition9, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourHumidity9, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime9, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition10, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourHumidity10, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime10, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition11, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourHumidity11, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime11, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition12, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourHumidity12, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime12, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition13, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourHumidity13, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime13, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition14, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourHumidity14, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime14, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition15, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourHumidity15, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime15, height: dayFourHour7ValueHeight)
        }
    }
    
    func completeDayFourUVIndexUISetup() {
        if dayFourPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition0, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourIndex0, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime0, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition1, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourIndex1, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime1, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition2, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourIndex2, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime2, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition3, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourIndex3, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime3, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition4, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourIndex4, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime4, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition5, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourIndex5, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime5, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition6, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourIndex6, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime6, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition7, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourIndex7, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime7, height: dayFourHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition8, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourIndex8, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime8, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition9, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourIndex9, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime9, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition10, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourIndex10, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime10, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition11, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourIndex11, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime11, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition12, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourIndex12, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime12, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition13, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourIndex13, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime13, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition14, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourIndex14, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime14, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition15, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourIndex15, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime15, height: dayFourHour7ValueHeight)
        }
    }

    func completeDayFourWindSpeedUISetup() {
        if dayFourPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition0, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourWindSpeed0, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime0, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition1, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourWindSpeed1, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime1, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition2, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourWindSpeed2, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime2, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition3, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourWindSpeed3, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime3, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition4, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourWindSpeed4, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime4, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition5, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourWindSpeed5, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime5, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition6, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourWindSpeed6, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime6, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition7, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourWindSpeed7, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime7, height: dayFourHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition8, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourWindSpeed8, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime8, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition9, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourWindSpeed9, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime9, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition10, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourWindSpeed10, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime10, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition11, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourWindSpeed11, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime11, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition12, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourWindSpeed12, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime12, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition13, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourWindSpeed13, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime13, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition14, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourWindSpeed14, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime14, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition15, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourWindSpeed15, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime15, height: dayFourHour7ValueHeight)
        }
    }
    
    func completeDayFourCloudCoverUISetup() {
        if dayFourPageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition0, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourCloudCover0, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime0, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition1, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourCloudCover1, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime1, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition2, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourCloudCover2, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime2, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition3, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourCloudCover3, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime3, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition4, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourCloudCover4, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime4, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition5, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourCloudCover5, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime5, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition6, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourCloudCover6, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime6, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition7, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourCloudCover7, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime7, height: dayFourHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFourHour0Condition, conditionImageType: dayFourCondition8, conditionValueText: dayFourHour0ValueText, conditionValue: dayFourCloudCover8, image: dayFourHour0Image, timeText: dayFourHour0Time, timeValue: dayFourTime8, height: dayFourHour0ValueHeight)
            hourSetup(conditionImage: dayFourHour1Condition, conditionImageType: dayFourCondition9, conditionValueText: dayFourHour1ValueText, conditionValue: dayFourCloudCover9, image: dayFourHour1Image, timeText: dayFourHour1Time, timeValue: dayFourTime9, height: dayFourHour1ValueHeight)
            hourSetup(conditionImage: dayFourHour2Condition, conditionImageType: dayFourCondition10, conditionValueText: dayFourHour2ValueText, conditionValue: dayFourCloudCover10, image: dayFourHour2Image, timeText: dayFourHour2Time, timeValue: dayFourTime10, height: dayFourHour2ValueHeight)
            hourSetup(conditionImage: dayFourHour3Condition, conditionImageType: dayFourCondition11, conditionValueText: dayFourHour3ValueText, conditionValue: dayFourCloudCover11, image: dayFourHour3Image, timeText: dayFourHour3Time, timeValue: dayFourTime11, height: dayFourHour3ValueHeight)
            hourSetup(conditionImage: dayFourHour4Condition, conditionImageType: dayFourCondition12, conditionValueText: dayFourHour4ValueText, conditionValue: dayFourCloudCover12, image: dayFourHour4Image, timeText: dayFourHour4Time, timeValue: dayFourTime12, height: dayFourHour4ValueHeight)
            hourSetup(conditionImage: dayFourHour5Condition, conditionImageType: dayFourCondition13, conditionValueText: dayFourHour5ValueText, conditionValue: dayFourCloudCover13, image: dayFourHour5Image, timeText: dayFourHour5Time, timeValue: dayFourTime13, height: dayFourHour5ValueHeight)
            hourSetup(conditionImage: dayFourHour6Condition, conditionImageType: dayFourCondition14, conditionValueText: dayFourHour6ValueText, conditionValue: dayFourCloudCover14, image: dayFourHour6Image, timeText: dayFourHour6Time, timeValue: dayFourTime14, height: dayFourHour6ValueHeight)
            hourSetup(conditionImage: dayFourHour7Condition, conditionImageType: dayFourCondition15, conditionValueText: dayFourHour7ValueText, conditionValue: dayFourCloudCover15, image: dayFourHour7Image, timeText: dayFourHour7Time, timeValue: dayFourTime15, height: dayFourHour7ValueHeight)
        }
    }
    
    func completeDayFivePrecipUISetup() {
        if dayFivePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition0, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFivePrecip0, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime0, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition1, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFivePrecip1, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime1, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition2, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFivePrecip2, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime2, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition3, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFivePrecip3, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime3, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition4, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFivePrecip4, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime4, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition5, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFivePrecip5, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime5, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition6, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFivePrecip6, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime6, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition7, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFivePrecip7, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime7, height: dayFiveHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition8, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFivePrecip8, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime8, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition9, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFivePrecip9, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime9, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition10, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFivePrecip10, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime10, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition11, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFivePrecip11, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime11, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition12, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFivePrecip12, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime12, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition13, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFivePrecip13, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime13, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition14, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFivePrecip14, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime14, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition15, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFivePrecip15, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime15, height: dayFiveHour7ValueHeight)
        }
    }
    
    func completeDayFiveTempUISetup() {
        if dayFivePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition0, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveTemp0, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime0, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition1, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveTemp1, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime1, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition2, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveTemp2, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime2, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition3, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveTemp3, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime3, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition4, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveTemp4, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime4, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition5, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveTemp5, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime5, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition6, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveTemp6, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime6, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition7, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveTemp7, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime7, height: dayFiveHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition8, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveTemp8, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime8, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition9, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveTemp9, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime9, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition10, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveTemp10, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime10, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition11, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveTemp11, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime11, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition12, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveTemp12, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime12, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition13, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveTemp13, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime13, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition14, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveTemp14, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime14, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition15, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveTemp15, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime15, height: dayFiveHour7ValueHeight)
        }
    }
    
    func completeDayFiveHumidityUISetup() {
        if dayFivePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition0, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveHumidity0, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime0, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition1, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveHumidity1, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime1, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition2, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveHumidity2, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime2, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition3, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveHumidity3, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime3, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition4, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveHumidity4, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime4, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition5, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveHumidity5, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime5, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition6, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveHumidity6, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime6, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition7, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveHumidity7, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime7, height: dayFiveHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition8, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveHumidity8, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime8, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition9, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveHumidity9, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime9, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition10, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveHumidity10, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime10, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition11, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveHumidity11, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime11, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition12, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveHumidity12, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime12, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition13, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveHumidity13, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime13, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition14, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveHumidity14, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime14, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition15, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveHumidity15, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime15, height: dayFiveHour7ValueHeight)
        }
    }
    
    func completeDayFiveUVIndexUISetup() {
        if dayFivePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition0, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveIndex0, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime0, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition1, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveIndex1, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime1, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition2, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveIndex2, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime2, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition3, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveIndex3, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime3, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition4, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveIndex4, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime4, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition5, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveIndex5, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime5, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition6, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveIndex6, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime6, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition7, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveIndex7, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime7, height: dayFiveHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition8, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveIndex8, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime8, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition9, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveIndex9, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime9, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition10, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveIndex10, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime10, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition11, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveIndex11, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime11, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition12, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveIndex12, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime12, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition13, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveIndex13, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime13, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition14, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveIndex14, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime14, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition15, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveIndex15, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime15, height: dayFiveHour7ValueHeight)
        }
    }

    func completeDayFiveWindSpeedUISetup() {
        if dayFivePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition0, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveWindSpeed0, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime0, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition1, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveWindSpeed1, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime1, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition2, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveWindSpeed2, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime2, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition3, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveWindSpeed3, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime3, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition4, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveWindSpeed4, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime4, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition5, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveWindSpeed5, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime5, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition6, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveWindSpeed6, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime6, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition7, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveWindSpeed7, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime7, height: dayFiveHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition8, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveWindSpeed8, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime8, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition9, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveWindSpeed9, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime9, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition10, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveWindSpeed10, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime10, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition11, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveWindSpeed11, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime11, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition12, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveWindSpeed12, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime12, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition13, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveWindSpeed13, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime13, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition14, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveWindSpeed14, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime14, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition15, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveWindSpeed15, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime15, height: dayFiveHour7ValueHeight)
        }
    }
    
    func completeDayFiveCloudCoverUISetup() {
        if dayFivePageControl.currentPage == 0 {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition0, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveCloudCover0, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime0, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition1, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveCloudCover1, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime1, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition2, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveCloudCover2, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime2, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition3, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveCloudCover3, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime3, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition4, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveCloudCover4, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime4, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition5, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveCloudCover5, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime5, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition6, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveCloudCover6, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime6, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition7, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveCloudCover7, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime7, height: dayFiveHour7ValueHeight)
        } else {
            hourSetup(conditionImage: dayFiveHour0Condition, conditionImageType: dayFiveCondition8, conditionValueText: dayFiveHour0ValueText, conditionValue: dayFiveCloudCover8, image: dayFiveHour0Image, timeText: dayFiveHour0Time, timeValue: dayFiveTime8, height: dayFiveHour0ValueHeight)
            hourSetup(conditionImage: dayFiveHour1Condition, conditionImageType: dayFiveCondition9, conditionValueText: dayFiveHour1ValueText, conditionValue: dayFiveCloudCover9, image: dayFiveHour1Image, timeText: dayFiveHour1Time, timeValue: dayFiveTime9, height: dayFiveHour1ValueHeight)
            hourSetup(conditionImage: dayFiveHour2Condition, conditionImageType: dayFiveCondition10, conditionValueText: dayFiveHour2ValueText, conditionValue: dayFiveCloudCover10, image: dayFiveHour2Image, timeText: dayFiveHour2Time, timeValue: dayFiveTime10, height: dayFiveHour2ValueHeight)
            hourSetup(conditionImage: dayFiveHour3Condition, conditionImageType: dayFiveCondition11, conditionValueText: dayFiveHour3ValueText, conditionValue: dayFiveCloudCover11, image: dayFiveHour3Image, timeText: dayFiveHour3Time, timeValue: dayFiveTime11, height: dayFiveHour3ValueHeight)
            hourSetup(conditionImage: dayFiveHour4Condition, conditionImageType: dayFiveCondition12, conditionValueText: dayFiveHour4ValueText, conditionValue: dayFiveCloudCover12, image: dayFiveHour4Image, timeText: dayFiveHour4Time, timeValue: dayFiveTime12, height: dayFiveHour4ValueHeight)
            hourSetup(conditionImage: dayFiveHour5Condition, conditionImageType: dayFiveCondition13, conditionValueText: dayFiveHour5ValueText, conditionValue: dayFiveCloudCover13, image: dayFiveHour5Image, timeText: dayFiveHour5Time, timeValue: dayFiveTime13, height: dayFiveHour5ValueHeight)
            hourSetup(conditionImage: dayFiveHour6Condition, conditionImageType: dayFiveCondition14, conditionValueText: dayFiveHour6ValueText, conditionValue: dayFiveCloudCover14, image: dayFiveHour6Image, timeText: dayFiveHour6Time, timeValue: dayFiveTime14, height: dayFiveHour6ValueHeight)
            hourSetup(conditionImage: dayFiveHour7Condition, conditionImageType: dayFiveCondition15, conditionValueText: dayFiveHour7ValueText, conditionValue: dayFiveCloudCover15, image: dayFiveHour7Image, timeText: dayFiveHour7Time, timeValue: dayFiveTime15, height: dayFiveHour7ValueHeight)
        }
    }
    
    func completeDaySixPrecipUISetup() {
        if daySixPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition0, conditionValueText: daySixHour0ValueText, conditionValue: daySixPrecip0, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime0, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition1, conditionValueText: daySixHour1ValueText, conditionValue: daySixPrecip1, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime1, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition2, conditionValueText: daySixHour2ValueText, conditionValue: daySixPrecip2, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime2, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition3, conditionValueText: daySixHour3ValueText, conditionValue: daySixPrecip3, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime3, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition4, conditionValueText: daySixHour4ValueText, conditionValue: daySixPrecip4, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime4, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition5, conditionValueText: daySixHour5ValueText, conditionValue: daySixPrecip5, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime5, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition6, conditionValueText: daySixHour6ValueText, conditionValue: daySixPrecip6, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime6, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition7, conditionValueText: daySixHour7ValueText, conditionValue: daySixPrecip7, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime7, height: daySixHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition8, conditionValueText: daySixHour0ValueText, conditionValue: daySixPrecip8, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime8, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition9, conditionValueText: daySixHour1ValueText, conditionValue: daySixPrecip9, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime9, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition10, conditionValueText: daySixHour2ValueText, conditionValue: daySixPrecip10, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime10, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition11, conditionValueText: daySixHour3ValueText, conditionValue: daySixPrecip11, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime11, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition12, conditionValueText: daySixHour4ValueText, conditionValue: daySixPrecip12, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime12, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition13, conditionValueText: daySixHour5ValueText, conditionValue: daySixPrecip13, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime13, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition14, conditionValueText: daySixHour6ValueText, conditionValue: daySixPrecip14, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime14, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition15, conditionValueText: daySixHour7ValueText, conditionValue: daySixPrecip15, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime15, height: daySixHour7ValueHeight)
        }
    }
    
    func completeDaySixTempUISetup() {
        if daySixPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition0, conditionValueText: daySixHour0ValueText, conditionValue: daySixTemp0, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime0, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition1, conditionValueText: daySixHour1ValueText, conditionValue: daySixTemp1, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime1, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition2, conditionValueText: daySixHour2ValueText, conditionValue: daySixTemp2, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime2, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition3, conditionValueText: daySixHour3ValueText, conditionValue: daySixTemp3, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime3, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition4, conditionValueText: daySixHour4ValueText, conditionValue: daySixTemp4, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime4, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition5, conditionValueText: daySixHour5ValueText, conditionValue: daySixTemp5, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime5, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition6, conditionValueText: daySixHour6ValueText, conditionValue: daySixTemp6, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime6, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition7, conditionValueText: daySixHour7ValueText, conditionValue: daySixTemp7, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime7, height: daySixHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition8, conditionValueText: daySixHour0ValueText, conditionValue: daySixTemp8, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime8, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition9, conditionValueText: daySixHour1ValueText, conditionValue: daySixTemp9, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime9, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition10, conditionValueText: daySixHour2ValueText, conditionValue: daySixTemp10, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime10, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition11, conditionValueText: daySixHour3ValueText, conditionValue: daySixTemp11, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime11, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition12, conditionValueText: daySixHour4ValueText, conditionValue: daySixTemp12, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime12, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition13, conditionValueText: daySixHour5ValueText, conditionValue: daySixTemp13, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime13, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition14, conditionValueText: daySixHour6ValueText, conditionValue: daySixTemp14, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime14, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition15, conditionValueText: daySixHour7ValueText, conditionValue: daySixTemp15, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime15, height: daySixHour7ValueHeight)
        }
    }
    
    func completeDaySixHumidityUISetup() {
        if daySixPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition0, conditionValueText: daySixHour0ValueText, conditionValue: daySixHumidity0, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime0, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition1, conditionValueText: daySixHour1ValueText, conditionValue: daySixHumidity1, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime1, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition2, conditionValueText: daySixHour2ValueText, conditionValue: daySixHumidity2, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime2, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition3, conditionValueText: daySixHour3ValueText, conditionValue: daySixHumidity3, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime3, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition4, conditionValueText: daySixHour4ValueText, conditionValue: daySixHumidity4, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime4, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition5, conditionValueText: daySixHour5ValueText, conditionValue: daySixHumidity5, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime5, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition6, conditionValueText: daySixHour6ValueText, conditionValue: daySixHumidity6, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime6, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition7, conditionValueText: daySixHour7ValueText, conditionValue: daySixHumidity7, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime7, height: daySixHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition8, conditionValueText: daySixHour0ValueText, conditionValue: daySixHumidity8, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime8, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition9, conditionValueText: daySixHour1ValueText, conditionValue: daySixHumidity9, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime9, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition10, conditionValueText: daySixHour2ValueText, conditionValue: daySixHumidity10, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime10, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition11, conditionValueText: daySixHour3ValueText, conditionValue: daySixHumidity11, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime11, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition12, conditionValueText: daySixHour4ValueText, conditionValue: daySixHumidity12, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime12, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition13, conditionValueText: daySixHour5ValueText, conditionValue: daySixHumidity13, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime13, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition14, conditionValueText: daySixHour6ValueText, conditionValue: daySixHumidity14, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime14, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition15, conditionValueText: daySixHour7ValueText, conditionValue: daySixHumidity15, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime15, height: daySixHour7ValueHeight)
        }
    }
    
    func completeDaySixUVIndexUISetup() {
        if daySixPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition0, conditionValueText: daySixHour0ValueText, conditionValue: daySixIndex0, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime0, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition1, conditionValueText: daySixHour1ValueText, conditionValue: daySixIndex1, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime1, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition2, conditionValueText: daySixHour2ValueText, conditionValue: daySixIndex2, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime2, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition3, conditionValueText: daySixHour3ValueText, conditionValue: daySixIndex3, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime3, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition4, conditionValueText: daySixHour4ValueText, conditionValue: daySixIndex4, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime4, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition5, conditionValueText: daySixHour5ValueText, conditionValue: daySixIndex5, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime5, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition6, conditionValueText: daySixHour6ValueText, conditionValue: daySixIndex6, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime6, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition7, conditionValueText: daySixHour7ValueText, conditionValue: daySixIndex7, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime7, height: daySixHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition8, conditionValueText: daySixHour0ValueText, conditionValue: daySixIndex8, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime8, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition9, conditionValueText: daySixHour1ValueText, conditionValue: daySixIndex9, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime9, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition10, conditionValueText: daySixHour2ValueText, conditionValue: daySixIndex10, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime10, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition11, conditionValueText: daySixHour3ValueText, conditionValue: daySixIndex11, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime11, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition12, conditionValueText: daySixHour4ValueText, conditionValue: daySixIndex12, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime12, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition13, conditionValueText: daySixHour5ValueText, conditionValue: daySixIndex13, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime13, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition14, conditionValueText: daySixHour6ValueText, conditionValue: daySixIndex14, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime14, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition15, conditionValueText: daySixHour7ValueText, conditionValue: daySixIndex15, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime15, height: daySixHour7ValueHeight)
        }
    }

    func completeDaySixWindSpeedUISetup() {
        if daySixPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition0, conditionValueText: daySixHour0ValueText, conditionValue: daySixWindSpeed0, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime0, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition1, conditionValueText: daySixHour1ValueText, conditionValue: daySixWindSpeed1, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime1, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition2, conditionValueText: daySixHour2ValueText, conditionValue: daySixWindSpeed2, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime2, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition3, conditionValueText: daySixHour3ValueText, conditionValue: daySixWindSpeed3, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime3, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition4, conditionValueText: daySixHour4ValueText, conditionValue: daySixWindSpeed4, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime4, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition5, conditionValueText: daySixHour5ValueText, conditionValue: daySixWindSpeed5, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime5, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition6, conditionValueText: daySixHour6ValueText, conditionValue: daySixWindSpeed6, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime6, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition7, conditionValueText: daySixHour7ValueText, conditionValue: daySixWindSpeed7, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime7, height: daySixHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition8, conditionValueText: daySixHour0ValueText, conditionValue: daySixWindSpeed8, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime8, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition9, conditionValueText: daySixHour1ValueText, conditionValue: daySixWindSpeed9, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime9, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition10, conditionValueText: daySixHour2ValueText, conditionValue: daySixWindSpeed10, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime10, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition11, conditionValueText: daySixHour3ValueText, conditionValue: daySixWindSpeed11, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime11, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition12, conditionValueText: daySixHour4ValueText, conditionValue: daySixWindSpeed12, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime12, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition13, conditionValueText: daySixHour5ValueText, conditionValue: daySixWindSpeed13, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime13, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition14, conditionValueText: daySixHour6ValueText, conditionValue: daySixWindSpeed14, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime14, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition15, conditionValueText: daySixHour7ValueText, conditionValue: daySixWindSpeed15, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime15, height: daySixHour7ValueHeight)
        }
    }
    
    func completeDaySixCloudCoverUISetup() {
        if daySixPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition0, conditionValueText: daySixHour0ValueText, conditionValue: daySixCloudCover0, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime0, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition1, conditionValueText: daySixHour1ValueText, conditionValue: daySixCloudCover1, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime1, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition2, conditionValueText: daySixHour2ValueText, conditionValue: daySixCloudCover2, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime2, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition3, conditionValueText: daySixHour3ValueText, conditionValue: daySixCloudCover3, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime3, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition4, conditionValueText: daySixHour4ValueText, conditionValue: daySixCloudCover4, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime4, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition5, conditionValueText: daySixHour5ValueText, conditionValue: daySixCloudCover5, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime5, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition6, conditionValueText: daySixHour6ValueText, conditionValue: daySixCloudCover6, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime6, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition7, conditionValueText: daySixHour7ValueText, conditionValue: daySixCloudCover7, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime7, height: daySixHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySixHour0Condition, conditionImageType: daySixCondition8, conditionValueText: daySixHour0ValueText, conditionValue: daySixCloudCover8, image: daySixHour0Image, timeText: daySixHour0Time, timeValue: daySixTime8, height: daySixHour0ValueHeight)
            hourSetup(conditionImage: daySixHour1Condition, conditionImageType: daySixCondition9, conditionValueText: daySixHour1ValueText, conditionValue: daySixCloudCover9, image: daySixHour1Image, timeText: daySixHour1Time, timeValue: daySixTime9, height: daySixHour1ValueHeight)
            hourSetup(conditionImage: daySixHour2Condition, conditionImageType: daySixCondition10, conditionValueText: daySixHour2ValueText, conditionValue: daySixCloudCover10, image: daySixHour2Image, timeText: daySixHour2Time, timeValue: daySixTime10, height: daySixHour2ValueHeight)
            hourSetup(conditionImage: daySixHour3Condition, conditionImageType: daySixCondition11, conditionValueText: daySixHour3ValueText, conditionValue: daySixCloudCover11, image: daySixHour3Image, timeText: daySixHour3Time, timeValue: daySixTime11, height: daySixHour3ValueHeight)
            hourSetup(conditionImage: daySixHour4Condition, conditionImageType: daySixCondition12, conditionValueText: daySixHour4ValueText, conditionValue: daySixCloudCover12, image: daySixHour4Image, timeText: daySixHour4Time, timeValue: daySixTime12, height: daySixHour4ValueHeight)
            hourSetup(conditionImage: daySixHour5Condition, conditionImageType: daySixCondition13, conditionValueText: daySixHour5ValueText, conditionValue: daySixCloudCover13, image: daySixHour5Image, timeText: daySixHour5Time, timeValue: daySixTime13, height: daySixHour5ValueHeight)
            hourSetup(conditionImage: daySixHour6Condition, conditionImageType: daySixCondition14, conditionValueText: daySixHour6ValueText, conditionValue: daySixCloudCover14, image: daySixHour6Image, timeText: daySixHour6Time, timeValue: daySixTime14, height: daySixHour6ValueHeight)
            hourSetup(conditionImage: daySixHour7Condition, conditionImageType: daySixCondition15, conditionValueText: daySixHour7ValueText, conditionValue: daySixCloudCover15, image: daySixHour7Image, timeText: daySixHour7Time, timeValue: daySixTime15, height: daySixHour7ValueHeight)
        }
    }
    
    func completeDaySevenPrecipUISetup() {
        if daySevenPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition0, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenPrecip0, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime0, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition1, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenPrecip1, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime1, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition2, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenPrecip2, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime2, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition3, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenPrecip3, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime3, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition4, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenPrecip4, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime4, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition5, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenPrecip5, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime5, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition6, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenPrecip6, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime6, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition7, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenPrecip7, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime7, height: daySevenHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition8, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenPrecip8, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime8, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition9, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenPrecip9, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime9, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition10, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenPrecip10, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime10, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition11, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenPrecip11, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime11, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition12, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenPrecip12, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime12, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition13, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenPrecip13, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime13, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition14, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenPrecip14, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime14, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition15, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenPrecip15, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime15, height: daySevenHour7ValueHeight)
        }
    }
    
    func completeDaySevenTempUISetup() {
        if daySevenPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition0, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenTemp0, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime0, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition1, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenTemp1, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime1, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition2, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenTemp2, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime2, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition3, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenTemp3, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime3, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition4, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenTemp4, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime4, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition5, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenTemp5, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime5, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition6, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenTemp6, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime6, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition7, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenTemp7, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime7, height: daySevenHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition8, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenTemp8, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime8, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition9, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenTemp9, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime9, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition10, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenTemp10, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime10, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition11, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenTemp11, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime11, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition12, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenTemp12, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime12, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition13, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenTemp13, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime13, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition14, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenTemp14, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime14, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition15, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenTemp15, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime15, height: daySevenHour7ValueHeight)
        }
    }
    
    func completeDaySevenHumidityUISetup() {
        if daySevenPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition0, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenHumidity0, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime0, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition1, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenHumidity1, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime1, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition2, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenHumidity2, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime2, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition3, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenHumidity3, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime3, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition4, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenHumidity4, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime4, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition5, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenHumidity5, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime5, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition6, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenHumidity6, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime6, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition7, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenHumidity7, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime7, height: daySevenHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition8, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenHumidity8, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime8, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition9, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenHumidity9, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime9, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition10, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenHumidity10, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime10, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition11, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenHumidity11, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime11, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition12, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenHumidity12, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime12, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition13, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenHumidity13, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime13, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition14, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenHumidity14, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime14, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition15, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenHumidity15, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime15, height: daySevenHour7ValueHeight)
        }
    }
    
    func completeDaySevenUVIndexUISetup() {
        if daySevenPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition0, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenIndex0, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime0, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition1, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenIndex1, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime1, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition2, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenIndex2, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime2, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition3, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenIndex3, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime3, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition4, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenIndex4, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime4, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition5, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenIndex5, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime5, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition6, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenIndex6, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime6, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition7, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenIndex7, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime7, height: daySevenHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition8, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenIndex8, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime8, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition9, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenIndex9, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime9, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition10, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenIndex10, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime10, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition11, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenIndex11, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime11, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition12, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenIndex12, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime12, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition13, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenIndex13, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime13, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition14, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenIndex14, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime14, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition15, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenIndex15, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime15, height: daySevenHour7ValueHeight)
        }
    }

    func completeDaySevenWindSpeedUISetup() {
        if daySevenPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition0, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenWindSpeed0, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime0, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition1, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenWindSpeed1, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime1, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition2, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenWindSpeed2, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime2, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition3, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenWindSpeed3, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime3, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition4, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenWindSpeed4, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime4, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition5, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenWindSpeed5, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime5, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition6, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenWindSpeed6, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime6, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition7, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenWindSpeed7, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime7, height: daySevenHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition8, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenWindSpeed8, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime8, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition9, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenWindSpeed9, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime9, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition10, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenWindSpeed10, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime10, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition11, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenWindSpeed11, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime11, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition12, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenWindSpeed12, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime12, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition13, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenWindSpeed13, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime13, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition14, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenWindSpeed14, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime14, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition15, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenWindSpeed15, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime15, height: daySevenHour7ValueHeight)
        }
    }
    
    func completeDaySevenCloudCoverUISetup() {
        if daySevenPageControl.currentPage == 0 {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition0, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenCloudCover0, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime0, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition1, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenCloudCover1, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime1, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition2, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenCloudCover2, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime2, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition3, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenCloudCover3, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime3, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition4, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenCloudCover4, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime4, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition5, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenCloudCover5, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime5, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition6, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenCloudCover6, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime6, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition7, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenCloudCover7, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime7, height: daySevenHour7ValueHeight)
        } else {
            hourSetup(conditionImage: daySevenHour0Condition, conditionImageType: daySevenCondition8, conditionValueText: daySevenHour0ValueText, conditionValue: daySevenCloudCover8, image: daySevenHour0Image, timeText: daySevenHour0Time, timeValue: daySevenTime8, height: daySevenHour0ValueHeight)
            hourSetup(conditionImage: daySevenHour1Condition, conditionImageType: daySevenCondition9, conditionValueText: daySevenHour1ValueText, conditionValue: daySevenCloudCover9, image: daySevenHour1Image, timeText: daySevenHour1Time, timeValue: daySevenTime9, height: daySevenHour1ValueHeight)
            hourSetup(conditionImage: daySevenHour2Condition, conditionImageType: daySevenCondition10, conditionValueText: daySevenHour2ValueText, conditionValue: daySevenCloudCover10, image: daySevenHour2Image, timeText: daySevenHour2Time, timeValue: daySevenTime10, height: daySevenHour2ValueHeight)
            hourSetup(conditionImage: daySevenHour3Condition, conditionImageType: daySevenCondition11, conditionValueText: daySevenHour3ValueText, conditionValue: daySevenCloudCover11, image: daySevenHour3Image, timeText: daySevenHour3Time, timeValue: daySevenTime11, height: daySevenHour3ValueHeight)
            hourSetup(conditionImage: daySevenHour4Condition, conditionImageType: daySevenCondition12, conditionValueText: daySevenHour4ValueText, conditionValue: daySevenCloudCover12, image: daySevenHour4Image, timeText: daySevenHour4Time, timeValue: daySevenTime12, height: daySevenHour4ValueHeight)
            hourSetup(conditionImage: daySevenHour5Condition, conditionImageType: daySevenCondition13, conditionValueText: daySevenHour5ValueText, conditionValue: daySevenCloudCover13, image: daySevenHour5Image, timeText: daySevenHour5Time, timeValue: daySevenTime13, height: daySevenHour5ValueHeight)
            hourSetup(conditionImage: daySevenHour6Condition, conditionImageType: daySevenCondition14, conditionValueText: daySevenHour6ValueText, conditionValue: daySevenCloudCover14, image: daySevenHour6Image, timeText: daySevenHour6Time, timeValue: daySevenTime14, height: daySevenHour6ValueHeight)
            hourSetup(conditionImage: daySevenHour7Condition, conditionImageType: daySevenCondition15, conditionValueText: daySevenHour7ValueText, conditionValue: daySevenCloudCover15, image: daySevenHour7Image, timeText: daySevenHour7Time, timeValue: daySevenTime15, height: daySevenHour7ValueHeight)
        }
    }
    
    // MARK: - Set day labels 0-7
    func setDayLabels() {
        // Day Zero
        dayZeroDay.text = "\(dayZeroDayString)\n\(dayZeroDateString)"
        if dayZeroStackView.isHidden == true {
            dayZeroHighLow.text = "\(dayZeroHigh)°↑ \(dayZeroLow)°↓"
            dayZeroPrecipitation.text = "\(defaultDailyConditionValueType) \(dayZeroConditionValue)\(defaultDailyConditionValueUnit)"
            dayZeroSummary.text = "\(dayZeroSummaryString)"
        } else {
            dayZeroHighLow.text = ""
            dayZeroPrecipitation.text = "\(dayZeroHigh)°↑ \(dayZeroLow)°↓"
            if dayZeroPrecipAccum > 0 && dayZeroPrecipAccum < 1 {
                dayZeroSummary.text = "\(dayZeroSummaryString) Chance of precipitation \(dayZeroPrecip)%. Snow accumulation < 1 \(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(dayZeroSunset). Moon phase, \(dayZeroMoonPhaseString.lowercased())."
            } else if dayZeroPrecipAccum > 1 {
                dayZeroSummary.text = "\(dayZeroSummaryString) Chance of precipitation \(dayZeroPrecip)%. Snow accumulation \(Int(dayZeroPrecipAccum)) \(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(dayZeroSunset). Moon phase, \(dayZeroMoonPhaseString.lowercased())."
            } else {
                dayZeroSummary.text = "\(dayZeroSummaryString) Chance of precipitation \(dayZeroPrecip)%. Sunrise \(dayZeroSunrise) and sunset \(dayZeroSunset). Moon phase, \(dayZeroMoonPhaseString.lowercased())."
            }
        }
        
        // Day One
        dayOneDay.text = "\(dayOneDayString)\n\(dayOneDateString)"
        if dayOneStackView.isHidden == true {
            dayOneHighLow.text = "\(dayOneHigh)°↑ \(dayOneLow)°↓"
            dayOnePrecipitation.text = "\(defaultDailyConditionValueType) \(dayOneConditionValue)\(defaultDailyConditionValueUnit)"
            dayOneSummary.text = "\(dayOneSummaryString)"
        } else {
            dayOneHighLow.text = ""
            dayOnePrecipitation.text = "\(dayOneHigh)°↑ \(dayOneLow)°↓"
            if dayOnePrecipAccum > 0 && dayOnePrecipAccum < 1 {
                dayOneSummary.text = "\(dayOneSummaryString) Chance of precipitation \(dayOnePrecip)%. Snow accumulation < 1 \(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(dayOneSunset). Moon phase, \(dayOneMoonPhaseString.lowercased())."
            } else if dayOnePrecipAccum > 1 {
                dayOneSummary.text = "\(dayOneSummaryString) Chance of precipitation \(dayOnePrecip)%. Snow accumulation \(Int(dayOnePrecipAccum)) \(unitsPrecipitation). Sunrise \(dayOneSunrise) and sunset \(dayOneSunset). Moon phase, \(dayOneMoonPhaseString.lowercased())."
            } else {
                dayOneSummary.text = "\(dayOneSummaryString) Chance of precipitation \(dayOnePrecip)%. Sunrise \(dayOneSunrise) and sunset \(dayOneSunset). Moon phase, \(dayOneMoonPhaseString.lowercased())."
            }
        }
        
        // Day Two
        dayTwoDay.text = "\(dayTwoDayString)\n\(dayTwoDateString)"
        if dayTwoStackView.isHidden == true {
            dayTwoHighLow.text = "\(dayTwoHigh)°↑ \(dayTwoLow)°↓"
            dayTwoPrecipitation.text = "\(defaultDailyConditionValueType) \(dayTwoConditionValue)\(defaultDailyConditionValueUnit)"
            dayTwoSummary.text = "\(dayTwoSummaryString)"
        } else {
            dayTwoHighLow.text = ""
            dayTwoPrecipitation.text = "\(dayTwoHigh)°↑ \(dayTwoLow)°↓"
            if dayTwoPrecipAccum > 0 && dayTwoPrecipAccum < 1 {
                dayTwoSummary.text = "\(dayTwoSummaryString) Chance of precipitation \(dayTwoPrecip)%. Snow accumulation < 1 \(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(dayTwoSunset). Moon phase, \(dayTwoMoonPhaseString.lowercased())."
            } else if dayTwoPrecipAccum > 1 {
                dayTwoSummary.text = "\(dayTwoSummaryString) Chance of precipitation \(dayTwoPrecip)%. Snow accumulation \(Int(dayTwoPrecipAccum)) \(unitsPrecipitation). Sunrise \(dayTwoSunrise) and sunset \(dayTwoSunset). Moon phase, \(dayTwoMoonPhaseString.lowercased())."
            } else {
                dayTwoSummary.text = "\(dayTwoSummaryString) Chance of precipitation \(dayTwoPrecip)%. Sunrise \(dayTwoSunrise) and sunset \(dayTwoSunset). Moon phase, \(dayTwoMoonPhaseString.lowercased())."
            }
        }
        
        // Day Three
        dayThreeDay.text = "\(dayThreeDayString)\n\(dayThreeDateString)"
        if dayThreeStackView.isHidden == true {
            dayThreeHighLow.text = "\(dayThreeHigh)°↑ \(dayThreeLow)°↓"
            dayThreePrecipitation.text = "\(defaultDailyConditionValueType) \(dayThreeConditionValue)\(defaultDailyConditionValueUnit)"
            dayThreeSummary.text = "\(dayThreeSummaryString)"
        } else {
            dayThreeHighLow.text = ""
            dayThreePrecipitation.text = "\(dayThreeHigh)°↑ \(dayThreeLow)°↓"
            if dayThreePrecipAccum > 0 && dayThreePrecipAccum < 1 {
                dayThreeSummary.text = "\(dayThreeSummaryString) Chance of precipitation \(dayThreePrecip)%. Snow accumulation < 1 \(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(dayThreeSunset). Moon phase, \(dayThreeMoonPhaseString.lowercased())."
            } else if dayThreePrecipAccum > 1 {
                dayThreeSummary.text = "\(dayThreeSummaryString) Chance of precipitation \(dayThreePrecip)%. Snow accumulation \(Int(dayThreePrecipAccum)) \(unitsPrecipitation). Sunrise \(dayThreeSunrise) and sunset \(dayThreeSunset). Moon phase, \(dayThreeMoonPhaseString.lowercased())."
            } else {
                dayThreeSummary.text = "\(dayThreeSummaryString) Chance of precipitation \(dayThreePrecip)%. Sunrise \(dayThreeSunrise) and sunset \(dayThreeSunset). Moon phase, \(dayThreeMoonPhaseString.lowercased())."
            }
        }
        
        // Day Four
        dayFourDay.text = "\(dayFourDayString)\n\(dayFourDateString)"
        if dayFourStackView.isHidden == true {
            dayFourHighLow.text = "\(dayFourHigh)°↑ \(dayFourLow)°↓"
            dayFourPrecipitation.text = "\(defaultDailyConditionValueType) \(dayFourConditionValue)\(defaultDailyConditionValueUnit)"
            dayFourSummary.text = "\(dayFourSummaryString)"
        } else {
            dayFourHighLow.text = ""
            dayFourPrecipitation.text = "\(dayFourHigh)°↑ \(dayFourLow)°↓"
            if dayFourPrecipAccum > 0 && dayFourPrecipAccum < 1 {
                dayFourSummary.text = "\(dayFourSummaryString) Chance of precipitation \(dayFourPrecip)%. Snow accumulation < 1 \(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(dayFourSunset). Moon phase, \(dayFourMoonPhaseString.lowercased())."
            } else if dayFourPrecipAccum > 1 {
                dayFourSummary.text = "\(dayFourSummaryString) Chance of precipitation \(dayFourPrecip)%. Snow accumulation \(Int(dayFourPrecipAccum)) \(unitsPrecipitation). Sunrise \(dayFourSunrise) and sunset \(dayFourSunset). Moon phase, \(dayFourMoonPhaseString.lowercased())."
            } else {
                dayFourSummary.text = "\(dayFourSummaryString) Chance of precipitation \(dayFourPrecip)%. Sunrise \(dayFourSunrise) and sunset \(dayFourSunset). Moon phase, \(dayFourMoonPhaseString.lowercased())."
            }
        }
        
        // Day Five
        dayFiveDay.text = "\(dayFiveDayString)\n\(dayFiveDateString)"
        if dayFiveStackView.isHidden == true {
            dayFiveHighLow.text = "\(dayFiveHigh)°↑ \(dayFiveLow)°↓"
            dayFivePrecipitation.text = "\(defaultDailyConditionValueType) \(dayFiveConditionValue)\(defaultDailyConditionValueUnit)"
            dayFiveSummary.text = "\(dayFiveSummaryString)"
        } else {
            dayFiveHighLow.text = ""
            dayFivePrecipitation.text = "\(dayFiveHigh)°↑ \(dayFiveLow)°↓"
            if dayFivePrecipAccum > 0 && dayFivePrecipAccum < 1 {
                dayFiveSummary.text = "\(dayFiveSummaryString) Chance of precipitation \(dayFivePrecip)%. Snow accumulation < 1 \(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(dayFiveSunset). Moon phase, \(dayFiveMoonPhaseString.lowercased())."
            } else if dayFivePrecipAccum > 1 {
                dayFiveSummary.text = "\(dayFiveSummaryString) Chance of precipitation \(dayFivePrecip)%. Snow accumulation \(Int(dayFivePrecipAccum)) \(unitsPrecipitation). Sunrise \(dayFiveSunrise) and sunset \(dayFiveSunset). Moon phase, \(dayFiveMoonPhaseString.lowercased())."
            } else {
                dayFiveSummary.text = "\(dayFiveSummaryString) Chance of precipitation \(dayFivePrecip)%. Sunrise \(dayFiveSunrise) and sunset \(dayFiveSunset). Moon phase, \(dayFiveMoonPhaseString.lowercased())."
            }
        }
        
        // Day Six
        daySixDay.text = "\(daySixDayString)\n\(daySixDateString)"
        if daySixStackView.isHidden == true {
            daySixHighLow.text = "\(daySixHigh)°↑ \(daySixLow)°↓"
            daySixPrecipitation.text = "\(defaultDailyConditionValueType) \(daySixConditionValue)\(defaultDailyConditionValueUnit)"
            daySixSummary.text = "\(daySixSummaryString)"
        } else {
            daySixHighLow.text = ""
            daySixPrecipitation.text = "\(daySixHigh)°↑ \(daySixLow)°↓"
            if daySixPrecipAccum > 0 && daySixPrecipAccum < 1 {
                daySixSummary.text = "\(daySixSummaryString) Chance of precipitation \(daySixPrecip)%. Snow accumulation < 1\(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(daySixSunset). Moon phase, \(daySixMoonPhaseString.lowercased())."
            } else if daySixPrecipAccum > 1 {
                daySixSummary.text = "\(daySixSummaryString) Chance of precipitation \(daySixPrecip)%. Snow accumulation \(Int(daySixPrecipAccum)) \(unitsPrecipitation). Sunrise \(daySixSunrise) and sunset \(daySixSunset). Moon phase, \(daySixMoonPhaseString.lowercased())."
            } else {
                daySixSummary.text = "\(daySixSummaryString) Chance of precipitation \(daySixPrecip)%. Sunrise \(daySixSunrise) and sunset \(daySixSunset). Moon phase, \(daySixMoonPhaseString.lowercased())."
            }
        }
        
        // Day Seven
        daySevenDay.text = "\(daySevenDayString)\n\(daySevenDateString)"
        if daySevenStackView.isHidden == true {
            daySevenHighLow.text = "\(daySevenHigh)°↑ \(daySevenLow)°↓"
            daySevenPrecipitation.text = "\(defaultDailyConditionValueType) \(daySevenConditionValue)\(defaultDailyConditionValueUnit)"
            daySevenSummary.text = "\(daySevenSummaryString)"
        } else {
            daySevenHighLow.text = ""
            daySevenPrecipitation.text = "\(daySevenHigh)°↑ \(daySevenLow)°↓"
            if daySevenPrecipAccum > 0 && daySevenPrecipAccum < 1 {
                daySevenSummary.text = "\(daySevenSummaryString) Chance of precipitation \(daySevenPrecip)%. Snow accumulation < 1 \(unitsPrecipitation). Sunrise \(dayZeroSunrise) and sunset \(daySevenSunset). Moon phase, \(daySevenMoonPhaseString.lowercased())."
            } else if daySevenPrecipAccum > 1 {
                daySevenSummary.text = "\(daySevenSummaryString) Chance of precipitation \(daySevenPrecip)%. Snow accumulation \(Int(daySevenPrecipAccum)) \(unitsPrecipitation). Sunrise \(daySevenSunrise) and sunset \(daySevenSunset). Moon phase, \(daySevenMoonPhaseString.lowercased())."
            } else {
                daySevenSummary.text = "\(daySevenSummaryString) Chance of precipitation \(daySevenPrecip)%. Sunrise \(daySevenSunrise) and sunset \(daySevenSunset). Moon phase, \(daySevenMoonPhaseString.lowercased())."
            }
        }
    }
    
    // MARK: - Action to open weather alerts
    @IBAction func weatherAlertsButtonTapped(_ sender: UIButton) {
        let svc = SFSafariViewController(url: URL(string: alertURI)!)
        present(svc, animated: true, completion: nil)
    }
    
    func hourSetup() {
        if hourlySegmentControl.selectedSegmentIndex == 0 {
            completePrecipUISetup()
        } else if hourlySegmentControl.selectedSegmentIndex == 1 {
            completeTempUISetup()
        } else if hourlySegmentControl.selectedSegmentIndex == 2 {
            completeHumidityUISetup()
        } else if hourlySegmentControl.selectedSegmentIndex == 3 {
            completeUVIndexUISetup()
        } else if hourlySegmentControl.selectedSegmentIndex == 4 {
            completeWindSpeedUISetup()
        } else if hourlySegmentControl.selectedSegmentIndex == 5 {
            completeCloudCoverUISetup()
        } else {
            completePrecipUISetup()
        }
    }
    
    func dayZeroHourSetup() {
        if dayZeroSegmentControl.selectedSegmentIndex == 0 {
            completeDayZeroPrecipUISetup()
        } else if dayZeroSegmentControl.selectedSegmentIndex == 1 {
            completeDayZeroTempUISetup()
        } else if dayZeroSegmentControl.selectedSegmentIndex == 2 {
            completeDayZeroHumidityUISetup()
        } else if dayZeroSegmentControl.selectedSegmentIndex == 3 {
            completeDayZeroUVIndexUISetup()
        } else if dayZeroSegmentControl.selectedSegmentIndex == 4 {
            completeDayZeroWindSpeedUISetup()
        } else if dayZeroSegmentControl.selectedSegmentIndex == 5 {
            completeDayZeroCloudCoverUISetup()
        } else {
            completeDayZeroPrecipUISetup()
        }
    }
    
    func dayOneHourSetup() {
        if dayOneSegmentControl.selectedSegmentIndex == 0 {
            completeDayOnePrecipUISetup()
        } else if dayOneSegmentControl.selectedSegmentIndex == 1 {
            completeDayOneTempUISetup()
        } else if dayOneSegmentControl.selectedSegmentIndex == 2 {
            completeDayOneHumidityUISetup()
        } else if dayOneSegmentControl.selectedSegmentIndex == 3 {
            completeDayOneUVIndexUISetup()
        } else if dayOneSegmentControl.selectedSegmentIndex == 4 {
            completeDayOneWindSpeedUISetup()
        } else if dayOneSegmentControl.selectedSegmentIndex == 5 {
            completeDayOneCloudCoverUISetup()
        } else {
            completeDayOnePrecipUISetup()
        }
    }
    
    func dayTwoHourSetup() {
        if dayTwoSegmentControl.selectedSegmentIndex == 0 {
            completeDayTwoPrecipUISetup()
        } else if dayTwoSegmentControl.selectedSegmentIndex == 1 {
            completeDayTwoTempUISetup()
        } else if dayTwoSegmentControl.selectedSegmentIndex == 2 {
            completeDayTwoHumidityUISetup()
        } else if dayTwoSegmentControl.selectedSegmentIndex == 3 {
            completeDayTwoUVIndexUISetup()
        } else if dayTwoSegmentControl.selectedSegmentIndex == 4 {
            completeDayTwoWindSpeedUISetup()
        } else if dayTwoSegmentControl.selectedSegmentIndex == 5 {
            completeDayTwoCloudCoverUISetup()
        } else {
            completeDayTwoPrecipUISetup()
        }
    }
    
    func dayThreeHourSetup() {
        if dayThreeSegmentControl.selectedSegmentIndex == 0 {
            completeDayThreePrecipUISetup()
        } else if dayThreeSegmentControl.selectedSegmentIndex == 1 {
            completeDayThreeTempUISetup()
        } else if dayThreeSegmentControl.selectedSegmentIndex == 2 {
            completeDayThreeHumidityUISetup()
        } else if dayThreeSegmentControl.selectedSegmentIndex == 3 {
            completeDayThreeUVIndexUISetup()
        } else if dayThreeSegmentControl.selectedSegmentIndex == 4 {
            completeDayThreeWindSpeedUISetup()
        } else if dayThreeSegmentControl.selectedSegmentIndex == 5 {
            completeDayThreeCloudCoverUISetup()
        } else {
            completeDayThreePrecipUISetup()
        }
    }
    
    func dayFourHourSetup() {
        if dayFourSegmentControl.selectedSegmentIndex == 0 {
            completeDayFourPrecipUISetup()
        } else if dayFourSegmentControl.selectedSegmentIndex == 1 {
            completeDayFourTempUISetup()
        } else if dayFourSegmentControl.selectedSegmentIndex == 2 {
            completeDayFourHumidityUISetup()
        } else if dayFourSegmentControl.selectedSegmentIndex == 3 {
            completeDayFourUVIndexUISetup()
        } else if dayFourSegmentControl.selectedSegmentIndex == 4 {
            completeDayFourWindSpeedUISetup()
        } else if dayFourSegmentControl.selectedSegmentIndex == 5 {
            completeDayFourCloudCoverUISetup()
        } else {
            completeDayFourPrecipUISetup()
        }
    }
    
    func dayFiveHourSetup() {
        if dayFiveSegmentControl.selectedSegmentIndex == 0 {
            completeDayFivePrecipUISetup()
        } else if dayFiveSegmentControl.selectedSegmentIndex == 1 {
            completeDayFiveTempUISetup()
        } else if dayFiveSegmentControl.selectedSegmentIndex == 2 {
            completeDayFiveHumidityUISetup()
        } else if dayFiveSegmentControl.selectedSegmentIndex == 3 {
            completeDayFiveUVIndexUISetup()
        } else if dayFiveSegmentControl.selectedSegmentIndex == 4 {
            completeDayFiveWindSpeedUISetup()
        } else if dayFiveSegmentControl.selectedSegmentIndex == 5 {
            completeDayFiveCloudCoverUISetup()
        } else {
            completeDayFivePrecipUISetup()
        }
    }
    
    func daySixHourSetup() {
        if daySixSegmentControl.selectedSegmentIndex == 0 {
            completeDaySixPrecipUISetup()
        } else if daySixSegmentControl.selectedSegmentIndex == 1 {
            completeDaySixTempUISetup()
        } else if daySixSegmentControl.selectedSegmentIndex == 2 {
            completeDaySixHumidityUISetup()
        } else if daySixSegmentControl.selectedSegmentIndex == 3 {
            completeDaySixUVIndexUISetup()
        } else if daySixSegmentControl.selectedSegmentIndex == 4 {
            completeDaySixWindSpeedUISetup()
        } else if daySixSegmentControl.selectedSegmentIndex == 5 {
            completeDaySixCloudCoverUISetup()
        } else {
            completeDaySixPrecipUISetup()
        }
    }
    
    func daySevenHourSetup() {
        if daySevenSegmentControl.selectedSegmentIndex == 0 {
            completeDaySevenPrecipUISetup()
        } else if daySevenSegmentControl.selectedSegmentIndex == 1 {
            completeDaySevenTempUISetup()
        } else if daySevenSegmentControl.selectedSegmentIndex == 2 {
            completeDaySevenHumidityUISetup()
        } else if daySevenSegmentControl.selectedSegmentIndex == 3 {
            completeDaySevenUVIndexUISetup()
        } else if daySevenSegmentControl.selectedSegmentIndex == 4 {
            completeDaySevenWindSpeedUISetup()
        } else if daySevenSegmentControl.selectedSegmentIndex == 5 {
            completeDaySevenCloudCoverUISetup()
        } else {
            completeDaySevenPrecipUISetup()
        }
    }
    
    // MARK: - Actions for changing hourly forecast
    @IBAction func hourlySegmentControlTapped(_ sender: UISegmentedControl) {
        hourSetup()
    }
    
    @IBAction func hourlyPageControlTapped(_ sender: UIPageControl) {
        hourSetup()
    }
    @IBAction func hourlyNextPageTapped(_ sender: UITapGestureRecognizer) {
        if hourlyPageControl.currentPage == 0 {
            hourlyPageControl.currentPage = 1
        } else if hourlyPageControl.currentPage == 1 {
            hourlyPageControl.currentPage = 0
        }
        hourSetup()
    }
    
    @IBAction func dayZeroSegmentControlTapped(_ sender: UISegmentedControl) {
        dayZeroHourSetup()
    }
    @IBAction func dayZeroPageControlTapped(_ sender: UIPageControl) {
        dayZeroHourSetup()
    }
    @IBAction func dayZeroNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayZeroPageControl.currentPage == 0 {
            dayZeroPageControl.currentPage = 1
        } else if dayZeroPageControl.currentPage == 1 {
            dayZeroPageControl.currentPage = 0
        }
        dayZeroHourSetup()
    }
    
    @IBAction func dayOneSegmentControlTapped(_ sender: UISegmentedControl) {
        dayOneHourSetup()
    }
    @IBAction func dayOnePageControlTapped(_ sender: UIPageControl) {
        dayOneHourSetup()
    }
    @IBAction func dayOneNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayOnePageControl.currentPage == 0 {
            dayOnePageControl.currentPage = 1
        } else if dayOnePageControl.currentPage == 1 {
            dayOnePageControl.currentPage = 0
        }
        dayOneHourSetup()
    }
    
    @IBAction func dayTwoSegmentControlTapped(_ sender: UISegmentedControl) {
        dayTwoHourSetup()
    }
    @IBAction func dayTwoPageControlTapped(_ sender: UIPageControl) {
        dayTwoHourSetup()
    }
    @IBAction func dayTwoNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayTwoPageControl.currentPage == 0 {
            dayTwoPageControl.currentPage = 1
        } else if dayTwoPageControl.currentPage == 1 {
            dayTwoPageControl.currentPage = 0
        }
        dayTwoHourSetup()
    }
    
    @IBAction func dayThreeSegmentControlTapped(_ sender: UISegmentedControl) {
        dayThreeHourSetup()
    }
    @IBAction func dayThreePageControlTapped(_ sender: UIPageControl) {
        dayThreeHourSetup()
    }
    @IBAction func dayThreeNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayThreePageControl.currentPage == 0 {
            dayThreePageControl.currentPage = 1
        } else if dayThreePageControl.currentPage == 1 {
            dayThreePageControl.currentPage = 0
        }
        dayThreeHourSetup()
    }
    
    @IBAction func dayFourSegmentControlTapped(_ sender: UISegmentedControl) {
        dayFourHourSetup()
    }
    @IBAction func dayFourPageControlTapped(_ sender: UIPageControl) {
        dayFourHourSetup()
    }
    @IBAction func dayFourNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayFourPageControl.currentPage == 0 {
            dayFourPageControl.currentPage = 1
        } else if dayFourPageControl.currentPage == 1 {
            dayFourPageControl.currentPage = 0
        }
        dayFourHourSetup()
    }
    
    @IBAction func dayFiveSegmentControlTapped(_ sender: UISegmentedControl) {
        dayFiveHourSetup()
    }
    @IBAction func dayFivePageControlTapped(_ sender: UIPageControl) {
        dayFiveHourSetup()
    }
    @IBAction func dayFiveNextPageTapped(_ sender: UITapGestureRecognizer) {
        if dayFivePageControl.currentPage == 0 {
            dayFivePageControl.currentPage = 1
        } else if dayFivePageControl.currentPage == 1 {
            dayFivePageControl.currentPage = 0
        }
        dayFiveHourSetup()
    }
    
    @IBAction func daySixSegmentControlTapped(_ sender: UISegmentedControl) {
        daySixHourSetup()
    }
    @IBAction func daySixPageControlTapped(_ sender: UIPageControl) {
        daySixHourSetup()
    }
    @IBAction func daySixNextPageTapped(_ sender: UITapGestureRecognizer) {
        if daySixPageControl.currentPage == 0 {
            daySixPageControl.currentPage = 1
        } else if daySixPageControl.currentPage == 1 {
            daySixPageControl.currentPage = 0
        }
        daySixHourSetup()
    }
    
    @IBAction func daySevenSegmentControlTapped(_ sender: UISegmentedControl) {
        daySevenHourSetup()
    }
    @IBAction func daySevenPageControlTapped(_ sender: UIPageControl) {
        daySevenHourSetup()
    }
    @IBAction func daySevenNextPageTapped(_ sender: UITapGestureRecognizer) {
        if daySevenPageControl.currentPage == 0 {
            daySevenPageControl.currentPage = 1
        } else if daySevenPageControl.currentPage == 1 {
            daySevenPageControl.currentPage = 0
        }
        daySevenHourSetup()
    }
    
    // MARK: - Action to show extended daily forecasts
    func setupDayStackView(stackview: UIStackView, day: Int) {
        if stackview.isHidden == true {
            UIView.animate(withDuration: 0.3) {
                stackview.isHidden = false
                self.setHourlyConditionTextForDay(day: day)
            }
        } else {
            stackview.isHidden = true
        }
        self.setDayLabels()
    }
    
    @IBAction func dayZeroGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayZeroStackView, day: 0)
    }
    @IBAction func dayOneGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayOneStackView, day: 1)
    }
    @IBAction func dayTwoGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayTwoStackView, day: 2)
    }
    @IBAction func dayThreeGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayThreeStackView, day: 3)
    }
    @IBAction func dayFourGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayFourStackView, day: 4)
    }
    @IBAction func dayFiveGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: dayFiveStackView, day: 5)
    }
    @IBAction func daySixGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: daySixStackView, day: 6)
    }
    @IBAction func daySevenGestureTapped(_ sender: UITapGestureRecognizer) {
        setupDayStackView(stackview: daySevenStackView, day: 7)
    }
    
    // MARK: - Check pressure levels and set label
    func checkHighPressure(current: Int, type: String) {
        if current > pressureHour1 || current > pressureHour2 || current > current || current > pressureHour4 {
            currentCondition2Label.text = "Pressure: \n\(current) \(unitsPressure), falling"
        } else if current < pressureHour1 || current < pressureHour2 || current < pressureHour3 || current < pressureHour4 {
            currentCondition2Label.text = "Pressure: \n\(current) \(unitsPressure), rising"
        } else {
            currentCondition2Label.text = "Pressure: \n\(current) \(unitsPressure)"
        }
    }
    
    // MARK: - Set current condition labels
    func setCurrentConditionLabels() {
        // Set temperature image and label
        currentCondition1Label.text = "Temperature: \n\(highTemperature)°↑ \(lowTemperature)°↓"
        if defaults.bool(forKey: "weatherUnitsUSA") == true {
            if currentTemperature >= 80 {
                currentCondition1Image.image = UIImage(named: "Temperature high.pdf")
            } else if currentTemperature < 80 && currentTemperature >= 50 {
                currentCondition1Image.image = UIImage(named: "Temperature moderate.pdf")
            } else if currentTemperature < 50 {
                currentCondition1Image.image = UIImage(named: "Temperature low.pdf")
            }
        } else {
            if currentTemperature >= 26 {
                currentCondition1Image.image = UIImage(named: "Temperature high.pdf")
            } else if currentTemperature < 26 && currentTemperature >= 10 {
                currentCondition1Image.image = UIImage(named: "Temperature moderate.pdf")
            } else if currentTemperature < 10 {
                currentCondition1Image.image = UIImage(named: "Temperature low.pdf")
            }
        }
        
        // Set pressure image and label
        if unitsPressure == "mB" {
            if pressure >= 1013 {
                currentCondition2Image.image = UIImage(named: "High Pressure.pdf")
                checkHighPressure(current: pressure, type: "high")
            } else {
                currentCondition2Image.image = UIImage(named: "Low Pressure.pdf")
                checkHighPressure(current: pressure, type: "low")
            }
        } else if unitsPressure == "hPa" {
            if pressure >= 101300 {
                currentCondition2Image.image = UIImage(named: "High Pressure.pdf")
                checkHighPressure(current: pressure, type: "high")
            } else {
                currentCondition2Image.image = UIImage(named: "Low Pressure.pdf")
                checkHighPressure(current: pressure, type: "low")
            }
        }
        
        // Set precip accumuluation phrase
        if precipAccumulation > 0 && precipAccumulation < 1 {
            currentCondition3Label.text = "Precipitation: \(precipitation)% \nSnow: < 1 \(unitsPrecipitation)"
        } else if precipAccumulation > 1 {
            currentCondition3Label.text = "Precipitation: \(precipitation)% \nSnow: \(Int(precipAccumulation)) \(unitsPrecipitation)"
        } else {
            currentCondition3Label.text = "Precipitation: \(precipitation)%"
        }
        
        // Check for current precipitation
        if minuteSummary.isEmpty == false && minuteSummary != "none" {
            // Check if there is current precipitation
            if precipitation >= 80 && precipitationType != "none" && endingMinuteSummary != "none" {
                currentCondition3Label.text = "Precipitation: \(precipitation)% \n\(precipitationType.capitalizingFirstLetter()) stops in \(endingMinuteSummary)."
            }
        }
        
        // Set precipitation image
        if precipitation == 0 {
            currentCondition3Image.image = UIImage(named: "Precipitation none.pdf")
        } else if precipitation <= 20 {
            currentCondition3Image.image = UIImage(named: "Precipitation low.pdf")
        } else if precipitation > 20 && precipitation < 80 {
            currentCondition3Image.image = UIImage(named: "Precipitation moderate.pdf")
        } else if precipitation >= 80 {
            currentCondition3Image.image = UIImage(named: "Precipitation heavy.pdf")
        }
        
        // Set humidity image and label
        currentCondition4Label.text = "Humidity: \(humidity)% \nDew point: \(dewPoint)°"
        if humidity <= 20 {
            currentCondition4Image.image = UIImage(named: "Humidity low.pdf")
        } else if humidity > 20 && humidity < 80 {
            currentCondition4Image.image = UIImage(named: "Humidity moderate.pdf")
        } else if humidity >= 80 {
            currentCondition4Image.image = UIImage(named: "Humidity heavy.pdf")
        }
        
        // Set wind image and label
        currentCondition5Label.text = "Wind: \(wind)(\(windGust)) \(unitsWindSpeed) \(windDirectionString)"
        if windDirectionString.contains("N") {
            currentCondition5Image.image = UIImage(named: "Wind N.pdf")
        }
        if windDirectionString.contains("NE") {
            currentCondition5Image.image = UIImage(named: "Wind NE.pdf")
        }
        if windDirectionString.contains("E") {
            currentCondition5Image.image = UIImage(named: "Wind E.pdf")
        }
        if windDirectionString.contains("SE") {
            currentCondition5Image.image = UIImage(named: "Wind NE.pdf")
        }
        if windDirectionString.contains("S") {
            currentCondition5Image.image = UIImage(named: "Wind S.pdf")
        }
        if windDirectionString.contains("SW") {
            currentCondition5Image.image = UIImage(named: "Wind SW.pdf")
        }
        if windDirectionString.contains("W") {
            currentCondition5Image.image = UIImage(named: "Wind W.pdf")
        }
        if windDirectionString.contains("NW") {
            currentCondition5Image.image = UIImage(named: "Wind NW.pdf")
        } else {
            currentCondition5Image.image = UIImage(named: "Wind SW.pdf")
        }
        
        // Set uv index image and text title and color
        if uvIndex == 0 || uvIndex == 1 && uvIndex <= 2 {
            currentCondition6Label.text = "UV index is low"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index low.pdf"), for: .normal)
        } else if uvIndex >= 3 && uvIndex <= 5 {
            currentCondition6Label.text = "UV index is moderate"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index moderate.pdf"), for: .normal)
        } else if uvIndex >= 6 && uvIndex <= 7 {
            currentCondition6Label.text = "UV index is high"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index high.pdf"), for: .normal)
        } else if uvIndex >= 8 && uvIndex <= 10 {
            currentCondition6Label.text = "UV index is very high"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index very high.pdf"), for: .normal)
        } else if uvIndex >= 11 {
            currentCondition6Label.text = "UV index is extreme"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index extreme.pdf"), for: .normal)
        } else {
            currentCondition6Label.text = "UV index is low"
            currentCondition6ImageButton.setTitle("\(uvIndex)", for: .normal)
            currentCondition6ImageButton.setTitleColor(UIColor.label, for: .normal)
            currentCondition6ImageButton.setBackgroundImage(UIImage(named: "UV Index low.pdf"), for: .normal)
        }
        
        // If visibility is within 1 drop last character
        if visibility == 1 {
            unitsDistance = String(unitsDistance.dropLast())
            currentCondition7Label.text = "Visibility: \(visibility) \(unitsDistance)"
        } else {
            currentCondition7Label.text = "Visibility: \(visibility) \(unitsDistance)"
        }
        currentCondition7Image.image = UIImage(named: "Visibility.pdf")
        
        // Set cloud cover image and label
        currentCondition8Image.image = UIImage(named: "Cloud cover.pdf")
        
        if cloudCover > cloudCoverHour1 || cloudCover > cloudCoverHour2 || cloudCover > cloudCoverHour3 || cloudCover > cloudCoverHour4 {
            currentCondition8Label.text = "Cloud cover: \n\(cloudCover)%, decreasing"
        } else if cloudCover < cloudCoverHour1 || cloudCover < cloudCoverHour2 || cloudCover < cloudCoverHour3 || cloudCover < cloudCoverHour4 {
            currentCondition8Label.text = "Cloud cover: \n\(cloudCover)%, increasing"
        } else {
            currentCondition8Label.text = "Cloud cover: \n\(cloudCover)%"
        }
        
        // Set sunrise/sunset image and label
        let currentTime = Date()
        if currentTime > sunriseDate && currentTime < sunsetDate {
            currentCondition9Label.text = "Sunset: \(sunset)"
            currentCondition9Image.image = UIImage(named: "Sunset.pdf")
        } else if currentTime > sunsetDate {
            currentCondition9Label.text = "Sunrise: \(sunrise)"
            currentCondition9Image.image = UIImage(named: "Sunrise.pdf")
        }
        
        // Set moonphase image and label
        currentCondition10Label.text = "Moon phase: \n\(dayZeroMoonPhaseString.lowercased())"
        if dayZeroMoonPhaseString == "New moon" {
            currentCondition10Image.image = UIImage(named: "New Moon.pdf")
        } else if dayZeroMoonPhaseString == "Waxing crescent" {
            currentCondition10Image.image = UIImage(named: "Waxing Crescent.pdf")
        } else if dayZeroMoonPhaseString == "First quarter" {
            currentCondition10Image.image = UIImage(named: "First Quarter.pdf")
        } else if dayZeroMoonPhaseString == "Waxing gibbous" {
            currentCondition10Image.image = UIImage(named: "Waxing Gibbous.pdf")
        } else if dayZeroMoonPhaseString == "Full moon" {
            currentCondition10Image.image = UIImage(named: "Full Moon.pdf")
        } else if dayZeroMoonPhaseString == "Waning gibbous" {
            currentCondition10Image.image = UIImage(named: "Waning Gibbous.pdf")
        } else if dayZeroMoonPhaseString == "Last quarter" {
            currentCondition10Image.image = UIImage(named: "Last Quarter.pdf")
        } else if dayZeroMoonPhaseString == "Waning crescent" {
            currentCondition10Image.image = UIImage(named: "Waning Crescent.pdf")
        }
    }
    
    // MARK: - Set weather data labels
    func setWeatherDataLabels() {
        setCurrentConditionLabels()
        setupDefaultHourlyCondition()
        setDayLabels()
        setDailyConditionImages()
        
        // Check if summaries are equal for the hour
        if currentSummary == hourSummary {
            currentSummary = "\(hourSummary.capitalizingFirstLetter()) for the hour."
        }
        
        currentTemperatureLabel.text = "\(currentTemperature)°"
        apparentTemperatureLabel.text = "Feels like \(apparentTemperature)°"
        currentConditonLabel.text = "\(currentSummary.capitalizingFirstLetter())"
        currentConditionIcon.image = UIImage(named: weatherCondition(condition: currentCondition, type: "image"))
        
        // If alert is active show button
        if alertTitle.isEmpty == false {
            weatherAlertsButton.isHidden = false
            // Check number of active alerts
            if alertCount > 1 {
                weatherAlertsButton.setTitle("\(alertTitle) | +\(alertCount)", for: .normal)
            } else {
                weatherAlertsButton.setTitle("\(alertTitle)!", for: .normal)
            }
            weatherAlertsButton.setTitleColor(alertColor, for: .normal)
        } else {
            weatherAlertsButton.isHidden = true
        }
    }
    
    // MARK: - Get location and weather data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defaults.set(false, forKey: "userDeniedLocation")
        if userSelectedSavedLocation == true {
            let address = "\(selectedLocation)"
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        // handle no location found
                        return
                }
                selectedLatitudeValue = location.coordinate.latitude
                selectedLongitudeValue = location.coordinate.longitude
                latitudeValue = location.coordinate.latitude
                longitudeValue = location.coordinate.longitude

                self.navigationController?.navigationBar.topItem?.title = "\(selectedLocation)"
                self.setupInitialData()
            }
        } else {
            geocode(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!) { placemark, error in
                guard let placemark = placemark, error == nil else { return }
                
                latitudeValue = (manager.location?.coordinate.latitude)!
                longitudeValue = (manager.location?.coordinate.longitude)!
                
                if defaults.bool(forKey: "weatherUnitsUSA") == false && defaults.bool(forKey: "weatherUnitsUK") == false && defaults.bool(forKey: "weatherUnitsCanada") == false && defaults.bool(forKey: "weatherUnitsInternational") == false {
                    if placemark.country! == "United States" {
                        defaults.set(true, forKey: "weatherUnitsUSA")
                    } else if placemark.country! == "Canada" {
                        defaults.set(true, forKey: "weatherUnitsCanada")
                    } else if placemark.country! == "United Kingdom" {
                        defaults.set(true, forKey: "weatherUnitsUK")
                    } else {
                        defaults.set(true, forKey: "weatherUnitsInternational")
                    }
                }
                
                if placemark.country! == "United States" {
                    city = placemark.locality!
                    state = placemark.administrativeArea!
                    self.navigationController?.navigationBar.topItem?.title = "\(city), \(state)"
                    userCurrentLocation = "\(city), \(state)"
                } else {
                    city = placemark.administrativeArea!
                    state = placemark.country!
                    self.navigationController?.navigationBar.topItem?.title = "\(city), \(state)"
                    userCurrentLocation = "\(city), \(state)"
                }
                self.setupInitialData()
            }
        }
    }
    
    // MARK: - Show error when location cannot be found
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
        defaults.set(true, forKey: "userDeniedLocation")
        setupDeniedLocation()
    }
    
    // MARK: - Fetch user location if denied location access
    func setupDeniedLocation() {
        placesClient = GMSPlacesClient.shared()
        
        if (defaults.bool(forKey: "userDeniedLocation") == true) {
            let address = "\(defaults.string(forKey: "savedSelectedLocation") ?? "New York, NY")"
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        // handle no location found
                        return
                }
                selectedLatitudeValue = location.coordinate.latitude
                selectedLongitudeValue = location.coordinate.longitude
                latitudeValue = location.coordinate.latitude
                longitudeValue = location.coordinate.longitude
                defaults.set(selectedLatitudeValue, forKey: "savedSelectedLatitudeValue")
                defaults.set(selectedLongitudeValue, forKey: "savedSelectedLongitudeValue")
                UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(selectedLatitudeValue, forKey: "setWidgetLatitude")
                UserDefaults(suiteName: "group.com.josephszafarowicz.weather")!.set(selectedLongitudeValue, forKey: "setWidgetLongitude")
                
                self.navigationController?.navigationBar.topItem?.title = "\(defaults.string(forKey: "savedSelectedLocation") ?? "New York, NY")"
                self.setupInitialData()
            }
            setWeatherDataLabels()
        }
    }
    
    // MARK: - Setup loading screen view
    func loadingScreen() {
        var loadFrame : CGRect = CGRect(x: 0, y: 0, width: 815, height: 815)
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight >= 812 {
            loadFrame = CGRect(x: 0, y: 0, width: 2000, height: 2000)
        } else {
            loadFrame = CGRect(x: 0, y: 0, width: 815, height: 815)
        }
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.startAnimating()
        
        let backgroundColor = UIColor(named: "customControlColor")
        let loadView : UIView = UIView(frame: loadFrame)
        loadView.backgroundColor = backgroundColor
        loadView.alpha = 1.0
        loadView.addSubview(activityIndicator)
        self.navigationController?.view.addSubview(loadView)
        self.setupInitialLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            loadView.removeFromSuperview()
            self.setWeatherDataLabels()
        }
    }

    func showLocationDisabledPopUp() {
        defaults.set(true, forKey: "userDeniedLocation")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Locations")
        present(controller, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UINavigationController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
